"""Audita a tabela modelos em um dump SQL do Drive Learn sem conectar ao banco."""

from __future__ import annotations

import csv
import json
import re
import sys
from collections import Counter
from pathlib import Path


def mysql_value(token: str):
    token = token.strip()
    if token.upper() == "NULL":
        return None
    if token.startswith("'") and token.endswith("'"):
        value = token[1:-1]
        replacements = {
            r"\\": "\0",
            r"\'": "'",
            r"\"": '"',
            r"\n": "\n",
            r"\r": "\r",
            r"\t": "\t",
            "\0": "\\",
        }
        for source, target in replacements.items():
            value = value.replace(source, target)
        return value.replace("''", "'")
    if re.fullmatch(r"-?\d+", token):
        return int(token)
    return token


def split_tuples(values: str) -> list[list[object]]:
    rows: list[list[object]] = []
    row: list[object] = []
    token: list[str] = []
    depth = 0
    quoted = False
    escaped = False
    for char in values:
        if quoted:
            token.append(char)
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == "'":
                quoted = False
            continue
        if char == "'":
            quoted = True
            token.append(char)
        elif char == "(":
            if depth:
                token.append(char)
            depth += 1
        elif char == ")":
            depth -= 1
            if depth:
                token.append(char)
            else:
                row.append(mysql_value("".join(token)))
                rows.append(row)
                row, token = [], []
        elif char == "," and depth == 1:
            row.append(mysql_value("".join(token)))
            token = []
        elif depth:
            token.append(char)
    return rows


def sql_statements(sql: str):
    """Separa comandos sem encerrar em ponto e vírgula contido em string."""
    start = 0
    quoted = False
    escaped = False
    for index, char in enumerate(sql):
        if quoted:
            if escaped:
                escaped = False
            elif char == "\\":
                escaped = True
            elif char == "'":
                quoted = False
        elif char == "'":
            quoted = True
        elif char == ";":
            statement = sql[start : index + 1].strip()
            if statement:
                yield statement
            start = index + 1
    tail = sql[start:].strip()
    if tail:
        yield tail


def inserts(sql: str, table: str) -> list[dict[str, object]]:
    pattern = re.compile(
        rf"INSERT INTO `{re.escape(table)}`\s*\((.*?)\)\s*VALUES\s*(.*);$",
        re.S,
    )
    result: list[dict[str, object]] = []
    for statement in sql_statements(sql):
        if f"INSERT INTO `{table}`" not in statement:
            continue
        match = pattern.search(statement)
        if not match:
            continue
        columns = [part.strip().strip("`") for part in match.group(1).split(",")]
        for values in split_tuples(match.group(2)):
            if len(values) != len(columns):
                raise ValueError(
                    f"{table}: {len(values)} valores para {len(columns)} colunas"
                )
            result.append(dict(zip(columns, values)))
    return result


def blank(value: object) -> bool:
    return value is None or (isinstance(value, str) and not value.strip())


def main() -> None:
    if len(sys.argv) < 3:
        raise SystemExit("Uso: audit_model_dump.py DUMP.sql DIRETORIO_SAIDA")
    dump_path = Path(sys.argv[1])
    output_dir = Path(sys.argv[2])
    output_dir.mkdir(parents=True, exist_ok=True)
    sql = dump_path.read_text(encoding="utf-8", errors="replace")

    brands = inserts(sql, "marcas")
    families = inserts(sql, "familias")
    models = inserts(sql, "modelos")
    documents = inserts(sql, "modelo_documentos")
    technical_rows = inserts(sql, "modelo_especificacoes_tecnicas")
    brand_by_id = {int(row["id"]): row for row in brands}
    family_by_id = {int(row["id"]): row for row in families}
    docs_by_model: dict[int, list[dict[str, object]]] = {}
    for document in documents:
        docs_by_model.setdefault(int(document["modelo_id"]), []).append(document)
    technical_by_model: dict[int, dict[str, dict[str, object]]] = {}
    for technical in technical_rows:
        technical_by_model.setdefault(int(technical["modelo_id"]), {})[
            str(technical["chave"])
        ] = technical

    scalar_fields = [
        "descricao",
        "imagem",
        "motor",
        "potencia",
        "torque",
        "transmissao",
        "pbt",
        "pbtc",
        "relacao_reducao",
    ]
    spec_fields = [
        "entre_eixos",
        "tipo_veiculo",
        "energia",
        "configuracao",
        "tipo_carroceria",
        "emissoes",
        "bateria",
        "autonomia",
        "capacidade_passageiros",
        "comprimento",
        "carregamento",
        "mercado",
        "fonte_oficial",
    ]
    records = []
    missing_counts: Counter[str] = Counter()
    for model in models:
        family = family_by_id[int(model["familia_id"])]
        brand = brand_by_id[int(family["marca_id"])]
        try:
            specs = json.loads(str(model.get("especificacoes") or "{}"))
        except json.JSONDecodeError:
            specs = {}
        model_technical = technical_by_model.get(int(model["id"]), {})
        missing = [
            field
            for field in scalar_fields
            if blank(model.get(field))
            and blank((model_technical.get(field) or {}).get("valor"))
        ]
        missing += [
            f"especificacoes.{field}"
            for field in spec_fields
            if blank(specs.get(field))
            and blank((model_technical.get(field) or {}).get("valor"))
        ]
        model_docs = docs_by_model.get(int(model["id"]), [])
        technical_docs = [
            row for row in model_docs if row.get("tipo") == "ficha_tecnica" and row.get("ativo")
        ]
        if not technical_docs:
            missing.append("ficha_tecnica")
        for field in missing:
            missing_counts[field] += 1
        expected_type = "Ônibus" if family.get("tipo_veiculo") == "onibus" else "Caminhão"
        type_inconsistent = bool(specs.get("tipo_veiculo")) and (
            str(specs.get("tipo_veiculo")).casefold() != expected_type.casefold()
        )
        records.append(
            {
                "id": int(model["id"]),
                "marca": brand["nome"],
                "familia": family["nome"],
                "tipo_familia": family.get("tipo_veiculo"),
                "modelo": model["nome"],
                "slug": model["slug"],
                "faltantes": missing,
                "qtd_faltantes": len(missing),
                "tipo_inconsistente": type_inconsistent,
                "tipo_especificacao": specs.get("tipo_veiculo", ""),
                "documentos": technical_docs,
                "dados": {field: model.get(field) for field in scalar_fields},
                "especificacoes": specs,
                "especificacoes_tecnicas": model_technical,
            }
        )

    records.sort(key=lambda row: (str(row["marca"]), str(row["familia"]), str(row["modelo"])))
    summary = {
        "dump": str(dump_path),
        "marcas": len(brands),
        "familias": len(families),
        "modelos": len(models),
        "especificacoes_tecnicas": len(technical_rows),
        "modelos_com_pendencias": sum(bool(row["faltantes"]) for row in records),
        "modelos_sem_ficha": sum("ficha_tecnica" in row["faltantes"] for row in records),
        "tipos_inconsistentes": sum(bool(row["tipo_inconsistente"]) for row in records),
        "faltantes_por_campo": dict(missing_counts.most_common()),
    }
    (output_dir / "auditoria_modelos.json").write_text(
        json.dumps({"resumo": summary, "modelos": records}, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    with (output_dir / "auditoria_modelos.csv").open(
        "w", encoding="utf-8-sig", newline=""
    ) as stream:
        writer = csv.DictWriter(
            stream,
            fieldnames=[
                "id",
                "marca",
                "familia",
                "tipo_familia",
                "modelo",
                "slug",
                "qtd_faltantes",
                "faltantes",
                "tipo_inconsistente",
                "tipo_especificacao",
            ],
            delimiter=";",
        )
        writer.writeheader()
        for row in records:
            writer.writerow(
                {
                    key: (
                        ", ".join(row[key])
                        if key == "faltantes"
                        else row[key]
                    )
                    for key in writer.fieldnames
                }
            )
    print(json.dumps(summary, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
