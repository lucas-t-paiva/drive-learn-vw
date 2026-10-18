"""Coleta auditável de páginas e PDFs oficiais; não conecta ao banco."""
import argparse
import hashlib
import json
import re
import time
from pathlib import Path
from urllib.parse import urljoin, urlsplit, unquote
from urllib.request import Request, urlopen

from lxml import html
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'output' / 'bus-audit-20260915'
DOCS = ROOT / 'public/assets/documents/modelos'
ALLOWED = ('volvobuses.com', 'volvogroup.com', 'volvo.com', 'scania.com', 'iveco.com', 'ivecobus.com', 'ivecogroup.com', 'cnhi.com', 'cnhindustrial.com', 'solucoesscania.com.br', 'd335luupugsy2.cloudfront.net', 'author-p122210-e1298788.adobeaemcloud.com')

def fetch(url):
    host = (urlsplit(url).hostname or '').lower()
    if not any(host == h or host.endswith('.' + h) for h in ALLOWED):
        raise ValueError('Host não autorizado: ' + host)
    req = Request(url, headers={'User-Agent': 'Mozilla/5.0 (compatible; DriveLearnTechnicalResearch/1.0)'})
    with urlopen(req, timeout=80) as response:
        return response.read()

def collect(brand, urls):
    OUT.mkdir(parents=True, exist_ok=True)
    DOCS.mkdir(parents=True, exist_ok=True)
    manifest_file = OUT / (brand + '-sources.json')
    manifest = json.loads(manifest_file.read_text(encoding='utf8')) if manifest_file.exists() else {'pages': [], 'documents': []}
    manifest['pages'] = [p for p in manifest['pages'] if not p.get('error')]
    known_pages = {p['url'] for p in manifest['pages']}
    known_docs = {p['url'] for p in manifest['documents'] if not p.get('error')}
    for url in urls:
        key = hashlib.sha256(url.encode()).hexdigest()[:12]
        cache = OUT / (brand + '-' + key + '.html')
        try:
            raw = cache.read_bytes() if cache.exists() else fetch(url)
            cache.write_bytes(raw)
            tree = html.fromstring(raw)
            links = []
            for a in tree.xpath('//a[@href]'):
                href = urljoin(url, a.get('href')).split('#')[0]
                label = ' '.join(' '.join(a.itertext()).split())
                if href not in [x['url'] for x in links]:
                    links.append({'label': label, 'url': href})
            # Adobe download components sometimes store URLs outside anchors.
            for match in re.findall(r'["\']([^"\']+\.pdf(?:\?[^"\']*)?)["\']', raw.decode('utf8', 'replace'), re.I):
                match = re.sub(r'\\u([0-9a-fA-F]{4})', lambda m: chr(int(m[1], 16)), match)
                href = urljoin(url, match)
                if href not in [x['url'] for x in links]:
                    links.append({'label': '', 'url': href})
            record = {'url': url, 'cache': str(cache.relative_to(ROOT)), 'links': links}
            if url not in known_pages:
                manifest['pages'].append(record)
                known_pages.add(url)
            print('PAGE', url, flush=True)
            for link in links:
                doc_url = link['url']
                if '.pdf.coredownload.pdf' in doc_url:
                    continue
                if re.search(r'smoke|noise|privacidade|privacy|rescue|resgate|manual-seguranca|tabela.ibama', doc_url, re.I):
                    continue
                if not urlsplit(doc_url).path.lower().endswith('.pdf') or doc_url in known_docs:
                    continue
                basename = re.sub(r'[^a-z0-9.-]+', '-', unquote(urlsplit(doc_url).path.split('/')[-1]).lower())
                name = brand + '-20260915-' + basename
                if len(name) > 180:
                    name = brand + '-20260915-' + hashlib.sha256(doc_url.encode()).hexdigest()[:16] + '.pdf'
                target = DOCS / name
                entry = {'url': doc_url, 'source_page': url, 'label': link['label'], 'file': target.relative_to(ROOT).as_posix()}
                try:
                    data = target.read_bytes() if target.exists() else fetch(doc_url)
                    if not data.startswith(b'%PDF'):
                        raise ValueError('Resposta não é PDF')
                    target.write_bytes(data)
                    reader = PdfReader(target)
                    entry.update(sha256=hashlib.sha256(data).hexdigest(), pages=len(reader.pages), bytes=len(data))
                    txt = OUT / (name + '.txt')
                    txt.write_text('\n\n'.join(p.extract_text() or '' for p in reader.pages), encoding='utf8')
                    entry['text'] = txt.relative_to(ROOT).as_posix()
                    known_docs.add(doc_url)
                    print('PDF', name, len(reader.pages), flush=True)
                except Exception as exc:
                    entry['error'] = str(exc)
                    print('ERROR', doc_url, str(exc), flush=True)
                manifest['documents'].append(entry)
                time.sleep(.15)
        except Exception as exc:
            print('PAGE ERROR', url, str(exc), flush=True)
            manifest['pages'].append({'url': url, 'error': str(exc)})
        manifest_file.write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding='utf8')
    print('SAVED', manifest_file, flush=True)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('brand', choices=['volvo', 'scania', 'iveco'])
    parser.add_argument('urls', nargs='+')
    args = parser.parse_args()
    collect(args.brand, args.urls)
