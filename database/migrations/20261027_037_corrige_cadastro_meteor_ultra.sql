-- Drive Learn VW
-- Correcao do cadastro da linha VW Meteor Ultra.
-- Data da verificacao oficial: 27/10/2026.
--
-- Motivo:
--   A migration 031 dependia do slug exato da marca e inseria os modelos com
--   ativo=0. Em bases com slug alternativo, ou nas telas que exibem apenas
--   modelos ativos, o resultado era zero linhas ou nenhum modelo visivel.
--
-- Fonte publica oficial:
--   https://www.vwco.com.br/
--   A pagina oficial destaca os ineditos Meteor Ultra 28.500 6x2,
--   28.540 6x2 e 29.540 6x4.
--
-- Migration idempotente. Nao conecta nem executa alteracoes na HostGator.

SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------------
-- 1. Localiza a marca mesmo quando o banco usa outro slug e cria somente se
-- ela realmente nao existir.
-- ---------------------------------------------------------------------------
INSERT INTO marcas (nome,slug,pais_origem,site_oficial,descricao,ativo)
SELECT
  'Volkswagen Caminhões e Ônibus',
  'volkswagen-caminhoes-onibus',
  'Brasil',
  'https://www.vwco.com.br/',
  'Veículos comerciais Volkswagen para transporte de cargas e passageiros.',
  1
WHERE NOT EXISTS (
  SELECT 1
  FROM marcas m
  WHERE m.slug COLLATE utf8mb4_unicode_ci IN (
      'volkswagen-caminhoes-onibus' COLLATE utf8mb4_unicode_ci,
      'volkswagen-caminhoes-e-onibus' COLLATE utf8mb4_unicode_ci,
      'vwco' COLLATE utf8mb4_unicode_ci
    )
     OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci LIKE '%volkswagen%caminh%onibus%' COLLATE utf8mb4_unicode_ci
     OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci LIKE '%volkswagen%caminh%ônibus%' COLLATE utf8mb4_unicode_ci
);

SET @vwco_marca_id := (
  SELECT m.id
  FROM marcas m
  WHERE m.slug COLLATE utf8mb4_unicode_ci IN (
      'volkswagen-caminhoes-onibus' COLLATE utf8mb4_unicode_ci,
      'volkswagen-caminhoes-e-onibus' COLLATE utf8mb4_unicode_ci,
      'vwco' COLLATE utf8mb4_unicode_ci
    )
     OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci LIKE '%volkswagen%caminh%onibus%' COLLATE utf8mb4_unicode_ci
     OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci LIKE '%volkswagen%caminh%ônibus%' COLLATE utf8mb4_unicode_ci
  ORDER BY
    CASE
      WHEN m.slug='volkswagen-caminhoes-onibus' THEN 0
      WHEN m.slug='volkswagen-caminhoes-e-onibus' THEN 1
      WHEN m.slug='vwco' THEN 2
      ELSE 3
    END,
    m.id
  LIMIT 1
);

UPDATE marcas
SET
  site_oficial='https://www.vwco.com.br/',
  ativo=1
WHERE id=@vwco_marca_id;

-- ---------------------------------------------------------------------------
-- 2. Garante a familia Meteor vinculada a marca encontrada.
-- ---------------------------------------------------------------------------
INSERT INTO familias (marca_id,nome,descricao,ativo,tipo_veiculo)
SELECT
  @vwco_marca_id,
  'Meteor',
  'Família de caminhões extrapesados Volkswagen para operações rodoviárias.',
  1,
  'caminhao'
WHERE @vwco_marca_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1
    FROM familias f
    WHERE f.marca_id=@vwco_marca_id
      AND (
        LOWER(TRIM(f.nome)) COLLATE utf8mb4_unicode_ci='meteor' COLLATE utf8mb4_unicode_ci
        OR LOWER(TRIM(f.nome)) COLLATE utf8mb4_unicode_ci='linha meteor' COLLATE utf8mb4_unicode_ci
      )
  );

SET @meteor_familia_id := (
  SELECT f.id
  FROM familias f
  WHERE f.marca_id=@vwco_marca_id
    AND LOWER(TRIM(f.nome)) COLLATE utf8mb4_unicode_ci IN (
      'meteor' COLLATE utf8mb4_unicode_ci,
      'linha meteor' COLLATE utf8mb4_unicode_ci
    )
  ORDER BY CASE WHEN LOWER(TRIM(f.nome))='meteor' THEN 0 ELSE 1 END,f.id
  LIMIT 1
);

UPDATE familias
SET tipo_veiculo='caminhao',ativo=1
WHERE id=@meteor_familia_id;

-- ---------------------------------------------------------------------------
-- 3. Cria os tres modelos ausentes. O ativo=1 significa visivel no catalogo;
-- a situacao comercial continua informando que disponibilidade e ficha
-- completa devem ser confirmadas com a fabricante.
-- ---------------------------------------------------------------------------
INSERT INTO modelos (
  familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,
  pbt,pbtc,relacao_reducao,especificacoes,ativo
)
SELECT
  @meteor_familia_id,
  'Meteor Ultra 28.500 6x2',
  'meteor-ultra-28-500-6x2',
  'Extrapesado rodoviário da nova geração Meteor Ultra com motor MAN D26 Ultra.',
  '/public/assets/images/modelos/vwco-20261016-meteor-ultra.jpeg',
  'MAN D26 Ultra',
  '500 cv',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  JSON_OBJECT(
    'tipo_veiculo','Caminhão',
    'energia','Diesel',
    'configuracao','6x2, cavalo mecânico',
    'mercado','Rodoviário',
    'situacao_comercial','Apresentado oficialmente pela VWCO; disponibilidade comercial sob consulta',
    'observacao_fonte','PBT, PBTC, CMT, redução e ficha técnica completa ainda não publicados pela fabricante',
    'fonte_oficial','https://www.vwco.com.br/',
    'conferido_em','2026-10-27'
  ),
  1
WHERE @meteor_familia_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM modelos m
    WHERE m.slug COLLATE utf8mb4_unicode_ci='meteor-ultra-28-500-6x2' COLLATE utf8mb4_unicode_ci
       OR LOWER(TRIM(m.nome)) COLLATE utf8mb4_unicode_ci='meteor ultra 28.500 6x2' COLLATE utf8mb4_unicode_ci
  );

INSERT INTO modelos (
  familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,
  pbt,pbtc,relacao_reducao,especificacoes,ativo
)
SELECT
  @meteor_familia_id,
  'Meteor Ultra 28.540 6x2',
  'meteor-ultra-28-540-6x2',
  'Extrapesado rodoviário da nova geração Meteor Ultra com motor MAN D26 Ultra.',
  '/public/assets/images/modelos/vwco-20261016-meteor-ultra.jpeg',
  'MAN D26 Ultra',
  '540 cv',
  '2.650 Nm',
  NULL,
  NULL,
  NULL,
  NULL,
  JSON_OBJECT(
    'tipo_veiculo','Caminhão',
    'energia','Diesel',
    'configuracao','6x2, cavalo mecânico',
    'mercado','Rodoviário',
    'situacao_comercial','Apresentado oficialmente pela VWCO; disponibilidade comercial sob consulta',
    'observacao_fonte','PBT, PBTC, CMT, redução e ficha técnica completa ainda não publicados pela fabricante',
    'fonte_oficial','https://www.vwco.com.br/',
    'conferido_em','2026-10-27'
  ),
  1
WHERE @meteor_familia_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM modelos m
    WHERE m.slug COLLATE utf8mb4_unicode_ci='meteor-ultra-28-540-6x2' COLLATE utf8mb4_unicode_ci
       OR LOWER(TRIM(m.nome)) COLLATE utf8mb4_unicode_ci='meteor ultra 28.540 6x2' COLLATE utf8mb4_unicode_ci
  );

INSERT INTO modelos (
  familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,
  pbt,pbtc,relacao_reducao,especificacoes,ativo
)
SELECT
  @meteor_familia_id,
  'Meteor Ultra 29.540 6x4',
  'meteor-ultra-29-540-6x4',
  'Extrapesado rodoviário da nova geração Meteor Ultra com motor MAN D26 Ultra.',
  '/public/assets/images/modelos/vwco-20261016-meteor-ultra.jpeg',
  'MAN D26 Ultra',
  '540 cv',
  '2.650 Nm',
  NULL,
  NULL,
  NULL,
  NULL,
  JSON_OBJECT(
    'tipo_veiculo','Caminhão',
    'energia','Diesel',
    'configuracao','6x4, cavalo mecânico',
    'mercado','Rodoviário',
    'situacao_comercial','Apresentado oficialmente pela VWCO; disponibilidade comercial sob consulta',
    'observacao_fonte','PBT, PBTC, CMT, redução e ficha técnica completa ainda não publicados pela fabricante',
    'fonte_oficial','https://www.vwco.com.br/',
    'conferido_em','2026-10-27'
  ),
  1
WHERE @meteor_familia_id IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM modelos m
    WHERE m.slug COLLATE utf8mb4_unicode_ci='meteor-ultra-29-540-6x4' COLLATE utf8mb4_unicode_ci
       OR LOWER(TRIM(m.nome)) COLLATE utf8mb4_unicode_ci='meteor ultra 29.540 6x4' COLLATE utf8mb4_unicode_ci
  );

-- ---------------------------------------------------------------------------
-- 4. Repara registros preexistentes da 031 e os torna visiveis no catalogo.
-- ---------------------------------------------------------------------------
UPDATE modelos m
SET
  m.familia_id=COALESCE(@meteor_familia_id,m.familia_id),
  m.imagem=CASE
    WHEN m.imagem IS NULL OR TRIM(m.imagem)='' THEN
      '/public/assets/images/modelos/vwco-20261016-meteor-ultra.jpeg'
    ELSE m.imagem END,
  m.motor='MAN D26 Ultra',
  m.potencia=CASE
    WHEN m.slug='meteor-ultra-28-500-6x2'
      OR LOWER(TRIM(m.nome))='meteor ultra 28.500 6x2' THEN '500 cv'
    ELSE '540 cv' END,
  m.torque=CASE
    WHEN m.slug='meteor-ultra-28-500-6x2'
      OR LOWER(TRIM(m.nome))='meteor ultra 28.500 6x2' THEN m.torque
    ELSE COALESCE(NULLIF(TRIM(m.torque),''),'2.650 Nm') END,
  m.descricao='Extrapesado rodoviário da nova geração Meteor Ultra com motor MAN D26 Ultra.',
  m.especificacoes=JSON_MERGE_PATCH(
    COALESCE(m.especificacoes,JSON_OBJECT()),
    JSON_OBJECT(
      'tipo_veiculo','Caminhão',
      'energia','Diesel',
      'configuracao',CASE
        WHEN m.slug='meteor-ultra-29-540-6x4'
          OR LOWER(TRIM(m.nome))='meteor ultra 29.540 6x4' THEN '6x4, cavalo mecânico'
        ELSE '6x2, cavalo mecânico' END,
      'mercado','Rodoviário',
      'situacao_comercial','Apresentado oficialmente pela VWCO; disponibilidade comercial sob consulta',
      'observacao_fonte','PBT, PBTC, CMT, redução e ficha técnica completa ainda não publicados pela fabricante',
      'fonte_oficial','https://www.vwco.com.br/',
      'conferido_em','2026-10-27'
    )
  ),
  m.ativo=1
WHERE m.slug IN (
  'meteor-ultra-28-500-6x2',
  'meteor-ultra-28-540-6x2',
  'meteor-ultra-29-540-6x4'
)
OR LOWER(TRIM(m.nome)) IN (
  'meteor ultra 28.500 6x2',
  'meteor ultra 28.540 6x2',
  'meteor ultra 29.540 6x4'
);

-- ---------------------------------------------------------------------------
-- 5. Sincroniza os campos normalizados usados no comparador e no assistente.
-- ---------------------------------------------------------------------------
INSERT INTO modelo_especificacoes_tecnicas
  (modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT
  m.id,
  k.chave,
  k.rotulo,
  CASE k.chave
    WHEN 'tipo_veiculo' THEN 'Caminhão'
    WHEN 'energia' THEN 'Diesel'
    WHEN 'configuracao' THEN CASE
      WHEN m.slug='meteor-ultra-29-540-6x4'
        OR LOWER(TRIM(m.nome))='meteor ultra 29.540 6x4' THEN '6x4, cavalo mecânico'
      ELSE '6x2, cavalo mecânico' END
    WHEN 'mercado' THEN 'Rodoviário'
    WHEN 'situacao_comercial' THEN
      'Apresentado oficialmente pela VWCO; disponibilidade comercial sob consulta'
    WHEN 'observacao_fonte' THEN
      'PBT, PBTC, CMT, redução e ficha técnica completa ainda não publicados pela fabricante'
  END,
  NULL,
  'https://www.vwco.com.br/',
  '2026-10-27'
FROM modelos m
CROSS JOIN (
  SELECT 'tipo_veiculo' chave,'Tipo de veículo' rotulo
  UNION ALL SELECT 'energia','Energia / propulsão'
  UNION ALL SELECT 'configuracao','Configuração / tração'
  UNION ALL SELECT 'mercado','Mercado / aplicação'
  UNION ALL SELECT 'situacao_comercial','Situação comercial'
  UNION ALL SELECT 'observacao_fonte','Observação da fonte'
) k
WHERE m.slug IN (
  'meteor-ultra-28-500-6x2',
  'meteor-ultra-28-540-6x2',
  'meteor-ultra-29-540-6x4'
)
OR LOWER(TRIM(m.nome)) IN (
  'meteor ultra 28.500 6x2',
  'meteor ultra 28.540 6x2',
  'meteor ultra 29.540 6x4'
)
ON DUPLICATE KEY UPDATE
  rotulo=VALUES(rotulo),
  valor=VALUES(valor),
  unidade=VALUES(unidade),
  fonte_url=VALUES(fonte_url),
  conferido_em=VALUES(conferido_em);

-- Diagnostico final: deve retornar exatamente tres modelos ativos.
SELECT
  ma.id AS marca_id,
  ma.nome AS marca,
  f.id AS familia_id,
  f.nome AS familia,
  m.id AS modelo_id,
  m.nome AS modelo,
  m.slug,
  m.motor,
  m.potencia,
  m.ativo
FROM modelos m
JOIN familias f ON f.id=m.familia_id
JOIN marcas ma ON ma.id=f.marca_id
WHERE m.slug IN (
  'meteor-ultra-28-500-6x2',
  'meteor-ultra-28-540-6x2',
  'meteor-ultra-29-540-6x4'
)
OR LOWER(TRIM(m.nome)) IN (
  'meteor ultra 28.500 6x2',
  'meteor ultra 28.540 6x2',
  'meteor ultra 29.540 6x4'
)
ORDER BY m.nome;

