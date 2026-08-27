-- Drive Learn - sincronização Mercedes-Benz por fontes técnicas oficiais públicas.
-- Gerado em 2026-08-27 por scripts/sync_mercedes_technical_catalog.py.
-- Idempotente: preserva dados preenchidos e completa lacunas; não envia formulários.
SET NAMES utf8mb4;
CREATE TABLE IF NOT EXISTS schema_migrations (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  versao VARCHAR(190) NOT NULL UNIQUE,
  descricao VARCHAR(255) NULL,
  aplicado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo)
VALUES ('Mercedes-Benz','mercedes-benz','Alemanha','https://www.mercedes-benz-trucks.com.br/',
        'Fabricante de caminhões e chassis de ônibus.',1)
ON DUPLICATE KEY UPDATE site_oficial=VALUES(site_oficial),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Accelo','Linha Mercedes-Benz Accelo de caminhões para aplicações de transporte e trabalho.','caminhao',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Actros','Linha Mercedes-Benz Actros de caminhões para aplicações de transporte e trabalho.','caminhao',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Arocs','Linha Mercedes-Benz Arocs de caminhões para aplicações de transporte e trabalho.','caminhao',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Atego','Linha Mercedes-Benz Atego de caminhões para aplicações de transporte e trabalho.','caminhao',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Axor','Linha Mercedes-Benz Axor de caminhões para aplicações de transporte e trabalho.','caminhao',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'LO Micro-Ônibus e Escolar','Linha de chassis Mercedes-Benz LO Micro-Ônibus e Escolar para transporte de passageiros.','onibus',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Novo Accelo','Linha Mercedes-Benz Novo Accelo de caminhões para aplicações de transporte e trabalho.','caminhao',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'O 500 Rodoviários','Linha de chassis Mercedes-Benz O 500 Rodoviários para transporte de passageiros.','onibus',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'O 500 Urbanos','Linha de chassis Mercedes-Benz O 500 Urbanos para transporte de passageiros.','onibus',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'OF Urbanos e Fretamento','Linha de chassis Mercedes-Benz OF Urbanos e Fretamento para transporte de passageiros.','onibus',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'Ônibus Elétricos Urbanos','Linha de chassis Mercedes-Benz Ônibus Elétricos Urbanos para transporte de passageiros.','onibus',1
FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo=VALUES(tipo_veiculo),ativo=1;

-- Accelo 1017 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Accelo 1017 4x2','accelo-1017-4x2','Com PBT técnico de 9,6 toneladas o Accelo 1017 é ideal para quem precisa de capacidade de carga adicional nas operações de coleta e entrega urbana e em curtas distâncias rodoviárias, sem abrir mão de agilidade e robustez. Com disponibilidade de duas cabinas e três distâncias entre-eixos, pode receber uma extensa variedade de carroçarias e ainda atende as legislações de restrição de circulação nas grandes cidades. O potente e confiável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, motor de caminhão de maior porte, proporciona economia, agilidade e durabilidade. Accelo 1017, eficiência e produtividade na cidade e estrada.','MB OM 924 LA • BlueTec 6 • 4,8 lts. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','163 cv (120 kW) @ 2.200 rpm','610 Nm (62 mkgf) @ 1.200 - 1.600 rpm','MB G 70-6 MB G 70-6 PowerShift 3','9.600 kg','13.000 kg','4,30 / 3,91','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.100 3.900 4.600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/1017-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Accelo'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='accelo-1017-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Accelo 1017 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com PBT técnico de 9,6 toneladas o Accelo 1017 é ideal para quem precisa de capacidade de carga adicional nas operações de coleta e entrega urbana e em curtas distâncias rodoviárias, sem abrir mão de agilidade e robustez. Com disponibilidade de duas cabinas e três distâncias entre-eixos, pode receber uma extensa variedade de carroçarias e ainda atende as legislações de restrição de circulação nas grandes cidades. O potente e confiável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, motor de caminhão de maior porte, proporciona economia, agilidade e durabilidade. Accelo 1017, eficiência e produtividade na cidade e estrada.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6 • 4,8 lts. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62 mkgf) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 70-6 MB G 70-6 PowerShift 3'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'9.600 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'13.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30 / 3,91'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.100 3.900 4.600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/1017-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Accelo 1017 4x2','public/assets/documents/modelos/mercedes-accelo-1017-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/1017-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','9.600 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','13.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30 / 3,91',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3.100 3.900 4.600',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2b343ef8-62a4-4a65-b8ef-b15509c03963','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1017-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1017 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Accelo 1317 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Accelo 1317 6x2','accelo-1317-6x2','Com terceiro eixo original de fábrica e PBT técnico de 13 toneladas, o Accelo 1317 é a opção perfeita para quem precisa unir maior capacidade de carga e máxima plataforma de carga, num veículo compacto e ágil. Disponível em duas cabinas e duas distâncias entre-eixos, o Accelo 1317 oferece as maiores plataformas de carga do segmento, possibilitando a instalação de carroçarias de até 8?m de comprimento. O robusto e confiável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, motor de caminhão de maior porte, assegura desempenho e economia excepcionais. Accelo 1317, agilidade e capacidade de carga para aumentar a produtividade e alavancar seu negócio.','MB OM 924 LA • BlueTec 6 • 4,8 lts. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','163 cv (120 kW) @ 2.200 rpm','610 Nm (62,2 mkgf) @ 1.200 - 1.600 rpm','MB G 70-6 MB G 70-6 PowerShift 3','13.000 kg','13.000 kg','4,30 /','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.900+978 4.600+978","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/1317-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Accelo'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='accelo-1317-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Accelo 1317 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com terceiro eixo original de fábrica e PBT técnico de 13 toneladas, o Accelo 1317 é a opção perfeita para quem precisa unir maior capacidade de carga e máxima plataforma de carga, num veículo compacto e ágil. Disponível em duas cabinas e duas distâncias entre-eixos, o Accelo 1317 oferece as maiores plataformas de carga do segmento, possibilitando a instalação de carroçarias de até 8?m de comprimento. O robusto e confiável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, motor de caminhão de maior porte, assegura desempenho e economia excepcionais. Accelo 1317, agilidade e capacidade de carga para aumentar a produtividade e alavancar seu negócio.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6 • 4,8 lts. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 mkgf) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 70-6 MB G 70-6 PowerShift 3'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'13.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'13.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30 /'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.900+978 4.600+978","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/1317-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Accelo 1317 6x2','public/assets/documents/modelos/mercedes-accelo-1317-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/1317-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','13.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','13.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30 /',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3.900+978 4.600+978',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/80d7e839-71e0-4e6f-870a-466785c9d042','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-1317-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 1317 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Accelo 817 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Accelo 817 4x2','accelo-817-4x2','Com PBT técnico de 8,3 toneladas, disponibilidade de duas cabinas e três distâncias entre-eixos, o Accelo 817 se adequa a todo tipo de implemento, atendendo as mais variadas aplicações do mercado, inclusive as legislações de restrição de circulação das grandes cidades. O robusto e durável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, motor de caminhão de maior porte, assegura economia, desempenho e agilidade no congestionado trânsito dos centros urbanos. Robusto, compacto e ágil, o Accelo 817 é perfeito para a distribuição de carga porta a porta nos grandes centros urbanos.','MB OM 924 LA • BlueTec 6• 4,8 lts. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','163 cv (120 kW) @ 2.200 rpm','610 Nm (62 kgfm) @ 1.200 - 1.600 rpm','EATON ESO 6205 MB G 70-6 MB G 70-6 PowerShift 3','8.300 kg','11.000 kg','3,91(43:11)','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.100 3.900 4.600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/817-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Accelo'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='accelo-817-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Accelo 817 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com PBT técnico de 8,3 toneladas, disponibilidade de duas cabinas e três distâncias entre-eixos, o Accelo 817 se adequa a todo tipo de implemento, atendendo as mais variadas aplicações do mercado, inclusive as legislações de restrição de circulação das grandes cidades. O robusto e durável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, motor de caminhão de maior porte, assegura economia, desempenho e agilidade no congestionado trânsito dos centros urbanos. Robusto, compacto e ágil, o Accelo 817 é perfeito para a distribuição de carga porta a porta nos grandes centros urbanos.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6• 4,8 lts. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62 kgfm) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'EATON ESO 6205 MB G 70-6 MB G 70-6 PowerShift 3'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'8.300 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'11.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,91(43:11)'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.100 3.900 4.600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/817-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Accelo 817 4x2','public/assets/documents/modelos/mercedes-accelo-817-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','https://www.mercedes-benz-trucks.com.br/caminhoes/accelo/817-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','8.300 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','11.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,91(43:11)',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3.100 3.900 4.600',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b8fce583-c429-4f0d-9732-5402799ab313','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='accelo-817-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Accelo 817 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2045 LS 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2045 LS 4x2','actros-2045-ls-4x2','Cavalo mecânico 4x2, equipado com suspensão traseira pneumática e com o confiável motor Mercedes-Benz OM 460, é ideal para quem prioriza robustez, versatilidade e baixo custo operacional no transporte de cargas volumosas ou fracionadas, frágeis e suscetíveis a danos durante o transporte, como informática, eletrodomésticos, eletroeletrônicos, equipamentos médicos e hospitalares e produtos farmacêuticos, entre outros. Pode tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, furgão lonado tipo sider, e cegonheiro, entre outros. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2045 LS, preservação da carga e conforto para quem dirige.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)','449 cv (330 kW) @ 1600 rpm','2200 Nm (224,3 kgfm) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced','20.100 kg',NULL,'2,84(37:13) 2,84(37:13)* 3,08(40:13)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2045-ls-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2045-ls-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2045 LS 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Cavalo mecânico 4x2, equipado com suspensão traseira pneumática e com o confiável motor Mercedes-Benz OM 460, é ideal para quem prioriza robustez, versatilidade e baixo custo operacional no transporte de cargas volumosas ou fracionadas, frágeis e suscetíveis a danos durante o transporte, como informática, eletrodomésticos, eletroeletrônicos, equipamentos médicos e hospitalares e produtos farmacêuticos, entre outros. Pode tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, furgão lonado tipo sider, e cegonheiro, entre outros. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2045 LS, preservação da carga e conforto para quem dirige.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'449 cv (330 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2200 Nm (224,3 kgfm) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,84(37:13) 2,84(37:13)* 3,08(40:13)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2045-ls-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2045 LS 4x2','public/assets/documents/modelos/mercedes-actros-2045-ls-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2045-ls-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,84(37:13) 2,84(37:13)* 3,08(40:13)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/314886ed-cdbe-46cf-ab10-b7a05049ffe9','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2045 S 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2045 S 4x2','actros-2045-s-4x2','Cavalo mecânico 4x2 equipado com suspensão traseira metálica e com o confiável motor Mercedes-Benz OM 460 atende o transportador que precisa de um caminhão robusto, versátil, com baixo custo operacional para o transporte de cargas volumosas em condições um pouco mais desfavoráveis de conservação de pavimento, onde a resistência da suspensão metálica traz confiabilidade e baixa demanda de manutenção. Ideal para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão lonado tipo sider, furgão de alumínio, tanque e carga seca aberta, entre outros, com disponibilidade e produtividade. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2045 S, robustez e confiabilidade para levar a carga onde ela precisa chegar.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)','449 cv (330 kW) @ 1600 rpm','2.200 Nm (224,3 mkgf) @ 1.100 rpm','MB G 291-12 Powershift 3 Advanced','20.100 kg',NULL,'2,84(37:13) 2,73(41:15)* 3,08(40:13)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2045-s-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2045-s-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2045 S 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Cavalo mecânico 4x2 equipado com suspensão traseira metálica e com o confiável motor Mercedes-Benz OM 460 atende o transportador que precisa de um caminhão robusto, versátil, com baixo custo operacional para o transporte de cargas volumosas em condições um pouco mais desfavoráveis de conservação de pavimento, onde a resistência da suspensão metálica traz confiabilidade e baixa demanda de manutenção. Ideal para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão lonado tipo sider, furgão de alumínio, tanque e carga seca aberta, entre outros, com disponibilidade e produtividade. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2045 S, robustez e confiabilidade para levar a carga onde ela precisa chegar.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'449 cv (330 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2.200 Nm (224,3 mkgf) @ 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,84(37:13) 2,73(41:15)* 3,08(40:13)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2045-s-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2045 S 4x2','public/assets/documents/modelos/mercedes-actros-2045-s-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2045-s-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,84(37:13) 2,73(41:15)* 3,08(40:13)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/98d49185-329f-4ef9-9b0a-cf9024afbfbc','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2045-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2045 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2548 LS 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2548 LS 6x2','actros-2548-ls-6x2','Transporte de cargas pesadas em médias e longas distâncias com conforto e preservação','MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)','476 cv (350 kW) @ 1600 rpm','2300 Nm (234,5 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced','28.100 kg',NULL,'2,85(37:13)','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250+1350 3550+1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2548-ls-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2548-ls-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2548 LS 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Transporte de cargas pesadas em médias e longas distâncias com conforto e preservação'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'476 cv (350 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2300 Nm (234,5 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'28.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85(37:13)'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250+1350 3550+1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2548-ls-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2548 LS 6x2','public/assets/documents/modelos/mercedes-actros-2548-ls-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2548-ls-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','28.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85(37:13)',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3250+1350 3550+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ca273b91-f1f9-470c-b267-d31a42df6251','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2548 S 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2548 S 6x2','actros-2548-s-6x2','Cavalo mecânico 6x2 equipado com suspensão traseira metálica e com o confiável motor Mercedes-Benz OM 460, atende o transportador que precisa de um caminhão forte e robusto para o transporte de cargas pesadas em condições desfavoráveis de conservação de pavimento, onde a resistência da suspensão metálica traz confiabilidade e baixa demanda de manutenção. Ideal para tracionar com robustez e versatilidade todos os tipos de semirreboques de 3 eixos e até de 4 eixos, tais como graneleiro, porta contêiner e gaiola para botijões de gás, entre outros. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2548 S, confiabilidade e disponibilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)','476 cv (350 kW) @ 1600 rpm','2300 Nm (234,5 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced*','30.100 kg',NULL,'2,85 / 2,73* 3,08* 4,33','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550+1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2548-s-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2548-s-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2548 S 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Cavalo mecânico 6x2 equipado com suspensão traseira metálica e com o confiável motor Mercedes-Benz OM 460, atende o transportador que precisa de um caminhão forte e robusto para o transporte de cargas pesadas em condições desfavoráveis de conservação de pavimento, onde a resistência da suspensão metálica traz confiabilidade e baixa demanda de manutenção. Ideal para tracionar com robustez e versatilidade todos os tipos de semirreboques de 3 eixos e até de 4 eixos, tais como graneleiro, porta contêiner e gaiola para botijões de gás, entre outros. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2548 S, confiabilidade e disponibilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'476 cv (350 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2300 Nm (234,5 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced*'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 / 2,73* 3,08* 4,33'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550+1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2548-s-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2548 S 6x2','public/assets/documents/modelos/mercedes-actros-2548-s-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2548-s-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 / 2,73* 3,08* 4,33',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b5ab0074-5746-4e24-ba97-ce4c835046c1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2548-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2548 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2553 LS 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2553 LS 6x2','actros-2553-ls-6x2','Transporte eficiente de cargas pesadas em médias e longas distâncias mais conforto e preservaçao','MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)','530 cv (390 kW) @ 1600 rpm','2600 Nm (265,1 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced','28.100 kg',NULL,'2,85(37:13)','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2553-ls-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2553-ls-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2553 LS 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Transporte eficiente de cargas pesadas em médias e longas distâncias mais conforto e preservaçao'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'530 cv (390 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2600 Nm (265,1 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'28.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85(37:13)'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2553-ls-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2553 LS 6x2','public/assets/documents/modelos/mercedes-actros-2553-ls-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2553-ls-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','28.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85(37:13)',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4f8831d2-8b59-469c-b01c-cc6b008c6f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2553 S 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2553 S 6x2','actros-2553-s-6x2','Transporte eficiente de cargas pesadas em médias e longas distâncias com robustez','MB OM 471 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)','530 cv (390 kW) @ 1600 rpm','2600 Nm (265,1 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced','30.100 kg',NULL,'2,73 /','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2553-s-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2553-s-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2553 S 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Transporte eficiente de cargas pesadas em médias e longas distâncias com robustez'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 471 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'530 cv (390 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2600 Nm (265,1 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,73 /'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2553-s-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2553 S 6x2','public/assets/documents/modelos/mercedes-actros-2553-s-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2553-s-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','68.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,73 /',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e8d219da-1888-435c-af82-f47427031eee','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2553-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2553 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2651 LS 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2651 LS 6x4','actros-2651-ls-6x4','Transporte de cargas densas e pesadas em longas distâncias com conforto e preservação','MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)','495 cv (364 kW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced','27.100 kg',NULL,'3,08(40:13) 2,84(37:13) 3,31(43:13)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2651-ls-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2651-ls-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2651 LS 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Transporte de cargas densas e pesadas em longas distâncias com conforto e preservação'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'27.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,08(40:13) 2,84(37:13) 3,31(43:13)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2651-ls-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2651 LS 6x4','public/assets/documents/modelos/mercedes-actros-2651-ls-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2651-ls-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','27.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','80.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,08(40:13) 2,84(37:13) 3,31(43:13)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc9eaee9-16db-43a1-a046-57f8dbd0009f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2651 S 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2651 S 6x4','actros-2651-s-6x4','Cavalo mecânico 6x4 equipado com suspensão traseira metálica e com o confiável motor Mercedes-Benz OM 460, atende o transportador que precisa de um caminhão forte e robusto para o transporte de grandes volumes de carga em condições desfavoráveis de conservação de pavimento e estradas mistas, onde a resistência da suspensão metálica traz confiabilidade e baixa demanda de manutenção. Ideal para tracionar com robustez e versatilidade grandes composições de 9 eixos e PBTC de 74 toneladas de qualquer tipo. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2651 S, capacidade de carga, robustez e confiabilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)','495 cv (364 kW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced','27.100 kg',NULL,'3,08(40:13) / 2,85(37:13)* / 3,31(43:13)* 4,33(26:24','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2651-s-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2651-s-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2651 S 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Cavalo mecânico 6x4 equipado com suspensão traseira metálica e com o confiável motor Mercedes-Benz OM 460, atende o transportador que precisa de um caminhão forte e robusto para o transporte de grandes volumes de carga em condições desfavoráveis de conservação de pavimento e estradas mistas, onde a resistência da suspensão metálica traz confiabilidade e baixa demanda de manutenção. Ideal para tracionar com robustez e versatilidade grandes composições de 9 eixos e PBTC de 74 toneladas de qualquer tipo. Pode ser equipado com um completo e avançado pacote de segurança. Actros 2651 S, capacidade de carga, robustez e confiabilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L. • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'27.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,08(40:13) / 2,85(37:13)* / 3,31(43:13)* 4,33(26:24'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2651-s-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2651 S 6x4','public/assets/documents/modelos/mercedes-actros-2651-s-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2651-s-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','27.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','80.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,08(40:13) / 2,85(37:13)* / 3,31(43:13)* 4,33(26:24',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec7e9e67-e53b-4d3c-a0e7-b7951cc2c75e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2651-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2651 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2653 LS 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2653 LS 6x4','actros-2653-ls-6x4','Transporte eficiente de cargas densas e pesadas em longas distâncias com conforto e preservação','MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)','530 cv (390 kW) @ 1600 rpm','2600 Nm (265,1 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced','27.100 kg',NULL,'3,08(40:13)','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250+1350 3550+1350","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-ls-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2653-ls-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2653 LS 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Transporte eficiente de cargas densas e pesadas em longas distâncias com conforto e preservação'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'530 cv (390 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2600 Nm (265,1 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'27.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,08(40:13)'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250+1350 3550+1350","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-ls-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2653 LS 6x4','public/assets/documents/modelos/mercedes-actros-2653-ls-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-ls-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','27.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','80.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,08(40:13)',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3250+1350 3550+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6505e0fc-1002-4ab2-9b19-dac8f429f9ae','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-ls-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 LS 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Actros 2653 S 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Actros 2653 S 6x4','actros-2653-s-6x4','Transporte eficiente de cargas densas e pesadas em longas distâncias com robustez','MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)','530 cv (390 kW) @ 1600 rpm','2600 Nm (265,1 mkgf) @ 1100 rpm','MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced*','27.100 kg',NULL,'3,08(40:13) / 2,85(37:13)* / 3,31(43:13)* 4,33(26:24','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-s-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Actros'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='actros-2653-s-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Actros 2653 S 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Transporte eficiente de cargas densas e pesadas em longas distâncias com robustez'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'530 cv (390 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2600 Nm (265,1 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 Powershift 3 Advanced MB G 340-12 Powershift 3 Advanced*'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'27.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,08(40:13) / 2,85(37:13)* / 3,31(43:13)* 4,33(26:24'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3250","cmt":"80.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-s-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Actros 2653 S 6x4','public/assets/documents/modelos/mercedes-actros-2653-s-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-s-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','27.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','80.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,08(40:13) / 2,85(37:13)* / 3,31(43:13)* 4,33(26:24',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ec1e253e-62c2-452a-a362-8290aa8b5759','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='actros-2653-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Actros 2653 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Arocs 3351 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Arocs 3351 6x4','arocs-3351-6x4','Para a severidade das operações de transporte e apoio pesado na construção civil, mineração e agropecuária, o Arocs 3351 P (plataforma) é o caminhão mais indicado. Suas excepcionais características de robustez, resistência e baixa demanda de manutenção asseguram disponibilidade e produtividade inigualáveis. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção, essenciais para executar o trabalho com o mínimo de interrupções e paradas. Ideal para operações que precisam resistência, robustez e elevada capacidade de carga, tais como tanque espargidor de água, guindaste e bomba de concreto, entre outras. Arocs 3351 P, capacidade carga, robustez, confiabilidade e disponibilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','495 cv (364 KW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 340 -12 Powershift 3 Advanced','33.500 kg',NULL,'5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4800+1350","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Arocs'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='arocs-3351-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Arocs 3351 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para a severidade das operações de transporte e apoio pesado na construção civil, mineração e agropecuária, o Arocs 3351 P (plataforma) é o caminhão mais indicado. Suas excepcionais características de robustez, resistência e baixa demanda de manutenção asseguram disponibilidade e produtividade inigualáveis. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção, essenciais para executar o trabalho com o mínimo de interrupções e paradas. Ideal para operações que precisam resistência, robustez e elevada capacidade de carga, tais como tanque espargidor de água, guindaste e bomba de concreto, entre outras. Arocs 3351 P, capacidade carga, robustez, confiabilidade e disponibilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 KW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 340 -12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'33.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4800+1350","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Arocs 3351 6x4','public/assets/documents/modelos/mercedes-arocs-3351-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','33.500 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','150.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4800+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4d5f17e3-5b0e-4d5b-9174-5ad049fff6ad','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Arocs 3351 K 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Arocs 3351 K 6x4','arocs-3351-k-6x4','Para a movimentação de grandes volumes de material e insumos nos canteiros das obras de grande porte, mineração e pedreiras, o Actros 3351 K (basculante) é a escolha certa. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção, essenciais para executar o trabalho com o mínimo de interrupções e paradas. Especialmente vocacionado para o trabalho como basculante, o Arocs 3351 K já vem equipado originalmente com itens desenvolvidos para enfrentar as mais severas condições de trabalho, tais como tomada de forca no câmbio, embreagem bidisco reforçada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação do implemento, ainda proporcionam elevada eficiência operacional. Arocs 3351 K, capacidade carga, robustez, confiabilidade e disponibilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','495 cv (364 KW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 340 -12 Powershift 3 Advanced','33.500 kg',NULL,'5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3300+1350","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-k-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Arocs'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='arocs-3351-k-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Arocs 3351 K 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para a movimentação de grandes volumes de material e insumos nos canteiros das obras de grande porte, mineração e pedreiras, o Actros 3351 K (basculante) é a escolha certa. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção, essenciais para executar o trabalho com o mínimo de interrupções e paradas. Especialmente vocacionado para o trabalho como basculante, o Arocs 3351 K já vem equipado originalmente com itens desenvolvidos para enfrentar as mais severas condições de trabalho, tais como tomada de forca no câmbio, embreagem bidisco reforçada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação do implemento, ainda proporcionam elevada eficiência operacional. Arocs 3351 K, capacidade carga, robustez, confiabilidade e disponibilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 KW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 340 -12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'33.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3300+1350","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-k-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Arocs 3351 K 6x4','public/assets/documents/modelos/mercedes-arocs-3351-k-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-k-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','33.500 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','150.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3300+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/aa73a279-7499-49d6-b17e-66541c5d0019','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Arocs 3351 S 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Arocs 3351 S 6x4','arocs-3351-s-6x4','Operações pesadas e severas na construção civil, mineração e agronegócio requerem um caminhão forte, resistente, de fácil manutenção e que proporcione alta disponibilidade. O Arocs 3351 S (cavalo mecânico) atende com folga essas demandas. Suas excepcionais características de robustez, resistência e baixa demanda de manutenção asseguram disponibilidade e produtividade inigualáveis. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção, essenciais para executar o trabalho com o mínimo de interrupções e paradas. O Arocs 3351 S é ideal para tracionar pesadas composições de carga com robustez e confiabilidade, tais como semi-reboques para transporte de máquinas na construção civil, rodotrem de 9 eixos no setor canavieiro e tritrem de 9 eixos no segmento da extração de madeira, entre outros. Arocs 3351 S, capacidade carga, robustez, confiabilidade e disponibilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','495 cv (364 KW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 340 -12 Powershift 3 Advanced','33.500 kg',NULL,'5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3300+1350","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-s-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Arocs'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='arocs-3351-s-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Arocs 3351 S 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Operações pesadas e severas na construção civil, mineração e agronegócio requerem um caminhão forte, resistente, de fácil manutenção e que proporcione alta disponibilidade. O Arocs 3351 S (cavalo mecânico) atende com folga essas demandas. Suas excepcionais características de robustez, resistência e baixa demanda de manutenção asseguram disponibilidade e produtividade inigualáveis. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção, essenciais para executar o trabalho com o mínimo de interrupções e paradas. O Arocs 3351 S é ideal para tracionar pesadas composições de carga com robustez e confiabilidade, tais como semi-reboques para transporte de máquinas na construção civil, rodotrem de 9 eixos no setor canavieiro e tritrem de 9 eixos no segmento da extração de madeira, entre outros. Arocs 3351 S, capacidade carga, robustez, confiabilidade e disponibilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 KW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 340 -12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'33.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3300+1350","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-s-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Arocs 3351 S 6x4','public/assets/documents/modelos/mercedes-arocs-3351-s-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3351-s-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','33.500 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','150.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3300+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/db45449c-268d-456c-ae7d-a15b43b629aa','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3351-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3351 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Arocs 3353 S 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Arocs 3353 S 6x4','arocs-3353-s-6x4','Operações pesadas e severas na construção civil, mineração e agronegócio requerem um caminhão forte, resistente e que também proporcione alta produtividade. O Arocs 3353 S (cavalo mecânico) é a escolha certa, atendendo com folga essas demandas. O moderno, potente e econômico motor Mercedes-Benz OM 471 de 530 cv assegura elevado patamar de produtividade com desempenho e economia de combustível inigualáveis Além de atender toda gama de aplicações tradicionais fora de estrada com excepcional robustez e produtividade, o Arocs 3353 S é especialmente indicado para tracionar, com confiabilidade e segurança, as pesadas composições de 11 eixos e PBTC de 91 toneladas carga utilizadas para escoar as safras cada vez maiores do setor sucroalcooleiro. Arocs 3353 S, capacidade carga, segurança e produtividade.','MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','530 cv (390 KW) @ 1600 rpm','2600 Nm (265,1 mkgf) @ 1100 rpm','MB G 340 -12 Powershift 3 Advanced','33.500 kg',NULL,'5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3300+1650","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3353-s-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Arocs'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='arocs-3353-s-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Arocs 3353 S 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Operações pesadas e severas na construção civil, mineração e agronegócio requerem um caminhão forte, resistente e que também proporcione alta produtividade. O Arocs 3353 S (cavalo mecânico) é a escolha certa, atendendo com folga essas demandas. O moderno, potente e econômico motor Mercedes-Benz OM 471 de 530 cv assegura elevado patamar de produtividade com desempenho e economia de combustível inigualáveis Além de atender toda gama de aplicações tradicionais fora de estrada com excepcional robustez e produtividade, o Arocs 3353 S é especialmente indicado para tracionar, com confiabilidade e segurança, as pesadas composições de 11 eixos e PBTC de 91 toneladas carga utilizadas para escoar as safras cada vez maiores do setor sucroalcooleiro. Arocs 3353 S, capacidade carga, segurança e produtividade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 471 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'530 cv (390 KW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2600 Nm (265,1 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 340 -12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'33.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3300+1650","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3353-s-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Arocs 3353 S 6x4','public/assets/documents/modelos/mercedes-arocs-3353-s-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/3353-s-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','33.500 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','150.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3300+1650',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4641dc98-97c7-4f7c-bffa-bfab29f67f62','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-3353-s-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 3353 S 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Arocs 4151 K 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Arocs 4151 K 6x4','arocs-4151-k-6x4','Para a movimentação de grandes volumes de material e insumos nos canteiros das obras de grande porte, mineração e pedreiras, o Actros 4151 K (basculante) é o caminhão indicado. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção. Especialmente vocacionado para o trabalho como basculante, o Arocs 4151 K já vem equipado originalmente com itens desenvolvidos para enfrentar as mais severas condições de trabalho, tais como tomada de forca no câmbio, embreagem bidisco reforçada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação do implemento, ainda proporcionam elevada eficiência operacional. Arocs 4151 K, alta capacidade carga, robustez, confiabilidade e disponibilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','495 cv (364 KW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 340 -12 Powershift 3 Advanced','41.000 kg',NULL,'5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550+1450","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/4151-k-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Arocs'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='arocs-4151-k-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Arocs 4151 K 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para a movimentação de grandes volumes de material e insumos nos canteiros das obras de grande porte, mineração e pedreiras, o Actros 4151 K (basculante) é o caminhão indicado. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção. Especialmente vocacionado para o trabalho como basculante, o Arocs 4151 K já vem equipado originalmente com itens desenvolvidos para enfrentar as mais severas condições de trabalho, tais como tomada de forca no câmbio, embreagem bidisco reforçada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação do implemento, ainda proporcionam elevada eficiência operacional. Arocs 4151 K, alta capacidade carga, robustez, confiabilidade e disponibilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 KW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 340 -12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'41.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550+1450","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/4151-k-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Arocs 4151 K 6x4','public/assets/documents/modelos/mercedes-arocs-4151-k-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/4151-k-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','41.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','150.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550+1450',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4da00dcc-64e7-4e0b-92dd-5c3148260c12','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-4151-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 4151 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Arocs 5851 K 8x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Arocs 5851 K 8x4','arocs-5851-k-8x4','O Arocs 5851 K em configuração 8x4 e versão K específica para operação basculante, oferece capacidade de carga e resistência excepcionais para a movimentação de grandes volumes de material e insumos nos canteiros das obras de grande porte, mineração e pedreiras. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção. Especialmente vocacionado para o trabalho pesado como basculante, já vem equipado originalmente com itens desenvolvidos para enfrentar as mais severas condições de trabalho, tais como tomada de forca no câmbio, embreagem bidisco reforçada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação do implemento, ainda proporcionam elevada eficiência operacional. Arocs 58 ton K, excepcional capacidade carga, robustez, confiabilidade e disponibilidade.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','495 cv (364 KW) @ 1600 rpm','2400 Nm (244,7 mkgf) @ 1100 rpm','MB G 340 -12 Powershift 3 Advanced','580.002 kg',NULL,'6,82(29:17','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2000+2550+1450","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/5851-k-8x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Arocs'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='arocs-5851-k-8x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Arocs 5851 K 8x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O Arocs 5851 K em configuração 8x4 e versão K específica para operação basculante, oferece capacidade de carga e resistência excepcionais para a movimentação de grandes volumes de material e insumos nos canteiros das obras de grande porte, mineração e pedreiras. O consagrado e confiável motor Mercedes-Benz OM 460, assegura robustez e facilidade de manutenção. Especialmente vocacionado para o trabalho pesado como basculante, já vem equipado originalmente com itens desenvolvidos para enfrentar as mais severas condições de trabalho, tais como tomada de forca no câmbio, embreagem bidisco reforçada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação do implemento, ainda proporcionam elevada eficiência operacional. Arocs 58 ton K, excepcional capacidade carga, robustez, confiabilidade e disponibilidade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'495 cv (364 KW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2400 Nm (244,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 340 -12 Powershift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'580.002 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'6,82(29:17'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2000+2550+1450","cmt":"150.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/5851-k-8x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Arocs 5851 K 8x4','public/assets/documents/modelos/mercedes-arocs-5851-k-8x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','https://www.mercedes-benz-trucks.com.br/caminhoes/arocs/5851-k-8x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','580.002 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','150.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','6,82(29:17',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','2000+2550+1450',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','8x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/ff553db4-90b7-46bb-8714-c46c2f4f6a16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='arocs-5851-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Arocs 5851 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1419 P 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1419 P 4x2','atego-1419-p-4x2','Agilidade, condução simples e baixo custo operacional, fazem do Atego 1419 P (plataforma) o caminhão ideal para a distribuição urbana de cargas e mercadorias. O trem de força Mercedes-Benz proporciona ótimo desempenho e muita agilidade no tráfego intenso das cidades. A moderna cabina traz muito conforto e praticidade para o dia a dia das operações urbanas. Sua versatilidade permite montagem dos mais diversos implementos, com os mais variados comprimentos, incluindo os tradicionais furgões de alumínio e carroçaria aberta carga seca. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','185 cv (136 kW) @ 2200 rpm','700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','EATON FOSA 5406A MB G 140-8* PowerShift 3 Advanced','14.300 kg','23.000 kg','4,88 5,77 4,78* 4,78* 3,91* 4,30* 5,22*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540 4740 5.300","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1419-p-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1419-p-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1419 P 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Agilidade, condução simples e baixo custo operacional, fazem do Atego 1419 P (plataforma) o caminhão ideal para a distribuição urbana de cargas e mercadorias. O trem de força Mercedes-Benz proporciona ótimo desempenho e muita agilidade no tráfego intenso das cidades. A moderna cabina traz muito conforto e praticidade para o dia a dia das operações urbanas. Sua versatilidade permite montagem dos mais diversos implementos, com os mais variados comprimentos, incluindo os tradicionais furgões de alumínio e carroçaria aberta carga seca. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'EATON FOSA 5406A MB G 140-8* PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'14.300 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'23.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,88 5,77 4,78* 4,78* 3,91* 4,30* 5,22*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540 4740 5.300","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1419-p-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1419 P 4x2','public/assets/documents/modelos/mercedes-atego-1419-p-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1419-p-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','14.300 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','23.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,88 5,77 4,78* 4,78* 3,91* 4,30* 5,22*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540 4740 5.300',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e56e1518-b7f8-4a10-825f-c54c539059a0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1419-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1419 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1719 BEB 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1719 BEB 4x2','atego-1719-beb-4x2','O anda-e-para e a elevada carga inicial característicos da distribuição de bebidas nas cidades, exigem um caminhão ágil, robusto, com grande capacidade de carga e que ainda ofereça conforto para os ocupantes nas longas jornadas diárias de trabalho. O Atego 1719 BEB (bebidas), versão especialmente desenvolvida para este severo trabalho, além de atender plenamente todas essas exigências, já vem equipado com diversos itens originais de fábrica, que facilitam e reduzem o custo da instalação da carroçaria rebaixada, normalmente utilizada nesse serviço. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','185 cv (136 kW) @ 2200 rpm','700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 90-6 MB G 140-8 PowerShift 3 Advanced','17.100 kg','27.000 kg','4,88 / 5,57* 5,22* /4,78* 4,30* / 3,91*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3590","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-beb-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1719-beb-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1719 BEB 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O anda-e-para e a elevada carga inicial característicos da distribuição de bebidas nas cidades, exigem um caminhão ágil, robusto, com grande capacidade de carga e que ainda ofereça conforto para os ocupantes nas longas jornadas diárias de trabalho. O Atego 1719 BEB (bebidas), versão especialmente desenvolvida para este severo trabalho, além de atender plenamente todas essas exigências, já vem equipado com diversos itens originais de fábrica, que facilitam e reduzem o custo da instalação da carroçaria rebaixada, normalmente utilizada nesse serviço. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 90-6 MB G 140-8 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,88 / 5,57* 5,22* /4,78* 4,30* / 3,91*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3590","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-beb-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1719 BEB 4x2','public/assets/documents/modelos/mercedes-atego-1719-beb-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-beb-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,88 / 5,57* 5,22* /4,78* 4,30* / 3,91*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3590',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/13bcfa94-5c1b-40cc-9893-b52f3a46441c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-beb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 BEB 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1719 K 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1719 K 4x2','atego-1719-k-4x2','A movimentação de materiais e insumos como pedra e areia e a remoção de material escavado nas pequenas obras da construção civil, requerem um caminhão compacto, robusto, com boa capacidade de carga e ágil no complicado trânsito urbano das cidades. O Atego 1719 K (basculante), vem configurado originalmente para operar como basculante, o que facilita muito a implementação e o capacita a atender a operação com resistência e economia. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','185 cv (136 kW) @ 2200 rpm','700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 90-6 MB G 140-8* PowerShift 3 Advanced','17.100 kg','27.000 kg','4,88 / 5,57* 4,78 / 3,91* 4,30* / 5,22*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-k-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1719-k-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1719 K 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'A movimentação de materiais e insumos como pedra e areia e a remoção de material escavado nas pequenas obras da construção civil, requerem um caminhão compacto, robusto, com boa capacidade de carga e ágil no complicado trânsito urbano das cidades. O Atego 1719 K (basculante), vem configurado originalmente para operar como basculante, o que facilita muito a implementação e o capacita a atender a operação com resistência e economia. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 90-6 MB G 140-8* PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,88 / 5,57* 4,78 / 3,91* 4,30* / 5,22*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-k-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1719 K 4x2','public/assets/documents/modelos/mercedes-atego-1719-k-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-k-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,88 / 5,57* 4,78 / 3,91* 4,30* / 5,22*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0cb48595-0093-4592-b842-0c9c1cbd9a88','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1719 P 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1719 P 4x2','atego-1719-p-4x2','Versatilidade na distribuição urbana, intercidades e apoio na agricultura ou construção','MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','185 cv (136 kW) @ 2200 rpm','700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 90-6 MB G 140-8* PowerShift 3 Advanced','17.100 kg','27.000 kg','4,88 /6,85 5,77 /7,60* 4,78 4,30* 3,91* 5,22*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540 4100 4740 5300","cmt":"27.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-p-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1719-p-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1719 P 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Versatilidade na distribuição urbana, intercidades e apoio na agricultura ou construção'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6 • 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 90-6 MB G 140-8* PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,88 /6,85 5,77 /7,60* 4,78 4,30* 3,91* 5,22*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540 4100 4740 5300","cmt":"27.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-p-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1719 P 4x2','public/assets/documents/modelos/mercedes-atego-1719-p-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1719-p-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,88 /6,85 5,77 /7,60* 4,78 4,30* 3,91* 5,22*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540 4100 4740 5300',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/611b7e05-dcee-4f54-a13a-e5d1e7ba7576','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1719-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1719 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1726 K 4X2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1726 K 4X2','atego-1726-k-4x2','Vocacionado para os serviços de basculante, sua potente motorização proporciona ótimo desempenho e muita agilidade na cidade e curtos trajetos de estrada, sem abrir mão de resistência e capacidade de carga. O Atego 1726 K (basculante), vem equipado originalmente com itens que facilitam a implementação e o capacitam a atender qualquer tipo de operação basculante com agilidade e economia. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','260 cv (191 kW) @ 2200 rpm','900 Nm (91,8 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 90-6 MB G 140-8* PowerShift 3 Advanced','1.100 kg','33.000 kg','4,88 / 5,57* 4,78 / 3,91* 4,30* / 5,22*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1726-k-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1726-k-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1726 K 4X2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Vocacionado para os serviços de basculante, sua potente motorização proporciona ótimo desempenho e muita agilidade na cidade e curtos trajetos de estrada, sem abrir mão de resistência e capacidade de carga. O Atego 1726 K (basculante), vem equipado originalmente com itens que facilitam a implementação e o capacitam a atender qualquer tipo de operação basculante com agilidade e economia. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'260 cv (191 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'900 Nm (91,8 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 90-6 MB G 140-8* PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'1.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'33.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,88 / 5,57* 4,78 / 3,91* 4,30* / 5,22*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1726-k-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1726 K 4X2','public/assets/documents/modelos/mercedes-atego-1726-k-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1726-k-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','1.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','33.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,88 / 5,57* 4,78 / 3,91* 4,30* / 5,22*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4X2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6d1e9352-a88b-4950-a5ae-978cec870ba5','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 K 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1726 P 4X2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1726 P 4X2','atego-1726-p-4x2','O transportador que prioriza entregas rápidas na cidade e desempenho em curtos trajetos de estrada, sabe que um caminhão mais forte faz diferença. Conforto, força e produtividade superiores são os diferenciais do Atego 1726. Em sua versão P (plataforma) oferece ampla possibilidade de combinações de cabinas e distâncias entre-eixos, permitindo atender uma extensa e variada gama de aplicações, que podem ir de uma simples carroçaria aberta carga seca até um furgão frigorífico, sempre proporcionando excelente produtividade no trabalho. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','260 cv (191 kW) @ 2200 rpm','900 Nm (91,8 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 90-6 MB G 140-8* PowerShift 3 Advanced','17.100 kg','27.000 kg','4,88 / 5,57* 4,78 / 4,30* / 3,91* / 5,22*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3600 4160 4800 5360","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1726-p-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1726-p-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1726 P 4X2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O transportador que prioriza entregas rápidas na cidade e desempenho em curtos trajetos de estrada, sabe que um caminhão mais forte faz diferença. Conforto, força e produtividade superiores são os diferenciais do Atego 1726. Em sua versão P (plataforma) oferece ampla possibilidade de combinações de cabinas e distâncias entre-eixos, permitindo atender uma extensa e variada gama de aplicações, que podem ir de uma simples carroçaria aberta carga seca até um furgão frigorífico, sempre proporcionando excelente produtividade no trabalho. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'260 cv (191 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'900 Nm (91,8 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 90-6 MB G 140-8* PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,88 / 5,57* 4,78 / 4,30* / 3,91* / 5,22*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3600 4160 4800 5360","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1726-p-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1726 P 4X2','public/assets/documents/modelos/mercedes-atego-1726-p-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1726-p-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,88 / 5,57* 4,78 / 4,30* / 3,91* / 5,22*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3600 4160 4800 5360',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4X2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6c299880-5b6e-4d2f-8e95-360c55a62876','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1726-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1726 P 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1729 KO 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1729 KO 4x2','atego-1729-ko-4x2','Desenvolvido especialmente para o serviço de coleta de resíduos, o Atego 1729 KO (coletor) traz características técnicas exclusivas que, além de facilitar a instalação do implemento coletor/compactador, o tornam apto a atender com folga os severos requisitos operacionais desse serviço, especialmente nos terrenos acidentados e mal pavimentados da periferia das grandes cidades. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 lts. • 6 cil. em linha • PROCONVE P8 (Euro 6)','286 cv (210 kW) @ 2.200 rpm','1.100 Nm (112 mkgf) @ 1.200 - 1.600 rpm Tomada de força No volante do motor','Allison 3000 - 6','17.100 kg','27.000 kg','6,83','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.850 4.740","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1729-ko-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1729-ko-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1729 KO 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido especialmente para o serviço de coleta de resíduos, o Atego 1729 KO (coletor) traz características técnicas exclusivas que, além de facilitar a instalação do implemento coletor/compactador, o tornam apto a atender com folga os severos requisitos operacionais desse serviço, especialmente nos terrenos acidentados e mal pavimentados da periferia das grandes cidades. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 lts. • 6 cil. em linha • PROCONVE P8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.100 Nm (112 mkgf) @ 1.200 - 1.600 rpm Tomada de força No volante do motor'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Allison 3000 - 6'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'6,83'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.850 4.740","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1729-ko-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1729 KO 4x2','public/assets/documents/modelos/mercedes-atego-1729-ko-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1729-ko-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','6,83',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3.850 4.740',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/542e1330-deba-4edf-9024-0101d4c49402','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1729-ko-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1729 KO 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1733 BOMB 4X2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1733 BOMB 4X2','atego-1733-bomb-4x2','Desenvolvido exclusivamente para o serviço de combate a incêndio, o Atego 1733 BOMB (bombeiro) traz tudo que essa exigente operação necessita. Características exclusivas fazem dele a solução perfeita para enfrentar os desafios dessa importante atividade. Fruto da extensa experiência da Mercedes-Benz no segmento e de sua vocação histórica de atender todos os segmentos do mercado, mesmo os mais especializados. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','Allison S 3000 - 6','17.100 kg','27.000 kg','4,30 (43:10)','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4740","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-bomb-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido exclusivamente para o serviço de combate a incêndio, o Atego 1733 BOMB (bombeiro) traz tudo que essa exigente operação necessita. Características exclusivas fazem dele a solução perfeita para enfrentar os desafios dessa importante atividade. Fruto da extensa experiência da Mercedes-Benz no segmento e de sua vocação histórica de atender todos os segmentos do mercado, mesmo os mais especializados. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Allison S 3000 - 6'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30 (43:10)'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4740","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-bomb-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1733 BOMB 4X2','public/assets/documents/modelos/mercedes-atego-1733-bomb-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-bomb-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30 (43:10)',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4740',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4X2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bd750201-0bc1-4c81-afd8-c0c66a99b0b2','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-bomb-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 BOMB 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1733 K 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1733 K 4x2','atego-1733-k-4x2','Especialmente desenvolvido para os serviços de basculante na construção civil. O Atego 1733 K (basculante) conta com potencia extra que proporciona grande capacidade de vencer rampas íngremes, muito comuns em canteiros de obra, bem como agilidade excepcional em curtos trajetos de estrada. Vem equipado de fábrica com itens facilitam a implementação e o capacitam a atender qualquer tipo de operação basculante com desempenho e economia. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2.200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 211-12 PowerShift 3 Advanced','11.000 kg','36.000 kg','4,30 (43:10) 3,91(43:11)','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-k-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1733-k-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1733 K 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Especialmente desenvolvido para os serviços de basculante na construção civil. O Atego 1733 K (basculante) conta com potencia extra que proporciona grande capacidade de vencer rampas íngremes, muito comuns em canteiros de obra, bem como agilidade excepcional em curtos trajetos de estrada. Vem equipado de fábrica com itens facilitam a implementação e o capacitam a atender qualquer tipo de operação basculante com desempenho e economia. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'11.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'36.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30 (43:10) 3,91(43:11)'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-k-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1733 K 4x2','public/assets/documents/modelos/mercedes-atego-1733-k-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-k-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','11.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','36.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30 (43:10) 3,91(43:11)',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/97497215-ed26-40b4-8715-1f113701d75d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-k-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 K 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1733 P 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1733 P 4x2','atego-1733-p-4x2','Desempenho nos trechos rodoviários de média distância ou com topografia acidentada','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 211-12 PowerShift 3 Advanced','17.100 kg','36.000 kg','3,91(43:11) / 4,30(43:10)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540 4100 4740 5300","cmt":"36.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-p-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1733-p-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1733 P 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desempenho nos trechos rodoviários de média distância ou com topografia acidentada'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'36.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,91(43:11) / 4,30(43:10)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540 4100 4740 5300","cmt":"36.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-p-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1733 P 4x2','public/assets/documents/modelos/mercedes-atego-1733-p-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1733-p-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','36.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','36.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,91(43:11) / 4,30(43:10)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540 4100 4740 5300',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6f472e7d-3866-469f-b6f2-5a4fcbe3047f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1733-p-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1733 P 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 1933 LS 4X2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 1933 LS 4X2','atego-1933-ls-4x2','Perfeito para o transporte rodoviário de cargas leves e volumosas em curtas e médias distâncias','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*','MB G 211-12 PowerShift 3 Advanced','18.000 kg',NULL,'3,58 (43:12) 3,91 (43:11)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1933-ls-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-1933-ls-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 1933 LS 4X2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Perfeito para o transporte rodoviário de cargas leves e volumosas em curtas e médias distâncias'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'18.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,58 (43:12) 3,91 (43:11)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4X2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1933-ls-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 1933 LS 4X2','public/assets/documents/modelos/mercedes-atego-1933-ls-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/1933-ls-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','18.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,58 (43:12) 3,91 (43:11)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4X2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3adbb4ba-2867-4849-ae57-b1beb625d87d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-1933-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 1933 LS 4X2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2429 K 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2429 K 6x2','atego-2429-k-6x2','Versão especialmente vocacionada para os serviços de basculante, o Atego 2429 K (basculante) é o 6x2 (trucado) original de fábrica, ideal para o transportador que precisa de capacidade de carga e robustez no transporte de materiais e insumos para construção civil na cidade e trechos intermunicipais de curta distância. Configurado de fábrica com características técnicas que facilitam a implementação e o tornam apto para a atender qualquer tipo de operação basculante com robustez e economia. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 140-8 PowerShift 3 Advanced','24.100 kg','27.000 kg','4,78 (43:9) 4,30 (43:10)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2429-k-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2429-k-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2429 K 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Versão especialmente vocacionada para os serviços de basculante, o Atego 2429 K (basculante) é o 6x2 (trucado) original de fábrica, ideal para o transportador que precisa de capacidade de carga e robustez no transporte de materiais e insumos para construção civil na cidade e trechos intermunicipais de curta distância. Configurado de fábrica com características técnicas que facilitam a implementação e o tornam apto para a atender qualquer tipo de operação basculante com robustez e economia. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 140-8 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'24.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78 (43:9) 4,30 (43:10)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2429-k-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2429 K 6x2','public/assets/documents/modelos/mercedes-atego-2429-k-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2429-k-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','24.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78 (43:9) 4,30 (43:10)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540+1250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4dd85d31-fad2-4096-8feb-530f181a888b','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2429 P 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2429 P 6x2','atego-2429-p-6x2','Eficiência e economia no transporte intermunicipal e rodoviário de média distância.','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 kgfm) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 140-8 PowerShift 3 Advanced','24.100 kg','27.000 kg','4,78 (43:9) 4,30 (43:10)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3600+1250 4800+1250 5360+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2429-p-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2429-p-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2429 P 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Eficiência e economia no transporte intermunicipal e rodoviário de média distância.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 kgfm) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 140-8 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'24.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'27.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78 (43:9) 4,30 (43:10)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3600+1250 4800+1250 5360+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2429-p-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2429 P 6x2','public/assets/documents/modelos/mercedes-atego-2429-p-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2429-p-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','24.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','27.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78 (43:9) 4,30 (43:10)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3600+1250 4800+1250 5360+1250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0fd54076-6bdd-4350-a9cc-4fa6c6022460','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2429-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2429 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2433 K 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2433 K 6x2','atego-2433-k-6x2','Especialmente desenvolvido para os trabalhos de basculante, o Atego 2433 K (basculante) é o 6x2 (trucado) original de fábrica, ideal para o transportador que precisa de capacidade de carga e rapidez no transporte de materiais e insumos para construção civil na cidade e trechos intermunicipais de curta distância. Original de fábrica em configuração que facilita a implementação e o torna apto a atender todo tipo de operação basculante com rapidez, robustez e economia. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 211-12 PowerShift 3 Advanced','24.100 kg','36.000 kg','3,58 (43:12) 3,91(43:9)* 4,30 (43:10)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2433-k-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2433-k-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2433 K 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Especialmente desenvolvido para os trabalhos de basculante, o Atego 2433 K (basculante) é o 6x2 (trucado) original de fábrica, ideal para o transportador que precisa de capacidade de carga e rapidez no transporte de materiais e insumos para construção civil na cidade e trechos intermunicipais de curta distância. Original de fábrica em configuração que facilita a implementação e o torna apto a atender todo tipo de operação basculante com rapidez, robustez e economia. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'24.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'36.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,58 (43:12) 3,91(43:9)* 4,30 (43:10)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2433-k-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2433 K 6x2','public/assets/documents/modelos/mercedes-atego-2433-k-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2433-k-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','24.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','36.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,58 (43:12) 3,91(43:9)* 4,30 (43:10)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540+1250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/3cf07e8b-77e1-4923-88de-49246d0c19a3','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-k-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 K 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2433 P 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2433 P 6x2','atego-2433-p-6x2','Produtividade nas operações expressas em trajetos rodoviários de média e longa distância','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 211-12 PowerShift 3 Advanced','24.100 kg','36.000 kg','3,58 /3,31 /3,91* /4,30*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3600+1250 4800+1250 5360+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2433-p-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2433-p-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2433 P 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Produtividade nas operações expressas em trajetos rodoviários de média e longa distância'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'24.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'36.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,58 /3,31 /3,91* /4,30*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3600+1250 4800+1250 5360+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2433-p-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2433 P 6x2','public/assets/documents/modelos/mercedes-atego-2433-p-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2433-p-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','24.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','36.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,58 /3,31 /3,91* /4,30*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3600+1250 4800+1250 5360+1250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/b64d8ba2-425b-41f5-8a12-a5cf1a7444ac','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2433-p-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2433 P 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2730 B 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2730 B 6x4','atego-2730-b-6x4','Para o nível de eficiência e confiabilidade que o transporte de concreto exige, não há melhor opção que o Atego 2730 B (betoneira), especialmente concebido para esse tipo de operação, em qualquer tipo de obra. Já vem equipado de fábrica com itens, tais como tomada de forca no motor, embreagem superdimensionada, escape vertical, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de trazer grande facilidade na instalação da betoneira, ainda proporcionam elevada eficiência operacional. Atego 2730 B, robustez e disponibilidade a toda prova. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor','MB G 211-12 PowerShift 3 Advancedf','26.600 kg',NULL,'4,78 4,30*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-b-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2730-b-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2730 B 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para o nível de eficiência e confiabilidade que o transporte de concreto exige, não há melhor opção que o Atego 2730 B (betoneira), especialmente concebido para esse tipo de operação, em qualquer tipo de obra. Já vem equipado de fábrica com itens, tais como tomada de forca no motor, embreagem superdimensionada, escape vertical, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de trazer grande facilidade na instalação da betoneira, ainda proporcionam elevada eficiência operacional. Atego 2730 B, robustez e disponibilidade a toda prova. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'26.600 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78 4,30*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3540+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-b-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2730 B 6x4','public/assets/documents/modelos/mercedes-atego-2730-b-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-b-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','26.600 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78 4,30*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3540+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/2742e029-e333-4025-9fb5-df54eacffc3a','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-b-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 B 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2730 K 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2730 K 6x4','atego-2730-k-6x4','Desenvolvido para os trabalhos de basculante nas condições mais difíceis da construção civil, o Atego 2730 K (basculante) é ideal para o transportador que precisa de capacidade de carga otimizada, grande mobilidade e capacidade de acesso a qualquer tipo de obra. Já vem equipado de fábrica com itens, tais como tomada de forca no câmbio, embreagem superdimensionada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que facilitam a montagem da báscula e o tornam apto a atender todo tipo de operação basculante com mobilidade, robustez e disponibilidade. Atego 2730 K, pronto para qualquer condição de trabalho. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*','MB G 211-12 PowerShift 3 Advancedf','26.600 kg',NULL,'4,78','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.540+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-k-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2730-k-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2730 K 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido para os trabalhos de basculante nas condições mais difíceis da construção civil, o Atego 2730 K (basculante) é ideal para o transportador que precisa de capacidade de carga otimizada, grande mobilidade e capacidade de acesso a qualquer tipo de obra. Já vem equipado de fábrica com itens, tais como tomada de forca no câmbio, embreagem superdimensionada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que facilitam a montagem da báscula e o tornam apto a atender todo tipo de operação basculante com mobilidade, robustez e disponibilidade. Atego 2730 K, pronto para qualquer condição de trabalho. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'26.600 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3.540+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-k-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2730 K 6x4','public/assets/documents/modelos/mercedes-atego-2730-k-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-k-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','26.600 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3.540+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/8213c139-086c-4c03-a0fd-7f704eef7e1d','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-k-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 K 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 2730 P 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 2730 P 6x4','atego-2730-p-6x4','Para operações severas na construção civil, agropecuária e operações de apoio fora de estrada em geral, o Atego 2730 P (plataforma) é o caminhão mais indicado. Com grande plataforma de carga e robusto trem de força Mercedes-Benz, atende com folga aos mais exigentes requisitos dessas duras operações, como tanque d''água, comboio de lubrificação, caminhão oficina, entre outros. Originalmente equipado com itens desenvolvidos para o trabalho em situações difíceis, tais como embreagem superdimensionada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter. Atego 2730 P, robustez e durabilidade característicos da marca. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor *','MB G 211-12 PowerShift 3 Advancedf','26.600 kg',NULL,'4,78 4,30*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4740+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-p-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-2730-p-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 2730 P 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para operações severas na construção civil, agropecuária e operações de apoio fora de estrada em geral, o Atego 2730 P (plataforma) é o caminhão mais indicado. Com grande plataforma de carga e robusto trem de força Mercedes-Benz, atende com folga aos mais exigentes requisitos dessas duras operações, como tanque d''água, comboio de lubrificação, caminhão oficina, entre outros. Originalmente equipado com itens desenvolvidos para o trabalho em situações difíceis, tais como embreagem superdimensionada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter. Atego 2730 P, robustez e durabilidade característicos da marca. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor *'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'26.600 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78 4,30*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4740+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-p-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 2730 P 6x4','public/assets/documents/modelos/mercedes-atego-2730-p-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/2730-p-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','26.600 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78 4,30*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4740+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7114e388-06aa-43a3-ad29-9a24f592d96c','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-2730-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 2730 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 3033 P 8x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 3033 P 8x2','atego-3033-p-8x2','Com segundo eixo dianteiro direcional original de fábrica e potente motorização, o Atego 3033 P (plataforma) é o caminhão ideal para o transportador que necessita capacidade de carga adicional, alta velocidade média e eficiência em suas operações. Também indicado para operações em trajetos mais pesados que incluam serras e trechos íngremes. O Atego 3033 pode receber os mais variados implementos, desde uma simples carroçaria aberta carga seca até um tanque de combustível ou um furgão frigorífico. Atego 3033, 8x2 original de fábrica, potente, robusto e confiável. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*','MB G 211-12 PowerShift 3 Advanced','30.200 kg','36.000 kg','3,58(43:12) / 3,91(43:11)* / 4,30(43:10)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2350+3010+12502350+3010+12502350+3950+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3033-p-8x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-3033-p-8x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 3033 P 8x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com segundo eixo dianteiro direcional original de fábrica e potente motorização, o Atego 3033 P (plataforma) é o caminhão ideal para o transportador que necessita capacidade de carga adicional, alta velocidade média e eficiência em suas operações. Também indicado para operações em trajetos mais pesados que incluam serras e trechos íngremes. O Atego 3033 pode receber os mais variados implementos, desde uma simples carroçaria aberta carga seca até um tanque de combustível ou um furgão frigorífico. Atego 3033, 8x2 original de fábrica, potente, robusto e confiável. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6• 7,2 L. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advanced'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.200 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'36.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'3,58(43:12) / 3,91(43:11)* / 4,30(43:10)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2350+3010+12502350+3010+12502350+3950+1250","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3033-p-8x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 3033 P 8x2','public/assets/documents/modelos/mercedes-atego-3033-p-8x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3033-p-8x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.200 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','36.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','3,58(43:12) / 3,91(43:11)* / 4,30(43:10)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','2350+3010+12502350+3010+12502350+3950+1250',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','8x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7f34e964-0881-49bd-a566-c12bf6c76cf7','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3033-p-8x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3033 P 8x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 3133 P 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 3133 P 6x4','atego-3133-p-6x4','Operações pesadas e severas na construção civil, agropecuária e apoio fora de estrada, requerem um caminhão forte, resistente, de fácil manutenção e que proporcione alta disponibilidade, trabalhando ininterruptamente com o mínimo possível de paradas. O Atego 3133 P (plataforma), com seu robusto trem de força Mercedes-Benz, que conta inclusive com os consagrados eixos traseiros MB com redução nos cubos, está apto a trabalhar com eficiência inigualável nas mais difíceis operações, como bomba de concreto, tanque d''água, combate a incêndio na agricultura, tanque espargidor de água na mineração e construção, basculante e betoneira, entre outros. Equipado originalmente com itens desenvolvidos para o trabalho severo, tais como para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter. Atego 3133, robustez, resistência e disponibilidade. E ainda conta com o renovado visual da linha Atego.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*','MB G 211-12 PowerShift 3 Advancedf','30.500 kg','56.000 kg','5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4800+1350","cmt":"56.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3133-p-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-3133-p-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 3133 P 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Operações pesadas e severas na construção civil, agropecuária e apoio fora de estrada, requerem um caminhão forte, resistente, de fácil manutenção e que proporcione alta disponibilidade, trabalhando ininterruptamente com o mínimo possível de paradas. O Atego 3133 P (plataforma), com seu robusto trem de força Mercedes-Benz, que conta inclusive com os consagrados eixos traseiros MB com redução nos cubos, está apto a trabalhar com eficiência inigualável nas mais difíceis operações, como bomba de concreto, tanque d''água, combate a incêndio na agricultura, tanque espargidor de água na mineração e construção, basculante e betoneira, entre outros. Equipado originalmente com itens desenvolvidos para o trabalho severo, tais como para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter. Atego 3133, robustez, resistência e disponibilidade. E ainda conta com o renovado visual da linha Atego.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'56.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4800+1350","cmt":"56.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3133-p-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 3133 P 6x4','public/assets/documents/modelos/mercedes-atego-3133-p-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3133-p-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.500 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','56.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','56.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4800+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/33635741-eeb2-40ec-aeb8-deabd7b2d4db','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3133-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3133 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 3330 B 8x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 3330 B 8x4','atego-3330-b-8x4','Para movimentação de grandes volumes de concreto em obras de maior porte ou em obras de infraestrutura, o Atego 3330 8x4 B (betoneira) é o caminhão ideal. Com segundo eixo direcional dianteiro original de fábrica e robusto trem de força Mercedes-Benz, atende plenamente as operações que precisam resistência, robustez e elevada capacidade de carga. Especialmente vocacionado para o trabalho como betoneira, o Atego 3330 B já vem equipado originalmente com itens desenvolvidos para enfrentar as condições adversas dos canteiros de obra, tais como tomada de forca no motor, embreagem superdimensionada, escape vertical, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de trazer grande facilidade na instalação da betoneira, ainda proporcionam elevada eficiência operacional. Atego 3330 B, robustez, alta capacidade de carga e durabilidade. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor','MB G 211-12 PowerShift 3 Advancedf','32.700 kg',NULL,'4,78 4,30*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2350+2250+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-b-8x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-3330-b-8x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 3330 B 8x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para movimentação de grandes volumes de concreto em obras de maior porte ou em obras de infraestrutura, o Atego 3330 8x4 B (betoneira) é o caminhão ideal. Com segundo eixo direcional dianteiro original de fábrica e robusto trem de força Mercedes-Benz, atende plenamente as operações que precisam resistência, robustez e elevada capacidade de carga. Especialmente vocacionado para o trabalho como betoneira, o Atego 3330 B já vem equipado originalmente com itens desenvolvidos para enfrentar as condições adversas dos canteiros de obra, tais como tomada de forca no motor, embreagem superdimensionada, escape vertical, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de trazer grande facilidade na instalação da betoneira, ainda proporcionam elevada eficiência operacional. Atego 3330 B, robustez, alta capacidade de carga e durabilidade. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de força No volante do motor'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'32.700 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78 4,30*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2350+2250+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-b-8x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 3330 B 8x4','public/assets/documents/modelos/mercedes-atego-3330-b-8x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-b-8x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','32.700 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78 4,30*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','2350+2250+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','8x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/7c95b833-aa08-462e-938d-e3e92f93c3ef','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-b-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 B 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 3330 K 8x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 3330 K 8x4','atego-3330-k-8x4','Para transporte de grandes volumes de materiais nas obras de maior porte ou em obras de infraestrutura, o Atego 3330 8x4 K (basculante) é o caminhão mais indicado. Com segundo eixo direcional dianteiro original de fábrica e robusto trem de força Mercedes-Benz, atende plenamente as operações que precisam resistência, robustez e elevada capacidade de carga. Especialmente vocacionado para o trabalho como basculante, o Atego 3330 K já vem equipado originalmente com itens desenvolvidos para enfrentar as severas condições dos canteiros de obra, tais como tomada de forca no câmbio, embreagem superdimensionada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação da báscula, ainda proporcionam elevada eficiência operacional. Atego 3330 K, robustez, alta capacidade de carga e durabilidade. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 lts. • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2.200 rpm','1.100 Nm (112,2 mkgf) @ 1.200 - 1.600 rpm Tomada de Força No volante do motor *','MB G 211-12 PowerShift 3 Advancedf','32.700 kg',NULL,'4,30','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2.350+2.250+1.350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-k-8x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-3330-k-8x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 3330 K 8x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para transporte de grandes volumes de materiais nas obras de maior porte ou em obras de infraestrutura, o Atego 3330 8x4 K (basculante) é o caminhão mais indicado. Com segundo eixo direcional dianteiro original de fábrica e robusto trem de força Mercedes-Benz, atende plenamente as operações que precisam resistência, robustez e elevada capacidade de carga. Especialmente vocacionado para o trabalho como basculante, o Atego 3330 K já vem equipado originalmente com itens desenvolvidos para enfrentar as severas condições dos canteiros de obra, tais como tomada de forca no câmbio, embreagem superdimensionada, para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter, que além de facilitar a instalação da báscula, ainda proporcionam elevada eficiência operacional. Atego 3330 K, robustez, alta capacidade de carga e durabilidade. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 lts. • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.100 Nm (112,2 mkgf) @ 1.200 - 1.600 rpm Tomada de Força No volante do motor *'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'32.700 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2.350+2.250+1.350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-k-8x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 3330 K 8x4','public/assets/documents/modelos/mercedes-atego-3330-k-8x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-k-8x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','32.700 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','2.350+2.250+1.350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','8x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/38887342-a8d7-46bc-8e87-5cc8d8913f50','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-k-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 K 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 3330 P 8x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 3330 P 8x4','atego-3330-p-8x4','Para aplicações severas na construção civil, agropecuária e apoio fora de estrada, que precisam de capacidade de carga adicional, o Atego 3330 8x4 P (plataforma) é o caminhão ideal. Com segundo eixo direcional dianteiro original de fábrica e robusto trem de força Mercedes-Benz, atende plenamente as operações que precisam resistência, robustez e elevada capacidade de carga, tais como tanque d''água, silo distribuidor de ração animal, entre outras. Vem originalmente equipado com itens desenvolvidos para o trabalho em terrenos acidentados, tais como para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter. Atego 3330 P, robustez, alta capacidade de carga e durabilidade. Com visual renovado, muito mais bonito, moderno e funcional.','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','286 cv (210 kW) @ 2200 rpm','1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*','MB G 211-12 PowerShift 3 Advancedf','32.700 kg',NULL,'4,78 4,30*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2350+3010+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-p-8x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-3330-p-8x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 3330 P 8x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Para aplicações severas na construção civil, agropecuária e apoio fora de estrada, que precisam de capacidade de carga adicional, o Atego 3330 8x4 P (plataforma) é o caminhão ideal. Com segundo eixo direcional dianteiro original de fábrica e robusto trem de força Mercedes-Benz, atende plenamente as operações que precisam resistência, robustez e elevada capacidade de carga, tais como tanque d''água, silo distribuidor de ração animal, entre outras. Vem originalmente equipado com itens desenvolvidos para o trabalho em terrenos acidentados, tais como para-choque alto com grande ângulo de entrada, grade protetora de faróis e protetor de radiador e cárter. Atego 3330 P, robustez, alta capacidade de carga e durabilidade. Com visual renovado, muito mais bonito, moderno e funcional.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1100 Nm (112,2 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'32.700 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,78 4,30*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"2350+3010+1350","cmt":"45.100 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-p-8x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 3330 P 8x4','public/assets/documents/modelos/mercedes-atego-3330-p-8x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3330-p-8x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','32.700 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','45.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,78 4,30*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','2350+3010+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','8x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a816e0a8-10f4-40dc-8f5f-c18880171725','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3330-p-8x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3330 P 8x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Atego 3433 P 6x4
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Atego 3433 P 6x4','atego-3433-p-6x4','O Atego 3433 P é destinado a operações severas fora de estrada que exigem capacidade de carga adicional, elevada robustez estrutural, desempenho operacional e disponibilidade. O modelo conta com eixos de maior capacidade e suspensão reforçada, além do consagrado trem de força Mercedes-Benz, retarder e componentes voltados ao uso intenso, como para-choque alto com amplo ângulo de entrada, grade de proteção dos faróis e proteções para radiador e cárter, tudo para aumentar a durabilidade e disponibilidade em ambientes de alta exigência. Sua versatilidade permite adequação a diferentes implementos, tais como bomba de concreto, tanque d’água, tanque combate a incêndio agrícola, tanque espargidor de água, basculante e betoneira, entre outros. Com projeto orientado à durabilidade, atende plenamente as demandas de segmentos como agricultura, construção civil, mineração e apoio operacional em terrenos irregulares. Atego 3433, uma solução desenvolvida para quem busca produtividade, disponibilida','MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','321 cv (236 kW) @ 2200 rpm','1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*','MB G 211-12 PowerShift 3 Advancedf','33.500 kg','56.000 kg','5,33(28:21','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4800+1350","cmt":"56.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3433-p-6x4","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Atego'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='atego-3433-p-6x4' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Atego 3433 P 6x4'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O Atego 3433 P é destinado a operações severas fora de estrada que exigem capacidade de carga adicional, elevada robustez estrutural, desempenho operacional e disponibilidade. O modelo conta com eixos de maior capacidade e suspensão reforçada, além do consagrado trem de força Mercedes-Benz, retarder e componentes voltados ao uso intenso, como para-choque alto com amplo ângulo de entrada, grade de proteção dos faróis e proteções para radiador e cárter, tudo para aumentar a durabilidade e disponibilidade em ambientes de alta exigência. Sua versatilidade permite adequação a diferentes implementos, tais como bomba de concreto, tanque d’água, tanque combate a incêndio agrícola, tanque espargidor de água, basculante e betoneira, entre outros. Com projeto orientado à durabilidade, atende plenamente as demandas de segmentos como agricultura, construção civil, mineração e apoio operacional em terrenos irregulares. Atego 3433, uma solução desenvolvida para quem busca produtividade, disponibilida'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA • BlueTec 6 • 7,2 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'321 cv (236 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1250 Nm (127,5 mkgf) @ 1200 - 1600 rpm Tomada de Força No volante do motor*'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 211-12 PowerShift 3 Advancedf'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'33.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'56.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,33(28:21'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x4","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4800+1350","cmt":"56.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3433-p-6x4","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Atego 3433 P 6x4','public/assets/documents/modelos/mercedes-atego-3433-p-6x4-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','https://www.mercedes-benz-trucks.com.br/caminhoes/atego/3433-p-6x4',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','33.500 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','56.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','56.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,33(28:21',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4800+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x4',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/40937f3c-f989-45c9-ab1d-703ddd4900f8','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='atego-3433-p-6x4' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Atego 3433 P 6x4')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Axor 2038 LS 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Axor 2038 LS 4x2','axor-2038-ls-4x2','Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2038 LS, cavalo mecânico 4x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 381 cv/1.900 Nme suspensão traseira pneumática que assegura conforto para o condutor e preservação da carga. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, furgão lonado tipo sider, tanque de combustível e cegonheiro, entre outros. Axor, agora em sua melhor versão.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','381 cv (280 kW) @ 1600 rpm','1900 Nm (193,7 kgfm) @ 1100 rpm','MB G 291-12 PowerShift 3 Advancd','20.100 kg',NULL,'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3551","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2038-ls-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Axor'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='axor-2038-ls-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Axor 2038 LS 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2038 LS, cavalo mecânico 4x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 381 cv/1.900 Nme suspensão traseira pneumática que assegura conforto para o condutor e preservação da carga. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, furgão lonado tipo sider, tanque de combustível e cegonheiro, entre outros. Axor, agora em sua melhor versão.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1900 Nm (193,7 kgfm) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 PowerShift 3 Advancd'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3551","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2038-ls-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Axor 2038 LS 4x2','public/assets/documents/modelos/mercedes-axor-2038-ls-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2038-ls-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3551',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/f80b9160-7e49-4a81-8367-2840e832c16f','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-ls-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 LS 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Axor 2038 S 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Axor 2038 S 4x2','axor-2038-s-4x2','Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2038 S, cavalo mecânico 4x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 380 cv/1.900 Nm de torque e suspensão traseira metálica, assegurando simplicidade e baixa demanda de manutenção. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, carga seca aberta, tanque de combustível e cegonheiro, entre outros. Axor, agora em sua melhor versão.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','381 cv (280 kW) @ 1600 rpm','1900 Nm (193,7 kgfm) @ 1100 rpm','MB G 291-12 PowerShift 3 Advancd MB G 340-12 PowerShift 3 Advancd*','20.100 kg',NULL,'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*3,71 (26:24','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3552","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2038-s-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Axor'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='axor-2038-s-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Axor 2038 S 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2038 S, cavalo mecânico 4x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 380 cv/1.900 Nm de torque e suspensão traseira metálica, assegurando simplicidade e baixa demanda de manutenção. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, carga seca aberta, tanque de combustível e cegonheiro, entre outros. Axor, agora em sua melhor versão.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1900 Nm (193,7 kgfm) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 PowerShift 3 Advancd MB G 340-12 PowerShift 3 Advancd*'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*3,71 (26:24'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3552","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2038-s-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Axor 2038 S 4x2','public/assets/documents/modelos/mercedes-axor-2038-s-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2038-s-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','68.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*3,71 (26:24',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3552',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/6b20fa18-e435-486a-9eab-fdcd669efb16','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2038-s-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2038 S 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Axor 2538 LS 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Axor 2538 LS 6x2','axor-2538-ls-6x2','Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2038 LS, cavalo mecânico 4x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 381 cv/1.900 Nme suspensão traseira pneumática que assegura conforto para o condutor e preservação da carga. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, furgão lonado tipo sider, tanque de combustível e cegonheiro, entre outros. Axor, agora em sua melhor versão.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','381 cv (280 kW) @ 1600 rpm','1900 Nm (193,8 mkgf) @ 1100 rpm','MB G 291-12 PowerShift 3 Advancd','28.100 kg',NULL,'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550 +1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2538-ls-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Axor'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='axor-2538-ls-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Axor 2538 LS 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2038 LS, cavalo mecânico 4x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 381 cv/1.900 Nme suspensão traseira pneumática que assegura conforto para o condutor e preservação da carga. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como furgão de alumínio, furgão lonado tipo sider, tanque de combustível e cegonheiro, entre outros. Axor, agora em sua melhor versão.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1900 Nm (193,8 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 PowerShift 3 Advancd'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'28.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550 +1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2538-ls-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Axor 2538 LS 6x2','public/assets/documents/modelos/mercedes-axor-2538-ls-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2538-ls-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','28.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550 +1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/0d4778f4-8a16-46ee-8898-a2799175f454','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Axor 2538 S 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Axor 2538 S 6x2','axor-2538-s-6x2',NULL,'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','381 cv (280 kW) @ 1600 rpm','1900 Nm (193,7 mkgf) @ 1100 rpm','MB G 291-12 PowerShift 3 Advancd MB G 340-12 PowerShift 3 Advancd *','30.100 kg',NULL,'2,85 (37:13) / 2,73 (41:15)* / 3,08 (40:13)* 4,33 (26:24','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3553+1350","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2538-s-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Axor'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='axor-2538-s-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Axor 2538 S 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),NULL),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1900 Nm (193,7 mkgf) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 PowerShift 3 Advancd MB G 340-12 PowerShift 3 Advancd *'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 (37:13) / 2,73 (41:15)* / 3,08 (40:13)* 4,33 (26:24'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3553+1350","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2538-s-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Axor 2538 S 6x2','public/assets/documents/modelos/mercedes-axor-2538-s-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2538-s-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','68.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 (37:13) / 2,73 (41:15)* / 3,08 (40:13)* 4,33 (26:24',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3553+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/4895c249-7496-4018-a94d-38a454b919f1','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2538-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2538 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Axor 2545 LS 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Axor 2545 LS 6x2','axor-2545-ls-6x2','Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas mais densas com robustez e disponibilidade. O Axor 2545 LS, cavalo mecânico 6x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 449 cv/2.200 Nme suspensão traseira pneumática que assegura conforto para o condutor e preservação da carga. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como, furgão de alumínio, furgão lonado tipo sidere cegonheiro, entre outros. Axor, agora em sua melhor versão.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','449 cv (330 kW) @ 1600 rpm','2200 Nm (224,3 kgfm) @ 1100 rpm','MB G 291-12 PowerShift 3 Advancd','30.100 kg',NULL,'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550+1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2545-ls-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Axor'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='axor-2545-ls-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Axor 2545 LS 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas mais densas com robustez e disponibilidade. O Axor 2545 LS, cavalo mecânico 6x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 449 cv/2.200 Nme suspensão traseira pneumática que assegura conforto para o condutor e preservação da carga. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como, furgão de alumínio, furgão lonado tipo sidere cegonheiro, entre outros. Axor, agora em sua melhor versão.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'449 cv (330 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2200 Nm (224,3 kgfm) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 PowerShift 3 Advancd'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3550+1350","cmt":"62.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2545-ls-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Axor 2545 LS 6x2','public/assets/documents/modelos/mercedes-axor-2545-ls-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2545-ls-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','62.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3550+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/a9f5ed65-6780-4a9a-8934-112ce0b5f763','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-ls-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 LS 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Axor 2545 S 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Axor 2545 S 6x2','axor-2545-s-6x2','Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2545 S, cavalo mecânico 6x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 449 cv/2.200 Nm de torque e suspensão traseira metálica tipo balancim, com molas trapezoidais e suspensor pneumático no terceiro eixo auxiliar, original de fábrica, assegurando simplicidade e baixa demanda de manutenção. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como graneleiro, carga seca aberta, furgão de alumínio, furgão lonado tipo sider, basculante e cegonheiro, entre outros. Axor, agora em sua melhor versão.','MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)','449 cv (330 kW) @ 1600 rpm','2200 Nm (224,3 kgfm) @ 1100 rpm','MB G 291-12 PowerShift 3 Advancd MB G 340-12 PowerShift 3 Advancd*','30.100 kg',NULL,'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)* 4,33 (26:24','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3553+1350","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2545-s-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Axor'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='axor-2545-s-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Axor 2545 S 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com novo estilo, novo interior e novo trem de força, a linha Axor foi totalmente renovada para atender os transportadores que precisam de um caminhão confiável, simples, de fácil manutenção e baixo custo de operação para o transporte de cargas volumosas ou fracionadas com robustez e disponibilidade. O Axor 2545 S, cavalo mecânico 6x2, é equipado com o forte e robusto motor Mercedes-Benz OM 460, 13 litros, com 449 cv/2.200 Nm de torque e suspensão traseira metálica tipo balancim, com molas trapezoidais e suspensor pneumático no terceiro eixo auxiliar, original de fábrica, assegurando simplicidade e baixa demanda de manutenção. Indicado para tracionar os mais variados tipos de semirreboques de 3 eixos, tais como graneleiro, carga seca aberta, furgão de alumínio, furgão lonado tipo sider, basculante e cegonheiro, entre outros. Axor, agora em sua melhor versão.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA • BlueTec 6 • 12,8 L • 6 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'449 cv (330 kW) @ 1600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2200 Nm (224,3 kgfm) @ 1100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'MB G 291-12 PowerShift 3 Advancd MB G 340-12 PowerShift 3 Advancd*'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'30.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),NULL),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)* 4,33 (26:24'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Cavalo mecânico","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3553+1350","cmt":"68.000 kg","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2545-s-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Axor 2545 S 6x2','public/assets/documents/modelos/mercedes-axor-2545-s-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','https://www.mercedes-benz-trucks.com.br/caminhoes/axor/2545-s-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','30.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'cmt','CMT','68.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,85 (37:13 / 2,73 (41:15)* / 3,08 (40:13)* 4,33 (26:24',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3553+1350',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Cavalo mecânico',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/cdffc698-446d-4d47-8c9f-d6997dd96710','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='axor-2545-s-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Axor 2545 S 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Novo Accelo 1117 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Novo Accelo 1117 4x2','novo-accelo-1117-4x2','Modernidade e mais capacidade de carga para a coleta e entrega nos centros urbanos','MB OM 924 LA • BlueTec 6• 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','163 cv (120 kW) @ 2200 rpm','610 Nm (62,2 kgfm) @ 1200 - 1600 rpm','EATON ESO 6206 A MB G 90-6 AMT*','10.700 kg','14.000 kg','4,30 / 3,91* 4,30 / 3,91*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3100 3900 4600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/1117-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Novo Accelo'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Novo Accelo 1117 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Modernidade e mais capacidade de carga para a coleta e entrega nos centros urbanos'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6• 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) @ 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'EATON ESO 6206 A MB G 90-6 AMT*'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'10.700 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'14.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30 / 3,91* 4,30 / 3,91*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3100 3900 4600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/1117-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Novo Accelo 1117 4x2','public/assets/documents/modelos/mercedes-novo-accelo-1117-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/1117-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','10.700 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','14.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30 / 3,91* 4,30 / 3,91*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3100 3900 4600',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/698b148a-f8d0-424f-b6fb-5f60193513f0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1117-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1117 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Novo Accelo 1417 6x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Novo Accelo 1417 6x2','novo-accelo-1417-6x2','Com estilo renovado, PBT de 14 toneladas e terceiro eixo original de fábrica, o Accelo 1417 é a melhor opção para quem precisa unir grande capacidade de carga e ampla plataforma de carga, num veículo compacto e ágil. Com duas opções de cabina e duas distâncias entre-eixos, o Accelo 1417 oferece as maiores e mais baixas plataformas de carga do segmento, possibilitando a instalação de carroçarias de até 8,3?m de comprimento. Seu robusto e durável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, foi recalibrado proporcionando até 3% de redução no consumo de combustível. Pode ser equipado com o novo câmbio automatizado Mercedes-Benz PowerShift de 3ª geração com 6 marchas, que se destaca pela robustez, rapidez e melhor escalonamento, assegurando conforto e auxiliando na economia. Accelo 1417, modernidade e capacidade de carga para aumentar a produtividade.','MB OM 924 LA • BlueTec 6• 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','163 cv (120 kW) @ 2200 rpm','610 Nm (62,2 kgfm) @ 1200 - 1600 rpm','EATON ESO 6206 MB G 90-6 AMT *','13.800 kg','13.800 kg','4,30 / 3,91* 4,30 / 3,91*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3900+978 4600+978","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/1417-6x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Novo Accelo'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Novo Accelo 1417 6x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com estilo renovado, PBT de 14 toneladas e terceiro eixo original de fábrica, o Accelo 1417 é a melhor opção para quem precisa unir grande capacidade de carga e ampla plataforma de carga, num veículo compacto e ágil. Com duas opções de cabina e duas distâncias entre-eixos, o Accelo 1417 oferece as maiores e mais baixas plataformas de carga do segmento, possibilitando a instalação de carroçarias de até 8,3?m de comprimento. Seu robusto e durável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, foi recalibrado proporcionando até 3% de redução no consumo de combustível. Pode ser equipado com o novo câmbio automatizado Mercedes-Benz PowerShift de 3ª geração com 6 marchas, que se destaca pela robustez, rapidez e melhor escalonamento, assegurando conforto e auxiliando na economia. Accelo 1417, modernidade e capacidade de carga para aumentar a produtividade.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6• 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) @ 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'EATON ESO 6206 MB G 90-6 AMT *'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'13.800 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'13.800 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30 / 3,91* 4,30 / 3,91*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3900+978 4600+978","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/1417-6x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Novo Accelo 1417 6x2','public/assets/documents/modelos/mercedes-novo-accelo-1417-6x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/1417-6x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','13.800 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','13.800 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30 / 3,91* 4,30 / 3,91*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3900+978 4600+978',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/bc3fe675-4b43-4d5e-84c9-ccdf7dde267e','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-1417-6x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 1417 6x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Novo Accelo 917 4x2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Novo Accelo 917 4x2','novo-accelo-917-4x2','Com PBT 8,9 toneladas, o novo Accelo 917 oferece mais capacidade de carga em conjunto com um inédito e moderno estilo que reúne detalhes clássicos e futuristas. Com disponibilidade de duas cabinas e três distâncias entre-eixos, atende as mais variadas aplicações do mercado, inclusive as legislações de restrição de circulação das grandes cidades. O robusto e durável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, agora até 3% mais econômico, assegura desempenho e agilidade. Compacto e ágil é perfeito para a distribuição porta a porta nos grandes centros urbanos. Accelo 917, agilidade, modernidade e maior capacidade de carga.','MB OM 924 LA • BlueTec 6• 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)','163 cv (120 kW) @ 2200 rpm','610 Nm (62,2 kgfm) @ 1200 - 1600 rpm','EATON ESO 6205','9.100 kg','11.000 kg','4,30(43:10) 3,91(43:11)*','{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3100 3900 4600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/917-4x2","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Novo Accelo'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='novo-accelo-917-4x2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Novo Accelo 917 4x2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com PBT 8,9 toneladas, o novo Accelo 917 oferece mais capacidade de carga em conjunto com um inédito e moderno estilo que reúne detalhes clássicos e futuristas. Com disponibilidade de duas cabinas e três distâncias entre-eixos, atende as mais variadas aplicações do mercado, inclusive as legislações de restrição de circulação das grandes cidades. O robusto e durável motor Mercedes-Benz OM 924 de 4 cilindros e 4,8 litros de cilindrada, agora até 3% mais econômico, assegura desempenho e agilidade. Compacto e ágil é perfeito para a distribuição porta a porta nos grandes centros urbanos. Accelo 917, agilidade, modernidade e maior capacidade de carga.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA • BlueTec 6• 4,8 L. • 4 cil. em linha • PROCONVE P-8 (Euro 6)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) @ 2200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) @ 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'EATON ESO 6205'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'9.100 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'11.000 kg'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,30(43:10) 3,91(43:11)*'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","emissoes":"Proconve P8 / Euro 6","entre_eixos":"3100 3900 4600","fonte_oficial":"https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/917-4x2","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Novo Accelo 917 4x2','public/assets/documents/modelos/mercedes-novo-accelo-917-4x2-ficha-tecnica.pdf','https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','https://www.mercedes-benz-trucks.com.br/caminhoes/novo-accelo/917-4x2',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','9.100 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','11.000 kg',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,30(43:10) 3,91(43:11)*',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','3100 3900 4600',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','4x2',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://truckinfomb.com.br/api/v1/arquivo/e1a56a82-8137-4617-a94f-f787c79cf0b0','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='novo-accelo-917-4x2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Novo Accelo 917 4x2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- LO 916/48 ORE 2
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'LO 916/48 ORE 2','lo-916-48-ore-2','Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','163 cv (120 kW) a 2.200 rpm','610 Nm (62,2 kgfm) a 1200 - 1600 rpm','Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690','9.400 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"Até 45 (estudantes sentados, +","comprimento":"Até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/escolar/lo-916","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='LO Micro-Ônibus e Escolar'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='lo-916-48-ore-2' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('LO 916/48 ORE 2'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) a 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'9.400 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"Até 45 (estudantes sentados, +","comprimento":"Até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/escolar/lo-916","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - LO 916/48 ORE 2','public/assets/documents/modelos/mercedes-lo-916-ore2-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','https://www.mercedes-benz-trucks.com.br/onibus/escolar/lo-916',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','9.400 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4,2 e 4,8',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','Até 9,2',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','Até 45 (estudantes sentados, +',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='lo-916-48-ore-2' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 ORE 2')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- LO 916/48 Rural
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'LO 916/48 Rural','mercedes-lo-916-48-rural','Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI) com protetor de carter','163 cv (120 kW) a 2.200 rpm','610 Nm (62,2 kgfm) a 1200 - 1600 rpm','Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690','9.400 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"até 32","comprimento":"até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/escolar/lo-916-r","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='LO Micro-Ônibus e Escolar'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('LO 916/48 Rural'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI) com protetor de carter'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) a 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'9.400 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"até 32","comprimento":"até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/escolar/lo-916-r","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - LO 916/48 Rural','public/assets/documents/modelos/mercedes-lo-916-rural-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','https://www.mercedes-benz-trucks.com.br/onibus/escolar/lo-916-r',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','9.400 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4,2 e 4,8',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 9,2',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 32',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1519R/60
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1519R/60','mercedes-of-1519r-60','O chassi OF 1519 R Escolar Rural é uma solução eficiente, segura e econômica para o transporte de alunos nas áreas do campo. Ele combina a força, robustez e resistência do OF com motor frontal a atributos como flexibilidade na configuração e versatilidade para operar em vias fora de estrada. Dessa forma, garante conforto e segurança no deslocamento de equipes, aliado a um excelente custo operacional para o cliente. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','185 cv (136 kW) a 2.200 rpm','700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm','Manual MB G 71- 6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649','15.000 kg','Não se aplica','4,778:1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 60 estudantes (demais versões sob consulta)","comprimento":"até 10,8","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/escolar/of-1519-r","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1519r-60' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1519R/60'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O chassi OF 1519 R Escolar Rural é uma solução eficiente, segura e econômica para o transporte de alunos nas áreas do campo. Ele combina a força, robustez e resistência do OF com motor frontal a atributos como flexibilidade na configuração e versatilidade para operar em vias fora de estrada. Dessa forma, garante conforto e segurança no deslocamento de equipes, aliado a um excelente custo operacional para o cliente. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 71- 6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'15.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,778:1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 60 estudantes (demais versões sob consulta)","comprimento":"até 10,8","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/escolar/of-1519-r","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1519R/60','public/assets/documents/modelos/mercedes-of-1519r-60-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','https://www.mercedes-benz-trucks.com.br/onibus/escolar/of-1519-r',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','15.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,778:1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 10,8',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 60 estudantes (demais versões sob consulta)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- LO 1116/48/55
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'LO 1116/48/55','mercedes-lo-1116-48-55','Os chassis LO 1116 Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento e rodoviário. Com PBT de 10,8 toneladas, opções de entre- eixos de 4,8 e 5,5 metros, podem receber carrocerias de 9,2 até 10,65 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','163 cv (120 kW) a 2.200 rpm','610 Nm (62,2 kgf.m) @ 1200 - 1600 rpm','Manual EATON ESBO 6206 - 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690','10.800 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4.800","comprimento":"De 9,2 até 10,65m","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-1116","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='LO Micro-Ônibus e Escolar'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('LO 1116/48/55'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Os chassis LO 1116 Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento e rodoviário. Com PBT de 10,8 toneladas, opções de entre- eixos de 4,8 e 5,5 metros, podem receber carrocerias de 9,2 até 10,65 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgf.m) @ 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual EATON ESBO 6206 - 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'10.800 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4.800","comprimento":"De 9,2 até 10,65m","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-1116","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - LO 1116/48/55','public/assets/documents/modelos/mercedes-lo-1116-48-55-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-1116',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','10.800 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4.800',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','De 9,2 até 10,65m',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-1116-48-55' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 1116/48/55')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- LO 916/42/48
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'LO 916/42/48','mercedes-lo-916-42-48','Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','163 cv (120 kW) a 2.200 rpm','610 Nm (62,2 kgfm) a 1200 - 1600 rpm','Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690','9.400 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"até 40","comprimento":"até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='LO Micro-Ônibus e Escolar'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('LO 916/42/48'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) a 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'9.400 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"até 40","comprimento":"até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - LO 916/42/48','public/assets/documents/modelos/mercedes-lo-916-42-48-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','9.400 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4,2 e 4,8',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 9,2',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 40',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-42-48' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/42/48')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- LO 916/48 Rural
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'LO 916/48 Rural','mercedes-lo-916-48-rural','Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI) com protetor de carter','163 cv (120 kW) a 2.200 rpm','610 Nm (62,2 kgfm) a 1200 - 1600 rpm','Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690','9.400 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"até 32","comprimento":"até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916-r","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='LO Micro-Ônibus e Escolar'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('LO 916/48 Rural'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Os chassis LO 916 e LO 916R Mercedes-Benz são destinados ao segmento de micro-ônibus, que visa atender ao transporte público de passageiros nos centros urbanos ou em locais onde há a necessidade de um veículo robusto e de fácil manutenção. Trata-se de um chassi versátil, que pode ser aplicado no transporte urbano, escolar, fretamento, fretamento rural e rodoviário. Com PBT de 9,4 toneladas, opções de entre- eixos de 4,2 e 4,8 metros, podem receber carrocerias de 7,5 até 9,2 metros de comprimento, com 1 ou 2 portas. Os chassis Mercedes-Benz, conhecidos pelo seu elevado padrão de qualidade e pelo baixo custo operacional e de manutenção, receberam a exclusiva tecnologia BlueTec 6, que reforça as características de durabilidade do motor, economia e desempenho, ou seja, tudo o que o seu negócio precisa para se tornar ainda mais rentável. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI) com protetor de carter'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'163 cv (120 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'610 Nm (62,2 kgfm) a 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual EATON ESBO 6206 de 6 marchas i = 6,195 / 3,391 / 2,079 / 1,333 / 1,000 / 0,775 marcha-ré = 5,690'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'9.400 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"4,2 e 4,8","capacidade_passageiros":"até 32","comprimento":"até 9,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916-r","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - LO 916/48 Rural','public/assets/documents/modelos/mercedes-lo-916-rural-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916-r',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','9.400 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','4,2 e 4,8',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 9,2',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 32',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-lo-916-48-rural' OR LOWER(TRIM(m.nome))=LOWER(TRIM('LO 916/48 Rural')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 R 1931/30
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 R 1931/30','mercedes-o500-r-1931-30','Desenvolvido para aplicações rodoviárias de curta distância e fretamento, o chassi O 500 R é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 R é dimensionado para suportar 19,5 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 13,2 metros de comprimento total. O motor eletrônico OM 926 LA (Proconve P-7), com exclusiva tecnologia BlueTec 6, possui 310 cv de potência e 1200 Nm de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','310 cv (228 KW) a 2.200 rpm','1.250 Nm (127 mkgf) a 1.200 a 1.600 rpm','Manual MB GO 190-6 de seis marchas i = 8,17 / 4,65 / 2,79 / 1,81 / 1,25 / 1,00 marcha-ré = 7,683','20.000 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-r","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Rodoviários'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 R 1931/30'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido para aplicações rodoviárias de curta distância e fretamento, o chassi O 500 R é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 R é dimensionado para suportar 19,5 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 13,2 metros de comprimento total. O motor eletrônico OM 926 LA (Proconve P-7), com exclusiva tecnologia BlueTec 6, possui 310 cv de potência e 1200 Nm de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'310 cv (228 KW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.250 Nm (127 mkgf) a 1.200 a 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB GO 190-6 de seis marchas i = 8,17 / 4,65 / 2,79 / 1,81 / 1,25 / 1,00 marcha-ré = 7,683'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-r","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 R 1931/30','public/assets/documents/modelos/mercedes-o500-r-1931-30-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-r',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 14,0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-r-1931-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 R 1931/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 RS 1938/30
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 RS 1938/30','mercedes-o500-rs-1938-30','Desenvolvido para aplicações rodoviárias de curtas, médias e longas distâncias, o chassi O 500 RS é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 RS é dimensionado para suportar 18,5 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 13,2 metros de comprimento total. O motor eletrônico OM 460 LA (Proconve P-8), com exclusiva tecnologia BlueTec6, apresenta 381cv de potência a 1900 Nm de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 / Euro VI)','381 cv (280 kW) a 1.600 rpm','1.900 Nm (193,8 kgfm) a 1.100 rpm',NULL,'20.000 kg','Não se aplica','2.533 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 50","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rs","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Rodoviários'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 RS 1938/30'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido para aplicações rodoviárias de curtas, médias e longas distâncias, o chassi O 500 RS é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 RS é dimensionado para suportar 18,5 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 13,2 metros de comprimento total. O motor eletrônico OM 460 LA (Proconve P-8), com exclusiva tecnologia BlueTec6, apresenta 381cv de potência a 1900 Nm de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.900 Nm (193,8 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2.533 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 50","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rs","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 RS 1938/30','public/assets/documents/modelos/mercedes-o500-rs-1938-30-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rs',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2.533 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 14,0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 50',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rs-1938-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RS 1938/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 RSD 2438
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 RSD 2438','mercedes-o500-rsd-2438','Desenvolvido para aplicações rodoviárias de médias e longas distância, o chassi O 500 RSD 6 x 2 é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 RSD 6 x 2 é dimensionado para suportar 24 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 14 metros de comprimento total, além de permitir a instalação de carrocerias Double Decker e Low Drive. O motor eletrônico OM 460 LA (Proconve P-8), com exclusiva tecnologia BlueTec 6, apresenta 381 cv e 1900 Nm e 449 cv e 2200 de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 / Euro VI)','381 cv (280 kW) a 1.600 rpm','1.900 Nm (193,7 kgfm) a 1.100 rpm',NULL,'24.000 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","fonte_oficial":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Rodoviários'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 RSD 2438'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido para aplicações rodoviárias de médias e longas distância, o chassi O 500 RSD 6 x 2 é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 RSD 6 x 2 é dimensionado para suportar 24 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 14 metros de comprimento total, além de permitir a instalação de carrocerias Double Decker e Low Drive. O motor eletrônico OM 460 LA (Proconve P-8), com exclusiva tecnologia BlueTec 6, apresenta 381 cv e 1900 Nm e 449 cv e 2200 de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.900 Nm (193,7 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'24.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","fonte_oficial":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','24.000 kg',NULL,'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'configuracao','Configuração / tração','6x2',NULL,'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2438' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2438')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 RSD 2445/30
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 RSD 2445/30','mercedes-o500-rsd-2445-30','Desenvolvido para aplicações rodoviárias de médias e longas distância, o chassi O 500 RSD 6 x 2 é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 RSD 6 x 2 é dimensionado para suportar 24 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 14 metros de comprimento total, além de permitir a instalação de carrocerias Double Decker e Low Drive. O motor eletrônico OM 460 LA (Proconve P-8), com exclusiva tecnologia BlueTec 6, apresenta 381 cv e 1900 Nm e 449 cv e 2200 de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 Euro VI)','449 cv (330 kW) a 1.600 rpm','2.200 Nm (224,3 kgfm) a 1.100 rpm',NULL,'24.500 kg','Não se aplica','2,533:1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2445","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Rodoviários'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 RSD 2445/30'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido para aplicações rodoviárias de médias e longas distância, o chassi O 500 RSD 6 x 2 é robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação, possuindo todas as vantagens da tecnologia Mercedes-Benz. O chassi O 500 RSD 6 x 2 é dimensionado para suportar 24 toneladas e ainda possibilita a alteração no entre-eixo para alongamentos até 14 metros de comprimento total, além de permitir a instalação de carrocerias Double Decker e Low Drive. O motor eletrônico OM 460 LA (Proconve P-8), com exclusiva tecnologia BlueTec 6, apresenta 381 cv e 1900 Nm e 449 cv e 2200 de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de concepção avançada, associado à garantia da marca líder em transporte de passageiros. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'449 cv (330 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2.200 Nm (224,3 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'24.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,533:1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2445","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 RSD 2445/30','public/assets/documents/modelos/mercedes-o500-rsd-2445-30-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2445',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','24.500 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,533:1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 14,0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-rsd-2445-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSD 2445/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 RSDD 2745/30
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 RSDD 2745/30','o-500-rsdd-2745-30','Desenvolvido para aplicação rodoviária de média e longa distância, o chassi O 500 RSDD 2745 8x2 incorpora todas as vantagens da tecnologia Mercedes-Benz. É um veículo robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação. O veículo apresenta alta qualidade e baixo custo operacional, superando as expectativas do frotista mais exigente. O chassi O 500 RSDD 2741 8x2 é dimensionado para suportar 27 toneladas e ainda possibilita a alteração no entre-eixos para alongamentos de até 15 metros de comprimento total. O motor eletrônico OM 460 LA (Proconve P-8) apresenta 449 cv de potência a 2200 Nm de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Além disso, o O 500 RSDD 2745 8x2 vem equipado com + Top Brake + freio EBS + leitor de faixa + Freios de emergência automáticos + piloto automático adaptativo. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de conce','MB OM 460 LA (Proconve P-8 / Euro VI)','449 cv (330 kW) a 1.600 rpm','2.200 Nm (224,3 kgfm) a 1.100 rpm',NULL,'27.000 kg','Não se aplica','2,846:1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 68","comprimento":"15.0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Rodoviários'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 RSDD 2745/30'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Desenvolvido para aplicação rodoviária de média e longa distância, o chassi O 500 RSDD 2745 8x2 incorpora todas as vantagens da tecnologia Mercedes-Benz. É um veículo robusto e de alta durabilidade, próprio para as mais severas condições de operação e aplicação. O veículo apresenta alta qualidade e baixo custo operacional, superando as expectativas do frotista mais exigente. O chassi O 500 RSDD 2741 8x2 é dimensionado para suportar 27 toneladas e ainda possibilita a alteração no entre-eixos para alongamentos de até 15 metros de comprimento total. O motor eletrônico OM 460 LA (Proconve P-8) apresenta 449 cv de potência a 2200 Nm de torque, proporcionando um desempenho superior na aplicação rodoviária, com economia de combustível e rentabilidade. Além disso, o O 500 RSDD 2745 8x2 vem equipado com + Top Brake + freio EBS + leitor de faixa + Freios de emergência automáticos + piloto automático adaptativo. Definitivamente, este é o veículo ideal quando sua operação requer um chassi de conce'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'449 cv (330 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2.200 Nm (224,3 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'27.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'2,846:1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 68","comprimento":"15.0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 RSDD 2745/30','public/assets/documents/modelos/mercedes-o500-rsdd-2745-30-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','27.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','2,846:1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','15.0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 68',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-rsdd-2745-30' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 RSDD 2745/30')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1519R/60
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1519R/60','mercedes-of-1519r-60','O chassi OF 1519 R Fretamento Rural é uma solução eficiente, segura e econômica para o transporte de funcionários e grupos em diversas áreas do campo, como reflorestamentos, mineração e canteiros de obras. Ele combina a força, robustez e resistência do OF com motor frontal a atributos como flexibilidade na configuração e versatilidade para operar em vias fora de estrada. Dessa forma, garante conforto e segurança no deslocamento de equipes, aliado a um excelente custo operacional para empresas do setor. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','185 cv (136 kW) a 2.200 rpm','700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm','Manual MB G 71- 6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649','15.000 kg','Não se aplica','4,778:1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 60 estudantes (demais versões sob consulta)","comprimento":"até 10,8","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1519-r","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1519r-60' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1519R/60'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O chassi OF 1519 R Fretamento Rural é uma solução eficiente, segura e econômica para o transporte de funcionários e grupos em diversas áreas do campo, como reflorestamentos, mineração e canteiros de obras. Ele combina a força, robustez e resistência do OF com motor frontal a atributos como flexibilidade na configuração e versatilidade para operar em vias fora de estrada. Dessa forma, garante conforto e segurança no deslocamento de equipes, aliado a um excelente custo operacional para empresas do setor. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 71- 6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'15.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,778:1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 60 estudantes (demais versões sob consulta)","comprimento":"até 10,8","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1519-r","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1519R/60','public/assets/documents/modelos/mercedes-of-1519r-60-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1519-r',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','15.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,778:1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 10,8',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 60 estudantes (demais versões sob consulta)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1519r-60' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1519R/60')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1621/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1621/59','mercedes-of-1621-59','Chassi de ônibus OF1621/59, desenvolvido especialmente para o fretamento contínuo de transporte de funcionários para empresas e indústrias. Com PBT (peso bruto total) de 16,5 toneladas e motor OM 924 LA de 208 cv, pode receber carroceria de até 12,55 metros de comprimento, permitindo a montagem de até 48 assentos para passageiros mais DPM (Dispositivo de Poltrona Móvel), que oferece segurança e conforto de acessibilidade a cadeirantes e pessoas com mobilidade reduzida','MB OM 924 LA (Proconve P-8 / Euro VI)','208 cv (153 kW) a 2.200 rpm','780 Nm (79,5 kgfm) a 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','16.500 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 48","comprimento":"12,55","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1621","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1621-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1621/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Chassi de ônibus OF1621/59, desenvolvido especialmente para o fretamento contínuo de transporte de funcionários para empresas e indústrias. Com PBT (peso bruto total) de 16,5 toneladas e motor OM 924 LA de 208 cv, pode receber carroceria de até 12,55 metros de comprimento, permitindo a montagem de até 48 assentos para passageiros mais DPM (Dispositivo de Poltrona Móvel), que oferece segurança e conforto de acessibilidade a cadeirantes e pessoas com mobilidade reduzida'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'208 cv (153 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'780 Nm (79,5 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'16.500 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 48","comprimento":"12,55","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1621","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1621/59','public/assets/documents/modelos/mercedes-of-1621-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1621',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','16.500 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','12,55',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 48',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1621-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1621/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1721/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1721/59','mercedes-of-1721-59','O pioneirismo do OF 1721 continua indiscutível no mercado. Desenvolvido com motor OM 924 LA de 4 cilindros, potência de 208 cv e 780 Nm de torque, esse chassi prioriza a economia de combustível, a rentabilidade e a qualidade do transporte. Com PBT de 17 toneladas, o OF 1721 recebe carrocerias de até 13,2 metros de comprimento para aplicações fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','208 cv (153 kW) a 2.200 rpm','780 Nm (79,5 kgfm) a 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','17.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1721","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1721-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1721/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O pioneirismo do OF 1721 continua indiscutível no mercado. Desenvolvido com motor OM 924 LA de 4 cilindros, potência de 208 cv e 780 Nm de torque, esse chassi prioriza a economia de combustível, a rentabilidade e a qualidade do transporte. Com PBT de 17 toneladas, o OF 1721 recebe carrocerias de até 13,2 metros de comprimento para aplicações fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'208 cv (153 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'780 Nm (79,5 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1721","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1721/59','public/assets/documents/modelos/mercedes-of-1721-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1721',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','11.3 (encurtado) ::: 12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1721L/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1721L/59','of-1721l-59','Projetado para criar uma variação na família de OFs de 17 toneladas e atender cidades que buscam soluções na mobilidade urbana, o OF 1721L surpreende pelo conforto, estabilidade e qualidade que a suspensão pneumática oferece aos passageiros. Esta solução diminui o nível de trepidações do chassi e reduz o ruído interno do veículo. Além disso, é equipado com motor OM 924 LA de 4 cilindros e peças de comum utilização em outros produtos, possibilitando a intercambialidade de componentes com outros modelos Mercedes-Benz. A aplicação do chassi atende às demandas de transporte urbano, fretamento e rodoviário de curta distância, oferecendo versatilidade para diferentes necessidades do setor de transporte. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','208 cv (153 kW) a 2.200 rpm','780 Nm (79,5 kgfm) de 1.200 a 1.600 rpm',NULL,'17.000 kg','Não se aplica','5,875:1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1721l","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='of-1721l-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1721L/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Projetado para criar uma variação na família de OFs de 17 toneladas e atender cidades que buscam soluções na mobilidade urbana, o OF 1721L surpreende pelo conforto, estabilidade e qualidade que a suspensão pneumática oferece aos passageiros. Esta solução diminui o nível de trepidações do chassi e reduz o ruído interno do veículo. Além disso, é equipado com motor OM 924 LA de 4 cilindros e peças de comum utilização em outros produtos, possibilitando a intercambialidade de componentes com outros modelos Mercedes-Benz. A aplicação do chassi atende às demandas de transporte urbano, fretamento e rodoviário de curta distância, oferecendo versatilidade para diferentes necessidades do setor de transporte. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'208 cv (153 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'780 Nm (79,5 kgfm) de 1.200 a 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875:1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1721l","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1721L/59','public/assets/documents/modelos/mercedes-of-1721l-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1721l',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875:1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','11.3 (encurtado) ::: 12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1726/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1726/59','mercedes-of-1726-59','O OF 1726 possui um sistema modular que facilita o arranjo de componentes do ônibus e é de fácil aquisição no mercado. Consagrado com o motor OM 926 LA, de 260 cv e 900 Nm de torque, esse chassi apresenta um ótimo desempenho, economia e rentabilidade ao operador que transita em vias urbanas, intermunicipais, rodoviárias e/ou de fretamento. Com versatilidade de encarroçamento, o veículo pode ser montado sobre carrocerias de até 13,2 metros de comprimento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','260 cv (191 kW) @ 2.200 rpm','900 Nm (91,7 kgf.m) @ 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','17.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1726","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1726-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1726/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O OF 1726 possui um sistema modular que facilita o arranjo de componentes do ônibus e é de fácil aquisição no mercado. Consagrado com o motor OM 926 LA, de 260 cv e 900 Nm de torque, esse chassi apresenta um ótimo desempenho, economia e rentabilidade ao operador que transita em vias urbanas, intermunicipais, rodoviárias e/ou de fretamento. Com versatilidade de encarroçamento, o veículo pode ser montado sobre carrocerias de até 13,2 metros de comprimento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'260 cv (191 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'900 Nm (91,7 kgf.m) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1726","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1726/59','public/assets/documents/modelos/mercedes-of-1726-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1726',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','11.3 (encurtado) ::: 12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1726L/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1726L/59','mercedes-of-1726l-59','Novidade no mercado, o OF 1726L destaca-se pelo alto nível de conforto e estabilidade que a suspensão pneumática proporciona e pela variedade de aplicações que assume. Preparado para receber carrocerias de até 13,2 metros, o veículo é equipado com motor OM 926 LA, de 6 cilindros e 260 cv e 900 Nm, consagrando a economia e a rentabilidade necessárias para aplicações urbanas (inclusive BRT), intermunicipais, rodoviárias e de fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','260 cv (191 kW) @ 2.200 rpm','900 Nm (91,7 kgfm) @ 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','17.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1726l","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1726l-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1726L/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Novidade no mercado, o OF 1726L destaca-se pelo alto nível de conforto e estabilidade que a suspensão pneumática proporciona e pela variedade de aplicações que assume. Preparado para receber carrocerias de até 13,2 metros, o veículo é equipado com motor OM 926 LA, de 6 cilindros e 260 cv e 900 Nm, consagrando a economia e a rentabilidade necessárias para aplicações urbanas (inclusive BRT), intermunicipais, rodoviárias e de fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'260 cv (191 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'900 Nm (91,7 kgfm) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1726l","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1726L/59','public/assets/documents/modelos/mercedes-of-1726l-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1726l',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- Mercedes-Benz eO500U
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'Mercedes-Benz eO500U','mercedes-benz-eo500u','O eO500U, o primeiro chassi de propulsão elétrica produzido pela Mercedes-Benz do Brasil, nasceu unindo características construtivas do já consolidado O500U e do primeiro chassi elétrico produzido pela matriz da Alemanha, o eCitaro. Esse veículo, destinado ao transporte urbano de passageiros, possui PBT de 21,2 toneladas e pode receber carrocerias de até 13,2 metros. Dentre as principais vantagens do ônibus elétrico está a eliminação de emissão de gases resultantes da queima de combustíveis fósseis. Além disso, por ser silencioso, o veículo também leva vantagem oferecendo maior conforto aos passageiros. Um outro destaque é o custo operacional do ônibus elétrico, que é menor em comparação com um ônibus convencional com motor à combustão. A Eletromobilidade significa repensar a mobilidade urbana com novos veículos, e a Mercedes-Benz do Brasil acompanha empresas de transportes neste caminho, seguindo uma solução sistemática: o eO500U não é apenas um veículo urbano, é muito mais. É parte d','Elétrico Modelo ZF AVE 130, montados no eixo traseiro próximos aos cubos de roda','de pico 250 kW (340 cv)','2x 485 Nm (2x 49,4 mkgf) Torque na roda 2x 11.000 Nm',NULL,'21.200 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"100% elétrico","tipo_carroceria":"Chassi de ônibus","emissoes":"Zero emissão local","capacidade_passageiros":"80","comprimento":"até 13,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/eo500u","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='Ônibus Elétricos Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-benz-eo500u' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('Mercedes-Benz eO500U'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O eO500U, o primeiro chassi de propulsão elétrica produzido pela Mercedes-Benz do Brasil, nasceu unindo características construtivas do já consolidado O500U e do primeiro chassi elétrico produzido pela matriz da Alemanha, o eCitaro. Esse veículo, destinado ao transporte urbano de passageiros, possui PBT de 21,2 toneladas e pode receber carrocerias de até 13,2 metros. Dentre as principais vantagens do ônibus elétrico está a eliminação de emissão de gases resultantes da queima de combustíveis fósseis. Além disso, por ser silencioso, o veículo também leva vantagem oferecendo maior conforto aos passageiros. Um outro destaque é o custo operacional do ônibus elétrico, que é menor em comparação com um ônibus convencional com motor à combustão. A Eletromobilidade significa repensar a mobilidade urbana com novos veículos, e a Mercedes-Benz do Brasil acompanha empresas de transportes neste caminho, seguindo uma solução sistemática: o eO500U não é apenas um veículo urbano, é muito mais. É parte d'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'Elétrico Modelo ZF AVE 130, montados no eixo traseiro próximos aos cubos de roda'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'de pico 250 kW (340 cv)'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'2x 485 Nm (2x 49,4 mkgf) Torque na roda 2x 11.000 Nm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'21.200 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"100% elétrico","tipo_carroceria":"Chassi de ônibus","emissoes":"Zero emissão local","capacidade_passageiros":"80","comprimento":"até 13,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/eo500u","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - Mercedes-Benz eO500U','public/assets/documents/modelos/mercedes-mercedes-eo500u-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/eo500u',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','21.200 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 13,2',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','100% elétrico',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Zero emissão local',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/eo500-u-2134.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-benz-eo500u' OR LOWER(TRIM(m.nome))=LOWER(TRIM('Mercedes-Benz eO500U')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 M 1928/59 Super Padron
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 M 1928/59 Super Padron','mercedes-o500-m-1928-59','O chassi O500M Super Padron foi desenvolvido para operar em linhas urbanas, garantindo maior durabilidade e robustez para a sua frota. Este veículo pode receber carrocerias de até 14 metros e conta com suspensão pneumática integral, que garante segurança e conforto para os passageiros e para o motorista. Equipado com o motor OM 926 LA de 6 cilindros, potência de 286 cv e 1.100 Nm, esse chassi possui vantagens que só a tecnologia BlueTec 6, exclusiva da Mercedes-Benz, pode proporcionar. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','286 cv (210 kW) a 2.200 rpm','1.100 Nm (112 kgfm) a 1200 - 1600 rpm',NULL,'20.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"entre 85 e 95","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500m","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O chassi O500M Super Padron foi desenvolvido para operar em linhas urbanas, garantindo maior durabilidade e robustez para a sua frota. Este veículo pode receber carrocerias de até 14 metros e conta com suspensão pneumática integral, que garante segurança e conforto para os passageiros e para o motorista. Equipado com o motor OM 926 LA de 6 cilindros, potência de 286 cv e 1.100 Nm, esse chassi possui vantagens que só a tecnologia BlueTec 6, exclusiva da Mercedes-Benz, pode proporcionar. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.100 Nm (112 kgfm) a 1200 - 1600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'20.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"entre 85 e 95","comprimento":"até 14,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500m","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 M 1928/59 Super Padron','public/assets/documents/modelos/mercedes-o500-m-1928-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500m',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','20.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 14,0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','entre 85 e 95',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-m-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 M 1928/59 Super Padron')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 MA 2938
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 MA 2938','mercedes-o500-ma-2938','Agregando a linha de articulados Mercedes-Benz, o O500MA foi desenvolvido para solucionar a demanda de transporte de passageiros nas grandes cidades e modernizar o mercado de ônibus brasileiro, trazendo rentabilidade e qualidade ao sistema. Este veículo pode receber carrocerias de até 18,6 metros e conta com suspensão pneumática integral. Equipado com um motor traseiro OM 460 LA de 381 cv e 1.900 Nm, o chassi possui uma ótima dirigibilidade, segurança e praticidade de encarroçamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 / Euro VI)','381 cv (280 kW) a 1.600 rpm','1.900 Nm (193,7 kgfm) a 1.100 rpm',NULL,'13.000 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 173","comprimento":"até 18,6","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ma","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 MA 2938'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Agregando a linha de articulados Mercedes-Benz, o O500MA foi desenvolvido para solucionar a demanda de transporte de passageiros nas grandes cidades e modernizar o mercado de ônibus brasileiro, trazendo rentabilidade e qualidade ao sistema. Este veículo pode receber carrocerias de até 18,6 metros e conta com suspensão pneumática integral. Equipado com um motor traseiro OM 460 LA de 381 cv e 1.900 Nm, o chassi possui uma ótima dirigibilidade, segurança e praticidade de encarroçamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.900 Nm (193,7 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'13.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 173","comprimento":"até 18,6","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ma","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 MA 2938','public/assets/documents/modelos/mercedes-o500-ma-2938-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ma',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','13.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 18,6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 173',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-ma-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 MDA 3738
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 MDA 3738','mercedes-o500-mda-3738','A linha de articulados Mercedes-Benz ficou ainda maior. Para acompanhar o mercado e apresentar soluções que atendam as necessidades da mobilidade urbana em sistemas BRT (Bus Rapid Transit), os modelos O500UDA/MDA foram projetados para operar em corredores e vias segregadas, com estações de embarque em nível, de forma que transportem uma demanda maior de passageiros e que a velocidade operacional, o conforto, a segurança e a qualidade sejam fatores favoráveis ao se optar pela melhor tecnologia do mercado. Os superarticulados Mercedes-Benz são compostos por 4 eixos, sendo o último direcional ERA, recebem carrocerias de até 23 metros e são capazes de transportar até 190 passageiros. São equipados com um motor eletrônico OM 460 LA de 381 cv e 1.900 Nm (Proconve P-8 Euro VI), e possuem um baixo custo de manutenção, sendo ideais para operar em horário de pico. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 / Euro VI)','381 cv (280 kW) a 1.600 rpm','1.900 Nm (193,7 kgfm) a 1.100 rpm',NULL,'18.400 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 190","comprimento":"até 23,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500mda","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 MDA 3738'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'A linha de articulados Mercedes-Benz ficou ainda maior. Para acompanhar o mercado e apresentar soluções que atendam as necessidades da mobilidade urbana em sistemas BRT (Bus Rapid Transit), os modelos O500UDA/MDA foram projetados para operar em corredores e vias segregadas, com estações de embarque em nível, de forma que transportem uma demanda maior de passageiros e que a velocidade operacional, o conforto, a segurança e a qualidade sejam fatores favoráveis ao se optar pela melhor tecnologia do mercado. Os superarticulados Mercedes-Benz são compostos por 4 eixos, sendo o último direcional ERA, recebem carrocerias de até 23 metros e são capazes de transportar até 190 passageiros. São equipados com um motor eletrônico OM 460 LA de 381 cv e 1.900 Nm (Proconve P-8 Euro VI), e possuem um baixo custo de manutenção, sendo ideais para operar em horário de pico. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.900 Nm (193,7 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'18.400 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 190","comprimento":"até 23,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500mda","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 MDA 3738','public/assets/documents/modelos/mercedes-o500-mda-3738-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500mda',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','18.400 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 23,0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 190',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-mda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 MDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 U 1928/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 U 1928/59','mercedes-o500-u-1928-59','O O500U foi desenvolvido para aplicação urbana e agrupa toda a tecnologia dos chassis Mercedes-Benz com embarque em nível baixo, ausência de degraus de acesso pela porta dianteira e no entre-eixos. A suspensão pneumática, agregada a um sistema de rebaixamento lateral, garante conforto e segurança, tanto para os operadores do sistema quanto para os passageiros, de forma que estes sejam priorizados. O motor OM 926 LA de 286 cv e 1.100 Nm introduz inovação à categoria e aumenta o desempenho desse chassi no tráfego urbano intenso das cidades grandes. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','286 cv (210 kW) a 2.200 rpm','1.100 Nm (112 kgfm) a 1.200 - 1.600 rpm',NULL,'19.600 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"80 - 90","comprimento":"até - 13,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500u","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 U 1928/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O O500U foi desenvolvido para aplicação urbana e agrupa toda a tecnologia dos chassis Mercedes-Benz com embarque em nível baixo, ausência de degraus de acesso pela porta dianteira e no entre-eixos. A suspensão pneumática, agregada a um sistema de rebaixamento lateral, garante conforto e segurança, tanto para os operadores do sistema quanto para os passageiros, de forma que estes sejam priorizados. O motor OM 926 LA de 286 cv e 1.100 Nm introduz inovação à categoria e aumenta o desempenho desse chassi no tráfego urbano intenso das cidades grandes. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'286 cv (210 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.100 Nm (112 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'19.600 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"80 - 90","comprimento":"até - 13,2","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500u","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 U 1928/59','public/assets/documents/modelos/mercedes-o500-u-1928-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500u',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','19.600 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até - 13,2',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','80 - 90',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-u-1928-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 U 1928/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 UA 2938
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 UA 2938','o-500-ua-2938','Pronto para operar em corredores de plataformas de embarque em nível baixo, o O500UA da Mercedes-Benz possui motor OM 460 LA de 381 cv e 1.900 Nm, que confirma a robustez e a qualidade dos chassis articulados. Este veículo pode receber carrocerias de até 18,6 metros e conta com suspensão pneumática integral. O O500UA garante a modernidade, a durabilidade de componentes, a qualidade, a segurança e o conforto para os operadores e passageiros do sistema de tráfego urbano. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 / Euro VI)','381 cv (280 kW) a 1.600 rpm','1.900 Nm (193,7 kgfm) a 1.100 rpm',NULL,'13.000 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 135","comprimento":"até 18,6","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='o-500-ua-2938' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 UA 2938'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Pronto para operar em corredores de plataformas de embarque em nível baixo, o O500UA da Mercedes-Benz possui motor OM 460 LA de 381 cv e 1.900 Nm, que confirma a robustez e a qualidade dos chassis articulados. Este veículo pode receber carrocerias de até 18,6 metros e conta com suspensão pneumática integral. O O500UA garante a modernidade, a durabilidade de componentes, a qualidade, a segurança e o conforto para os operadores e passageiros do sistema de tráfego urbano. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.900 Nm (193,7 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'13.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 135","comprimento":"até 18,6","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 UA 2938','public/assets/documents/modelos/mercedes-o500-ua-2938-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','13.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 18,6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 135',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='o-500-ua-2938' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UA 2938')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- O 500 UDA 3738
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'O 500 UDA 3738','mercedes-o500-uda-3738','A linha de articulados Mercedes-Benz ficou ainda maior. Para acompanhar o mercado e apresentar soluções que atendam às necessidades da mobilidade urbana em sistemas BRT (Bus Rapid Transit), os modelos O500UDA/MDA foram projetados para operar em corredores e vias segregadas, com estações de embarque em nível, de forma que transportem uma demanda maior de passageiros e que a velocidade operacional, o conforto, a segurança e a qualidade sejam fatores favoráveis ao se optar pela melhor tecnologia do mercado. Os superarticulados Mercedes-Benz são compostos por 4 eixos, sendo o último direcional ERA, recebem carrocerias de até 23 metros e são capazes de transportar até 180 passageiros. São equipados com um motor eletrônico OM 460 LA de 381 cv e 1.900 Nm (Proconve P-8 Euro VI), e possuem um baixo custo de manutenção, sendo ideais para operar em horário de pico. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 460 LA (Proconve P-8 / Euro VI)','381 cv (280 kW) a 1.600 rpm','1.900 Nm (193,7 kgfm) a 1.100 rpm',NULL,'18.400 kg','Não se aplica',NULL,'{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"7.000","capacidade_passageiros":"até 175","comprimento":"até 23,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500uda","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='O 500 Urbanos'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('O 500 UDA 3738'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'A linha de articulados Mercedes-Benz ficou ainda maior. Para acompanhar o mercado e apresentar soluções que atendam às necessidades da mobilidade urbana em sistemas BRT (Bus Rapid Transit), os modelos O500UDA/MDA foram projetados para operar em corredores e vias segregadas, com estações de embarque em nível, de forma que transportem uma demanda maior de passageiros e que a velocidade operacional, o conforto, a segurança e a qualidade sejam fatores favoráveis ao se optar pela melhor tecnologia do mercado. Os superarticulados Mercedes-Benz são compostos por 4 eixos, sendo o último direcional ERA, recebem carrocerias de até 23 metros e são capazes de transportar até 180 passageiros. São equipados com um motor eletrônico OM 460 LA de 381 cv e 1.900 Nm (Proconve P-8 Euro VI), e possuem um baixo custo de manutenção, sendo ideais para operar em horário de pico. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 460 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'381 cv (280 kW) a 1.600 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'1.900 Nm (193,7 kgfm) a 1.100 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'18.400 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),NULL),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","entre_eixos":"7.000","capacidade_passageiros":"até 175","comprimento":"até 23,0","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500uda","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - O 500 UDA 3738','public/assets/documents/modelos/mercedes-o500-uda-3738-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500uda',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','18.400 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'entre_eixos','Entre-eixos','7.000',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 23,0',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 175',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-o500-uda-3738' OR LOWER(TRIM(m.nome))=LOWER(TRIM('O 500 UDA 3738')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1619/52
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1619/52','mercedes-of-1619-52','Com um PBT de 16 toneladas, o OF 1619 é equipado com o motor OM 924 LA (Proconve-P8), de 4 cilindros, 185 cv de potência e 700 Nm de torque. Esse veículo possui caixa de câmbio exclusiva da Mercedes-Benz (MB G-71) e variações de comprimento que possibilitam aplicações para linhas urbanas e de fretamento, com carrocerias de até 11,4 metros. O chassi OF 1619 é a junção de qualidade, segurança e conforto que os operadores precisam para alcançar a excelência em transporte e mobilidade urbana. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','185 cv (136kW) a 2.200 rpm','700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm','Manual MB G 71-6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649','16.000 kg','Não se aplica','4,778 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 65","comprimento":"até 11,3","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1619-52' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1619/52'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com um PBT de 16 toneladas, o OF 1619 é equipado com o motor OM 924 LA (Proconve-P8), de 4 cilindros, 185 cv de potência e 700 Nm de torque. Esse veículo possui caixa de câmbio exclusiva da Mercedes-Benz (MB G-71) e variações de comprimento que possibilitam aplicações para linhas urbanas e de fretamento, com carrocerias de até 11,4 metros. O chassi OF 1619 é a junção de qualidade, segurança e conforto que os operadores precisam para alcançar a excelência em transporte e mobilidade urbana. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 71-6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'16.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,778 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 65","comprimento":"até 11,3","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1619/52','public/assets/documents/modelos/mercedes-of-1619-52-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','16.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,778 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 11,3',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 65',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1619L/52
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1619L/52','mercedes-of-1619l-52','Com um PBT de 16 toneladas, o OF 1619 é equipado com o motor OM 924 LA (Proconve-P8), de 4 cilindros, 185 cv de potência e 700 Nm de torque. Esse veículo possui caixa de câmbio exclusiva da Mercedes-Benz (MB G-71) e variações de comprimento que possibilitam aplicações para linhas urbanas e de fretamento, com carrocerias de até 11,4 metros. O chassi OF 1619 é a junção de qualidade, segurança e conforto que os operadores precisam para alcançar a excelência em transporte e mobilidade urbana. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','185 cv (136kW) a 2.200 rpm','700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm','Manual MB G 71-6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649','16.000 kg','Não se aplica','4,778 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 65","comprimento":"até 11,3","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619l","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1619l-52' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1619L/52'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Com um PBT de 16 toneladas, o OF 1619 é equipado com o motor OM 924 LA (Proconve-P8), de 4 cilindros, 185 cv de potência e 700 Nm de torque. Esse veículo possui caixa de câmbio exclusiva da Mercedes-Benz (MB G-71) e variações de comprimento que possibilitam aplicações para linhas urbanas e de fretamento, com carrocerias de até 11,4 metros. O chassi OF 1619 é a junção de qualidade, segurança e conforto que os operadores precisam para alcançar a excelência em transporte e mobilidade urbana. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'185 cv (136kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'700 Nm (71,4 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 71-6 i = 9,201 / 5,230 / 3,145 / 2,034 / 1,374 / 1,00 marcha à ré = 8,649'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'16.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'4,778 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"até 65","comprimento":"até 11,3","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619l","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1619L/52','public/assets/documents/modelos/mercedes-of-1619l-52-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619l',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','16.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','4,778 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','até 11,3',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','até 65',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1619l-52' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1619L/52')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1721/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1721/59','mercedes-of-1721-59','O pioneirismo do OF 1721 continua indiscutível no mercado. Desenvolvido com motor OM 924 LA de 4 cilindros, potência de 208 cv e 780 Nm de torque, esse chassi prioriza a economia de combustível, a rentabilidade e a qualidade do transporte. Com PBT de 17 toneladas, o OF 1721 recebe carrocerias de até 13,2 metros de comprimento para aplicações fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','208 cv (153 kW) a 2.200 rpm','780 Nm (79,5 kgfm) a 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','17.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1721-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1721/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O pioneirismo do OF 1721 continua indiscutível no mercado. Desenvolvido com motor OM 924 LA de 4 cilindros, potência de 208 cv e 780 Nm de torque, esse chassi prioriza a economia de combustível, a rentabilidade e a qualidade do transporte. Com PBT de 17 toneladas, o OF 1721 recebe carrocerias de até 13,2 metros de comprimento para aplicações fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'208 cv (153 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'780 Nm (79,5 kgfm) a 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1721/59','public/assets/documents/modelos/mercedes-of-1721-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','11.3 (encurtado) ::: 12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1721-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1721L/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1721L/59','of-1721l-59','Projetado para criar uma variação na família de OFs de 17 toneladas e atender cidades que buscam soluções na mobilidade urbana, o OF 1721L surpreende pelo conforto, estabilidade e qualidade que a suspensão pneumática oferece aos passageiros. Esta solução diminui o nível de trepidações do chassi e reduz o ruído interno do veículo. Além disso, é equipado com motor OM 924 LA de 4 cilindros e peças de comum utilização em outros produtos, possibilitando a intercambialidade de componentes com outros modelos Mercedes-Benz. A aplicação do chassi atende às demandas de transporte urbano, fretamento e rodoviário de curta distância, oferecendo versatilidade para diferentes necessidades do setor de transporte. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 924 LA (Proconve P-8 / Euro VI)','208 cv (153 kW) a 2.200 rpm','780 Nm (79,5 kgfm) de 1.200 a 1.600 rpm',NULL,'17.000 kg','Não se aplica','5,875:1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721l","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='of-1721l-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1721L/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Projetado para criar uma variação na família de OFs de 17 toneladas e atender cidades que buscam soluções na mobilidade urbana, o OF 1721L surpreende pelo conforto, estabilidade e qualidade que a suspensão pneumática oferece aos passageiros. Esta solução diminui o nível de trepidações do chassi e reduz o ruído interno do veículo. Além disso, é equipado com motor OM 924 LA de 4 cilindros e peças de comum utilização em outros produtos, possibilitando a intercambialidade de componentes com outros modelos Mercedes-Benz. A aplicação do chassi atende às demandas de transporte urbano, fretamento e rodoviário de curta distância, oferecendo versatilidade para diferentes necessidades do setor de transporte. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 924 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'208 cv (153 kW) a 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'780 Nm (79,5 kgfm) de 1.200 a 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),NULL),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875:1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721l","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1721L/59','public/assets/documents/modelos/mercedes-of-1721l-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721l',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875:1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','11.3 (encurtado) ::: 12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='of-1721l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1721L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1726/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1726/59','mercedes-of-1726-59','O OF 1726 possui um sistema modular que facilita o arranjo de componentes do ônibus e é de fácil aquisição no mercado. Consagrado com o motor OM 926 LA, de 260 cv e 900 Nm de torque, esse chassi apresenta um ótimo desempenho, economia e rentabilidade ao operador que transita em vias urbanas, intermunicipais, rodoviárias e/ou de fretamento. Com versatilidade de encarroçamento, o veículo pode ser montado sobre carrocerias de até 13,2 metros de comprimento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','260 cv (191 kW) @ 2.200 rpm','900 Nm (91,7 kgf.m) @ 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','17.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1726-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1726/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'O OF 1726 possui um sistema modular que facilita o arranjo de componentes do ônibus e é de fácil aquisição no mercado. Consagrado com o motor OM 926 LA, de 260 cv e 900 Nm de torque, esse chassi apresenta um ótimo desempenho, economia e rentabilidade ao operador que transita em vias urbanas, intermunicipais, rodoviárias e/ou de fretamento. Com versatilidade de encarroçamento, o veículo pode ser montado sobre carrocerias de até 13,2 metros de comprimento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'260 cv (191 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'900 Nm (91,7 kgf.m) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"11.3 (encurtado) ::: 12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1726/59','public/assets/documents/modelos/mercedes-of-1726-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','11.3 (encurtado) ::: 12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

-- OF 1726L/59
INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,'OF 1726L/59','mercedes-of-1726l-59','Novidade no mercado, o OF 1726L destaca-se pelo alto nível de conforto e estabilidade que a suspensão pneumática proporciona e pela variedade de aplicações que assume. Preparado para receber carrocerias de até 13,2 metros, o veículo é equipado com motor OM 926 LA, de 6 cilindros e 260 cv e 900 Nm, consagrando a economia e a rentabilidade necessárias para aplicações urbanas (inclusive BRT), intermunicipais, rodoviárias e de fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.','MB OM 926 LA (Proconve P-8 / Euro VI)','260 cv (191 kW) @ 2.200 rpm','900 Nm (91,7 kgfm) @ 1.200 - 1.600 rpm','Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29','17.000 kg','Não se aplica','5,875 :1','{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726l","conferido_em":"2026-08-27"}',1
FROM familias f JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND f.nome='OF Urbanos e Fretamento'
  AND NOT EXISTS (SELECT 1 FROM modelos mx JOIN familias fx ON fx.id=mx.familia_id JOIN marcas maxx ON maxx.id=fx.marca_id
                  WHERE maxx.slug='mercedes-benz' AND (mx.slug='mercedes-of-1726l-59' OR LOWER(TRIM(mx.nome))=LOWER(TRIM('OF 1726L/59'))))
LIMIT 1;
UPDATE modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
SET m.descricao=COALESCE(NULLIF(TRIM(m.descricao),''),'Novidade no mercado, o OF 1726L destaca-se pelo alto nível de conforto e estabilidade que a suspensão pneumática proporciona e pela variedade de aplicações que assume. Preparado para receber carrocerias de até 13,2 metros, o veículo é equipado com motor OM 926 LA, de 6 cilindros e 260 cv e 900 Nm, consagrando a economia e a rentabilidade necessárias para aplicações urbanas (inclusive BRT), intermunicipais, rodoviárias e de fretamento. *A foto é apenas representativa, o chassi pode apresentar diferenças construtivas.'),
    m.motor=COALESCE(NULLIF(TRIM(m.motor),''),'MB OM 926 LA (Proconve P-8 / Euro VI)'),
    m.potencia=COALESCE(NULLIF(TRIM(m.potencia),''),'260 cv (191 kW) @ 2.200 rpm'),
    m.torque=COALESCE(NULLIF(TRIM(m.torque),''),'900 Nm (91,7 kgfm) @ 1.200 - 1.600 rpm'),
    m.transmissao=COALESCE(NULLIF(TRIM(m.transmissao),''),'Manual MB G 90–6 , de seis marchas (com radiador de óleo) i = 6,70 / 3,81 / 2,29 / 1,48 / 1,00 / 0,73 marcha à ré = 6,29'),
    m.pbt=COALESCE(NULLIF(TRIM(m.pbt),''),'17.000 kg'),
    m.pbtc=COALESCE(NULLIF(TRIM(m.pbtc),''),'Não se aplica'),
    m.relacao_reducao=COALESCE(NULLIF(TRIM(m.relacao_reducao),''),'5,875 :1'),
    m.especificacoes=JSON_MERGE_PATCH('{"tipo_veiculo":"Ônibus","energia":"Diesel","tipo_carroceria":"Chassi de ônibus","emissoes":"Proconve P8 / Euro 6","capacidade_passageiros":"70 a 80","comprimento":"12.7 a 13.2 (alongado)","fonte_oficial":"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf","fonte_pagina":"https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726l","conferido_em":"2026-08-27"}',COALESCE(m.especificacoes,JSON_OBJECT())),m.ativo=1
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')));
INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica','Ficha técnica oficial - OF 1726L/59','public/assets/documents/modelos/mercedes-of-1726l-59-ficha-tecnica.pdf','https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726l',1
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),
 arquivo=COALESCE(NULLIF(VALUES(arquivo),''),arquivo),
 url_origem=COALESCE(NULLIF(VALUES(url_origem),''),url_origem),
 fonte_pagina=VALUES(fonte_pagina),ativo=1;
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbt','PBT','17.000 kg',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'pbtc','PBTC','Não se aplica',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'relacao_reducao','Relação de redução','5,875 :1',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'tipo_carroceria','Tipo de carroceria','Chassi de ônibus',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'comprimento','Comprimento','12.7 a 13.2 (alongado)',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'capacidade_passageiros','Capacidade de passageiros','70 a 80',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'energia','Energia / propulsão','Diesel',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));
INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,'emissoes','Norma de emissões','Proconve P8 / Euro 6',NULL,'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf','2026-08-27'
FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
WHERE ma.slug='mercedes-benz' AND (m.slug='mercedes-of-1726l-59' OR LOWER(TRIM(m.nome))=LOWER(TRIM('OF 1726L/59')))
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),
 valor=IF(NULLIF(TRIM(valor),'') IS NULL,VALUES(valor),valor),
 fonte_url=IF(NULLIF(TRIM(fonte_url),'') IS NULL,VALUES(fonte_url),fonte_url),
 conferido_em=GREATEST(COALESCE(conferido_em,'1000-01-01'),VALUES(conferido_em));

INSERT INTO schema_migrations(versao,descricao)
VALUES ('20260827_027_sincronizacao_mercedes_chassis','Sincronização técnica oficial Mercedes-Benz caminhões e ônibus')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
