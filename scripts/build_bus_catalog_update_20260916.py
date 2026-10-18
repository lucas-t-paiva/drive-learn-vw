"""Gera migrações auditáveis do catálogo de ônibus. Não conecta ao banco."""
from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MIGRATIONS = ROOT / "database" / "migrations"
AUDIT = ROOT / "docs" / "AUDITORIA_CATALOGO_ONIBUS_2026-09-16.md"
DATE = "2026-09-16"


def model(family, name, slug, **values):
    return {"family": family, "name": name, "slug": slug, **values}


VOLVO_PAGE = "https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html"
VOLVO_BZR = "https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html"
VOLVO_BZRT = "https://www.volvobuses.com/br/Rodoviario/volvo-bzrt-electric/specifications.html"
VOLVO_BZL = "https://www.volvobuses.com/br/Rodoviario/volvo-bzl-electric/specifications.html"
VOLVO_B320 = "https://www.volvogroup.com/br/news-and-media/news/2026/jul/chassi-b320r-6x2-b100-flex-amplia-a-oferta-volvo-para-a-descarbo.html"
SCANIA_ROAD = "https://www.scania.com/br/pt/home/products/onibus/chassi-rodoviario/especificacoetecnicas.html"
SCANIA_SUPER = "https://www.scania.com/br/pt/home/products/onibus/scania-new-bus-and-coach-powertrain.html"
SCANIA_URBAN = "https://www.scania.com/br/pt/home/products/onibus/chassi-urbano.html"
IVECO_BUS = "https://www.ivecobus.com/latam-pt/chassi-onibus"
IVECO_SCHOOL = "https://www.ivecobus.com/latam-pt/onibus-rural-escolar"
IVECO_2026 = "https://www.ivecogroup.com/media/brand_press_releases/2026/SOUTH-AMERICA-(BR-PORTUG)/Iveco-Bus/iveco_bus_anuncia_investimento_de_r_150_milhes_e_amplia_portflio_paraacelerar_crescimento_na_amrica_latina_20260811T151057T911_krk3a2jwbotf1semw3w5wujl"
IVECO_BEV = "https://www.ivecogroup.com/media/brand_press_releases/2024/SOUTH-AMERICA-(BR-PORTUG)/Iveco-Bus/17-e_bev__o_chassi_eltrico_da_iveco_bus_desenvolvido_para_a_realidade_do_brasil_e_da_amrica_latina_20240806T192144T864_3fduqmuiofuxvztvmbnq1ja1"


def volvo_b13(name, slug, hp, kw, torque, rpm, axles, pbt, wheelbase, length, doc):
    return model(
        "B13R Rodoviários", name, slug,
        motor=f"Volvo D13K{hp}, 12,8 l, 6 cilindros em linha, Euro 6",
        potencia=f"{hp} hp ({kw} kW) @ {rpm}", torque=torque,
        transmissao="Volvo I-Shift automatizada", pbt=pbt,
        relacao_reducao="2,64:1 (2,85:1 opcional)", source=VOLVO_PAGE,
        doc=doc, specs={"tipo_veiculo": "Ônibus", "energia": "Diesel/HVO", "configuracao": axles,
        "entre_eixos": wheelbase, "comprimento_chassi": length, "emissoes": "Euro 6 / Proconve P8",
        "mercado": "Rodoviário e fretamento"})


volvo = {
    "brand": {"name": "Volvo", "slug": "volvo", "country": "Suécia", "site": "https://www.volvobuses.com/br/"},
    "families": {
        "B13R Rodoviários": "Chassis Volvo B13R Euro 6 para aplicações rodoviárias e de fretamento.",
        "B320R Urbanos": "Chassis urbanos Volvo B320R de 8 litros, incluindo entrada baixa e B100 Flex.",
        "BZR Elétrico": "Chassis urbanos elétricos Volvo BZR de piso médio e entrada baixa.",
        "BZRT Elétrico": "Chassis elétricos articulados e biarticulados Volvo BZRT.",
        "BZL Elétrico": "Chassi urbano elétrico de entrada baixa Volvo BZL."
    },
    "models": [
        volvo_b13("Volvo B380R 4x2", "volvo-b380r-4x2-onibus", "380", "279", "1.814 Nm @ 830-1.400 rpm", "1.700 rpm", "4x2", "19.500 kg", "4.000", "9.400 / 9.750", "volvo-20260915-data-sheet-b380r-4x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B420R 4x2", "volvo-b420r-4x2-onibus", "420", "309", "2.100 Nm @ 860-1.400 rpm", "1.400-1.800 rpm", "4x2", "19.500 kg", "4.000", "9.400 / 9.750", "volvo-20260915-data-sheet-b420r-4x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B420R 6x2", "volvo-b420r-6x2-onibus", "420", "309", "2.100 Nm @ 860-1.400 rpm", "1.400-1.800 rpm", "6x2", "24.750 / 26.500 kg", "4.000 + 1.400", "10.220 / 10.570", "volvo-20260915-data-sheet-b420r-6x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B460R 4x2", "volvo-b460r-4x2-onibus", "460", "345", "2.300 Nm @ 900-1.400 rpm", "1.400-1.800 rpm", "4x2", "19.500 kg", "4.000", "9.400 / 9.750", "volvo-20260915-data-sheet-b460r-4x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B460R 6x2", "volvo-b460r-6x2-onibus", "460", "345", "2.300 Nm @ 900-1.400 rpm", "1.400-1.800 rpm", "6x2", "24.750 / 26.500 kg", "4.000 + 1.400", "10.220 / 10.570", "volvo-20260915-data-sheet-b460r-6x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B460R 8x2", "volvo-b460r-8x2-onibus", "460", "345", "2.300 Nm @ 900-1.400 rpm", "1.400-1.800 rpm", "8x2", "29.250 kg", "2.600 + 1.400 + 1.400", "10.470", "volvo-20260915-data-sheet-b460r-8x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B510R 4x2", "volvo-b510r-4x2-onibus", "500", "368", "2.500 Nm @ 980-1.270 rpm", "1.530-1.800 rpm", "4x2", "19.500 kg", "4.000", "9.400 / 9.750", "volvo-20260915-data-sheet-b510r-4x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B510R 6x2", "volvo-b510r-6x2-onibus", "500", "368", "2.500 Nm @ 980-1.270 rpm", "1.530-1.800 rpm", "6x2", "24.750 / 26.500 kg", "4.000 + 1.400", "10.220 / 10.570", "volvo-20260915-data-sheet-b510r-6x2-euro-6-pt-br-2022.pdf"),
        volvo_b13("Volvo B510R 8x2", "volvo-b510r-8x2-onibus", "500", "368", "2.500 Nm @ 980-1.270 rpm", "1.530-1.800 rpm", "8x2", "29.250 kg", "2.600 + 1.400 + 1.400", "10.470", "volvo-20260915-data-sheet-b510r-8x2-euro-6-pt-br-2022.pdf"),
        model("B320R Urbanos", "Volvo B320R LE 4x2", "volvo-b320r-le-4x2", motor="Volvo D8K, 7,7 l, 6 cilindros em linha, Euro 6", potencia="320 hp (240 kW)", torque="1.224 Nm @ 1.050-1.600 rpm", transmissao="ZF 6AP1420B, 6 marchas, ou Voith D864.6, 4 marchas", pbt="19.500 kg", relacao_reducao="5,63:1", source="https://www.volvobuses.com/br/Rodoviario/volvo-b320r-le/specifications.html", doc="volvo-20260915-b320rle-4x2.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"Diesel", "configuracao":"4x2, entrada baixa", "entre_eixos":"3.500", "emissoes":"Euro 6 / Proconve P8", "mercado":"Urbano"}),
        model("B320R Urbanos", "Volvo B320R 6x2 B100 Flex", "volvo-b320r-6x2-b100-flex", motor="Volvo D8K, 8 l", potencia="320 cv", torque="1.200 Nm", source=VOLVO_B320, specs={"tipo_veiculo":"Ônibus", "energia":"B100 Flex / diesel", "configuracao":"6x2, piso alto ou entrada baixa, 3º eixo direcional", "comprimento_carroceria":"Até 15.000", "capacidade_passageiros":"Até 120", "mercado":"Urbano / BRT", "situacao_comercial":"Apresentado em agosto de 2026"}),
        model("BZR Elétrico", "Volvo BZR Elétrico 4x2 Piso Médio", "volvo-bzr-eletrico-4x2-piso-medio", motor="Volvo EPT 402 ou EPT 802", potencia="200 kW ou 400 kW (pico)", torque="425 Nm ou 850 Nm no motor", transmissao="Automatizada de 2 velocidades", pbt="20.800 kg", source=VOLVO_BZR, doc="volvo-20260915-volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"4x2, piso médio", "entre_eixos":"4.000 (transporte)", "comprimento_carroceria":"9.500-13.200", "bateria":"Até 540 kWh na oferta atual", "carregamento":"CCS2 até 250 kW / OppCharge até 450 kW", "mercado":"Urbano"}),
        model("BZR Elétrico", "Volvo BZR Elétrico 6x2 Piso Médio", "volvo-bzr-eletrico-6x2-piso-medio", motor="Volvo EPT 802", potencia="400 kW (pico)", torque="850 Nm no motor", transmissao="Automatizada de 2 velocidades", pbt="27.200 kg", source=VOLVO_BZR, doc="volvo-20260915-volvo-bzr-electric-6x2-medium-floor-data-sheet.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"6x2, piso médio", "entre_eixos":"4.000 (transporte)", "comprimento_carroceria":"12.400-14.900", "bateria":"Até 540 kWh", "mercado":"Urbano"}),
        model("BZR Elétrico", "Volvo BZR Elétrico 4x2 Entrada Baixa", "volvo-bzr-eletrico-4x2-entrada-baixa", motor="Volvo EPT 402 ou EPT 802", potencia="200 kW ou 400 kW (pico)", torque="425 Nm ou 850 Nm no motor", transmissao="Automatizada de 2 velocidades", pbt="20.600 kg", source=VOLVO_BZR, doc="volvo-20260915-volvo-bzr-electric-4x2-low-entry-data-sheet.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"4x2, entrada baixa", "entre_eixos":"4.000 (transporte)", "comprimento_carroceria":"9.800-13.100", "bateria":"Até 540 kWh", "mercado":"Urbano"}),
        model("BZR Elétrico", "Volvo BZR Elétrico 6x2 Entrada Baixa", "volvo-bzr-eletrico-6x2-entrada-baixa", motor="Volvo EPT 802", potencia="400 kW (pico)", torque="850 Nm no motor", transmissao="Automatizada de 2 velocidades", pbt="27.000 kg", source=VOLVO_BZR, specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"6x2, entrada baixa", "entre_eixos":"4.000 (transporte)", "comprimento_carroceria":"12.800-14.800", "bateria":"Até 540 kWh", "mercado":"Urbano", "observacao_fonte":"Página oficial não expõe PDF específico desta configuração"}),
        model("BZRT Elétrico", "Volvo BZRT Elétrico Articulado", "volvo-bzrt-eletrico-articulado", motor="Volvo EPT 802, dois motores elétricos", potencia="400 kW pico / 334 kW contínuos por 30 min", torque="850 Nm no motor; 31.000 Nm nas rodas", transmissao="Automatizada de 2 velocidades", pbt="32.500 / 34.000 kg", source=VOLVO_BZRT, doc="volvo-20260915-volvo-bzrt-eletrico-articulado.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"Articulado", "entre_eixos":"5.500 / 5.850 / 6.200 + 6.650 / 7.750", "comprimento_chassi":"Até 21.600", "bateria":"540 kWh, 6 packs NCA", "mercado":"Urbano / BRT"}),
        model("BZRT Elétrico", "Volvo BZRT Elétrico Biarticulado", "volvo-bzrt-eletrico-biarticulado", motor="Volvo EPT 802, dois motores elétricos", potencia="400 kW pico / 334 kW contínuos por 30 min", torque="850 Nm no motor; 31.000 Nm nas rodas", transmissao="Automatizada de 2 velocidades", pbt="47.000 kg", source=VOLVO_BZRT, doc="volvo-20260915-volvo-bzrt-iartic.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"Biarticulado", "entre_eixos":"5.000 / 5.500 / 5.850", "comprimento_chassi":"27.600", "bateria":"Configuração depende do projeto; confirmar na proposta técnica", "mercado":"Urbano / BRT"}),
        model("BZL Elétrico", "Volvo BZL Elétrico 4x2", "volvo-bzl-eletrico-4x2", motor="Volvo EPT 402 ou EPT 802", potencia="200 kW ou 400 kW (pico)", torque="425 Nm ou 850 Nm no motor", transmissao="Automatizada de 2 velocidades", pbt="19.500 kg", source=VOLVO_BZL, doc="volvo-20260915-data-sheet-bzl-electric-en-2021.pdf", specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"4x2, entrada baixa", "comprimento_chassi":"8.515", "comprimento_carroceria":"9.500-13.000", "bateria":"NCA 282/376/470 kWh ou LFP 350/500 kWh", "carregamento":"CCS2 até 250 kW; OppCharge conforme bateria", "mercado":"Urbano"})
    ]
}


def scania_model(family, code, slug, hp, torque, axles, ratio, wheelbase, doc, super_line=False):
    transmission = "Scania G25CM automatizada, 14 marchas" if super_line else "Scania Opticruise GRS/GRSO automatizada, 12 marchas"
    liters = "11 l, 5 cilindros" if super_line and hp in (350, 390, 430) else "13 l, 6 cilindros"
    return model(family, f"Scania {code}", slug, motor=f"Scania {liters}, Proconve P8", potencia=f"{hp} hp", torque=torque, transmissao=transmission, relacao_reducao=ratio, source=SCANIA_SUPER if super_line else SCANIA_ROAD, doc=doc, specs={"tipo_veiculo":"Ônibus", "energia":"Diesel", "configuracao":axles, "entre_eixos":wheelbase, "emissoes":"Proconve P8", "mercado":"Rodoviário", "observacao_peso":"A ficha informa tara/peso do chassi e capacidade dos eixos, mas não declara PBT total; PBT mantido em branco"})


scania = {
    "brand": {"name":"Scania", "slug":"scania", "country":"Suécia", "site":"https://www.scania.com/br/pt/home/products/onibus.html"},
    "families": {"Série K Rodoviários":"Chassis rodoviários Scania da geração P8 anterior ao powertrain Super.", "Série K Super Rodoviários":"Chassis rodoviários Scania Super apresentados em 2026.", "Série K Urbanos":"Chassis urbanos Scania diesel e elétricos.", "Série K Gás e Biometano":"Chassis Scania para gás natural e biometano."},
    "models": [
        scania_model("Série K Rodoviários","K 320 4x2NB","scania-k320-4x2nb-onibus",320,"1.600 Nm @ 1.050-1.400 rpm","4x2NB","2,72:1 / 2,92:1 / 3,08:1","3.000","scania-20260915-cms-files-50649-1721933486000023-2024-baw-k320-4x2nb.pdf"),
        scania_model("Série K Rodoviários","K 370 4x2NB","scania-k370-4x2nb-onibus",370,"1.900 Nm @ 900-1.340 rpm","4x2NB","2,72:1 / 2,92:1 / 3,08:1","3.000","scania-20260915-cms-files-50649-1721933537000023-2024-baw-k370-4x2nb.pdf"),
        scania_model("Série K Rodoviários","K 370 6x2NB","scania-k370-6x2nb-onibus",370,"1.900 Nm @ 900-1.340 rpm","6x2NB","2,72:1 / 2,92:1 / 3,08:1","3.000 + 1.300","scania-20260915-cms-files-50649-1721933547000023-2024-baw-k370-6x2nb.pdf"),
        scania_model("Série K Rodoviários","K 410 6x2NB","scania-k410-6x2nb-onibus",410,"2.150 Nm @ 900-1.340 rpm","6x2NB","2,72:1 / 2,92:1 / 3,08:1","3.000 + 1.300","scania-20260915-cms-files-50649-1721933556000023-2024-baw-k410-6x2nb.pdf"),
        scania_model("Série K Rodoviários","K 450 8x2NB","scania-k450-8x2nb-onibus",450,"2.350 Nm @ 1.000-1.300 rpm","8x2NB","2,72:1 / 2,92:1 / 3,08:1","3.000 + 1.300 + 1.400","scania-20260915-cms-files-50649-1721933583000023-2024-baw-k450-8x2nb.pdf"),
        scania_model("Série K Rodoviários","K 500 8x2NB","scania-k500-8x2nb-onibus",500,"2.550 Nm @ 925-1.340 rpm","8x2NB","2,72:1 / 2,92:1 / 3,08:1","3.000 + 1.300 + 1.400","scania-20260915-cms-files-50649-1721933590000023-2024-baw-k500-8x2nb.pdf"),
        scania_model("Série K Super Rodoviários","K 350 Super 4x2NB","scania-k350-super-4x2nb",350,"1.800 Nm @ 950-1.360 rpm","4x2NB","2,72:1 / 2,92:1 / 3,07:1","3.000","scania-20260915-especificacao-tecnica-k350-4x2nb.pdf",True),
        scania_model("Série K Super Rodoviários","K 390 Super 4x2NB","scania-k390-super-4x2nb",390,"2.000 Nm @ 950-1.360 rpm","4x2NB","2,72:1 / 2,92:1 / 3,07:1","3.000","scania-20260915-especificacao-tecnica-k390-4x2nb.pdf",True),
        scania_model("Série K Super Rodoviários","K 390 Super 6x2NB","scania-k390-super-6x2nb",390,"2.000 Nm @ 950-1.360 rpm","6x2NB","2,85:1","3.000 + 1.300","scania-20260915-especificacao-tecnica-k390-6x2nb.pdf",True),
        scania_model("Série K Super Rodoviários","K 430 Super 6x2NB","scania-k430-super-6x2nb",430,"2.200 Nm @ 950-1.360 rpm","6x2NB","2,85:1","3.000 + 1.300","scania-20260915-especificacao-tecnica-k430-6x2nb.pdf",True),
        scania_model("Série K Super Rodoviários","K 460 Super 6x2NB","scania-k460-super-6x2nb",460,"2.500 Nm @ 900-1.300 rpm","6x2NB","2,85:1","3.000 + 1.300","scania-20260915-especificacao-tecnica-k460-6x2nb.pdf",True),
        scania_model("Série K Super Rodoviários","K 460 Super 8x2NB","scania-k460-super-8x2nb",460,"2.500 Nm @ 900-1.300 rpm","8x2NB","2,85:1","3.000 + 1.300 + 1.400","scania-20260915-especificacao-tecnica-k460-8x2nb.pdf",True),
        scania_model("Série K Super Rodoviários","K 500 Super 8x2NB","scania-k500-super-8x2nb",500,"2.650 Nm @ 900-1.320 rpm","8x2NB","2,85:1","3.000 + 1.300 + 1.400","scania-20260915-especificacao-tecnica-k500-8x2nb.pdf",True),
        model("Série K Urbanos","Scania K 280 4x2 NB/LB","scania-k280-4x2-nb-lb",motor="Scania 9 l, Proconve P8",potencia="280 hp (206 kW) @ 1.900 rpm",torque="1.400 Nm @ 1.050-1.400 rpm",relacao_reducao="5,36:1 / 6,23:1 / 7,18:1",source=SCANIA_URBAN,doc="scania-20260915-cms-files-50649-1721934141000023-2024-baw-k280-4x2-nblb.pdf",specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2 NB/LB","entre_eixos":"3.000","emissoes":"Proconve P8","mercado":"Urbano"}),
        model("Série K Urbanos","Scania K 320 6x2*4 NB/LB","scania-k320-6x2-4-nb-lb",motor="Scania 9 l, Proconve P8",potencia="320 hp (235 kW) @ 1.900 rpm",torque="1.600 Nm @ 1.050-1.400 rpm",relacao_reducao="5,36:1 / 6,23:1 / 7,18:1",source=SCANIA_URBAN,doc="scania-20260915-cms-files-50649-1721934159000023-2024-baw-k320-6x24nb-lb.pdf",specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"6x2*4 NB/LB","entre_eixos":"3.000 + 1.300","emissoes":"Proconve P8","mercado":"Urbano"}),
        model("Série K Urbanos","Scania K 320 6x2/2 NB/LB Articulado","scania-k320-6x2-2-articulado",motor="Scania 9 l, Proconve P8",potencia="320 hp (235 kW) @ 1.900 rpm",torque="1.600 Nm @ 1.050-1.400 rpm",relacao_reducao="5,36:1 / 6,23:1 / 7,18:1",source=SCANIA_URBAN,doc="scania-20260915-cms-files-50649-1721934174000023-2024-baw-k320-6x22nb-lb.pdf",specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"6x2/2 articulado NB/LB","entre_eixos":"3.000 + 6.762","emissoes":"Proconve P8","mercado":"Urbano / BRT"}),
        model("Série K Urbanos","Scania K 230E 4x2 LB","scania-k230e-4x2-lb",motor="Motor elétrico Scania",potencia="230 kW contínuos",torque="2.200 Nm",transmissao="Automatizada de 2 velocidades",source=SCANIA_URBAN,doc="scania-20260915-cms-files-50649-1721934104000023-2024-baw-k230e-b4x2lb.pdf",specs={"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"4x2 LB","bateria":"416 ou 520 kWh (4 ou 5 packs)","autonomia":"250-300 km","carregamento":"CCS2 DC até 130 kW","mercado":"Urbano"}),
        model("Série K Urbanos","Scania K 270E 4x2","scania-k270e-4x2",motor="Motor elétrico Scania",potencia="270 kW",relacao_reducao="4,56:1",source="https://www.scania.com/br/pt/home/newsroom/news/2024/news-article-template-simple69.html",specs={"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"4x2, piso baixo","comprimento_carroceria":"12.200-14.000","mercado":"Urbano","situacao_comercial":"Apresentado em agosto de 2026; ficha técnica completa ainda não publicada"}),
        model("Série K Urbanos","Scania K 300E 6x2*4","scania-k300e-6x2-4",motor="Motor elétrico Scania C1-4",potencia="300 kW",transmissao="Automatizada de 4 velocidades",relacao_reducao="4,56:1",source="https://www.scania.com/br/pt/home/newsroom/news/2024/news-article-template-simple69.html",specs={"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"6x2*4, piso baixo","comprimento_carroceria":"15.000","bateria":"356 kWh (320 úteis) ou 445 kWh (400 úteis), NMC","autonomia":"250-300 km","capacidade_passageiros":"Aproximadamente 105","mercado":"Urbano","situacao_comercial":"Apresentado em agosto de 2026"}),
        model("Série K Gás e Biometano","Scania K 280 4x2 Gás","scania-k280-4x2-gas",motor="Scania OC09, 9 l, gás/biometano",potencia="280 cv",torque="1.350 Nm",transmissao="ZF EcoLife 2 automática",source="https://www.scania.com/br/pt/home/newsroom/news/2024/news-article-template-simple65.html",specs={"tipo_veiculo":"Ônibus","energia":"GNV / biometano","configuracao":"4x2","comprimento_carroceria":"Até 14.000","autonomia":"300-350 km","armazenamento_gas":"4 cilindros tipo 4, 220 m³, no teto","mercado":"Urbano"}),
        model("Série K Gás e Biometano","Scania K 340 6x2/2 Gás Articulado","scania-k340-6x2-2-gas-articulado",motor="Scania OC09, 9 l, gás/biometano",potencia="340 cv @ 1.900 rpm",torque="1.600 Nm @ 1.100-1.400 rpm",transmissao="ZF automática",source="https://www.scania.com/br/pt/home/newsroom/news/2024/news-article-template-simple59.html",specs={"tipo_veiculo":"Ônibus","energia":"GNV / biometano","configuracao":"6x2/2 articulado","comprimento_carroceria":"Até 21.000","emissoes":"Proconve P8","mercado":"Urbano / BRT"})
    ]
}


iveco = {
    "brand":{"name":"IVECO","slug":"iveco","country":"Itália","site":"https://www.ivecobus.com/latam-pt"},
    "families":{"IVECO BUS":"Chassis urbanos, escolares e de fretamento IVECO BUS.","IVECO BUS Multienergia":"Chassis IVECO BUS a gás, biometano e elétricos.","Daily Minibus":"Minibus IVECO Daily para fretamento e transporte executivo."},
    "models":[
        model("IVECO BUS","IVECO BUS 10-190","iveco-bus-10-190",motor="IVECO FPT NEF 4, 4.485 cm³, Proconve P8",potencia="186 cv (137 kW) @ 2.500 rpm",torque="610 Nm @ 1.200-2.100 rpm",transmissao="Eaton ESBO-6206 B manual, 6 marchas",pbt="10.500 kg",relacao_reducao="4,56:1",source=IVECO_SCHOOL,doc="iveco-20260915-iveco-bus-folheto-chassi-mirco-10-190.pdf",specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2","entre_eixos":"4.500 / 4.800","emissoes":"Proconve P8 / Euro 6","peso_ordem_marcha":"3.200 / 3.220 kg","cmt":"13.000 kg","mercado":"Urbano, intermunicipal e escolar ORE 2"}),
        model("IVECO BUS","IVECO BUS 15-210 R","iveco-bus-15-210-r",motor="IVECO FPT NEF 4, 4.485 cm³, Proconve P8",potencia="207 cv (152 kW) @ 2.500 rpm",torque="720 Nm @ 1.300-1.900 rpm",transmissao="Eaton FSB 5406A manual, 6 marchas",pbt="15.000 kg",relacao_reducao="4,63:1",source=IVECO_SCHOOL,doc="iveco-20260915-iveco-bus-folheto-chassi-15-210.pdf",specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2","entre_eixos":"5.175 / 5.950","emissoes":"Proconve P8 / Euro 6","peso_ordem_marcha":"4.450 / 4.480 kg","cmt":"27.000 kg","mercado":"Escolar ORE 3 e rural"}),
        model("IVECO BUS","IVECO BUS 17-280","iveco-bus-17-280",motor="IVECO FPT NEF 6, 6.728 cm³, Proconve P8",potencia="280 cv (207 kW) @ 2.500 rpm",torque="950 Nm @ 1.300-1.970 rpm",transmissao="ZF 6S 1010 BO manual, 6 marchas",pbt="18.100 kg (suspensão metálica) / 17.500 kg (pneumática); legal 16.000 kg",relacao_reducao="5,57:1 série; 6,14:1 / 6,57:1 urbano; 5,13:1 intercity",source=IVECO_BUS,doc="iveco-20260915-iveco-bus-folheto-chassi-onibus-17-280.pdf",specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2; suspensão metálica ou pneumática","entre_eixos":"5.950","emissoes":"Proconve P8 / Euro 6","peso_ordem_marcha":"5.260 kg metálica / 5.055 kg pneumática","cmt":"33.000 kg","capacidade_passageiros":"59+1 conforme página comercial","mercado":"Urbano, fretamento e turismo"}),
        model("IVECO BUS","IVECO BUS 17-210","iveco-bus-17-210",motor="IVECO, 4 cilindros",potencia="210 cv",pbt="17.000 kg",source=IVECO_2026,doc="iveco-20260915-release-iveco-bus-latbus-2026---bus-17-210-20260813t141015t749-xkb2rg15l5abno00iofycfld.pdf",active=0,specs={"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2","mercado":"Urbano e metropolitano","situacao_comercial":"Apresentado em agosto de 2026; vendas programadas para 2027","observacao_fonte":"A fabricante ainda não publicou a ficha técnica comercial completa"}),
        model("IVECO BUS Multienergia","IVECO BUS 17-210 G","iveco-bus-17-210-g",motor="FPT N60 CNG",potencia="210 cv",source=IVECO_2026,doc="iveco-20260915-release-iveco-bus-modal-expo-20250603t195506t299-ne3uana1ywi3rv52p02sjagq.pdf",active=0,specs={"tipo_veiculo":"Ônibus","energia":"GNV / biometano","configuracao":"4x2","mercado":"Urbano","situacao_comercial":"Produzido na Argentina; apresentado e em validação para o mercado brasileiro","observacao_fonte":"Sem ficha técnica brasileira completa publicada"}),
        model("IVECO BUS Multienergia","IVECO BUS 17-E BEV","iveco-bus-17-e-bev",motor="Motor elétrico central",potencia="145 kW contínuos",torque="1.055 Nm contínuos",source=IVECO_BEV,doc="iveco-20260915-release-iveco-bus-chassi-17-e-bev---latbus-2024-20240806t192124t721-3fduqmuiofuxvztvmbnq1ja1.pdf",active=0,specs={"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"4x2, piso normal","comprimento_carroceria":"9.600-12.000","bateria":"4 ou 8 packs modulares","autonomia":"120 km (4 packs) a 250 km (8 packs)","mercado":"Urbano","situacao_comercial":"Chassi conceito apresentado na Lat.Bus 2024; não tratado como produto comercial"}),
        model("Daily Minibus","IVECO Daily Minibus 45-160 Fretamento","iveco-daily-minibus-45-160-fretamento",potencia="160 cv",source=IVECO_2026,active=1,specs={"tipo_veiculo":"Minibus","energia":"Diesel","configuracao":"17+1 lugares","mercado":"Fretamento","situacao_comercial":"Configuração lançada comercialmente em agosto de 2026","observacao_fonte":"Ficha técnica brasileira completa não localizada na página pública"}),
        model("Daily Minibus","IVECO Daily Minibus Hi-Matic","iveco-daily-minibus-hi-matic",transmissao="Hi-Matic automática, 8 velocidades",source=IVECO_2026,active=1,specs={"tipo_veiculo":"Minibus","energia":"Diesel","mercado":"Fretamento e executivo","situacao_comercial":"Lançamento comercial em agosto de 2026","observacao_fonte":"A denominação de configuração e demais dados dependem da proposta comercial"})
    ]
}


CATALOGS = [("028", "volvo", volvo), ("029", "scania", scania), ("030", "iveco", iveco)]


def q(value):
    if value is None:
        return "NULL"
    return "'" + str(value).replace("\\", "\\\\").replace("'", "''") + "'"


def json_sql(value):
    return q(json.dumps(value, ensure_ascii=False, separators=(",", ":")))


def blank_fill(column, value):
    return f"CASE WHEN {column} IS NULL OR TRIM({column})='' OR LOWER(TRIM({column})) IN ('não informado','nao informado','n/d') THEN {q(value)} ELSE {column} END"


def generate(version, brand_key, catalog):
    b = catalog["brand"]
    lines = [
        f"-- Drive Learn - atualização auditada do catálogo de ônibus {b['name']}.",
        f"-- Gerado em {DATE}; idempotente; preenche lacunas sem substituir dados válidos já cadastrados.",
        "-- Não confundir peso/tara do chassi com PBT. Protótipos e lançamentos futuros ficam inativos.",
        "SET NAMES utf8mb4;", "START TRANSACTION;", "",
        "CREATE TABLE IF NOT EXISTS schema_migrations (versao VARCHAR(80) NOT NULL PRIMARY KEY, descricao VARCHAR(255) NOT NULL, aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        "CREATE TABLE IF NOT EXISTS modelo_especificacoes_tecnicas (modelo_id BIGINT UNSIGNED NOT NULL,chave VARCHAR(80) NOT NULL,rotulo VARCHAR(120) NOT NULL,valor VARCHAR(255) NOT NULL,unidade VARCHAR(30) NULL,fonte_url VARCHAR(700) NULL,conferido_em DATE NULL,PRIMARY KEY(modelo_id,chave),INDEX idx_met_chave_"+version+"(chave),CONSTRAINT fk_met_modelo_"+version+" FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        "",
        f"INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES ({q(b['name'])},{q(b['slug'])},{q(b['country'])},{q(b['site'])},{q('Fabricante de chassis e veículos para transporte de passageiros.')},1) ON DUPLICATE KEY UPDATE site_oficial=VALUES(site_oficial),descricao=COALESCE(NULLIF(descricao,''),VALUES(descricao));",
        ""
    ]
    for family, description in catalog["families"].items():
        lines.append(f"INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo) SELECT id,{q(family)},{q(description)},'onibus',1 FROM marcas WHERE slug={q(b['slug'])} ON DUPLICATE KEY UPDATE descricao=COALESCE(NULLIF(familias.descricao,''),VALUES(descricao)),tipo_veiculo='onibus';")
    for m in catalog["models"]:
        specs = dict(m.get("specs", {}))
        specs.update({"fonte_oficial": m["source"], "conferido_em": DATE})
        if m.get("doc"):
            specs["documento_auditoria"] = "/public/assets/documents/modelos/" + m["doc"]
        fields = ["motor", "potencia", "torque", "transmissao", "pbt", "pbtc", "relacao_reducao"]
        values = [m.get(x) for x in fields]
        active = int(m.get("active", 1))
        lines += ["", f"-- {m['name']}",
            "INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo) "
            f"SELECT f.id,{q(m['name'])},{q(m['slug'])},{q(m.get('description','Especificações atualizadas a partir de fonte oficial pública.'))},{','.join(q(v) for v in values)},{json_sql(specs)},{active} "
            "FROM familias f JOIN marcas ma ON ma.id=f.marca_id "
            f"WHERE ma.slug={q(b['slug'])} AND f.nome={q(m['family'])} AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas bx ON bx.id=fx.marca_id WHERE bx.slug={q(b['slug'])} AND (mx.slug={q(m['slug'])} OR LOWER(TRIM(mx.nome))=LOWER(TRIM({q(m['name'])})))) LIMIT 1;"
        ]
        updates = [f"m.{field}={blank_fill('m.'+field, value)}" for field, value in zip(fields, values) if value]
        updates += [f"m.descricao={blank_fill('m.descricao', m.get('description','Especificações atualizadas a partir de fonte oficial pública.'))}", f"m.especificacoes=JSON_MERGE_PATCH({json_sql(specs)},COALESCE(m.especificacoes,JSON_OBJECT()))"]
        lines.append("UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id SET " + ",".join(updates) + f" WHERE ma.slug={q(b['slug'])} AND (m.slug={q(m['slug'])} OR LOWER(TRIM(m.nome))=LOWER(TRIM({q(m['name'])})));" )
        technical = {"pbt":m.get("pbt"), "pbtc":m.get("pbtc"), "relacao_reducao":m.get("relacao_reducao")}
        technical.update(specs)
        labels = {"pbt":"PBT","pbtc":"PBTC","cmt":"CMT","relacao_reducao":"Relação de redução","tipo_veiculo":"Tipo de veículo","energia":"Energia / propulsão","configuracao":"Configuração / tração","entre_eixos":"Entre-eixos","comprimento_chassi":"Comprimento do chassi","comprimento_carroceria":"Comprimento de carroceria","bateria":"Bateria","autonomia":"Autonomia","carregamento":"Carregamento","capacidade_passageiros":"Capacidade de passageiros","emissoes":"Norma de emissões","mercado":"Mercado / aplicação","situacao_comercial":"Situação comercial","peso_ordem_marcha":"Peso em ordem de marcha","armazenamento_gas":"Armazenamento de gás","observacao_peso":"Observação sobre peso","observacao_fonte":"Observação da fonte"}
        for key, value in technical.items():
            if not value or key not in labels:
                continue
            lines.append(f"INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em) SELECT m.id,{q(key)},{q(labels[key])},{q(value)},NULL,{q(m['source'])},{q(DATE)} FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE ma.slug={q(b['slug'])} AND (m.slug={q(m['slug'])} OR LOWER(TRIM(m.nome))=LOWER(TRIM({q(m['name'])})) ) LIMIT 1 ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),valor=CASE WHEN valor IS NULL OR TRIM(valor)='' OR LOWER(TRIM(valor)) IN ('não informado','nao informado','n/d') THEN VALUES(valor) ELSE valor END,fonte_url=CASE WHEN valor IS NULL OR TRIM(valor)='' THEN VALUES(fonte_url) ELSE fonte_url END,conferido_em=CASE WHEN valor IS NULL OR TRIM(valor)='' THEN VALUES(conferido_em) ELSE conferido_em END;")
        if m.get("doc"):
            path = "/public/assets/documents/modelos/" + m["doc"]
            lines.append(f"INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo) SELECT m.id,'ficha_tecnica',{q('Documento técnico oficial - '+m['name'])},{q(path)},{q(m['source'])},{q(m['source'])},1 FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE ma.slug={q(b['slug'])} AND (m.slug={q(m['slug'])} OR LOWER(TRIM(m.nome))=LOWER(TRIM({q(m['name'])}))) LIMIT 1 ON DUPLICATE KEY UPDATE titulo=COALESCE(NULLIF(titulo,''),VALUES(titulo)),arquivo=COALESCE(NULLIF(arquivo,''),VALUES(arquivo)),url_origem=COALESCE(NULLIF(url_origem,''),VALUES(url_origem)),fonte_pagina=COALESCE(NULLIF(fonte_pagina,''),VALUES(fonte_pagina));")
    migration = f"20260916_{version}_catalogo_onibus_{brand_key}.sql"
    lines += ["", f"INSERT INTO schema_migrations(versao,descricao) VALUES ({q(migration[:-4])},{q('Atualização auditada do catálogo de ônibus '+b['name'])}) ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);", "COMMIT;", ""]
    path = MIGRATIONS / migration
    path.write_text("\n".join(lines), encoding="utf-8", newline="\n")
    return path


def main():
    MIGRATIONS.mkdir(parents=True, exist_ok=True)
    generated = [generate(*entry) for entry in CATALOGS]
    rows = []
    for _, key, catalog in CATALOGS:
        commercial = sum(int(m.get("active", 1)) for m in catalog["models"])
        rows.append((catalog["brand"]["name"], len(catalog["families"]), len(catalog["models"]), commercial, len(catalog["models"])-commercial, sum(bool(m.get("doc")) for m in catalog["models"])))
    report = ["# Auditoria do catálogo de ônibus - 16/09/2026", "", "Pesquisa baseada prioritariamente em páginas e documentos públicos oficiais das fabricantes. As migrações são idempotentes, preenchem lacunas e preservam valores válidos existentes.", "", "| Marca | Famílias | Modelos | Comerciais | Futuro/conceito | Documentos vinculados |", "|---|---:|---:|---:|---:|---:|"]
    report += [f"| {a} | {b} | {c} | {d} | {e} | {f} |" for a,b,c,d,e,f in rows]
    report += ["", "## Regras técnicas aplicadas", "", "- Peso/tara do chassi não foi convertido em PBT.", "- A soma da capacidade dos eixos não foi usada para inventar PBT ou PBTC.", "- Torque no motor e torque nas rodas permanecem identificados separadamente.", "- O Volvo B510R mantém a denominação comercial, mas a ficha oficial declara motor D13K500 com 500 hp.", "- Modelos anunciados para 2027, em validação ou conceituais são criados inativos.", "- Quando a página oficial não publicou a ficha completa, somente os dados expressamente divulgados foram cadastrados.", "", "## Ordem de importação", "", "1. `20260916_028_catalogo_onibus_volvo.sql`", "2. `20260916_029_catalogo_onibus_scania.sql`", "3. `20260916_030_catalogo_onibus_iveco.sql`", "", "Envie também os PDFs novos de `public/assets/documents/modelos/`. Não é necessário executar novamente as migrações Mercedes-Benz 026 ou 027 para esta atualização.", "", "## Fontes principais", "", f"- Volvo B13R: {VOLVO_PAGE}", f"- Volvo BZR/BZRT/BZL: {VOLVO_BZR}", f"- Volvo B320R B100: {VOLVO_B320}", f"- Scania rodoviários/Super: {SCANIA_ROAD}", f"- Scania urbanos: {SCANIA_URBAN}", f"- IVECO chassis atuais: {IVECO_BUS}", f"- IVECO lançamentos 2026: {IVECO_2026}", ""]
    AUDIT.write_text("\n".join(report), encoding="utf-8", newline="\n")
    print("\n".join(str(p.relative_to(ROOT)) for p in generated))
    print(AUDIT.relative_to(ROOT))


if __name__ == "__main__":
    main()
