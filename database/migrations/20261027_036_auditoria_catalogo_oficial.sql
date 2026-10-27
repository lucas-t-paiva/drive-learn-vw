-- Drive Learn VW
-- Auditoria oficial do catalogo em 27/10/2026.
-- Fontes consultadas: somente paginas publicas dos fabricantes.
--
-- Novidades materiais confirmadas nesta rodada:
--   1. FIAT Ducato Minibus Luxo 16L MY2027, com preco publico oficial.
--   2. Tres configuracoes Ford Transit Furgao publicadas no catalogo atual.
--   3. Central multimidia SYNC 4 de 12 polegadas na linha Ford Transit Furgao.
--
-- Esta migration deve ser executada depois de:
--   20261017_032_segmento_vans_precos_catalogo.sql
--
-- Nao executa conexoes externas e nao altera diretamente a HostGator.
-- Reexecucao segura: todos os INSERTs possuem verificacao de existencia.

SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 1. Garante a marca e a familia utilizadas pela nova versao.
-- ---------------------------------------------------------------------------
INSERT INTO marcas (nome,slug,pais_origem,site_oficial,descricao,ativo)
SELECT
  'Fiat',
  'fiat',
  'Italia',
  'https://www.fiat.com.br/',
  'Fabricante com veiculos comerciais no segmento de vans.',
  1
WHERE NOT EXISTS (
  SELECT 1
  FROM marcas m
  WHERE m.slug COLLATE utf8mb4_unicode_ci = 'fiat' COLLATE utf8mb4_unicode_ci
     OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci = 'fiat' COLLATE utf8mb4_unicode_ci
);

INSERT INTO familias (marca_id,nome,descricao,ativo,tipo_veiculo)
SELECT
  m.id,
  'Ducato',
  'Linha de vans Fiat Ducato para transporte de cargas e passageiros.',
  1,
  'van'
FROM marcas m
WHERE (m.slug COLLATE utf8mb4_unicode_ci = 'fiat' COLLATE utf8mb4_unicode_ci
    OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci = 'fiat' COLLATE utf8mb4_unicode_ci)
  AND NOT EXISTS (
    SELECT 1
    FROM familias f
    WHERE f.marca_id=m.id
      AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci = 'ducato' COLLATE utf8mb4_unicode_ci
  )
ORDER BY m.id
LIMIT 1;

-- ---------------------------------------------------------------------------
-- 2. Nova configuracao oficial: Ducato Minibus Luxo 16L MY2027.
-- ---------------------------------------------------------------------------
INSERT INTO modelos (
  familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,
  relacao_reducao,ativo,especificacoes
)
SELECT
  f.id,
  'Ducato Minibus Luxo 16L',
  'fiat-ducato-minibus-luxo-16l',
  'Minibus Fiat Ducato Luxo para transporte executivo de passageiros, ano-modelo 2027.',
  '2.2 Turbo Diesel BlueHDi',
  '140 cv @ 3.500 rpm',
  '350 Nm @ 1.500 rpm',
  'Manual de 6 marchas',
  NULL,
  NULL,
  1,
  JSON_OBJECT(
    'tipo_veiculo','Van',
    'energia','Diesel S10',
    'configuracao','4x2, tracao dianteira',
    'tipo_carroceria','Minibus de passageiros',
    'capacidade_passageiros','16 lugares, conforme nomenclatura oficial 16L',
    'mercado','Transporte executivo de passageiros',
    'ano_modelo','2027',
    'situacao_comercial','Linha atual',
    'fonte_url','https://ducato.fiat.com.br/monte.html?mvs=529GMF0&openFundingPlans=true&year=2027',
    'consultado_em','2026-10-27'
  )
FROM familias f
JOIN marcas m ON m.id=f.marca_id
WHERE (m.slug COLLATE utf8mb4_unicode_ci = 'fiat' COLLATE utf8mb4_unicode_ci
    OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci = 'fiat' COLLATE utf8mb4_unicode_ci)
  AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci = 'ducato' COLLATE utf8mb4_unicode_ci
  AND NOT EXISTS (
    SELECT 1
    FROM modelos x
    WHERE x.slug COLLATE utf8mb4_unicode_ci = 'fiat-ducato-minibus-luxo-16l' COLLATE utf8mb4_unicode_ci
  )
ORDER BY f.id
LIMIT 1;

-- Completa a configuracao caso o modelo ja tenha sido criado anteriormente.
UPDATE modelos
SET
  descricao=CASE WHEN descricao IS NULL OR TRIM(descricao)='' THEN
    'Minibus Fiat Ducato Luxo para transporte executivo de passageiros, ano-modelo 2027.'
    ELSE descricao END,
  motor=CASE WHEN motor IS NULL OR TRIM(motor)='' THEN '2.2 Turbo Diesel BlueHDi' ELSE motor END,
  potencia=CASE WHEN potencia IS NULL OR TRIM(potencia)='' THEN '140 cv @ 3.500 rpm' ELSE potencia END,
  torque=CASE WHEN torque IS NULL OR TRIM(torque)='' THEN '350 Nm @ 1.500 rpm' ELSE torque END,
  transmissao=CASE WHEN transmissao IS NULL OR TRIM(transmissao)='' THEN 'Manual de 6 marchas' ELSE transmissao END,
  especificacoes=JSON_MERGE_PATCH(
    COALESCE(especificacoes,JSON_OBJECT()),
    JSON_OBJECT(
      'tipo_veiculo','Van',
      'energia','Diesel S10',
      'configuracao','4x2, tracao dianteira',
      'tipo_carroceria','Minibus de passageiros',
      'capacidade_passageiros','16 lugares, conforme nomenclatura oficial 16L',
      'mercado','Transporte executivo de passageiros',
      'ano_modelo','2027',
      'situacao_comercial','Linha atual',
      'fonte_url','https://ducato.fiat.com.br/monte.html?mvs=529GMF0&openFundingPlans=true&year=2027',
      'consultado_em','2026-10-27'
    )
  ),
  ativo=1
WHERE slug COLLATE utf8mb4_unicode_ci = 'fiat-ducato-minibus-luxo-16l' COLLATE utf8mb4_unicode_ci;

-- Especificacoes normalizadas utilizadas pelo comparador e pelo assistente.
INSERT INTO modelo_especificacoes_tecnicas
  (modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,s.chave,s.rotulo,s.valor,NULL,
  'https://ducato.fiat.com.br/monte.html?mvs=529GMF0&openFundingPlans=true&year=2027',
  '2026-10-27'
FROM modelos m
CROSS JOIN (
  SELECT 'tipo_veiculo' chave, 'Tipo de veiculo' rotulo, 'Van' valor
  UNION ALL SELECT 'energia','Energia / propulsao','Diesel S10'
  UNION ALL SELECT 'configuracao','Configuracao / tracao','4x2, tracao dianteira'
  UNION ALL SELECT 'tipo_carroceria','Tipo de carroceria','Minibus de passageiros'
  UNION ALL SELECT 'capacidade_passageiros','Capacidade de passageiros','16 lugares, conforme nomenclatura oficial 16L'
  UNION ALL SELECT 'mercado','Mercado / aplicacao','Transporte executivo de passageiros'
) s
WHERE m.slug COLLATE utf8mb4_unicode_ci = 'fiat-ducato-minibus-luxo-16l' COLLATE utf8mb4_unicode_ci
  AND NOT EXISTS (
    SELECT 1
    FROM modelo_especificacoes_tecnicas e
    WHERE e.modelo_id=m.id AND e.chave=s.chave
  );

UPDATE modelo_especificacoes_tecnicas e
JOIN modelos m ON m.id=e.modelo_id
SET
  e.valor=CASE e.chave
    WHEN 'tipo_veiculo' THEN 'Van'
    WHEN 'energia' THEN 'Diesel S10'
    WHEN 'configuracao' THEN '4x2, tracao dianteira'
    WHEN 'tipo_carroceria' THEN 'Minibus de passageiros'
    WHEN 'capacidade_passageiros' THEN '16 lugares, conforme nomenclatura oficial 16L'
    WHEN 'mercado' THEN 'Transporte executivo de passageiros'
    ELSE e.valor END,
  e.fonte_url='https://ducato.fiat.com.br/monte.html?mvs=529GMF0&openFundingPlans=true&year=2027',
  e.conferido_em='2026-10-27'
WHERE m.slug COLLATE utf8mb4_unicode_ci = 'fiat-ducato-minibus-luxo-16l' COLLATE utf8mb4_unicode_ci
  AND e.chave IN ('tipo_veiculo','energia','configuracao','tipo_carroceria','capacidade_passageiros','mercado');

-- Preco publico exibido pelo configurador oficial Fiat na data da consulta.
INSERT INTO modelo_precos (
  modelo_id,variante,ano_modelo,tipo_preco,valor_min,valor_max,moeda,
  fonte_url,fonte_tipo,consultado_em,observacao,ativo
)
SELECT
  m.id,
  'Novo Ducato Minibus Luxo 2.2 Diesel 4P 16L',
  '2027',
  'sugerido',
  398990.00,
  NULL,
  'BRL',
  'https://ducato.fiat.com.br/monte.html?mvs=529GMF0&openFundingPlans=true&year=2027',
  'configurador_fabricante',
  '2026-10-27',
  'Preco publico do configurador oficial Fiat na data da consulta; confirmar impostos, frete, opcionais e disponibilidade.',
  1
FROM modelos m
WHERE m.slug COLLATE utf8mb4_unicode_ci = 'fiat-ducato-minibus-luxo-16l' COLLATE utf8mb4_unicode_ci
  AND NOT EXISTS (
    SELECT 1
    FROM modelo_precos p
    WHERE p.modelo_id=m.id
      AND p.consultado_em='2026-10-27'
      AND p.valor_min=398990.00
      AND p.ano_modelo='2027'
  );

-- ---------------------------------------------------------------------------
-- 3. Configuracoes Ford Transit Furgao presentes no catalogo oficial atual e
-- ainda ausentes da carga de 17/10/2026.
-- ---------------------------------------------------------------------------
INSERT INTO modelos (
  familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,pbt,
  relacao_reducao,ativo,especificacoes
)
SELECT
  f.id,
  s.nome,
  s.slug,
  s.descricao,
  '/public/assets/images/modelos/ford-transit-20261017.webp',
  '2.0 EcoBlue Diesel',
  '165 cv / 121 kW @ 3.500 rpm',
  '390 Nm @ 1.750-2.500 rpm',
  s.transmissao,
  s.pbt,
  NULL,
  1,
  s.especificacoes
FROM familias f
JOIN marcas ma ON ma.id=f.marca_id
CROSS JOIN (
  SELECT
    'Transit Furgão L3H3 350L MT' nome,
    'ford-transit-furgao-longo-12-4-350l-mt' slug,
    'Furgão longo de 12,4 m³, PBT de 3.500 kg e câmbio manual de 6 marchas.' descricao,
    'Manual de 6 marchas' transmissao,
    '3.500 kg' pbt,
    '3.750' entre_eixos,
    JSON_OBJECT(
      'tipo_veiculo','Van','energia','Diesel S10','configuracao','4x2, tração traseira',
      'entre_eixos','3.750','tipo_carroceria','Furgão L3H3','capacidade_carga','1.181 kg',
      'volume_carga','12,4 m³','categoria_cnh','B','central_multimidia','SYNC 4 com tela de 12 polegadas',
      'mercado','Carga urbana e regional','ano_modelo','2026','situacao_comercial','Linha atual',
      'fonte_url','https://www.ford.com.br/veiculos-comerciais/transit-furgao/compare-as-versoes/furgao-l3h3/',
      'consultado_em','2026-10-27'
    ) especificacoes
  UNION ALL
  SELECT
    'Transit Furgão L3H3 380L MT',
    'ford-transit-furgao-longo-12-4-380l-mt',
    'Furgão longo de 12,4 m³, PBT de 3.750 kg e câmbio manual de 6 marchas.',
    'Manual de 6 marchas',
    '3.750 kg',
    '3.750',
    JSON_OBJECT(
      'tipo_veiculo','Van','energia','Diesel S10','configuracao','4x2, tração traseira',
      'entre_eixos','3.750','comprimento','5.981','tipo_carroceria','Furgão L3H3',
      'capacidade_carga','1.431 kg','volume_carga','12,4 m³','categoria_cnh','C',
      'central_multimidia','SYNC 4 com tela de 12 polegadas','mercado','Carga urbana e regional',
      'ano_modelo','2026','situacao_comercial','Linha atual',
      'fonte_url','https://www.ford.com.br/veiculos-comerciais/transit-furgao/compare-as-versoes/furgao-l3h3-380l-mt/',
      'consultado_em','2026-10-27'
    )
  UNION ALL
  SELECT
    'Transit Furgão L2H3 350M AT',
    'ford-transit-furgao-medio-10-7-350m-at',
    'Furgão médio de 10,7 m³, PBT de 3.500 kg e câmbio automático de 10 marchas.',
    'Automática de 10 marchas',
    '3.500 kg',
    '3.300',
    JSON_OBJECT(
      'tipo_veiculo','Van','energia','Diesel S10','configuracao','4x2, tração traseira',
      'entre_eixos','3.300','comprimento','5.531','tipo_carroceria','Furgão L2H3',
      'capacidade_carga','1.227 kg','volume_carga','10,7 m³','categoria_cnh','B',
      'central_multimidia','SYNC 4 com tela de 12 polegadas','mercado','Carga urbana e regional',
      'ano_modelo','2026','situacao_comercial','Linha atual',
      'fonte_url','https://www.ford.com.br/veiculos-comerciais/transit-furgao/compare-as-versoes/furgao-l2h3-at/',
      'consultado_em','2026-10-27'
    )
) s
WHERE (ma.slug COLLATE utf8mb4_unicode_ci='ford' COLLATE utf8mb4_unicode_ci
    OR LOWER(ma.nome) COLLATE utf8mb4_unicode_ci='ford' COLLATE utf8mb4_unicode_ci)
  AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci='transit' COLLATE utf8mb4_unicode_ci
  AND NOT EXISTS (
    SELECT 1 FROM modelos x
    WHERE x.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci
  );

-- Registros normalizados para comparacao e consulta pelo assistente.
INSERT INTO modelo_especificacoes_tecnicas
  (modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT
  m.id,
  k.chave,
  k.rotulo,
  JSON_UNQUOTE(JSON_EXTRACT(m.especificacoes,CONCAT('$.',k.chave))),
  NULL,
  JSON_UNQUOTE(JSON_EXTRACT(m.especificacoes,'$.fonte_url')),
  '2026-10-27'
FROM modelos m
CROSS JOIN (
  SELECT 'tipo_veiculo' chave,'Tipo de veículo' rotulo
  UNION ALL SELECT 'energia','Energia / propulsão'
  UNION ALL SELECT 'configuracao','Configuração / tração'
  UNION ALL SELECT 'entre_eixos','Entre-eixos'
  UNION ALL SELECT 'comprimento','Comprimento'
  UNION ALL SELECT 'tipo_carroceria','Tipo de carroceria'
  UNION ALL SELECT 'capacidade_carga','Capacidade de carga'
  UNION ALL SELECT 'volume_carga','Volume de carga'
  UNION ALL SELECT 'categoria_cnh','Categoria de habilitação'
  UNION ALL SELECT 'central_multimidia','Central multimidia'
  UNION ALL SELECT 'mercado','Mercado / aplicacao'
) k
WHERE m.slug IN (
  'ford-transit-furgao-longo-12-4-350l-mt',
  'ford-transit-furgao-longo-12-4-380l-mt',
  'ford-transit-furgao-medio-10-7-350m-at'
)
  AND JSON_EXTRACT(m.especificacoes,CONCAT('$.',k.chave)) IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM modelo_especificacoes_tecnicas e
    WHERE e.modelo_id=m.id AND e.chave=k.chave
  );

-- A ficha ja existente no projeto e a mesma ficha publica da linha Transit.
INSERT INTO modelo_documentos
  (modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT
  m.id,
  'ficha_tecnica',
  CONCAT('Ficha técnica oficial — ',m.nome),
  '/public/assets/documents/modelos/ford-transit-furgao-ficha-tecnica-2026.pdf',
  'https://www.ford.com.br/veiculos-comerciais/transit-furgao/',
  'https://www.ford.com.br/veiculos-comerciais/transit-furgao/',
  1
FROM modelos m
WHERE m.slug IN (
  'ford-transit-furgao-longo-12-4-350l-mt',
  'ford-transit-furgao-longo-12-4-380l-mt',
  'ford-transit-furgao-medio-10-7-350m-at'
)
  AND NOT EXISTS (
    SELECT 1 FROM modelo_documentos d
    WHERE d.modelo_id=m.id AND d.tipo='ficha_tecnica'
  );

-- O site oficial solicita proposta e nao publica valor numerico para estas
-- versoes; por isso o catalogo registra corretamente como sob consulta.
INSERT INTO modelo_precos (
  modelo_id,variante,ano_modelo,tipo_preco,valor_min,valor_max,moeda,
  fonte_url,fonte_tipo,consultado_em,observacao,ativo
)
SELECT
  m.id,m.nome,'2026','sob_consulta',NULL,NULL,'BRL',
  'https://www.ford.com.br/veiculos-comerciais/transit-furgao/',
  'fabricante','2026-10-27',
  'O fabricante nao publicou preco numerico de veiculo zero km para esta configuracao; solicitar proposta.',
  1
FROM modelos m
WHERE m.slug IN (
  'ford-transit-furgao-longo-12-4-350l-mt',
  'ford-transit-furgao-longo-12-4-380l-mt',
  'ford-transit-furgao-medio-10-7-350m-at'
)
  AND NOT EXISTS (
    SELECT 1 FROM modelo_precos p
    WHERE p.modelo_id=m.id AND p.consultado_em='2026-10-27'
  );

-- ---------------------------------------------------------------------------
-- 4. Especificacao oficial antes ausente: SYNC 4 de 12 pol na Transit Furgao.
-- A fonte e a pagina atual da linha; nao se estende este dado a E-Transit ou
-- Transit Minibus sem confirmacao especifica do fabricante.
-- ---------------------------------------------------------------------------
INSERT INTO modelo_especificacoes_tecnicas
  (modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT
  m.id,
  'central_multimidia',
  'Central multimidia',
  'SYNC 4 com tela de 12 polegadas',
  NULL,
  'https://www.ford.com.br/veiculos-comerciais/transit-furgao/',
  '2026-10-27'
FROM modelos m
WHERE m.slug IN (
  'ford-transit-furgao-medio-10-7-mt',
  'ford-transit-furgao-longo-12-4-at',
  'ford-transit-furgao-cargo-12-4-at'
)
  AND NOT EXISTS (
    SELECT 1
    FROM modelo_especificacoes_tecnicas e
    WHERE e.modelo_id=m.id AND e.chave='central_multimidia'
  );

UPDATE modelo_especificacoes_tecnicas e
JOIN modelos m ON m.id=e.modelo_id
SET
  e.rotulo='Central multimidia',
  e.valor='SYNC 4 com tela de 12 polegadas',
  e.unidade=NULL,
  e.fonte_url='https://www.ford.com.br/veiculos-comerciais/transit-furgao/',
  e.conferido_em='2026-10-27'
WHERE m.slug IN (
  'ford-transit-furgao-medio-10-7-mt',
  'ford-transit-furgao-longo-12-4-at',
  'ford-transit-furgao-cargo-12-4-at'
)
  AND e.chave='central_multimidia';

UPDATE modelos
SET especificacoes=JSON_MERGE_PATCH(
  COALESCE(especificacoes,JSON_OBJECT()),
  JSON_OBJECT(
    'central_multimidia','SYNC 4 com tela de 12 polegadas',
    'fonte_multimidia_url','https://www.ford.com.br/veiculos-comerciais/transit-furgao/',
    'multimidia_conferida_em','2026-10-27'
  )
)
WHERE slug IN (
  'ford-transit-furgao-medio-10-7-mt',
  'ford-transit-furgao-longo-12-4-at',
  'ford-transit-furgao-cargo-12-4-at'
);

-- Diagnostico de conferencia apos a importacao.
SELECT
  m.slug,
  m.nome,
  f.nome AS familia,
  ma.nome AS marca,
  p.valor_min AS preco,
  p.ano_modelo,
  p.consultado_em
FROM modelos m
JOIN familias f ON f.id=m.familia_id
JOIN marcas ma ON ma.id=f.marca_id
LEFT JOIN modelo_precos p ON p.modelo_id=m.id AND p.ativo=1
WHERE m.slug='fiat-ducato-minibus-luxo-16l';

