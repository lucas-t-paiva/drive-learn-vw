"""Descobre e prepara fichas técnicas públicas da Mercedes-Benz.

O coletor não envia formulários comerciais. Ele lê os links de ficha técnica
que já fazem parte do HTML público das páginas de produto, baixa apenas PDFs
de domínios permitidos e gera um manifesto e uma migração SQL auditáveis.

Uso:
  python scripts/sync_mercedes_technical_catalog.py
  python scripts/sync_mercedes_technical_catalog.py --no-download
"""

from __future__ import annotations

import argparse
import hashlib
import html
import json
import re
import ssl
import sys
import time
import unicodedata
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass, asdict
from datetime import date
from pathlib import Path
from typing import Iterable

from lxml import html as lxml_html
from pypdf import PdfReader


ROOT = Path(__file__).resolve().parents[1]
DOC_DIR = ROOT / "public" / "assets" / "documents" / "modelos"
OUTPUT_DIR = ROOT / "output" / "mercedes-sync"
MIGRATIONS_DIR = ROOT / "database" / "migrations"

BASE = "https://www.mercedes-benz-trucks.com.br"
SEEDS = {
    "caminhao": [
        f"{BASE}/caminhoes/novo-accelo",
        f"{BASE}/caminhoes/accelo",
        f"{BASE}/caminhoes/atego",
        f"{BASE}/caminhoes/axor",
        f"{BASE}/caminhoes/actros",
        f"{BASE}/caminhoes/arocs",
    ],
    "onibus": [
        f"{BASE}/onibus/micro-onibus",
        f"{BASE}/onibus/urbano",
        f"{BASE}/onibus/rodoviario-fretamento",
        f"{BASE}/onibus/escolar",
    ],
}

PAGE_HOSTS = {"www.mercedes-benz-trucks.com.br", "mercedes-benz-trucks.com.br"}
DOCUMENT_HOSTS = {
    "salandingpagespaasprod.blob.core.windows.net",
    "m.mercedes-benz-trucks.com.br",
    "www.mercedes-benz-trucks.com.br",
    "mercedes-benz-trucks.com.br",
    "truckinfomb.com.br",
    "www.truckinfomb.com.br",
}
USER_AGENT = "DriveLearnTechnicalCatalog/1.0 (+official-public-documents-only)"

BUS_CANONICAL = {
    "micro-onibus/lo-916": ("LO 916/42/48", "mercedes-lo-916-42-48"),
    "micro-onibus/lo-916-r": ("LO 916/48 Rural", "mercedes-lo-916-48-rural"),
    "micro-onibus/lo-1116": ("LO 1116/48/55", "mercedes-lo-1116-48-55"),
    "escolar/lo-916": ("LO 916/48 ORE 2", "lo-916-48-ore-2"),
    "escolar/lo-916-r": ("LO 916/48 Rural", "mercedes-lo-916-48-rural"),
    "escolar/of-1519-r": ("OF 1519R/60", "mercedes-of-1519r-60"),
    "rodoviario-fretamento/of-1519-r": ("OF 1519R/60", "mercedes-of-1519r-60"),
    "rodoviario-fretamento/of-1621": ("OF 1621/59", "mercedes-of-1621-59"),
    "rodoviario-fretamento/of-1721": ("OF 1721/59", "mercedes-of-1721-59"),
    "rodoviario-fretamento/of-1721l": ("OF 1721L/59", "of-1721l-59"),
    "rodoviario-fretamento/of-1726": ("OF 1726/59", "mercedes-of-1726-59"),
    "rodoviario-fretamento/of-1726l": ("OF 1726L/59", "mercedes-of-1726l-59"),
    "rodoviario-fretamento/o-500-r": ("O 500 R 1931/30", "mercedes-o500-r-1931-30"),
    "rodoviario-fretamento/o-500-rs": ("O 500 RS 1938/30", "mercedes-o500-rs-1938-30"),
    "rodoviario-fretamento/o-500-rsd-2438": ("O 500 RSD 2438", "mercedes-o500-rsd-2438"),
    "rodoviario-fretamento/o-500-rsd-2445": ("O 500 RSD 2445/30", "mercedes-o500-rsd-2445-30"),
    "rodoviario-fretamento/o-500-rsdd": ("O 500 RSDD 2745/30", "o-500-rsdd-2745-30"),
    "urbano/eo500u": ("Mercedes-Benz eO500U", "mercedes-benz-eo500u"),
    "urbano/o500u": ("O 500 U 1928/59", "mercedes-o500-u-1928-59"),
    "urbano/o500m": ("O 500 M 1928/59 Super Padron", "mercedes-o500-m-1928-59"),
    "urbano/o500ma": ("O 500 MA 2938", "mercedes-o500-ma-2938"),
    "urbano/o500ua": ("O 500 UA 2938", "o-500-ua-2938"),
    "urbano/o500uda": ("O 500 UDA 3738", "mercedes-o500-uda-3738"),
    "urbano/o500mda": ("O 500 MDA 3738", "mercedes-o500-mda-3738"),
    "urbano/of-1619": ("OF 1619/52", "mercedes-of-1619-52"),
    "urbano/of-1619l": ("OF 1619L/52", "mercedes-of-1619l-52"),
    "urbano/of-1721": ("OF 1721/59", "mercedes-of-1721-59"),
    "urbano/of-1721l": ("OF 1721L/59", "of-1721l-59"),
    "urbano/of-1726": ("OF 1726/59", "mercedes-of-1726-59"),
    "urbano/of-1726l": ("OF 1726L/59", "mercedes-of-1726l-59"),
}

BUS_PAGE_FALLBACKS = {
    "rodoviario-fretamento/o-500-rsd-2438": {
        "motor": "MB OM 460 LA (Proconve P-8 / Euro VI)",
        "potencia": "381 cv (280 kW) a 1.600 rpm",
        "torque": "1.900 Nm (193,7 kgfm) a 1.100 rpm",
        "pbt": "24.000 kg",
        "configuracao": "6x2",
    },
}


@dataclass
class Product:
    vehicle_type: str
    family: str
    name: str
    slug: str
    page_url: str
    document_url: str = ""
    document_path: str = ""
    description: str = ""
    motor: str = ""
    potencia: str = ""
    torque: str = ""
    transmissao: str = ""
    pbt: str = ""
    pbtc: str = ""
    cmt: str = ""
    relacao_reducao: str = ""
    entre_eixos: str = ""
    configuracao: str = ""
    tipo_carroceria: str = ""
    comprimento: str = ""
    capacidade_passageiros: str = ""
    energia: str = "Diesel"
    emissoes: str = "Proconve P8 / Euro 6"
    extraction_source: str = "page"
    error: str = ""


def compact(value: str) -> str:
    return re.sub(r"\s+", " ", html.unescape(value or "")).strip()


def slugify(value: str) -> str:
    normalized = unicodedata.normalize("NFKD", value).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", "-", normalized.lower()).strip("-")


def sql(value: str | None) -> str:
    if value is None or value == "":
        return "NULL"
    return "'" + value.replace("\\", "\\\\").replace("'", "''") + "'"


def request(url: str, *, timeout: int = 90) -> tuple[bytes, str, str]:
    parsed = urllib.parse.urlsplit(url)
    if parsed.scheme != "https":
        raise ValueError(f"URL não HTTPS recusada: {url}")
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept": "*/*"})
    context = ssl.create_default_context()
    with urllib.request.urlopen(req, timeout=timeout, context=context) as response:
        return response.read(), response.headers.get_content_type(), (response.headers.get_content_charset() or "")


def fetch_html(url: str) -> str:
    content, _, charset = request(url)
    if charset:
        return content.decode(charset, errors="replace")
    decoded = content.decode("utf-8", errors="replace")
    if "�" in decoded:
        decoded = content.decode("cp1252", errors="replace")
    return decoded


def same_product_url(url: str, vehicle_type: str) -> bool:
    parsed = urllib.parse.urlsplit(url)
    if (parsed.hostname or "").lower() not in PAGE_HOSTS:
        return False
    path = parsed.path.rstrip("/").lower()
    root = "/caminhoes/" if vehicle_type == "caminhao" else "/onibus/"
    if root not in path:
        return False
    blocked = ("/manuais", "/todos", "/pecas", "/servicos")
    if any(item in path for item in blocked):
        return False
    parts = [part for part in path.split("/") if part]
    if vehicle_type == "onibus" and "/onibus/eletrico/" in path and not path.endswith("/eo500u"):
        return False
    return len(parts) >= 3


def discover_product_urls(seed: str, vehicle_type: str) -> set[str]:
    document = lxml_html.fromstring(fetch_html(seed))
    urls: set[str] = set()
    for href in document.xpath("//a/@href"):
        absolute = urllib.parse.urljoin(seed, str(href)).split("#", 1)[0]
        if same_product_url(absolute, vehicle_type):
            urls.add(absolute.rstrip("/"))
    return urls


def pick_title(document, page_url: str) -> str:
    candidates = document.xpath("//main//h1//text() | //main//h2//text() | //h1//text() | //h2//text()")
    for candidate in candidates:
        value = compact(str(candidate))
        if value and value.lower() not in {"tudo certo!", "compare com outros modelos"}:
            return value
    return urllib.parse.unquote(urllib.parse.urlsplit(page_url).path.rsplit("/", 1)[-1]).replace("-", " ").title()


def family_from_url(url: str, vehicle_type: str, name: str) -> str:
    path = urllib.parse.urlsplit(url).path.lower()
    if vehicle_type == "caminhao":
        for token, family in (
            ("novo-accelo", "Novo Accelo"), ("accelo", "Accelo"), ("atego", "Atego"),
            ("axor", "Axor"), ("actros", "Actros"), ("arocs", "Arocs"),
        ):
            if f"/{token}/" in path:
                return family
        return name.split()[0]
    upper = re.sub(r"[^A-Z0-9]", "", unicodedata.normalize("NFKD", name).encode("ascii", "ignore").decode().upper())
    if upper.startswith("LO"):
        return "LO Micro-Ônibus e Escolar"
    if upper.startswith("OF"):
        return "OF Urbanos e Fretamento"
    if re.match(r"O500(R|RS|RSD|RSDD)", upper):
        return "O 500 Rodoviários"
    if upper.startswith("O500"):
        return "O 500 Urbanos"
    if upper.startswith("EO500"):
        return "Ônibus Elétricos Urbanos"
    return "Mercedes-Benz Ônibus"


def product_slug(url: str, vehicle_type: str, family: str) -> str:
    tail = urllib.parse.unquote(urllib.parse.urlsplit(url).path.rstrip("/").rsplit("/", 1)[-1])
    if vehicle_type == "caminhao":
        return slugify(f"{family} {tail}")
    return slugify(f"mercedes {tail}")


def find_document_url(document, raw_html: str, page_url: str) -> str:
    ranked: list[tuple[int, str]] = []
    for anchor in document.xpath("//a[@href]"):
        href = urllib.parse.urljoin(page_url, str(anchor.get("href")))
        host = (urllib.parse.urlsplit(href).hostname or "").lower()
        label = compact(" ".join(anchor.xpath(".//text()"))).lower()
        path = urllib.parse.urlsplit(href).path.lower()
        if host not in DOCUMENT_HOSTS:
            continue
        score = 0
        if "ficha técnica" in label or "ficha tecnica" in label:
            score += 100
        if path.endswith(".pdf"):
            score += 60
        if "/api/v1/arquivo/" in path:
            score += 55
        if score:
            ranked.append((score, href))
    for match in re.findall(r"https://[^\"'<>\\s]+?(?:\.pdf(?:\?[^\"'<>\\s]*)?|/api/v1/arquivo/[a-z0-9-]+)", raw_html, re.I):
        decoded = html.unescape(match).replace("\\/", "/")
        host = (urllib.parse.urlsplit(decoded).hostname or "").lower()
        if host in DOCUMENT_HOSTS:
            ranked.append((70, decoded))
    ranked.sort(key=lambda item: item[0], reverse=True)
    return ranked[0][1] if ranked else ""


def table_map(document) -> dict[str, str]:
    values: dict[str, str] = {}
    for row in document.xpath("//tr"):
        cells = [compact(" ".join(cell.xpath(".//text()"))) for cell in row.xpath("./th|./td")]
        cells = [cell for cell in cells if cell]
        if len(cells) >= 2:
            values[slugify(cells[0])] = cells[1]
    return values


def first_match(text: str, patterns: Iterable[str]) -> str:
    for pattern in patterns:
        match = re.search(pattern, text, re.I | re.S)
        if match:
            return compact(match.group(1)).replace("�", " · ")[:255]
    return ""


def normalize_kg(value: str) -> str:
    if not value:
        return ""
    value = compact(value)
    match = re.fullmatch(r"(\d+(?:[.,]\d+)?)\s*(?:t|toneladas?)", value, re.I)
    if match:
        number = float(match.group(1).replace(",", ".")) * 1000
        return f"{number:,.0f}".replace(",", ".") + " kg"
    digits = re.sub(r"\D", "", value)
    if digits and 4 <= len(digits) <= 6 and re.fullmatch(r"[\d.\s]+(?:kg)?", value, re.I):
        return f"{int(digits):,}".replace(",", ".") + " kg"
    return value


def extract_pdf_text(path: Path) -> str:
    reader = PdfReader(path)
    return "\n".join(page.extract_text() or "" for page in reader.pages)


def enrich_from_text(product: Product, text: str, *, prefer: bool = False) -> None:
    flat = compact(text)
    def assign(field: str, value: str) -> None:
        if value and (prefer or not getattr(product, field)):
            setattr(product, field, value)

    assign("motor", first_match(flat, [
        r"Motor\s+Modelo\s+(.{3,110}?)(?=\s+(?:Cilindros|Volume|Sist|Pot.ncia))",
        r"Motor\s+(.{3,150}?)(?=\s+Pot.ncia)",
    ]))
    assign("potencia", first_match(flat, [
        r"Pot.ncia(?: M.xima| máxima)?(?:\s+\[[^]]+\])?\s+(.{3,90}?)(?=\s+(?:Torque|Unidades|Transmiss))",
        r"(\d{2,3}\s*cv\s*\([^)]*\)\s*(?:@|a)\s*[\d.]+\s*rpm)",
    ]))
    assign("torque", first_match(flat, [
        r"Torque(?: M.ximo| máximo)?(?:\s+\[[^]]+\])?\s+(.{3,100}?)(?=\s+(?:Unidades|Sistema|Transmiss|Eixos))",
        r"(\d[\d.]*\s*Nm.{0,55}?rpm)",
    ]))
    assign("transmissao", first_match(flat, [
        r"Transmiss.o\s+(.{3,120}?)(?=\s+(?:Tipo|N. marchas|Rela..es|Acionamento|Eixos))",
    ]))
    assign("pbt", normalize_kg(first_match(flat, [
        r"Total\s*\(PBT\).*?(?:\[kg\]|\(kg\))\s+[\d.]+\s+[\d.]+\s+([\d.]+)",
        r"Peso t.cnico por eixo\s*\[kg\]\s+[\d.]+\s+[\d.]+\s+([\d.]+)",
        r"(?:Peso Bruto Total\s*\(PBT\)|\bPBT\b)\s+(?:[\d.]*)/([\d.]{4,6})",
        r"(?:Peso Bruto Total\s*\(PBT\)|\bPBT\b)\s+([\d.]{4,6})",
        r"PBT(?: técnico)?[^\d]{0,35}(\d+(?:[.,]\d+)?\s*(?:t|toneladas?)|\d{4,6}\s*kg)",
    ])))
    assign("pbtc", normalize_kg(first_match(flat, [
        r"PBT\s*\+\s*3. eixo\s*\|\s*PBTC\s+([\d.]+)",
        r"\bPBTC\b[^\d]{0,20}([\d.]{4,6})",
    ])))
    assign("cmt", normalize_kg(first_match(flat, [
        r"\bCMT\b\s+([\d.]{4,6})",
        r"\bCMT\b[^\d]{0,25}([\d.]{4,6})",
        r"CMT\s*\(kg\)\s*(?:até\s*)?([\d.]+)",
        r"CMT[^\d]{0,25}(\d+(?:[.,]\d+)?\s*(?:t|toneladas?)|\d{4,6}\s*kg)",
    ])))
    assign("relacao_reducao", first_match(flat, [
        r"Redução\s+i\s*=\s*(\d{1,2}[,.]\d{2,4}\s*: ?1)",
        r"Relação de redução\s*:?[ ]*(\d{1,2}[,.]\d{2,4}\s*: ?1)",
        r"Redu..o\s+i\s*=\s*(\d{1,2}[,.]\d{2,4}\s*: ?1)",
        r"Rela..es? de eixo\s+(?:i\s*=\s*)?([\d,.( ):/*]+)",
    ]))
    assign("entre_eixos", first_match(flat, [
        r"Dist.ncia entre eixos(?:\s*\([^)]*\))?\s+([\d./+ ]+)",
        r"entre\s*-?\s*eixos?[^\d]{0,20}([\d.,/ +e]{3,45})\s*(?:mm|metros?)",
    ]))
    assign("comprimento", first_match(flat, [
        r"Comprimento encarroçado\s*\[m\]\s*(.{2,45}?)(?=\s+(?:Capacidade|Quantidade|Pesos))",
    ]))
    assign("capacidade_passageiros", first_match(flat, [
        r"Capacidade de passageiros\s*(.{2,60}?)(?=\s+(?:Quantidade|Pesos|Motor))",
    ]))
    if re.search(r"100%\s+el[eé]tric|eO\s*500", flat, re.I):
        product.energia = "100% elétrico"
        product.emissoes = "Zero emissão local"


def parse_product(page_url: str, vehicle_type: str) -> Product:
    raw = fetch_html(page_url)
    document = lxml_html.fromstring(raw)
    name = pick_title(document, page_url)
    family = family_from_url(page_url, vehicle_type, name)
    canonical_key = "/".join(urllib.parse.urlsplit(page_url).path.strip("/").split("/")[-2:])
    canonical = BUS_CANONICAL.get(canonical_key) if vehicle_type == "onibus" else None
    if canonical:
        name = canonical[0]
    product = Product(
        vehicle_type=vehicle_type,
        family=family,
        name=name,
        slug=canonical[1] if canonical else product_slug(page_url, vehicle_type, family),
        page_url=page_url,
        document_url=find_document_url(document, raw, page_url),
    )
    paragraphs = [compact(" ".join(node.xpath(".//text()"))) for node in document.xpath("//main//p | //p")]
    product.description = next((item for item in paragraphs if len(item) >= 80), "")[:1000]
    tables = table_map(document)
    product.motor = tables.get("motor", "")
    product.potencia = tables.get("potencia-cv", "") or tables.get("potencia", "")
    product.torque = tables.get("torque-nm", "") or tables.get("torque", "")
    product.transmissao = tables.get("transmissao", "") or tables.get("transmissao", "")
    product.entre_eixos = tables.get("distancia-entre-eixos-mm", "")
    product.cmt = normalize_kg(tables.get("cmt-kg", ""))
    page_text = compact(" ".join(document.xpath("//main//text() | //body//text()")))
    enrich_from_text(product, page_text)
    traction = first_match(product.name, [r"\b(\d+x\d+)\b"])
    product.configuracao = product.configuracao or traction
    product.tipo_carroceria = product.tipo_carroceria or (
        "Chassi de ônibus" if vehicle_type == "onibus" else
        ("Cavalo mecânico" if re.search(r"\b(?:LS|S)\b", product.name) else "Chassi-cabine")
    )
    if vehicle_type == "onibus":
        product.pbtc = "Não se aplica"
        for field, value in BUS_PAGE_FALLBACKS.get(canonical_key, {}).items():
            if not getattr(product, field):
                setattr(product, field, value)
    return product


def existing_hashes() -> dict[str, str]:
    hashes: dict[str, str] = {}
    for path in DOC_DIR.glob("*.pdf"):
        try:
            digest = hashlib.sha256(path.read_bytes()).hexdigest()
            hashes[digest] = path.relative_to(ROOT).as_posix()
        except OSError:
            continue
    return hashes


def download_document(product: Product, hashes: dict[str, str]) -> None:
    if not product.document_url:
        return
    host = (urllib.parse.urlsplit(product.document_url).hostname or "").lower()
    if host not in DOCUMENT_HOSTS:
        raise ValueError(f"Domínio de documento não permitido: {host}")
    filename_slug = product.slug if product.slug.startswith("mercedes-") else f"mercedes-{product.slug}"
    expected = DOC_DIR / f"{filename_slug}-ficha-tecnica.pdf"
    if expected.is_file() and expected.read_bytes().startswith(b"%PDF"):
        product.document_path = expected.relative_to(ROOT).as_posix()
        enrich_from_text(product, extract_pdf_text(expected), prefer=True)
        product.extraction_source = "official-pdf"
        return
    content, content_type, _ = request(product.document_url, timeout=120)
    if not content.startswith(b"%PDF"):
        raise ValueError(f"Documento não é PDF ({content_type})")
    digest = hashlib.sha256(content).hexdigest()
    if digest in hashes:
        product.document_path = hashes[digest]
    else:
        filename = f"{filename_slug}-ficha-tecnica.pdf"
        target = DOC_DIR / filename
        target.write_bytes(content)
        product.document_path = target.relative_to(ROOT).as_posix()
        hashes[digest] = product.document_path
    enrich_from_text(product, extract_pdf_text(ROOT / product.document_path), prefer=True)
    product.extraction_source = "official-pdf"


def family_description(family: str, vehicle_type: str) -> str:
    return (
        f"Linha Mercedes-Benz {family} de caminhões para aplicações de transporte e trabalho."
        if vehicle_type == "caminhao"
        else f"Linha de chassis Mercedes-Benz {family} para transporte de passageiros."
    )


def generate_sql(products: list[Product], target: Path) -> None:
    today = date.today().isoformat()
    lines = [
        "-- Drive Learn - sincronização Mercedes-Benz por fontes técnicas oficiais públicas.",
        f"-- Gerado em {today} por scripts/sync_mercedes_technical_catalog.py.",
        "-- Idempotente: preserva dados preenchidos e completa lacunas; não envia formulários.",
        "SET NAMES utf8mb4;",
        "CREATE TABLE IF NOT EXISTS schema_migrations (",
        "  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,",
        "  versao VARCHAR(190) NOT NULL UNIQUE,",
        "  descricao VARCHAR(255) NULL,",
        "  aplicado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP",
        ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;",
        "",
        "INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo)",
        "VALUES ('Mercedes-Benz','mercedes-benz','Alemanha','https://www.mercedes-benz-trucks.com.br/',",
        "        'Fabricante de caminhões e chassis de ônibus.',1)",
        "ON DUPLICATE KEY UPDATE site_oficial=VALUES(site_oficial),ativo=1;",
        "",
    ]
    usable = [p for p in products if p.name and (not p.error or any((p.motor, p.potencia, p.pbt, p.document_url)))]
    families = sorted({(p.family, p.vehicle_type) for p in usable})
    for family, vehicle_type in families:
        lines += [
            "INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)",
            f"SELECT id,{sql(family)},{sql(family_description(family, vehicle_type))},{sql(vehicle_type)},1",
            "FROM marcas WHERE slug='mercedes-benz'",
            "ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;",
            "",
        ]
    for p in products:
        if p not in usable:
            continue
        specs = {
            "tipo_veiculo": "Caminhão" if p.vehicle_type == "caminhao" else "Ônibus",
            "energia": p.energia,
            "configuracao": p.configuracao,
            "tipo_carroceria": p.tipo_carroceria,
            "emissoes": p.emissoes,
            "entre_eixos": p.entre_eixos,
            "capacidade_passageiros": p.capacidade_passageiros,
            "comprimento": p.comprimento,
            "cmt": p.cmt,
            "fonte_oficial": p.document_url or p.page_url,
            "fonte_pagina": p.page_url,
            "conferido_em": today,
        }
        specs_json = json.dumps({k: v for k, v in specs.items() if v}, ensure_ascii=False, separators=(",", ":"))
        match = (
            f"(m.slug={sql(p.slug)} OR LOWER(TRIM(m.nome))=LOWER(TRIM({sql(p.name)})))"
        )
        lines += [
            f"-- {p.name}",
            "INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)",
            f"SELECT f.id,{sql(p.name)},{sql(p.slug)},{sql(p.description)},{sql(p.motor)},{sql(p.potencia)},{sql(p.torque)},{sql(p.transmissao)},{sql(p.pbt)},{sql(p.pbtc)},{sql(p.relacao_reducao)},{sql(specs_json)},1",
            "FROM familias f JOIN marcas ma ON ma.id=f.marca_id",
            f"WHERE ma.slug='mercedes-benz' AND f.nome={sql(p.family)}",
            "  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id",
            f"                  WHERE maxx.slug='mercedes-benz' AND (mx.slug={sql(p.slug)} OR LOWER(TRIM(mx.nome))=LOWER(TRIM({sql(p.name)}))))",
            "LIMIT 1;",
            "UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id",
            f"SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),{sql(p.description)}),",
            f"    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),{sql(p.motor)}),",
            f"    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),{sql(p.potencia)}),",
            f"    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),{sql(p.torque)}),",
            f"    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),{sql(p.transmissao)}),",
            f"    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),{sql(p.pbt)}),",
            f"    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),{sql(p.pbtc)}),",
            f"    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),{sql(p.relacao_reducao)}),",
            f"    m.especificacoes=JSON_MERGE_PATCH({sql(specs_json)},COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1",
            f"WHERE ma.slug='mercedes-benz' AND {match};",
        ]
        if p.document_url or p.document_path:
            lines += [
                "INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)",
                f"SELECT m.id,'ficha_tecnica',{sql('Ficha técnica oficial - ' + p.name)},{sql(p.document_path)},{sql(p.document_url)},{sql(p.page_url)},1",
                "FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id",
                f"WHERE ma.slug='mercedes-benz' AND {match}",
                "ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),",
                " arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),",
                " url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),",
                " fonte_pagina=VALUES(fonte_pagina),ativo=1;",
            ]
        technical = {
            "pbt": ("PBT", p.pbt), "pbtc": ("PBTC", p.pbtc), "cmt": ("CMT", p.cmt),
            "relacao_reducao": ("Relação de redução", p.relacao_reducao),
            "entre_eixos": ("Entre-eixos", p.entre_eixos),
            "configuracao": ("Configuração / tração", p.configuracao),
            "tipo_carroceria": ("Tipo de carroceria", p.tipo_carroceria),
            "comprimento": ("Comprimento", p.comprimento),
            "capacidade_passageiros": ("Capacidade de passageiros", p.capacidade_passageiros),
            "energia": ("Energia / propulsão", p.energia), "emissoes": ("Norma de emissões", p.emissoes),
        }
        for key, (label, value) in technical.items():
            if not value:
                continue
            lines += [
                "INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)",
                f"SELECT m.id,{sql(key)},{sql(label)},{sql(value)},NULL,{sql(p.document_url or p.page_url)},{sql(today)}",
                "FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id",
                f"WHERE ma.slug='mercedes-benz' AND {match}",
                "ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),",
                " valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),",
                " fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),",
                " conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));",
            ]
        lines.append("")
    version = target.stem
    lines += [
        "INSERT INTO schema_migrations(versao,descricao)",
        f"VALUES ({sql(version)},'Sincronização técnica oficial Mercedes-Benz caminhões e ônibus')",
        "ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);",
        "",
    ]
    target.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--no-download", action="store_true", help="Não baixa PDFs; gera inventário com dados das páginas.")
    parser.add_argument("--delay", type=float, default=0.7, help="Intervalo entre páginas, em segundos.")
    parser.add_argument("--limit", type=int, default=0, help="Limita produtos para teste (0 = todos).")
    args = parser.parse_args()

    DOC_DIR.mkdir(parents=True, exist_ok=True)
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    products: list[Product] = []
    hashes = existing_hashes()
    discovered: list[tuple[str, str]] = []

    for vehicle_type, seeds in SEEDS.items():
        for seed in seeds:
            try:
                for url in discover_product_urls(seed, vehicle_type):
                    discovered.append((vehicle_type, url))
            except Exception as exc:
                print(f"Aviso: falha ao descobrir {seed}: {exc}", file=sys.stderr)
            time.sleep(args.delay)

    unique = sorted(set(discovered), key=lambda item: item[1])
    if args.limit > 0:
        unique = unique[: args.limit]

    for index, (vehicle_type, url) in enumerate(unique, start=1):
        print(f"[{index}/{len(unique)}] {url}")
        try:
            product = parse_product(url, vehicle_type)
        except Exception as exc:
            family = urllib.parse.urlsplit(url).path.rstrip("/").split("/")[-2].title()
            product = Product(vehicle_type, family, url.rsplit("/", 1)[-1], slugify(url.rsplit("/", 1)[-1]), url, error=f"{type(exc).__name__}: {exc}")
            products.append(product)
            time.sleep(args.delay)
            continue
        if not args.no_download and product.document_url:
            try:
                download_document(product, hashes)
            except Exception as exc:
                product.error = f"documento: {type(exc).__name__}: {exc}"
                product.document_url = ""
        products.append(product)
        time.sleep(args.delay)

    stamp = date.today().strftime("%Y%m%d")
    manifest = OUTPUT_DIR / f"mercedes-technical-catalog-{stamp}.json"
    manifest.write_text(json.dumps({"generated_at": date.today().isoformat(), "products": [asdict(p) for p in products]}, ensure_ascii=False, indent=2), encoding="utf-8")
    migration = MIGRATIONS_DIR / f"{stamp}_027_sincronizacao_mercedes_chassis.sql"
    generate_sql(products, migration)
    summary = {
        "produtos_descobertos": len(products),
        "com_ficha": sum(bool(p.document_url) for p in products),
        "pdfs_locais": sum(bool(p.document_path) for p in products),
        "erros": sum(bool(p.error) for p in products),
        "manifesto": manifest.relative_to(ROOT).as_posix(),
        "migracao": migration.relative_to(ROOT).as_posix(),
    }
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
