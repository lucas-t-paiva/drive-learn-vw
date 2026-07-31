"""Baixa fichas técnicas oficiais já referenciadas no dump e gera manifesto."""

from __future__ import annotations

import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path
from urllib.parse import urlsplit, urlunsplit


ALLOWED_DOMAINS = {
    "bydbrasil.com.br",
    "www.bydbrasil.com.br",
    "www.dafcaminhoes.com.br",
    "dafcaminhoes.com.br",
    "www.iveco.com",
    "iveco.com",
    "solucoesscania.com.br",
    "www.solucoesscania.com.br",
    "www.volvotrucks.com.br",
    "volvotrucks.com.br",
}


def slugify(value: str) -> str:
    value = value.casefold()
    value = (
        value.replace("á", "a")
        .replace("ã", "a")
        .replace("â", "a")
        .replace("é", "e")
        .replace("ê", "e")
        .replace("í", "i")
        .replace("ó", "o")
        .replace("ô", "o")
        .replace("õ", "o")
        .replace("ú", "u")
        .replace("ç", "c")
    )
    return re.sub(r"[^a-z0-9]+", "-", value).strip("-")


def main() -> None:
    if len(sys.argv) < 4:
        raise SystemExit(
            "Uso: download_official_model_sheets.py AUDITORIA.json RAIZ_PROJETO MANIFESTO.json"
        )
    audit_path = Path(sys.argv[1])
    project_root = Path(sys.argv[2]).resolve()
    manifest_path = Path(sys.argv[3])
    destination = project_root / "public/assets/documents/modelos"
    destination.mkdir(parents=True, exist_ok=True)

    audit = json.loads(audit_path.read_text(encoding="utf-8"))
    by_url: dict[str, list[dict[str, object]]] = {}
    skipped: list[dict[str, str]] = []
    for model in audit["modelos"]:
        documents = model.get("documentos") or []
        document = documents[0] if documents else {}
        current = document.get("arquivo")
        if current and (project_root / str(current)).is_file():
            continue
        url = str(document.get("url_origem") or "")
        host = urlsplit(url).hostname or ""
        if ".pdf" not in urlsplit(url).path.casefold():
            continue
        if host.casefold() not in ALLOWED_DOMAINS:
            skipped.append(
                {"modelo": str(model["modelo"]), "url": url, "motivo": "domínio fora da lista"}
            )
            continue
        by_url.setdefault(url, []).append(model)

    downloads: list[dict[str, object]] = []
    errors: list[dict[str, str]] = []
    for url, models in by_url.items():
        first = models[0]
        digest = hashlib.sha256(url.encode("utf-8")).hexdigest()[:12]
        filename = f"{slugify(str(first['marca']))}-{digest}.pdf"
        target = destination / filename
        download_url = url
        parts = urlsplit(url)
        if parts.hostname and parts.hostname.casefold().endswith("dafcaminhoes.com.br"):
            download_url = urlunsplit((parts.scheme, parts.netloc, parts.path, "", ""))
        request = urllib.request.Request(
            download_url,
            headers={"User-Agent": "DriveLearnTechnicalAudit/1.0"},
        )
        try:
            with urllib.request.urlopen(request, timeout=90) as response:
                content = response.read()
            if not content.startswith(b"%PDF"):
                raise ValueError("conteúdo retornado não é PDF")
            target.write_bytes(content)
        except Exception as exc:
            errors.append(
                {
                    "url": url,
                    "url_download": download_url,
                    "erro": f"{type(exc).__name__}: {exc}",
                }
            )
            continue
        downloads.append(
            {
                "url": url,
                "arquivo": target.relative_to(project_root).as_posix(),
                "bytes": len(content),
                "modelos": [
                    {
                        "id": model["id"],
                        "slug": model["slug"],
                        "modelo": model["modelo"],
                    }
                    for model in models
                ],
            }
        )

    manifest_path.parent.mkdir(parents=True, exist_ok=True)
    manifest_path.write_text(
        json.dumps(
            {"downloads": downloads, "ignorados": skipped, "erros": errors},
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )
    print(
        json.dumps(
            {
                "fontes_baixadas": len(downloads),
                "modelos_atendidos": sum(len(row["modelos"]) for row in downloads),
                "ignorados": len(skipped),
                "erros": len(errors),
            },
            ensure_ascii=False,
        )
    )


if __name__ == "__main__":
    main()
