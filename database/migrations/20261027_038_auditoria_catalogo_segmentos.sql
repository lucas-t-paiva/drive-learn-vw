-- Drive Learn VW | Auditoria oficial por marca e segmento
-- Data da consulta: 27/10/2026
-- Executar depois de 20261027_037_corrige_cadastro_meteor_ultra.sql
--
-- Escopo desta carga:
--   VWCO: Constellation 25.380 rigido 6x2/8x2 e e-Volksbus 18H/22H.
--   BYD: chassis de onibus comprovadamente apresentados/operados no Brasil.
--   Agrale: linha comercial brasileira de caminhoes e chassis para onibus.
--   Foton: caminhoes e vans eletricas com PBT homologado publicado no Brasil.
--
-- Somente fontes publicas oficiais dos fabricantes/encarroçadores envolvidos.
-- Nao inclui modelos estrangeiros como se fossem linha brasileira.
-- Reexecucao segura: a tabela de apoio e recriada e os slugs sao conciliados.

SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS schema_migrations (
  versao VARCHAR(80) NOT NULL PRIMARY KEY,
  descricao VARCHAR(255) NOT NULL,
  aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS migration_catalogo_20261027_038;
CREATE TABLE migration_catalogo_20261027_038 (
  marca_slug VARCHAR(140) NOT NULL,
  familia VARCHAR(120) NOT NULL,
  tipo_familia ENUM('caminhao','onibus','van') NOT NULL,
  modelo VARCHAR(180) NOT NULL,
  slug VARCHAR(180) NOT NULL PRIMARY KEY,
  descricao TEXT,
  motor VARCHAR(160), potencia VARCHAR(120), torque VARCHAR(120),
  transmissao VARCHAR(180), pbt VARCHAR(80), pbtc VARCHAR(100), reducao VARCHAR(160),
  specs_json LONGTEXT NOT NULL,
  fonte_url VARCHAR(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migration_catalogo_20261027_038 VALUES
-- VWCO | caminhoes e onibus
('volkswagen-caminhoes-e-onibus','Constellation','caminhao','Constellation 25.380 6x2','constellation-25-380-6x2','Caminhao rigido rodoviario 6x2 da linha Constellation.','Cummins ISL','380 cv',NULL,'V-Tronic automatizada de 12 marchas','26.600 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2, rígido","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","pbt_criterio":"PBT técnico","consultado_em":"2026-10-27"}',
 'https://www.vwco.com.br/news/776'),
('volkswagen-caminhoes-e-onibus','Constellation','caminhao','Constellation 25.380 8x2','constellation-25-380-8x2','Caminhao rigido rodoviario 8x2 da linha Constellation.','Cummins ISL','380 cv',NULL,'V-Tronic automatizada de 12 marchas','32.200 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"8x2, rígido","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","pbt_criterio":"PBT técnico","consultado_em":"2026-10-27"}',
 'https://www.vwco.com.br/news/776'),
('volkswagen-caminhoes-e-onibus','Urbano','onibus','e-Volksbus 18H','e-volksbus-18h','Chassi eletrico de piso alto para fretamento.','VW SD 460',NULL,NULL,'Tracao eletrica direta',NULL,NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"4x2, piso alto","tipo_carroceria":"Chassi de ônibus","autonomia":"Até 250 km","situacao_comercial":"Comercialização iniciada na Lat.Bus 2026","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.vwco.com.br/news/814'),
('volkswagen-caminhoes-e-onibus','Urbano','onibus','e-Volksbus 22H','e-volksbus-22h','Chassi eletrico de piso alto para operacoes urbanas e corredores BRT.','VW SD 460','280 kW (380 cv)','2.450 Nm','Tracao eletrica direta','17.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"6x2, piso alto","tipo_carroceria":"Chassi de ônibus","autonomia":"Até 250 km","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.vwco.com.br/onibus/Urbano?id=5'),

-- BYD | onibus efetivamente apresentados ou operados no Brasil
('byd','Ônibus Elétricos Urbanos','onibus','BYD D9A','byd-d9a','Chassi padron eletrico utilizado em operacoes e testes urbanos brasileiros.','Dois motores elétricos integrados às rodas traseiras',NULL,NULL,'Tração elétrica direta com regeneração',NULL,NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"Padron urbano","tipo_carroceria":"Chassi de ônibus","autonomia":"Até 250 km","capacidade_passageiros":"Até 78 passageiros","situacao_comercial":"Em operação/testes no Brasil","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH'),
('byd','Ônibus Elétricos Urbanos','onibus','BYD D9W Low Entry','byd-d9w-low-entry','Chassi eletrico Low Entry utilizado em operacoes urbanas brasileiras.','Motores elétricos integrados às rodas traseiras',NULL,NULL,'Tração elétrica direta com regeneração',NULL,NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"Low Entry urbano","tipo_carroceria":"Chassi de ônibus","situacao_comercial":"Operação comprovada no Brasil","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://viajante.marcopolo.com.br/noticias/onibus-100-eletrico-marcopolo-e-byd/'),
('byd','Ônibus Elétricos Rodoviários','onibus','BYD D9F 20.410','byd-d9f-20-410','Chassi eletrico para fretamento e operacao rodoviaria.','2 x BYD 2912TZ-XY-A','402 cv (máxima)','1.100 Nm (máximo)','Automática / tração elétrica direta','20.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"Rodoviário / fretamento","tipo_carroceria":"Chassi de ônibus","bateria":"6 packs","autonomia":"Até 300 km","capacidade_passageiros":"44 passageiros na aplicação divulgada","comprimento":"12.900 mm na aplicação divulgada","situacao_comercial":"Em operação no Brasil","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://viajante.marcopolo.com.br/noticias/marcopolo-fornece-viaggio-1050-100-eletrico-para-fretamento-no-parana/'),
('byd','Ônibus Elétricos Articulados','onibus','BYD D11B','byd-d11b','Chassi articulado eletrico apresentado e testado em operacao urbana brasileira.','Motores elétricos',NULL,NULL,'Tração elétrica direta',NULL,NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"100% elétrico","configuracao":"Articulado urbano","tipo_carroceria":"Chassi de ônibus articulado","autonomia":"Até 250 km","capacidade_passageiros":"Até 170 passageiros","comprimento":"22.000 mm","situacao_comercial":"Testado no Brasil","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.marcopolo.com.br/sala-de-imprensa/byd-e-marcopolo-testarao-onibus-articulado-100-eletrico-em-curitiba'),

-- Agrale | chassis para onibus atuais
('agrale','Microbus','onibus','Agrale MA 9.2','agrale-ma-9-2','Chassi para micro-onibus urbano, rodoviario e de fretamento.','Cummins F3.8','175 cv @ 2.500 rpm','600 Nm @ 1.100-1.800 rpm','Manual de 5 marchas','9.200 kg',NULL,'4,30:1; opcionais 4,10 / 4,56 / 4,78 / 5,38:1',
 '{"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi para micro-ônibus","entre_eixos":"4.200 / 4.500 mm","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/chassis-para-onibus/linha-microbus/ma-9-2'),
('agrale','Microbus','onibus','Agrale MA 10.0','agrale-ma-10-0','Chassi para micro-onibus de maior capacidade.','Cummins F3.8','175 cv @ 2.500 rpm','600 Nm @ 1.100-1.800 rpm','Manual de 5 marchas','10.000 kg',NULL,'4,88:1 ou 4,30:1; opcionais conforme entre-eixos',
 '{"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi para micro-ônibus","entre_eixos":"4.500 / 4.800 / 5.500 mm","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/download/147'),
('agrale','Microbus','onibus','Agrale MA 11.0 Gás','agrale-ma-11-0-gas','Chassi para micro-onibus movido a GNV ou biometano.','Weichai WP4.6NNG','195 cv @ 2.300 rpm','642 Nm @ 1.400 rpm',NULL,NULL,NULL,NULL,
 '{"tipo_veiculo":"Ônibus","energia":"GNV / Biometano","configuracao":"4x2","tipo_carroceria":"Chassi para micro-ônibus","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/chassis-para-onibus/linha-microbus/ma-11-0-gas'),
('agrale','Midibus','onibus','Agrale MA 17.0','agrale-ma-17-0','Chassi para midibus urbano e fretamento.','Cummins F4.5','213 cv @ 2.200 rpm','780 Nm @ 1.300-1.500 rpm','Eaton FS 5406 B, 6 marchas','17.000 kg',NULL,'4,89:1; opcionais 4,10 / 4,56 / 5,38:1',
 '{"tipo_veiculo":"Ônibus","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi para midibus","pbt_legal":"16.000 kg","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/chassis-para-onibus/linha-midibus/ma-17-0'),

-- Agrale | caminhoes atuais
('agrale','Linha A','caminhao','Agrale A 8.700','agrale-a-8-700','Caminhao leve para distribuicao urbana e regional.','Cummins F3.8','175 cv','600 Nm @ 1.100-1.800 rpm','Manual','8.700 kg','11.000 kg','4,10:1; opcionais 4,63 / 5,38:1',
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","cmt":"11.000 kg","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/caminhoes/caminhoes-leves/caminhao-agrale-a-8-700'),
('agrale','Linha A','caminhao','Agrale A 10.000','agrale-a-10-000','Caminhao leve para multiplas aplicacoes.','Cummins F3.8','175 cv','600 Nm @ 1.100-1.800 rpm','Manual','10.700 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","cmt":"13.000 kg","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/caminhoes/caminhoes-leves/caminhao-agrale-a-10-000'),
('agrale','Linha A','caminhao','Agrale A 10.000 4x4','agrale-a-10-000-4x4','Caminhao leve com tracao integral e opcao de cambio automatico.','Cummins F3.8','175 cv','600 Nm @ 1.100-1.800 rpm','Manual ou automática conforme versão','10.700 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x4","tipo_carroceria":"Chassi-cabine","cmt":"13.000 kg","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/caminhoes/caminhoes-leves/caminhao-agrale-a-10-000-4x4'),
('agrale','Linha A','caminhao','Agrale A 11.000 Gás','agrale-a-11-000-gas','Caminhao leve movido a GNV ou biometano.','Weichai WP4.6NNG200E60','195 cv @ 2.300 rpm','642 Nm @ 1.400 rpm',NULL,'10.700 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"GNV / Biometano","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/caminhoes/caminhoes-leves/caminhao-agrale-a-11-000-gas'),
('agrale','Linha A Médios','caminhao','Agrale A 15.000','agrale-a-15-000','Caminhao medio para distribuicao urbana e rodoviaria.','Cummins F4.5','213 cv','780 Nm @ 1.300-1.500 rpm',NULL,'15.000 kg',NULL,'4,56 / 6,36:1; opcionais 4,10 / 5,72 / 4,88:1',
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","cmt":"23.000 kg","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/caminhoes/medios/caminhao-agrale-a-15-000'),
('agrale','Linha A Semipesados','caminhao','Agrale A 18.000','agrale-a-18-000','Caminhao semipesado para operacoes de maior capacidade.','Cummins F4.5','213 cv','780 Nm @ 1.300-1.500 rpm',NULL,'17.600 kg',NULL,'4,56 / 6,36:1; opcionais 4,10 / 5,72 / 5,29:1',
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","pbt_legal":"16.000 kg","cmt":"27.000 kg","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}',
 'https://www.agrale.com.br/pt/detalhes/caminhoes/medios/caminhao-agrale-a-18-000'),

-- Foton | caminhoes diesel e eletricos homologados no catalogo brasileiro
('foton','Aumark S','caminhao','Foton Aumark S 315','foton-aumark-s-315','Caminhao urbano leve da linha Aumark S.','Cummins F2.5','150 cv @ 2.900 rpm','400 Nm @ 1.200-2.500 rpm','5S408','3.500 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','Aumark S','caminhao','Foton Aumark S 715','foton-aumark-s-715','Caminhao leve da linha Aumark S.','Cummins F2.5','150 cv @ 2.900 rpm','400 Nm @ 1.200-2.500 rpm','5S408','7.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','Aumark S','caminhao','Foton Aumark S 916','foton-aumark-s-916','Caminhao leve da linha Aumark S.','Cummins F3.8','160 cv @ 2.600 rpm','500 Nm @ 1.100-1.900 rpm','6S558','9.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','Aumark S','caminhao','Foton Aumark S 1217','foton-aumark-s-1217','Caminhao medio da linha Aumark S.','Cummins F3.8','170 cv @ 2.600 rpm','600 Nm @ 1.200-1.900 rpm','6S558','11.500 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','Auman D','caminhao','Foton Auman D 1722','foton-auman-d-1722','Caminhao semipesado para distribuicao urbana e regional.','Cummins F4.5','220 cv @ 2.300 rpm','820 Nm @ 1.200-1.500 rpm','ZF 6S1000 TO manual, 6 marchas','16.000 kg','26.000 kg','4,889:1',
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","pbt_tecnico":"18.700 kg","cmt":"26.000 kg","situacao_comercial":"Linha atual / pronta entrega","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos/auman-d-1722'),
('foton','Auman D','caminhao','Foton Auman D 1830','foton-auman-d-1830','Caminhao semipesado da linha Auman D.','Cummins D6.7','282 cv','1.100 Nm @ 1.100-1.600 rpm','ZF 9AS1517TO automatizada, 9 marchas','16.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos/auman-d-1722'),
('foton','Auman D','caminhao','Foton Auman D 2632','foton-auman-d-2632','Caminhao semipesado 6x2 da linha Auman D.','Cummins D6.7','320 cv','1.200 Nm @ 1.100-1.600 rpm','ZF 9AS1517TO automatizada, 9 marchas','23.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"Diesel","configuracao":"6x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos/auman-d-1722'),
('foton','eAumark','caminhao','Foton eAumark 6T','foton-eaumark-6t','Caminhao eletrico urbano.','Síncrono de ímã permanente','167 kW (227 cv)','410 Nm','Tração elétrica direta','6.000 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"100% elétrico","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','eAumark','caminhao','Foton eAumark 9T','foton-eaumark-9t','Caminhao eletrico urbano.','Síncrono de ímã permanente','150 kW (177 cv)','560 Nm','Tração elétrica direta','8.500 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"100% elétrico","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','eAumark','caminhao','Foton eAumark 12T','foton-eaumark-12t','Caminhao eletrico urbano.','Síncrono de ímã permanente','260 kW (353 cv)','2.800 Nm','Tração elétrica direta','11.500 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"100% elétrico","configuracao":"4x2","tipo_carroceria":"Chassi-cabine","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://fotondobrasil.com.br/veiculos'),
('foton','eWonder','caminhao','Foton eWonder','foton-ewonder','Mini truck eletrico para logistica urbana.','Síncrono de ímã permanente','75 kW (102 cv)','220 Nm','Tração elétrica direta','2.550 kg',NULL,NULL,
 '{"tipo_veiculo":"Caminhão","energia":"100% elétrico","configuracao":"Chassi-cabine","tipo_carroceria":"Mini truck","bateria":"41 kWh","autonomia":"189 km INMETRO","capacidade_carga":"1,3 t","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://www.fotondobrasil.com.br/veiculos/ewonder'),

-- Foton | vans eletricas homologadas no catalogo brasileiro
('foton','eView','van','Foton eView Connect','foton-eview-connect','Van eletrica compacta para entregas urbanas.','Síncrono de ímã permanente','125 kW (170 cv)','245 Nm','Tração elétrica direta','2.900 kg',NULL,NULL,
 '{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"Furgão","tipo_carroceria":"Van de carga","bateria":"53 kWh","volume_carga":"7,2 m³","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://www.fotondobrasil.com.br/veiculos'),
('foton','eView','van','Foton eView Grand','foton-eview-grand','Van eletrica para logistica urbana.','Síncrono de ímã permanente','135 kW (184 cv)','330 Nm','Tração elétrica direta','3.495 kg',NULL,NULL,
 '{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"Furgão","tipo_carroceria":"Van de carga","bateria":"77 kWh","autonomia":"187 km INMETRO / 303 km WLTP","volume_carga":"6,8 ou 7,9 m³","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://www.fotondobrasil.com.br/veiculos/eview-grand'),
('foton','eToano','van','Foton eToano Pro','foton-etoano-pro','Van eletrica de grande volume para logistica.','Síncrono de ímã permanente','130 kW (176 cv)','330 Nm','Tração elétrica direta','3.500 kg',NULL,NULL,
 '{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"Furgão M ou H","tipo_carroceria":"Van de carga","bateria":"77 kWh","autonomia":"179 km INMETRO / 252 km WLTP","volume_carga":"10,4 ou 12,2 m³","situacao_comercial":"Linha atual","mercado":"Brasil","consultado_em":"2026-10-27"}','https://www.fotondobrasil.com.br/veiculos/etoano-pro');

-- Familias ausentes.
INSERT INTO familias (marca_id,tipo_veiculo,nome,descricao,ativo)
SELECT ma.id,s.tipo_familia,s.familia,CONCAT('Linha ',s.familia,' da ',ma.nome,'.'),1
FROM (SELECT DISTINCT marca_slug,familia,tipo_familia FROM migration_catalogo_20261027_038) s
JOIN marcas ma ON ma.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci
WHERE NOT EXISTS (
  SELECT 1 FROM familias f
  WHERE f.marca_id=ma.id AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.familia) COLLATE utf8mb4_unicode_ci
);

UPDATE familias f
JOIN marcas ma ON ma.id=f.marca_id
JOIN (SELECT DISTINCT marca_slug,familia,tipo_familia FROM migration_catalogo_20261027_038) s
  ON ma.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci
 AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.familia) COLLATE utf8mb4_unicode_ci
SET f.tipo_veiculo=s.tipo_familia,f.ativo=1;

-- Modelos novos.
INSERT INTO modelos
  (familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,s.modelo,s.slug,s.descricao,NULLIF(s.motor,''),NULLIF(s.potencia,''),NULLIF(s.torque,''),
       NULLIF(s.transmissao,''),NULLIF(s.pbt,''),NULLIF(s.pbtc,''),NULLIF(s.reducao,''),s.specs_json,1
FROM migration_catalogo_20261027_038 s
JOIN marcas ma ON ma.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci
JOIN familias f ON f.marca_id=ma.id AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.familia) COLLATE utf8mb4_unicode_ci
WHERE NOT EXISTS (
  SELECT 1 FROM modelos m WHERE m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci
);

-- Concilia cadastros existentes e corrige classificacoes antigas sem apagar campos curados.
UPDATE modelos m
JOIN migration_catalogo_20261027_038 s ON s.slug COLLATE utf8mb4_unicode_ci=m.slug COLLATE utf8mb4_unicode_ci
JOIN marcas ma ON ma.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci
JOIN familias f ON f.marca_id=ma.id AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.familia) COLLATE utf8mb4_unicode_ci
SET m.familia_id=f.id,
    m.nome=s.modelo,
    m.descricao=s.descricao,
    m.motor=COALESCE(NULLIF(s.motor,''),m.motor),
    m.potencia=COALESCE(NULLIF(s.potencia,''),m.potencia),
    m.torque=COALESCE(NULLIF(s.torque,''),m.torque),
    m.transmissao=COALESCE(NULLIF(s.transmissao,''),m.transmissao),
    m.pbt=COALESCE(NULLIF(s.pbt,''),m.pbt),
    m.pbtc=COALESCE(NULLIF(s.pbtc,''),m.pbtc),
    m.relacao_reducao=COALESCE(NULLIF(s.reducao,''),m.relacao_reducao),
    m.especificacoes=JSON_MERGE_PATCH(COALESCE(m.especificacoes,JSON_OBJECT()),s.specs_json),
    m.ativo=1;

-- Fonte oficial visivel no catalogo. Usa tipo "outro" quando a fonte e pagina de produto/noticia,
-- evitando classificar uma pagina HTML como PDF de ficha tecnica.
INSERT INTO modelo_documentos (modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'outro',CONCAT('Fonte oficial — ',s.modelo),NULL,s.fonte_url,s.fonte_url,1
FROM migration_catalogo_20261027_038 s
JOIN modelos m ON m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci
WHERE NOT EXISTS (
  SELECT 1 FROM modelo_documentos d
  WHERE d.modelo_id=m.id AND d.url_origem COLLATE utf8mb4_unicode_ci=s.fonte_url COLLATE utf8mb4_unicode_ci
);

-- Campos homologados usados pelo comparador e pelo assistente.
INSERT INTO modelo_especificacoes_tecnicas
  (modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,k.chave,k.rotulo,JSON_UNQUOTE(JSON_EXTRACT(s.specs_json,CONCAT('$.',k.chave))),NULL,s.fonte_url,'2026-10-27'
FROM migration_catalogo_20261027_038 s
JOIN modelos m ON m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci
CROSS JOIN (
  SELECT 'tipo_veiculo' chave,'Tipo de veículo' rotulo
  UNION ALL SELECT 'energia','Energia / propulsão'
  UNION ALL SELECT 'configuracao','Configuração / tração'
  UNION ALL SELECT 'tipo_carroceria','Tipo de carroceria'
  UNION ALL SELECT 'entre_eixos','Entre-eixos'
  UNION ALL SELECT 'bateria','Bateria'
  UNION ALL SELECT 'autonomia','Autonomia'
  UNION ALL SELECT 'capacidade_passageiros','Capacidade de passageiros'
  UNION ALL SELECT 'capacidade_carga','Capacidade de carga'
  UNION ALL SELECT 'volume_carga','Volume de carga'
  UNION ALL SELECT 'comprimento','Comprimento'
  UNION ALL SELECT 'cmt','CMT'
  UNION ALL SELECT 'pbt_legal','PBT legal'
  UNION ALL SELECT 'situacao_comercial','Situação comercial'
  UNION ALL SELECT 'mercado','Mercado / aplicação'
) k
WHERE JSON_EXTRACT(s.specs_json,CONCAT('$.',k.chave)) IS NOT NULL
ON DUPLICATE KEY UPDATE
  rotulo=VALUES(rotulo),valor=VALUES(valor),fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);

-- Campos principais tambem entram na tabela normalizada.
INSERT INTO modelo_especificacoes_tecnicas
  (modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,k.chave,k.rotulo,
       CASE k.chave
         WHEN 'motor' THEN s.motor WHEN 'potencia' THEN s.potencia WHEN 'torque' THEN s.torque
         WHEN 'transmissao' THEN s.transmissao WHEN 'pbt' THEN s.pbt WHEN 'pbtc' THEN s.pbtc
         WHEN 'relacao_reducao' THEN s.reducao END,
       CASE WHEN k.chave IN ('pbt','pbtc') THEN 'kg' ELSE NULL END,
       s.fonte_url,'2026-10-27'
FROM migration_catalogo_20261027_038 s
JOIN modelos m ON m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci
CROSS JOIN (
  SELECT 'motor' chave,'Motor' rotulo UNION ALL SELECT 'potencia','Potência'
  UNION ALL SELECT 'torque','Torque' UNION ALL SELECT 'transmissao','Transmissão'
  UNION ALL SELECT 'pbt','PBT' UNION ALL SELECT 'pbtc','PBTC'
  UNION ALL SELECT 'relacao_reducao','Relação de redução'
) k
WHERE CASE k.chave
        WHEN 'motor' THEN s.motor WHEN 'potencia' THEN s.potencia WHEN 'torque' THEN s.torque
        WHEN 'transmissao' THEN s.transmissao WHEN 'pbt' THEN s.pbt WHEN 'pbtc' THEN s.pbtc
        WHEN 'relacao_reducao' THEN s.reducao END IS NOT NULL
ON DUPLICATE KEY UPDATE
  rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);

INSERT INTO schema_migrations (versao,descricao)
VALUES ('20261027_038','Auditoria oficial por marca e segmento: VWCO, BYD, Agrale e Foton')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

DROP TABLE migration_catalogo_20261027_038;
