"""Extrai texto das fichas técnicas vinculadas aos modelos auditados."""

from __future__ import annotations

import csv
import json
import re
import subprocess
import sys
from pathlib import Path

from pypdf import PdfReader


LABELS = {
    "pbt": (
        r"Peso bruto total \(PBT\)[^\n]*",
        r"Peso bruto total[^\n]*",
    ),
    "pbtc": (
        r"Peso bruto total combinado \(PBTC\)[^\n]*",
        r"Peso bruto total combinado[^\n]*",
    ),
    "cmt": (
        r"Capacidade m[aá]x\.? de tra[cç][aã]o \(CMT\)[^\n]*",
        r"Capacidade m[aá]xima de tra[cç][aã]o[^\n]*",
    ),
    "reducao": (
        r"Rela[cç][aã]o de redu[cç][aã]o[^\n]*",
        r"Rela[cç][aã]o do eixo traseiro[^\n]*",
    ),
    "entre_eixos": (
        r"Dist[aâ]ncia entre[- ]eixos[^\n]*",
        r"Entre[- ]eixos[^\n]*",
    ),
    "emissoes": (
        r"Norma de emiss[oõ]es[^\n]*",
        r"Emiss[oõ]es[^\n]*PROCONVE[^\n]*",
    ),
    "tracao": (
        r"Tra[cç][aã]o[^\n]*",
    ),
}


def first_matches(text: str, patterns: tuple[str, ...]) -> str:
    matches: list[str] = []
    for pattern in patterns:
        for match in re.finditer(pattern, text, flags=re.I):
            line = re.sub(r"\s+", " ", match.group(0)).strip()
            if line and line not in matches:
                matches.append(line)
            if len(matches) == 3:
                return " | ".join(matches)
    return " | ".join(matches)


def main() -> None:
    if len(sys.argv) < 4:
        raise SystemExit(
            "Uso: extract_model_spec_sheets.py AUDITORIA.json RAIZ_PROJETO SAIDA"
        )
    audit_path = Path(sys.argv[1])
    project_root = Path(sys.argv[2])
    output_dir = Path(sys.argv[3])
    manifest_path = Path(sys.argv[4]) if len(sys.argv) > 4 else None
    pdftotext_path = Path(sys.argv[5]) if len(sys.argv) > 5 else None
    output_dir.mkdir(parents=True, exist_ok=True)
    text_dir = output_dir / "textos"
    text_dir.mkdir(exist_ok=True)

    audit = json.loads(audit_path.read_text(encoding="utf-8"))
    downloaded_by_model: dict[int, str] = {}
    if manifest_path and manifest_path.is_file():
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        for download in manifest.get("downloads", []):
            for model in download.get("modelos", []):
                downloaded_by_model[int(model["id"])] = str(download["arquivo"])
    downloaded_by_model[20] = (
        "public/assets/documents/modelos/vwco-constellation-27-320-6x4.pdf"
    )
    downloaded_by_model[24] = (
        "public/assets/documents/modelos/vwco-1495e61eebf898f3ea52fab6.pdf"
    )
    records: list[dict[str, object]] = []
    for model in audit["modelos"]:
        documents = model.get("documentos") or []
        document = documents[0] if documents else None
        row: dict[str, object] = {
            "id": model["id"],
            "marca": model["marca"],
            "familia": model["familia"],
            "modelo": model["modelo"],
            "slug": model["slug"],
            "arquivo": document.get("arquivo", "") if document else "",
            "paginas": 0,
            "erro": "",
        }
        selected_file = downloaded_by_model.get(
            int(model["id"]), str((document or {}).get("arquivo") or "")
        )
        if not document or not selected_file:
            row["erro"] = "Ficha técnica não vinculada"
            records.append(row)
            continue
        row["arquivo"] = selected_file
        pdf_path = project_root / selected_file
        if not pdf_path.is_file():
            row["erro"] = f"Arquivo não encontrado: {pdf_path}"
            records.append(row)
            continue
        try:
            text_path = text_dir / f"{model['slug']}.txt"
            if text_path.is_file() and text_path.stat().st_size > 20:
                text = text_path.read_text(encoding="utf-8", errors="replace")
                pages = text.split("\f")
            elif pdftotext_path and pdftotext_path.is_file():
                result = subprocess.run(
                    [str(pdftotext_path), "-layout", str(pdf_path), "-"],
                    check=True,
                    capture_output=True,
                    timeout=15,
                )
                text = result.stdout.decode("utf-8", errors="replace")
                pages = text.split("\f")
            else:
                pdf = PdfReader(pdf_path)
                pages = [page.extract_text() or "" for page in pdf.pages]
            text = "\n\n".join(pages)
            row["paginas"] = len(pages)
            text_path.write_text(text, encoding="utf-8")
            for field, patterns in LABELS.items():
                row[field] = first_matches(text, patterns)
        except Exception as exc:  # relatório de auditoria deve continuar nos demais PDFs
            row["erro"] = f"{type(exc).__name__}: {exc}"
        records.append(row)

    fields = [
        "id",
        "marca",
        "familia",
        "modelo",
        "slug",
        "arquivo",
        "paginas",
        "pbt",
        "pbtc",
        "cmt",
        "reducao",
        "entre_eixos",
        "emissoes",
        "tracao",
        "erro",
    ]
    with (output_dir / "campos_extraidos.csv").open(
        "w", encoding="utf-8-sig", newline=""
    ) as stream:
        writer = csv.DictWriter(stream, fieldnames=fields, delimiter=";")
        writer.writeheader()
        for row in records:
            writer.writerow({field: row.get(field, "") for field in fields})

    errors = [row for row in records if row["erro"]]
    print(
        json.dumps(
            {
                "fichas": len(records),
                "extraidas": len(records) - len(errors),
                "erros": errors,
            },
            ensure_ascii=False,
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
