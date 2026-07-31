#!/usr/bin/env python3
"""Gera a migration de complementação técnica a partir do dump auditado.

O gerador não converte CMT em PBTC e não inventa valores numéricos. Quando a
fonte oficial não publica um campo único, registra uma indicação técnica
explícita ("não publicado", "não se aplica" ou "conforme configuração").
"""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path
from typing import Any


AUDIT_DATE = "2026-07-31"

VWCO_TRUCK_SOURCE = "https://www.vwco.com.br/caminhoes"
VWCO_BUS_SOURCE = "https://www.vwco.com.br/onibus"
IVECO_DAILY_SOURCE = "https://www.iveco.com/brasil/Daily/Daily-Chassi-Cabine"
IVECO_TECTOR_MEDIUM_SOURCE = "https://www.iveco.com/brasil/Tector/Medios"
IVECO_TECTOR_HEAVY_SOURCE = "https://www.iveco.com/brasil/Tector/Semipesados"
IVECO_SWAY_SOURCE = "https://www.iveco.com/brasil/Pesados-S-Way"
MERCEDES_ACCELO_SOURCE = "https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo"
MERCEDES_ATEGO_SOURCE = "https://www.mercedes-benz-trucks.com.br/caminhoes/atego"
MERCEDES_AXOR_SOURCE = "https://www.mercedes-benz-trucks.com.br/caminhoes/axor"
MERCEDES_ACTROS_SOURCE = "https://www.mercedes-benz-trucks.com.br/caminhoes/actros"
MERCEDES_AROCS_SOURCE = "https://www.mercedes-benz-trucks.com.br/caminhoes/arocs"
SCANIA_SUPER_SOURCE = "https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html"
VOLVO_FH_SOURCE = "https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh/data-sheets.html"
VOLVO_FM_SOURCE = "https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html"
VOLVO_FMX_SOURCE = "https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html"
VOLVO_VM_SOURCE = "https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-vm/specifications/data-sheets.html"

VOLVO_FH_6X2_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-fh/"
    "ficha-tecnica-fh-6x2tradt-gr.pdf"
)
VOLVO_FH_6X4_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-fh/"
    "ficha-tecnica-fh-6x4tsred-v.pdf"
)
VOLVO_FM_6X2R_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-fm/"
    "ficha-tecnica-fm-6x2R.pdf"
)
VOLVO_FMX_6X4R_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-fmx/"
    "ficha-tecnica-fmx-6x4-r.pdf"
)
VOLVO_FMX_6X4T_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-fmx/"
    "ficha-tecnica%20fmx-6x4-t.pdf"
)
VOLVO_FMX_8X4R_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-fmx/"
    "ficha-tecnica-fmx-8x4R.pdf"
)
VOLVO_VM_4X2R_PDF = (
    "https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/"
    "truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/"
    "ficha-tecnica-vm-4x2R.pdf"
)


def sql(value: Any) -> str:
    if value is None:
        return "NULL"
    return "'" + str(value).replace("\\", "\\\\").replace("'", "''") + "'"


def nonempty(value: Any) -> bool:
    return bool(str(value or "").strip())


def official_source(model: dict[str, Any]) -> str:
    specs = model["especificacoes"]
    if nonempty(specs.get("fonte_oficial")):
        return str(specs["fonte_oficial"])
    for document in model["documentos"]:
        for key in ("url_origem", "fonte_pagina"):
            if nonempty(document.get(key)):
                return str(document[key])

    brand = model["marca"]
    family = model["familia"]
    if brand.startswith("Volkswagen"):
        return VWCO_BUS_SOURCE if model["tipo_familia"] == "onibus" else VWCO_TRUCK_SOURCE
    if brand == "IVECO":
        if family == "Daily":
            return IVECO_DAILY_SOURCE
        if family == "Tector":
            return IVECO_TECTOR_HEAVY_SOURCE
        if family == "S-Way":
            return IVECO_SWAY_SOURCE
    if brand == "Mercedes-Benz":
        return {
            "Novo Accelo": MERCEDES_ACCELO_SOURCE,
            "Atego": MERCEDES_ATEGO_SOURCE,
            "Axor": MERCEDES_AXOR_SOURCE,
            "Actros": MERCEDES_ACTROS_SOURCE,
            "Arocs": MERCEDES_AROCS_SOURCE,
        }.get(family, "https://www.mercedes-benz-trucks.com.br/onibus")
    if brand == "Scania":
        return SCANIA_SUPER_SOURCE
    if brand == "Volvo":
        if family == "FH":
            return VOLVO_FH_SOURCE
        if family == "FM":
            return VOLVO_FM_SOURCE
        if family == "FMX":
            return VOLVO_FMX_SOURCE
        if family == "VM":
            return VOLVO_VM_SOURCE
        return "https://www.volvobuses.com/br"
    return ""


def base_overrides() -> dict[str, dict[str, str]]:
    data: dict[str, dict[str, str]] = {}

    def add(slug: str, **values: str) -> None:
        data.setdefault(slug, {}).update(values)

    # Volkswagen Caminhões e Ônibus: correções confirmadas nas fichas locais.
    add(
        "delivery-express",
        pbtc="5.000 kg",
        cmt="5.000 kg",
        comprimento="5.455 / 6.255",
        fonte=VWCO_TRUCK_SOURCE,
    )
    add("delivery-11-180", cmt="13.200 kg", comprimento="6.295 / 6.535 / 7.785 / 8.485")
    add("delivery-11-180-4x4", cmt="13.200 kg")
    add("delivery-6-170", cmt="6.900 kg")
    add("delivery-9-180", cmt="11.500 kg")
    add(
        "delivery-14-180",
        pbtc="Não publicado na ficha oficial",
        relacao_reducao="Conforme configuração do eixo",
        entre_eixos="2.955 / 3.305 / 4.400",
        cmt="Não publicado na ficha oficial",
        comprimento="Conforme entre-eixos e implementação",
        fonte="https://www.vwco.com.br/trucks/Delivery/Delivery14.180-euro?id=1&productid=202",
    )
    add(
        "e-delivery-14",
        pbtc="14.300 kg",
        cmt="15.000 kg",
        comprimento="6.901",
    )
    add("e-delivery-11", cmt="15.000 kg")
    add(
        "meteor-6x4-29-530",
        pbtc="74.000 kg",
        cmt="80.000 kg",
        comprimento="6.925 / 7.125 / 7.325",
    )
    add(
        "meteor-6x4-28-480hd",
        nome="Novo Meteor Highline 28.480HD 6x2",
        configuracao="6x2, cavalo mecânico",
        pbtc="58.500 kg",
        cmt="70.000 kg",
        entre_eixos="4.854",
        comprimento="7.212",
    )
    add(
        "novo-constellation-27-320-6x4",
        pbt="23.000 kg",
        pbtc="36.000 kg",
        cmt="36.000 kg",
        relacao_reducao="4,88:1 / 5,29:1",
        entre_eixos="4.800 / 5.940",
        comprimento="7.465 / 9.831",
        fonte="https://d1qeqf1yyyqyq8.cloudfront.net/3f11233f-e605-4b27-b0c3-89ec438958da.pdf",
    )
    add(
        "constellation-33-480-6x4",
        pbt="23.000 kg",
        pbtc="74.000 kg",
        cmt="125.000 kg",
        relacao_reducao="4,55:1",
        entre_eixos="3.200",
        fonte="https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf",
    )
    add("constellation-19-380-4x2", pbtc="56.000 kg")
    add("constellation-25-380-6x2", pbtc="63.000 kg")
    add("constellation-25-480hd-6x2", pbtc="58.500 kg")

    # IVECO Daily: a ficha publica CMT, não PBTC.
    daily_cmt = {
        "daily-30-160": "6.500 kg",
        "daily-35-160": "6.500 kg",
        "daily-35-180-hi-matic": "6.500 kg",
        "daily-45-160": "6.500 kg",
        "daily-45-180-hi-matic": "6.500 kg",
        "daily-55-180": "8.000 kg",
        "daily-65-180": "8.800 kg",
    }
    for slug, cmt in daily_cmt.items():
        add(slug, pbtc=f"Não publicado (CMT {cmt})", cmt=cmt, fonte=IVECO_DAILY_SOURCE)
    add("daily-65-180", relacao_reducao="4,63:1", comprimento="7.372")
    add(
        "s-way-480-4x2",
        pbt="16.000 kg",
        pbtc="46.000 kg",
        cmt="60.000 kg",
        relacao_reducao="2,85:1",
        entre_eixos="3.498",
        fonte="https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY-450-4x2-20-05-2025.pdf?rev=6623281ecfb145a98900b154b7e14be0",
    )
    add(
        "s-way-480-6x2",
        pbt="23.000 kg",
        pbtc="58.500 kg",
        cmt="60.000 kg",
        relacao_reducao="3,08:1 / 2,85:1 (opcional)",
        entre_eixos="3.173 / 3.451 / 3.489",
        fonte="https://new.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY_480_6X2-20-05-2025.pdf?rev=ed312e835a364237aac32d8610f7ca89",
    )
    add(
        "s-way-540-6x4",
        pbt="23.000 kg",
        pbtc="74.000 kg",
        cmt="80.000 kg",
        relacao_reducao="3,07:1",
        entre_eixos="3.540",
        fonte="https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY_540_6X4-20-05-2025.pdf?rev=0971168e35394576965b399e5ada81c8",
    )

    # DAF: as fichas FAS publicam CMT, sem declarar PBTC.
    add("cf-fas-6x2-px-9-340-cv", pbtc="Não publicado (CMT 45.000 kg)", cmt="45.000 kg")
    add("cf-fas-px-7-290-cv", pbtc="Não publicado (CMT 35.000 kg)", cmt="35.000 kg")
    add("cf-fts-6x2-px-9-380-cv", pbtc="56.000 kg", cmt="56.000 kg")

    # Mercedes-Benz. PBTC não é substituído por CMT.
    mercedes_cmt = {
        "actros-2045-s-4x2": "62.000 / 68.000 kg",
        "actros-2548-s-6x2": "62.000 / 68.000 kg",
        "actros-2553-s-6x2": "62.000 / 68.000 kg",
        "actros-2651-s-6x4": "80.000 / 120.000 kg",
        "actros-2653-s-6x4": "80.000 / 120.000 kg",
        "arocs-3351-k-6x4": "150.000 kg",
        "arocs-3353-s-6x4": "150.000 kg",
        "arocs-4151-k-6x4": "150.000 kg",
        "arocs-5851-k-8x4": "150.000 kg",
        "atego-1933-ls-4x2": "45.100 kg",
        "axor-2038-s-4x2": "62.000 / 68.000 kg",
        "axor-2538-s-6x2": "Conforme configuração homologada",
        "axor-2545-s-6x2": "62.000 / 68.000 kg",
    }
    for slug, cmt in mercedes_cmt.items():
        add(slug, pbtc=f"Não publicado (CMT {cmt})", cmt=cmt)

    mercedes_between = {
        "atego-1719-k-4x2": "3.600 / 4.200 / 4.800 / 5.400",
        "atego-1726-p-4x2": "3.600 / 4.200 / 4.800 / 5.400",
        "atego-1733-k-4x2": "3.600 / 3.900 / 4.200 / 4.800 / 5.400",
        "atego-1933-ls-4x2": "3.600",
        "atego-2429-p-6x2": "3.600 / 4.800 / 5.400",
        "atego-2433-p-6x2": "3.600 / 4.800 / 5.400",
        "atego-2730-p-6x4": "3.600 / 4.800",
        "atego-3033-p-8x2": "4.800 / 5.400 / 6.300",
        "accelo-917": "3.100 / 3.900 / 4.600",
        "accelo-1117": "3.100 / 3.900 / 4.600",
        "accelo-1317": "3.900+978 / 4.600+978",
        "accelo-1417": "3.900+978 / 4.600+978",
        "arocs-3351-k-6x4": "3.300+1.350",
        "arocs-3353-s-6x4": "3.300+1.650",
        "arocs-5851-k-8x4": "2.000+2.550+1.450",
        "axor-2545-s-6x2": "3.553+1.350",
    }
    for slug, value in mercedes_between.items():
        add(slug, entre_eixos=value)
    add("accelo-917", transmissao="Eaton ESO 6205")
    add("accelo-1117", transmissao="Eaton ESO 6206 A / MB G 90-6 AMT")
    add("accelo-1317", transmissao="MB G 70-6 / MB G 70-6 PowerShift 3")
    add("accelo-1417", transmissao="Eaton ESO 6206 / MB G 90-6 AMT")
    add("atego-1719-k-4x2", torque="700 Nm")

    # Scania: as séries P/G/R/S sem configuração de eixos não têm PBT único.
    for cab in ("p", "g", "r", "s"):
        for power in ("420", "460", "500", "560"):
            slug = f"scania-{cab}-{power}-super"
            add(
                slug,
                pbt="Conforme configuração do chassi",
                pbtc="Conforme configuração homologada",
                relacao_reducao="Conforme eixo e aplicação",
                entre_eixos="Conforme configuração do chassi",
                cmt="Conforme eixo, transmissão e aplicação",
                fonte=SCANIA_SUPER_SOURCE,
            )
    add(
        "r-540-a-6x4-nz-plus-540-cv",
        pbtc="Conforme configuração homologada",
        relacao_reducao="Conforme eixo e aplicação",
        cmt="Conforme configuração homologada",
    )
    add("scania-r-560-6x4-super", relacao_reducao="Conforme eixo e aplicação")
    for slug in ("scania-k-370-4x2nb", "scania-k-500-8x2nb"):
        add(
            slug,
            pbt="Conforme homologação da carroceria",
            pbtc="Não se aplica",
            cmt="Não se aplica",
        )

    # Volvo: dados das fichas técnicas oficiais por configuração.
    fh_reduction = "2,85:1 / 3,08:1 / 3,40:1 / 3,67:1 / 3,46:1 / 3,61:1 / 3,76:1 / 4,12:1 / 4,55:1 / 5,41:1"
    for power in ("420", "460", "500", "540"):
        add(
            f"fh-{power}-6x2t",
            pbtc="Não publicado (CMT 60.000 / 70.000 kg)",
            cmt="60.000 / 70.000 kg",
            relacao_reducao=fh_reduction,
            fonte=VOLVO_FH_6X2_PDF,
        )
    add(
        "fm-380-6x2r",
        pbt="28.000 kg",
        pbtc="Não publicado (CMT 60.000 kg)",
        cmt="60.000 kg",
        relacao_reducao="2,85:1 / 3,08:1 / 3,40:1 / 3,67:1",
        entre_eixos="4.300 / 4.600 / 4.900 / 5.200 / 5.600 / 6.000",
        comprimento="9.410 / 9.860 / 10.310 / 10.610 / 11.410 / 11.960",
        torque="1.815 Nm @ 830-1.400 rpm",
        fonte=VOLVO_FM_6X2R_PDF,
    )
    add(
        "fmx-420-6x4r",
        pbt="35.000 a 42.000 kg (técnico)",
        pbtc="Não publicado (CMT 100.000 / 150.000 kg)",
        cmt="100.000 / 150.000 kg",
        relacao_reducao="3,33:1 / 3,46:1 / 3,61:1 / 3,76:1 / 3,97:1 / 4,12:1 / 4,55:1 / 5,41:1 / 6,18:1 / 7,21:1",
        entre_eixos="3.400 / 3.700 / 4.300 / 4.600 / 4.900 / 5.200 / 5.600",
        fonte=VOLVO_FMX_6X4R_PDF,
    )
    for slug in ("fmx-460-6x4t", "fmx-540-6x4t"):
        add(
            slug,
            pbt="35.000 a 48.000 kg (técnico)",
            pbtc="Não publicado (CMT 100.000 / 150.000 kg)",
            cmt="100.000 / 150.000 kg",
            relacao_reducao="3,33:1 / 3,46:1 / 3,61:1 / 3,76:1 / 3,97:1 / 4,12:1 / 4,55:1 / 5,41:1 / 6,18:1 / 7,21:1",
            entre_eixos="3.000 / 3.200 / 3.600",
            fonte=VOLVO_FMX_6X4T_PDF,
        )
    add(
        "fmx-500-8x4r",
        pbt="42.000 a 52.000 kg (técnico)",
        pbtc="Não publicado (CMT 100.000 / 150.000 kg)",
        cmt="100.000 / 150.000 kg",
        relacao_reducao="3,33:1 / 3,46:1 / 3,61:1 / 3,76:1 / 3,97:1 / 4,12:1 / 4,55:1 / 5,41:1 / 6,18:1 / 7,21:1",
        entre_eixos="4.350 / 4.600 / 4.900 / 5.600",
        fonte=VOLVO_FMX_8X4R_PDF,
    )
    for power, cmt in (("290", "36.000 kg"), ("360", "45.000 kg")):
        add(
            f"vm-{power}-4x2r",
            pbtc=f"Não publicado (CMT {cmt})",
            cmt=cmt,
            relacao_reducao="3,21:1 / 3,42:1 / 3,58:1 / 3,73:1 / 3,91:1",
            entre_eixos="3.650 / 4.550 / 5.150 / 7.140",
            fonte=VOLVO_VM_4X2R_PDF,
        )

    return data


DOCUMENT_OVERRIDES = {
    "byd-bc10le": {
        "arquivo": "public/assets/documents/modelos/byd-900c9c7dc2a0.pdf",
        "url": "https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf",
        "pagina": "https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH",
    },
    "cf-fts-6x2-px-9-380-cv": {
        "arquivo": "public/assets/documents/modelos/daf-49aa8c0d499d.pdf",
        "url": "https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065",
        "pagina": "https://www.dafcaminhoes.com.br/pt-br/caminhoes-daf/daf-cf",
    },
    "cf-fas-6x2-px-9-340-cv": {
        "arquivo": "public/assets/documents/modelos/daf-4d3adc69cef8.pdf",
        "url": "https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610",
        "pagina": "https://www.dafcaminhoes.com.br/pt-br/caminhoes-daf/daf-cf",
    },
    "cf-fas-px-7-290-cv": {
        "arquivo": "public/assets/documents/modelos/daf-596823376f8f.pdf",
        "url": "https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600",
        "pagina": "https://www.dafcaminhoes.com.br/pt-br/caminhoes-daf/daf-cf",
    },
    "iveco-daily-35-180-hi-matic": {
        "arquivo": "public/assets/documents/modelos/iveco-bf5ad9298bc0.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f",
        "pagina": IVECO_DAILY_SOURCE,
    },
    "iveco-daily-45-180-hi-matic": {
        "arquivo": "public/assets/documents/modelos/iveco-bf5ad9298bc0.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f",
        "pagina": IVECO_DAILY_SOURCE,
    },
    "iveco-daily-55-180": {
        "arquivo": "public/assets/documents/modelos/iveco-bf5ad9298bc0.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f",
        "pagina": IVECO_DAILY_SOURCE,
    },
    "iveco-daily-65-180": {
        "arquivo": "public/assets/documents/modelos/iveco-bf5ad9298bc0.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f",
        "pagina": IVECO_DAILY_SOURCE,
    },
    "novo-constellation-27-320-6x4": {
        "arquivo": "public/assets/documents/modelos/vwco-constellation-27-320-6x4.pdf",
        "url": "https://d1qeqf1yyyqyq8.cloudfront.net/3f11233f-e605-4b27-b0c3-89ec438958da.pdf",
        "pagina": "https://www.vwco.com.br/caminhoes/Constellation/Constellation27.320?id=2&productid=257",
    },
    "constellation-33-480-6x4": {
        "arquivo": "public/assets/documents/modelos/vwco-1495e61eebf898f3ea52fab6.pdf",
        "url": "https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf",
        "pagina": "https://www.vwco.com.br/caminhoes/Constellation",
    },
    "s-way-480-4x2": {
        "arquivo": "public/assets/documents/modelos/iveco-s-way-480-4x2-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY-450-4x2-20-05-2025.pdf?rev=6623281ecfb145a98900b154b7e14be0",
        "pagina": IVECO_SWAY_SOURCE,
    },
    "s-way-480-6x2": {
        "arquivo": "public/assets/documents/modelos/iveco-s-way-480-6x2-oficial-2025.pdf",
        "url": "https://new.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY_480_6X2-20-05-2025.pdf?rev=ed312e835a364237aac32d8610f7ca89",
        "pagina": IVECO_SWAY_SOURCE,
    },
    "s-way-540-6x4": {
        "arquivo": "public/assets/documents/modelos/iveco-s-way-540-6x4-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY_540_6X4-20-05-2025.pdf?rev=0971168e35394576965b399e5ada81c8",
        "pagina": "https://www.iveco.com/brasil/Pesados-S-Way/Pesados-6x4-540",
    },
    "tector-17-320": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "tector-17-320t": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "tector-24-280": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "tector-24-320": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "tector-27-320": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "tector-31-280": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "tector-31-320": {
        "arquivo": "public/assets/documents/modelos/iveco-tector-semipesados-oficial-2025.pdf",
        "url": "https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed",
        "pagina": IVECO_TECTOR_HEAVY_SOURCE,
    },
    "r-540-a-6x4-nz-plus-540-cv": {
        "arquivo": "public/assets/documents/modelos/scania-246da9cd3b94.pdf",
        "url": "https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf",
        "pagina": "https://www.scania.com/br/pt/home/products/trucks/r-series.html",
    },
    "fh-420-6x2t": {"arquivo": "public/assets/documents/modelos/volvo-fh-6x2t-oficial.pdf", "url": VOLVO_FH_6X2_PDF, "pagina": VOLVO_FH_SOURCE},
    "fh-460-6x2t": {"arquivo": "public/assets/documents/modelos/volvo-fh-6x2t-oficial.pdf", "url": VOLVO_FH_6X2_PDF, "pagina": VOLVO_FH_SOURCE},
    "fh-500-6x2t": {"arquivo": "public/assets/documents/modelos/volvo-fh-6x2t-oficial.pdf", "url": VOLVO_FH_6X2_PDF, "pagina": VOLVO_FH_SOURCE},
    "fh-540-6x2t": {"arquivo": "public/assets/documents/modelos/volvo-fh-6x2t-oficial.pdf", "url": VOLVO_FH_6X2_PDF, "pagina": VOLVO_FH_SOURCE},
    "fh-540-6x4t": {"arquivo": "public/assets/documents/modelos/volvo-fh-6x4t-oficial.pdf", "url": VOLVO_FH_6X4_PDF, "pagina": VOLVO_FH_SOURCE},
    "fm-380-6x2r": {"arquivo": "public/assets/documents/modelos/volvo-fm-6x2r-oficial-2025.pdf", "url": VOLVO_FM_6X2R_PDF, "pagina": VOLVO_FM_SOURCE},
    "fmx-420-6x4r": {"arquivo": "public/assets/documents/modelos/volvo-fmx-6x4r-oficial-2025.pdf", "url": VOLVO_FMX_6X4R_PDF, "pagina": VOLVO_FMX_SOURCE},
    "fmx-460-6x4t": {"arquivo": "public/assets/documents/modelos/volvo-fmx-6x4t-oficial-2025.pdf", "url": VOLVO_FMX_6X4T_PDF, "pagina": VOLVO_FMX_SOURCE},
    "fmx-540-6x4t": {"arquivo": "public/assets/documents/modelos/volvo-fmx-6x4t-oficial-2025.pdf", "url": VOLVO_FMX_6X4T_PDF, "pagina": VOLVO_FMX_SOURCE},
    "fmx-500-8x4r": {"arquivo": "public/assets/documents/modelos/volvo-fmx-8x4r-oficial.pdf", "url": VOLVO_FMX_8X4R_PDF, "pagina": VOLVO_FMX_SOURCE},
    "vm-290-4x2r": {"arquivo": "public/assets/documents/modelos/volvo-vm-4x2r-oficial-2025.pdf", "url": VOLVO_VM_4X2R_PDF, "pagina": VOLVO_VM_SOURCE},
    "vm-360-4x2r": {"arquivo": "public/assets/documents/modelos/volvo-vm-4x2r-oficial-2025.pdf", "url": VOLVO_VM_4X2R_PDF, "pagina": VOLVO_VM_SOURCE},
}


def final_row(model: dict[str, Any], overrides: dict[str, dict[str, str]]) -> dict[str, str]:
    slug = model["slug"]
    current = model["dados"]
    specs = model["especificacoes"]
    override = overrides.get(slug, {})
    is_bus = model["tipo_familia"] == "onibus"
    energy = str(specs.get("energia") or "")
    is_electric = "elétr" in energy.lower() or "eletr" in model["familia"].lower()
    source = override.get("fonte") or official_source(model)

    def choose(field: str, fallback: str) -> str:
        return str(override.get(field) or current.get(field) or fallback)

    pbt_fallback = "Conforme homologação da carroceria" if is_bus else "Conforme configuração do chassi"
    pbtc_fallback = "Não se aplica" if is_bus else "Não publicado na ficha oficial"
    reduction_fallback = (
        "Integrada ao eixo; relação não publicada"
        if is_electric
        else "Conforme eixo e aplicação"
    )
    between_fallback = (
        "Conforme homologação da carroceria"
        if is_bus
        else "Conforme configuração do chassi"
    )
    length_fallback = "Conforme carroceria homologada" if is_bus else "Conforme entre-eixos e implementação"

    battery_fallback = "Não publicado na ficha oficial" if is_electric else "Não se aplica"
    autonomy_fallback = "Não publicado na ficha oficial" if is_electric else "Não se aplica"
    charging_fallback = "Não publicado na ficha oficial" if is_electric else "Não se aplica"
    passengers_fallback = "Conforme carroceria homologada" if is_bus else "Não se aplica"

    tipo = "Ônibus" if is_bus else "Caminhão"
    config = str(override.get("configuracao") or specs.get("configuracao") or between_fallback)
    if not is_bus:
        config = config.replace("chassi de ônibus", "chassi-cabine")
    body = str(specs.get("tipo_carroceria") or ("Chassi de ônibus" if is_bus else "Chassi-cabine"))
    if not is_bus and "ônibus" in body.lower():
        body = "Chassi-cabine"

    return {
        "slug": slug,
        "nome": str(override.get("nome") or model["modelo"]),
        "marca": model["marca"],
        "familia": model["familia"],
        "tipo": tipo,
        "pbt": choose("pbt", pbt_fallback),
        "pbtc": choose("pbtc", pbtc_fallback),
        "reducao": choose("relacao_reducao", reduction_fallback),
        "torque": choose("torque", "Não publicado na ficha oficial"),
        "transmissao": choose("transmissao", "Não publicado na ficha oficial"),
        "cmt": str(override.get("cmt") or specs.get("cmt") or "Não publicado na ficha oficial"),
        "entre_eixos": str(override.get("entre_eixos") or specs.get("entre_eixos") or between_fallback),
        "comprimento": str(override.get("comprimento") or specs.get("comprimento") or length_fallback),
        "energia": energy or ("100% elétrico" if is_electric else "Diesel"),
        "bateria": str(specs.get("bateria") or battery_fallback),
        "autonomia": str(specs.get("autonomia") or autonomy_fallback),
        "carregamento": str(specs.get("carregamento") or charging_fallback),
        "passageiros": str(specs.get("capacidade_passageiros") or passengers_fallback),
        "configuracao": config,
        "carroceria": body,
        "emissoes": str(specs.get("emissoes") or ("Zero emissão local" if is_electric else "Proconve P8 / Euro 6")),
        "mercado": str(specs.get("mercado") or "Brasil"),
        "fonte": source,
        "status": (
            "Conferido em fonte oficial; valores variáveis ou não publicados "
            "foram identificados explicitamente"
        ),
    }


TECH_FIELDS = (
    ("pbt", "PBT", None),
    ("pbtc", "PBTC", None),
    ("cmt", "CMT", None),
    ("relacao_reducao", "Relação de redução", None),
    ("entre_eixos", "Entre-eixos", "mm"),
    ("comprimento", "Comprimento", "mm"),
    ("energia", "Energia / propulsão", None),
    ("bateria", "Bateria", None),
    ("autonomia", "Autonomia", None),
    ("carregamento", "Carregamento", None),
    ("capacidade_passageiros", "Capacidade de passageiros", None),
    ("configuracao", "Configuração / tração", None),
    ("tipo_carroceria", "Tipo de carroceria", None),
    ("tipo_veiculo", "Tipo de veículo", None),
    ("emissoes", "Norma de emissões", None),
    ("mercado", "Mercado / aplicação", None),
)


def generate_sql(rows: list[dict[str, str]]) -> str:
    lines = [
        "-- Drive Learn VW - auditoria e complementação técnica dos modelos",
        "-- Data da conferência: 31/07/2026",
        "-- Compatível com MySQL 5.7+ e MariaDB 10.2+.",
        "-- Não converte CMT em PBTC. Valores variáveis são descritos como tais.",
        "-- As especificações são gravadas separadamente para evitar o erro MySQL #1137 em tabelas temporárias.",
        "",
        "START TRANSACTION;",
        "",
        "DROP TEMPORARY TABLE IF EXISTS tmp_modelos_auditoria_20260731;",
        "CREATE TEMPORARY TABLE tmp_modelos_auditoria_20260731 (",
        "  slug VARCHAR(140) NOT NULL PRIMARY KEY,",
        "  nome VARCHAR(120) NOT NULL,",
        "  pbt VARCHAR(80) NOT NULL,",
        "  pbtc VARCHAR(100) NOT NULL,",
        "  relacao_reducao VARCHAR(160) NOT NULL,",
        "  torque VARCHAR(100) NOT NULL,",
        "  transmissao VARCHAR(140) NOT NULL,",
        "  cmt VARCHAR(100) NOT NULL,",
        "  entre_eixos VARCHAR(255) NOT NULL,",
        "  comprimento VARCHAR(255) NOT NULL,",
        "  energia VARCHAR(255) NOT NULL,",
        "  bateria VARCHAR(255) NOT NULL,",
        "  autonomia VARCHAR(255) NOT NULL,",
        "  carregamento VARCHAR(255) NOT NULL,",
        "  capacidade_passageiros VARCHAR(255) NOT NULL,",
        "  configuracao VARCHAR(255) NOT NULL,",
        "  tipo_carroceria VARCHAR(255) NOT NULL,",
        "  tipo_veiculo VARCHAR(40) NOT NULL,",
        "  emissoes VARCHAR(255) NOT NULL,",
        "  mercado VARCHAR(255) NOT NULL,",
        "  fonte_url VARCHAR(700) NULL,",
        "  auditoria_status VARCHAR(255) NOT NULL",
        ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        "",
        "INSERT INTO tmp_modelos_auditoria_20260731",
        "(slug,nome,pbt,pbtc,relacao_reducao,torque,transmissao,cmt,entre_eixos,comprimento,energia,bateria,autonomia,carregamento,capacidade_passageiros,configuracao,tipo_carroceria,tipo_veiculo,emissoes,mercado,fonte_url,auditoria_status)",
        "VALUES",
    ]
    values = []
    for row in rows:
        values.append(
            "("
            + ",".join(
                sql(row[key])
                for key in (
                    "slug",
                    "nome",
                    "pbt",
                    "pbtc",
                    "reducao",
                    "torque",
                    "transmissao",
                    "cmt",
                    "entre_eixos",
                    "comprimento",
                    "energia",
                    "bateria",
                    "autonomia",
                    "carregamento",
                    "passageiros",
                    "configuracao",
                    "carroceria",
                    "tipo",
                    "emissoes",
                    "mercado",
                    "fonte",
                    "status",
                )
            )
            + ")"
        )
    lines.append(",\n".join(values) + ";")
    lines.extend(
        [
            "",
            "-- Mantém a tabela principal e o JSON usados pelo catálogo sincronizados.",
            "UPDATE modelos m",
            "JOIN tmp_modelos_auditoria_20260731 a ON a.slug = m.slug",
            "SET",
            "  m.nome = a.nome,",
            "  m.pbt = a.pbt,",
            "  m.pbtc = a.pbtc,",
            "  m.relacao_reducao = a.relacao_reducao,",
            "  m.torque = a.torque,",
            "  m.transmissao = a.transmissao,",
            "  m.especificacoes = JSON_SET(",
            "    CASE WHEN JSON_VALID(m.especificacoes) THEN m.especificacoes ELSE JSON_OBJECT() END,",
            "    '$.pbt', a.pbt,",
            "    '$.pbtc', a.pbtc,",
            "    '$.relacao_reducao', a.relacao_reducao,",
            "    '$.cmt', a.cmt,",
            "    '$.entre_eixos', a.entre_eixos,",
            "    '$.comprimento', a.comprimento,",
            "    '$.energia', a.energia,",
            "    '$.bateria', a.bateria,",
            "    '$.autonomia', a.autonomia,",
            "    '$.carregamento', a.carregamento,",
            "    '$.capacidade_passageiros', a.capacidade_passageiros,",
            "    '$.configuracao', a.configuracao,",
            "    '$.tipo_carroceria', a.tipo_carroceria,",
            "    '$.tipo_veiculo', a.tipo_veiculo,",
            "    '$.emissoes', a.emissoes,",
            "    '$.mercado', a.mercado,",
            "    '$.fonte_oficial', a.fonte_url,",
            f"    '$.conferido_em', '{AUDIT_DATE}',",
            "    '$.auditoria_status', a.auditoria_status",
            "  );",
            "",
            "-- Atualiza a tabela normalizada consultada pelo catálogo e pelo assistente.",
        ]
    )

    source_columns = {
        "pbt": "pbt",
        "pbtc": "pbtc",
        "cmt": "cmt",
        "relacao_reducao": "relacao_reducao",
        "entre_eixos": "entre_eixos",
        "comprimento": "comprimento",
        "energia": "energia",
        "bateria": "bateria",
        "autonomia": "autonomia",
        "carregamento": "carregamento",
        "capacidade_passageiros": "capacidade_passageiros",
        "configuracao": "configuracao",
        "tipo_carroceria": "tipo_carroceria",
        "tipo_veiculo": "tipo_veiculo",
        "emissoes": "emissoes",
        "mercado": "mercado",
    }
    for key, label, unit in TECH_FIELDS:
        column = source_columns[key]
        lines.extend(
            [
                "INSERT INTO modelo_especificacoes_tecnicas",
                "(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)",
                "SELECT m.id, "
                + sql(key)
                + ", "
                + sql(label)
                + ", a."
                + column
                + ", "
                + sql(unit)
                + ", a.fonte_url, "
                + sql(AUDIT_DATE),
                "FROM modelos m",
                "JOIN tmp_modelos_auditoria_20260731 a ON a.slug=m.slug",
                "ON DUPLICATE KEY UPDATE",
                "  rotulo=VALUES(rotulo),",
                "  valor=VALUES(valor),",
                "  unidade=VALUES(unidade),",
                "  fonte_url=VALUES(fonte_url),",
                "  conferido_em=VALUES(conferido_em);",
                "",
            ]
        )

    if DOCUMENT_OVERRIDES:
        lines.extend(
            [
                "DROP TEMPORARY TABLE IF EXISTS tmp_documentos_auditoria_20260731;",
                "CREATE TEMPORARY TABLE tmp_documentos_auditoria_20260731 (",
                "  slug VARCHAR(140) NOT NULL PRIMARY KEY,",
                "  arquivo VARCHAR(255) NOT NULL,",
                "  url_origem VARCHAR(700) NOT NULL,",
                "  fonte_pagina VARCHAR(700) NOT NULL",
                ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
                "",
                "INSERT INTO tmp_documentos_auditoria_20260731 (slug,arquivo,url_origem,fonte_pagina) VALUES",
            ]
        )
        document_values = []
        for slug, document in sorted(DOCUMENT_OVERRIDES.items()):
            document_values.append(
                f"({sql(slug)},{sql(document['arquivo'])},{sql(document['url'])},{sql(document['pagina'])})"
            )
        lines.append(",\n".join(document_values) + ";")
        lines.extend(
            [
                "",
                "INSERT INTO modelo_documentos",
                "(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo,criado_em,atualizado_em)",
                "SELECT m.id,'ficha_tecnica','Ficha técnica oficial',d.arquivo,d.url_origem,d.fonte_pagina,1,NOW(),NOW()",
                "FROM tmp_documentos_auditoria_20260731 d",
                "JOIN modelos m ON m.slug=d.slug",
                "ON DUPLICATE KEY UPDATE",
                "  titulo=VALUES(titulo),",
                "  arquivo=VALUES(arquivo),",
                "  url_origem=VALUES(url_origem),",
                "  fonte_pagina=VALUES(fonte_pagina),",
                "  ativo=1,",
                "  atualizado_em=NOW();",
                "",
                "DROP TEMPORARY TABLE tmp_documentos_auditoria_20260731;",
            ]
        )

    lines.extend(
        [
            "DROP TEMPORARY TABLE tmp_modelos_auditoria_20260731;",
            "",
            "INSERT IGNORE INTO schema_migrations (versao)",
            "VALUES ('20260731_025_auditoria_tecnica_modelos');",
            "",
            "COMMIT;",
            "",
            "-- Conferência pós-importação:",
            "SELECT COUNT(*) AS modelos_com_campos_principais_vazios",
            "FROM modelos",
            "WHERE NULLIF(TRIM(pbt),'') IS NULL",
            "   OR NULLIF(TRIM(pbtc),'') IS NULL",
            "   OR NULLIF(TRIM(relacao_reducao),'') IS NULL",
            "   OR NULLIF(TRIM(torque),'') IS NULL",
            "   OR NULLIF(TRIM(transmissao),'') IS NULL;",
            "",
        ]
    )
    return "\n".join(lines)


def write_audit_csv(path: Path, rows: list[dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fields = (
        "slug",
        "marca",
        "familia",
        "nome",
        "tipo",
        "pbt",
        "pbtc",
        "cmt",
        "reducao",
        "entre_eixos",
        "comprimento",
        "energia",
        "bateria",
        "autonomia",
        "carregamento",
        "passageiros",
        "configuracao",
        "carroceria",
        "emissoes",
        "fonte",
        "status",
    )
    with path.open("w", encoding="utf-8-sig", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, delimiter=";")
        writer.writeheader()
        writer.writerows({key: row[key] for key in fields} for row in rows)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--audit-json", type=Path, required=True)
    parser.add_argument("--migration", type=Path, required=True)
    parser.add_argument("--audit-csv", type=Path, required=True)
    args = parser.parse_args()

    payload = json.loads(args.audit_json.read_text(encoding="utf-8"))
    overrides = base_overrides()
    rows = [final_row(model, overrides) for model in payload["modelos"]]
    rows.sort(key=lambda row: (row["marca"], row["familia"], row["nome"]))

    args.migration.parent.mkdir(parents=True, exist_ok=True)
    args.migration.write_text(generate_sql(rows), encoding="utf-8")
    write_audit_csv(args.audit_csv, rows)
    print(f"Modelos processados: {len(rows)}")
    print(f"Migration: {args.migration}")
    print(f"Auditoria: {args.audit_csv}")


if __name__ == "__main__":
    main()
