"""Gera a atualizacao multimarcas do catalogo em 16/10/2026.

O script nao conecta ao banco. A migracao resultante e idempotente, preserva
valores validos ja cadastrados e distingue produtos comerciais de anuncios
futuros/prototipos.
"""
from __future__ import annotations

import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MIGRATION = ROOT / "database/migrations/20261016_031_atualizacao_catalogo_multimarcas.sql"
REPORT = ROOT / "docs/AUDITORIA_CATALOGO_MULTIMARCAS_2026-10-16.md"
DATE = "2026-10-16"


def model(brand, family, vehicle_type, name, slug, source, image, **values):
    return {
        "brand": brand,
        "family": family,
        "vehicle_type": vehicle_type,
        "name": name,
        "slug": slug,
        "source": source,
        "image": image,
        **values,
    }


VW_ESG = "https://www.prnewswire.com/br/comunicados-para-a-imprensa/vwco-amplia-portfolio-esg-com-novos-veiculos-eletricos-e-a-biometano-302898752.html"
VW_ULTRA = "https://www.prnewswire.com/br/comunicados-para-a-imprensa/volkswagen-eleva-padrao-de-seus-caminhoes-extrapesados-302874051.html"
VW_33540 = "https://www.vwco.com.br/news/829"
VW_BIO = "https://www.vwco.com.br/news/809"
MB_ECITY = "https://www.mercedes-benz-trucks.com.br/imprensa/releases/mercedes-benz-lanca-ecity-novo-onibus-urbano-eletrico-da-marca-no-brasil-743"
MB_EO500UA = "https://www.mercedes-benz-trucks.com.br/onibus/eletrico/eo500ua"
IVECO_EDAILY = "https://www.iveco.com/brasil/eDaily"
IVECO_TECTOR_NG = "https://www.iveco.com/brasil/Tector-natural-gas"
IVECO_SWAY_NG = "https://www.iveco.com/brasil/S-Way-natural-gas/Grand-Cab"
BYD_T35 = "https://www.byd.com/br/BYD-leva-ecossistema-de-mobilidade-e-energia-a-Expointer-2026"
VOLVO_BZR_NEWS = "https://www.volvogroup.com/br/news-and-media/news/2026/jul/volvo-apresenta-mais-uma-opcao-do-seu-onibus-eletrico-bzr--agora.html"


BRANDS = {
    "volkswagen-caminhoes-onibus": ("Volkswagen Caminhões e Ônibus", "Brasil", "https://www.vwco.com.br/"),
    "mercedes-benz": ("Mercedes-Benz", "Alemanha", "https://www.mercedes-benz-trucks.com.br/"),
    "iveco": ("IVECO", "Italia", "https://www.iveco.com/brasil/"),
    "byd": ("BYD", "China", "https://www.byd.com/br"),
}


FAMILIES = {
    ("volkswagen-caminhoes-onibus", "e-Delivery", "caminhao"): "Caminhões urbanos elétricos Volkswagen.",
    ("volkswagen-caminhoes-onibus", "Constellation", "caminhao"): "Caminhoes Volkswagen Constellation rodoviarios e vocacionais.",
    ("volkswagen-caminhoes-onibus", "Meteor", "caminhao"): "Caminhoes extrapesados Volkswagen Meteor.",
    ("mercedes-benz", "Eletricos", "onibus"): "Chassis de ônibus elétricos Mercedes-Benz.",
    ("iveco", "eDaily", "caminhao"): "Chassis-cabine eletricos IVECO eDaily.",
    ("iveco", "Tector NG", "caminhao"): "Caminhao IVECO Tector a gas natural e biometano.",
    ("iveco", "S-Way NG", "caminhao"): "Caminhoes pesados IVECO S-Way a gas natural e biometano.",
    ("byd", "T35", "caminhao"): "Caminhao leve eletrico BYD com bateria Blade.",
}


MODELS = [
    model("volkswagen-caminhoes-onibus", "e-Delivery", "caminhao", "e-Delivery 12", "e-delivery-12", VW_ESG,
          "/public/assets/images/modelos/vwco-20261016-edelivery-12-17.jpeg",
          pbt="12.000 kg", active=1, specs={"tipo_veiculo":"Caminhao", "energia":"100% eletrico", "configuracao":"4x2", "autonomia":"Ate 250 km", "carregamento":"Carga rapida em cerca de 1h30; AC ate 22 kW", "mercado":"Distribuicao urbana", "situacao_comercial":"Lancado comercialmente em outubro de 2026", "observacao_fonte":"Substitui o e-Delivery 11; ficha tecnica completa ainda nao publicada"}),
    model("volkswagen-caminhoes-onibus", "e-Delivery", "caminhao", "e-Delivery 17", "e-delivery-17", VW_ESG,
          "/public/assets/images/modelos/vwco-20261016-edelivery-12-17.jpeg",
          pbt="17.500 kg", active=1, specs={"tipo_veiculo":"Caminhao", "energia":"100% eletrico", "configuracao":"6x2, suspensao pneumatica integral nos eixos traseiros", "comprimento":"7.200", "largura":"2.200", "capacidade_carga":"Ate 11.800 kg", "carregamento":"AC ate 22 kW; compativel com mais de 30 carregadores homologados", "mercado":"Distribuicao urbana", "situacao_comercial":"Lancado comercialmente em outubro de 2026", "observacao_fonte":"Ficha tecnica completa ainda nao publicada"}),
    model("volkswagen-caminhoes-onibus", "Constellation", "caminhao", "Constellation 26.280 Biometano", "constellation-26-280-biometano", VW_BIO,
          "/public/assets/images/modelos/vwco-20261016-constellation-biometano.jpeg",
          potencia="280 cv", active=1, specs={"tipo_veiculo":"Caminhao", "energia":"GNV / biometano", "configuracao":"6x2, vocacional para coleta de residuos", "autonomia":"Ate 300 km", "armazenamento_gas":"240 m3 (960 litros) em tanques de aco carbono", "mercado":"Coleta de residuos e operacoes vocacionais", "situacao_comercial":"Vendas iniciadas; primeiro lote de 56 unidades anunciado em 2026", "observacao_fonte":"A potencia decorre da denominacao oficial 26.280; torque e ficha integral nao publicados"}),
    model("volkswagen-caminhoes-onibus", "Constellation", "caminhao", "Constellation 33.540 6x4", "constellation-33-540-6x4", VW_33540,
          "/public/assets/images/modelos/vwco-20261016-constellation-33-540.jpeg",
          motor="MAN D26 Ultra", potencia="540 cv", torque="2.650 Nm", pbtc="91.000 kg", active=1,
          specs={"tipo_veiculo":"Caminhao", "energia":"Diesel", "configuracao":"6x4, off-road", "cmt":"125.000 kg; ate 150.000 kg em aplicacoes especiais com consultoria da fabricante", "mercado":"Agronegocio e operacoes severas fora de estrada", "situacao_comercial":"Lancado comercialmente em 2026"}),
]


def ultra(name, slug, family, config, power, active=0):
    return model("volkswagen-caminhoes-onibus", family, "caminhao", name, slug, VW_ULTRA,
                 "/public/assets/images/modelos/vwco-20261016-meteor-ultra.jpeg",
                 motor="MAN D26 Ultra", potencia=f"{power} cv", torque="2.650 Nm" if power == 540 else None,
                 active=active, specs={"tipo_veiculo":"Caminhao", "energia":"Diesel", "configuracao":config,
                 "mercado":"Rodoviario" if "33." not in name else "Off-road",
                 "situacao_comercial":"Anunciado em setembro de 2026; vendas previstas a partir da Fenatran 2026",
                 "observacao_fonte":"PBT, PBTC, CMT, reducao e ficha completa ainda nao publicados"})


MODELS += [
    ultra("Meteor Ultra 28.500 6x2", "meteor-ultra-28-500-6x2", "Meteor", "6x2, cavalo mecanico", 500),
    ultra("Meteor Ultra 28.540 6x2", "meteor-ultra-28-540-6x2", "Meteor", "6x2, cavalo mecanico", 540),
    ultra("Meteor Ultra 29.540 6x4", "meteor-ultra-29-540-6x4", "Meteor", "6x4, cavalo mecanico", 540),
    ultra("Constellation Ultra 20.500 4x2", "constellation-ultra-20-500-4x2", "Constellation", "4x2, cavalo mecanico", 500),
    ultra("Constellation Ultra 25.500 6x2", "constellation-ultra-25-500-6x2", "Constellation", "6x2, cavalo mecanico", 500),
    ultra("Constellation Ultra 33.500 6x4", "constellation-ultra-33-500-6x4", "Constellation", "6x4, off-road", 500),
    model("mercedes-benz", "Eletricos", "onibus", "Mercedes-Benz eO500UA 3455/52", "mercedes-benz-eo500ua", MB_EO500UA,
          "/public/assets/images/modelos/mercedes-20261016-eo500ua.webp",
          motor="ZF CeTrax CX332, dois motores síncronos de ímã permanente", potencia="544 cv (400 kW) de pico", torque="2.470 Nm", transmissao="Automática integrada, 3 marchas", pbt="34.200 kg", relacao_reducao="3,154:1", active=1, doc="mercedes-20261016-eo500ua.pdf",
          specs={"tipo_veiculo":"Ônibus", "energia":"100% elétrico", "configuracao":"6x2 articulado, entrada baixa", "comprimento":"18.111", "comprimento_carroceria":"Até 19.000", "autonomia":"Até 270 km, conforme configuração e operação", "capacidade_passageiros":"122 (configuração da ficha)", "quantidade_assentos":"34", "bateria":"NMC, 5 a 7 pacotes de 98 kWh; até 686 kWh", "carregamento":"CCS2 DC, até 150 kW; cerca de 3 horas", "velocidade_maxima":"60 km/h, limitada eletronicamente", "mercado":"Urbano / corredores de alta demanda", "situacao_comercial":"Vendas iniciadas em agosto de 2026", "observacao_fonte":"Valores da ficha oficial eO500 UA 3455/52 de julho de 2026; autonomia divulgada na página comercial"}),
    model("mercedes-benz", "Eletricos", "onibus", "Mercedes-Benz eCity", "mercedes-benz-ecity", MB_ECITY,
          "/public/assets/images/modelos/mercedes-20261016-ecity.webp",
          active=0, specs={"tipo_veiculo":"Onibus", "energia":"100% eletrico", "configuracao":"4x2, piso alto, familia OF", "comprimento_carroceria":"12.000", "autonomia":"Media de 150 km por carga", "mercado":"Urbano; cidades pequenas e medias", "situacao_comercial":"Lancado em agosto de 2026; chegada ao mercado prevista para 2027", "observacao_fonte":"Sera comercializado encarroçado; ficha tecnica completa ainda nao publicada"}),
    model("iveco", "eDaily", "caminhao", "IVECO eDaily 42S14CS 3,5 t", "iveco-edaily-42s14cs-35", IVECO_EDAILY,
          "/public/assets/images/modelos/iveco-20261016-edaily.jpg",
          motor="FPT EPWT 550002E / AP Motor", potencia="136 cv (100 kW)", torque="300 Nm", pbt="3.500 kg", relacao_reducao="3,308:1", active=1, doc="iveco-20261016-edaily-chassi-e-furgao.pdf",
          specs={"tipo_veiculo":"Caminhao", "energia":"100% eletrico", "configuracao":"4x2, chassi-cabine", "entre_eixos":"3.750", "comprimento":"6.599", "peso_ordem_marcha":"2.099 kg", "capacidade_carga":"1.401 kg", "bateria":"37 kWh instalada / 35 kWh utilizavel, NMC", "autonomia":"105 km WLTP", "carregamento":"CCS Combo 2; AC 22 kW ou DC ate 80 kW", "mercado":"Entregas urbanas"}),
    model("iveco", "eDaily", "caminhao", "IVECO eDaily 42CS 4,25 t", "iveco-edaily-42cs-425", IVECO_EDAILY,
          "/public/assets/images/modelos/iveco-20261016-edaily.jpg",
          motor="FPT EPWT 550002E / AP Motor", potencia="136 cv (100 kW)", torque="300 Nm", pbt="4.250 kg", relacao_reducao="3,308:1", active=1, doc="iveco-20261016-edaily-chassi-e-furgao.pdf",
          specs={"tipo_veiculo":"Caminhao", "energia":"100% eletrico", "configuracao":"4x2, chassi-cabine", "entre_eixos":"3.750", "comprimento":"6.599", "peso_ordem_marcha":"2.099 kg", "capacidade_carga":"2.151 kg", "bateria":"37 kWh instalada / 35 kWh utilizavel, NMC", "autonomia":"105 km WLTP", "carregamento":"CCS Combo 2; AC 22 kW ou DC ate 80 kW", "mercado":"Entregas urbanas"}),
    model("iveco", "eDaily", "caminhao", "IVECO eDaily 72C19 7,2 t", "iveco-edaily-72c19", IVECO_EDAILY,
          "/public/assets/images/modelos/iveco-20261016-edaily.jpg",
          motor="FPT EPWT 550002E / AP Motor", potencia="193 cv (140 kW)", torque="400 Nm", pbt="7.200 kg", relacao_reducao="4,30:1", active=1, doc="iveco-20261016-edaily-chassi-e-furgao.pdf",
          specs={"tipo_veiculo":"Caminhao", "energia":"100% eletrico", "configuracao":"4x2, chassi-cabine", "entre_eixos":"4.100 / 4.350", "comprimento":"6.999 / 7.419", "peso_ordem_marcha":"2.735 / 2.756 kg", "capacidade_carga":"4.465 / 4.444 kg", "bateria":"74 kWh instalada / 70 kWh utilizavel, 2 packs NMC", "autonomia":"120 km WLTP", "carregamento":"CCS Combo 2; AC 22 kW ou DC ate 80 kW", "mercado":"Entregas urbanas"}),
    model("iveco", "Tector NG", "caminhao", "IVECO Tector NG 160-210", "iveco-tector-ng-160-210", IVECO_TECTOR_NG,
          "/public/assets/images/modelos/iveco-20261016-tector-ng.jpg",
          motor="FPT N60 CNG", potencia="210 cv", torque="750 Nm", pbt="16.000 kg", active=1,
          specs={"tipo_veiculo":"Caminhao", "energia":"GNV / biometano", "configuracao":"4x2", "autonomia":"Ate 300 km", "mercado":"Urbano e regional; predisposicao para bebidas", "situacao_comercial":"Produto atual no catalogo brasileiro", "observacao_fonte":"A pagina brasileira ainda nao publica a ficha completa para download"}),
    model("iveco", "S-Way NG", "caminhao", "IVECO S-Way NG 460 6x2", "iveco-s-way-ng-460-6x2", IVECO_SWAY_NG,
          "/public/assets/images/modelos/iveco-20261016-sway-ng.jpg",
          motor="FPT Cursor 13 a gas", potencia="460 cv @ 1.990 rpm", torque="2.000 Nm", pbt="23.000 kg", active=1,
          specs={"tipo_veiculo":"Caminhao", "energia":"GNV / biometano", "configuracao":"6x2, cavalo mecanico; Grand Cab ou Mega Cab", "entre_eixos":"3.451", "comprimento":"7.156", "autonomia":"Conforme configuracao de cilindros e operacao", "mercado":"Media e longa distancia", "situacao_comercial":"Produto atual no catalogo brasileiro", "observacao_fonte":"Pagina oficial brasileira nao declara PBTC/CMT na tabela publica"}),
    model("byd", "T35", "caminhao", "BYD T35", "byd-t35", BYD_T35,
          "/public/assets/images/modelos/byd-20261016-t35.webp",
          motor="Motor eletrico", potencia="174 kW (referencia internacional)", torque="340 Nm (referencia internacional)", pbt="3.300 kg (referencia internacional)", active=0, doc="byd-20261016-t35-referencia-internacional.pdf",
          specs={"tipo_veiculo":"Caminhao", "energia":"100% eletrico", "configuracao":"4x2, cabine simples", "entre_eixos":"3.200", "comprimento":"5.515", "bateria":"Blade LFP 62,36 kWh (referencia internacional)", "autonomia":">= 250 km CLTC-C (referencia internacional)", "carregamento":"CCS2 DC 71,7 kW / AC 6,6 kW (referencia internacional)", "mercado":"Operacoes comerciais e logisticas", "situacao_comercial":"Exibido pela primeira vez no Brasil em agosto de 2026; venda nacional nao confirmada", "observacao_fonte":"Dados numericos do folheto global/Equador; confirmar homologacao brasileira antes de ativar"}),
]


SUPPLEMENTS = [
    {"brand":"volvo", "slug":"volvo-bzr-eletrico-6x2-piso-medio", "source":VOLVO_BZR_NEWS,
     "specs":{"capacidade_passageiros":"Ate 110", "autonomia":"Ate 300 km", "bateria":"4 a 6 packs", "carregamento":"CCS2 ate 250 kW; carga completa em ate 2 horas", "comprimento_carroceria":"Ate 15.000", "situacao_comercial":"Apresentado no Brasil em agosto de 2026"}},
]


LABELS = {
    "pbt":"PBT", "pbtc":"PBTC", "cmt":"CMT", "relacao_reducao":"Relacao de reducao",
    "tipo_veiculo":"Tipo de veiculo", "energia":"Energia / propulsao", "configuracao":"Configuracao / tracao",
    "entre_eixos":"Entre-eixos", "comprimento":"Comprimento", "largura":"Largura", "comprimento_carroceria":"Comprimento da carroceria",
    "bateria":"Bateria", "autonomia":"Autonomia", "carregamento":"Carregamento", "capacidade_passageiros":"Capacidade de passageiros",
    "capacidade_carga":"Capacidade de carga", "peso_ordem_marcha":"Peso em ordem de marcha", "mercado":"Mercado / aplicacao",
    "situacao_comercial":"Situacao comercial", "armazenamento_gas":"Armazenamento de gas", "observacao_fonte":"Observacao da fonte",
}


def q(value):
    if value is None:
        return "NULL"
    return "'" + str(value).replace("\\", "\\\\").replace("'", "''") + "'"


def j(value):
    return q(json.dumps(value, ensure_ascii=False, separators=(",", ":")))


def blank(column, value):
    return f"CASE WHEN {column} IS NULL OR TRIM({column})='' OR LOWER(TRIM({column})) IN ('nao informado','não informado','n/d') THEN {q(value)} ELSE {column} END"


def add_specs(lines, brand, slug, source, specs):
    for key, value in specs.items():
        if not value or key not in LABELS:
            continue
        lines.append(
            "INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em) "
            f"SELECT m.id,{q(key)},{q(LABELS[key])},{q(value)},NULL,{q(source)},{q(DATE)} FROM modelos m "
            "JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id "
            f"WHERE ma.slug={q(brand)} AND m.slug={q(slug)} LIMIT 1 ON DUPLICATE KEY UPDATE "
            "rotulo=VALUES(rotulo),valor=CASE WHEN valor IS NULL OR TRIM(valor)='' OR LOWER(TRIM(valor)) IN ('nao informado','não informado','n/d') THEN VALUES(valor) ELSE valor END,"
            "fonte_url=CASE WHEN valor IS NULL OR TRIM(valor)='' THEN VALUES(fonte_url) ELSE fonte_url END,"
            "conferido_em=CASE WHEN valor IS NULL OR TRIM(valor)='' THEN VALUES(conferido_em) ELSE conferido_em END;"
        )


def generate():
    lines = [
        "-- Drive Learn - atualizacao multimarcas auditada em 16/10/2026.",
        "-- Execute apos a migracao 030. Nao conecta nem altera a HostGator automaticamente.",
        "-- Produtos futuros/prototipos sao cadastrados inativos; dados nao publicados permanecem em branco.",
        "SET NAMES utf8mb4;", "START TRANSACTION;", "",
        "CREATE TABLE IF NOT EXISTS schema_migrations (versao VARCHAR(80) NOT NULL PRIMARY KEY,descricao VARCHAR(255) NOT NULL,aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        "CREATE TABLE IF NOT EXISTS modelo_especificacoes_tecnicas (modelo_id BIGINT UNSIGNED NOT NULL,chave VARCHAR(80) NOT NULL,rotulo VARCHAR(120) NOT NULL,valor VARCHAR(255) NOT NULL,unidade VARCHAR(30) NULL,fonte_url VARCHAR(700) NULL,conferido_em DATE NULL,PRIMARY KEY(modelo_id,chave),INDEX idx_met_chave_031(chave),CONSTRAINT fk_met_modelo_031 FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;",
        "",
    ]
    for slug, (name, country, site) in BRANDS.items():
        lines.append(f"INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES ({q(name)},{q(slug)},{q(country)},{q(site)},{q('Fabricante de veiculos comerciais auditado em fonte publica oficial.')},1) ON DUPLICATE KEY UPDATE site_oficial=VALUES(site_oficial),ativo=1;")
    for (brand, family, vehicle_type), description in FAMILIES.items():
        image = next(m["image"] for m in MODELS if m["brand"] == brand and m["family"] == family)
        lines.append(f"INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,imagem,ativo) SELECT id,{q(family)},{q(description)},{q(vehicle_type)},{q(image)},1 FROM marcas WHERE slug={q(brand)} ON DUPLICATE KEY UPDATE descricao=COALESCE(NULLIF(familias.descricao,''),VALUES(descricao)),tipo_veiculo=VALUES(tipo_veiculo),imagem=COALESCE(NULLIF(familias.imagem,''),VALUES(imagem)),ativo=1;")

    for m in MODELS:
        specs = dict(m.get("specs", {}))
        specs.update({"fonte_oficial":m["source"], "fonte_imagem":m["source"], "conferido_em":DATE})
        if m.get("doc"):
            specs["documento_auditoria"] = "/public/assets/documents/modelos/" + m["doc"]
        base_fields = ["motor", "potencia", "torque", "transmissao", "pbt", "pbtc", "relacao_reducao"]
        base_values = [m.get(x) for x in base_fields]
        description = m.get("description", "Dados conferidos em fonte publica oficial da fabricante.")
        active = int(m.get("active", 1))
        lines += ["", f"-- {m['name']}",
            "INSERT INTO modelos(familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo) "
            f"SELECT f.id,{q(m['name'])},{q(m['slug'])},{q(description)},{q(m['image'])},{','.join(q(x) for x in base_values)},{j(specs)},{active} FROM familias f JOIN marcas ma ON ma.id=f.marca_id "
            f"WHERE ma.slug={q(m['brand'])} AND f.nome={q(m['family'])} AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas bx ON bx.id=fx.marca_id WHERE bx.slug={q(m['brand'])} AND (mx.slug={q(m['slug'])} OR LOWER(TRIM(mx.nome))=LOWER(TRIM({q(m['name'])})))) LIMIT 1;"
        ]
        updates = [f"m.{field}={blank('m.'+field, value)}" for field, value in zip(base_fields, base_values) if value]
        updates += [f"m.imagem={blank('m.imagem', m['image'])}", f"m.descricao={blank('m.descricao', description)}", f"m.especificacoes=JSON_MERGE_PATCH(COALESCE(m.especificacoes,JSON_OBJECT()),{j(specs)})"]
        lines.append("UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id SET " + ",".join(updates) + f" WHERE ma.slug={q(m['brand'])} AND (m.slug={q(m['slug'])} OR LOWER(TRIM(m.nome))=LOWER(TRIM({q(m['name'])})));" )
        technical = {"pbt":m.get("pbt"), "pbtc":m.get("pbtc"), "relacao_reducao":m.get("relacao_reducao")}
        technical.update(specs)
        add_specs(lines, m["brand"], m["slug"], m["source"], technical)
        if m.get("doc"):
            path = "/public/assets/documents/modelos/" + m["doc"]
            lines.append(f"INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo) SELECT m.id,'ficha_tecnica',{q('Documento tecnico oficial - '+m['name'])},{q(path)},{q(m['source'])},{q(m['source'])},1 FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE ma.slug={q(m['brand'])} AND m.slug={q(m['slug'])} LIMIT 1 ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),arquivo=VALUES(arquivo),url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1;")

    for item in SUPPLEMENTS:
        specs = dict(item["specs"])
        specs.update({"fonte_oficial_atualizacao":item["source"], "conferido_em_atualizacao":DATE})
        lines += ["", f"-- Complemento do modelo existente {item['slug']}",
                  f"UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id SET m.especificacoes=JSON_MERGE_PATCH(COALESCE(m.especificacoes,JSON_OBJECT()),{j(specs)}) WHERE ma.slug={q(item['brand'])} AND m.slug={q(item['slug'])};"]
        add_specs(lines, item["brand"], item["slug"], item["source"], specs)

    lines += ["", "INSERT INTO schema_migrations(versao,descricao) VALUES ('20261016_031_atualizacao_catalogo_multimarcas','Atualizacao auditada VWCO, Mercedes-Benz, IVECO, BYD e complemento Volvo; Scania e DAF revisados sem inclusoes') ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);", "COMMIT;", ""]
    MIGRATION.write_text("\n".join(lines), encoding="utf-8", newline="\n")

    active = sum(int(m.get("active", 1)) for m in MODELS)
    report = [
        "# Auditoria multimarcas do catalogo - 16/10/2026", "",
        "A varredura comparou o catalogo local com paginas, releases e fichas publicas oficiais. A migracao e idempotente e nao altera a HostGator automaticamente.", "",
        f"- Modelos incluidos ou complementados: **{len(MODELS) + len(SUPPLEMENTS)}**.",
        f"- Produtos comerciais ativos: **{active}**.",
        f"- Anuncios futuros/prototipos mantidos inativos: **{len(MODELS)-active}**.",
        "- Novas fichas locais: **3**.", "- Novas imagens oficiais locais: **10**.", "",
        "## Resultado por marca", "",
        "- **VWCO:** e-Delivery 12/17, Constellation 26.280 Biometano e 33.540; familia Ultra registrada como anuncio futuro.",
        "- **Mercedes-Benz:** eO500UA comercial e eCity previsto para 2027.",
        "- **IVECO:** eDaily 3,5/4,25/7,2 t, Tector NG e S-Way NG.",
        "- **BYD:** T35 registrado inativo ate confirmacao de venda/homologacao brasileira.",
        "- **Volvo:** BZR 6x2 complementado com capacidade, autonomia, bateria e recarga divulgadas no Brasil.",
        "- **Scania:** linha Super, eletricos 4x2/6x2 e gas ja cobertos pela migracao 029; nenhum modelo adicional comprovado.",
        "- **DAF:** linha brasileira atual continua CF/XF/Vocacional ja coberta; nenhum modelo comercial novo comprovado.", "",
        "## Arquivo a importar", "", "`database/migrations/20261016_031_atualizacao_catalogo_multimarcas.sql`", "",
        "Envie junto as novas imagens em `public/assets/images/modelos/` e fichas em `public/assets/documents/modelos/`.", "",
        "## Regras de confiabilidade", "",
        "- Nao foi convertido CMT em PBTC e nenhum peso foi deduzido pela soma de eixos.",
        "- Campos ausentes na fonte permaneceram vazios e receberam observacao explicita.",
        "- A ficha internacional do BYD T35 foi marcada como referencia, nao como homologacao brasileira.",
        "- Imagens foram baixadas de paginas oficiais e armazenadas sem dependencia de hotlink.", "",
    ]
    REPORT.write_text("\n".join(report), encoding="utf-8", newline="\n")
    print(MIGRATION.relative_to(ROOT))
    print(REPORT.relative_to(ROOT))


if __name__ == "__main__":
    generate()
