-- Drive Learn | Benchmark do seletor de marchas
-- VW Constellation 33.460 6x4 x Volvo FH 540 6x4T
-- Pesquisa de campo: COFCO, unidade de Votuporanga-SP.
--
-- Premissas de qualidade:
-- 1. A arquitetura de cada seletor e confirmada em fontes oficiais.
-- 2. A preferencia do motorista e registrada como percepcao de campo, sem eleger vencedor.
-- 3. O relato foi sintetizado e anonimizado; nao e apresentado como transcricao literal.
-- 4. Reexecucao segura em MySQL 5.7+/MariaDB 10.4+.

SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Garante o modelo historico utilizado na pesquisa, somente se ele ainda nao existir.
-- Os dados abaixo sao limitados ao que foi divulgado oficialmente pela VWCO.
INSERT INTO modelos
  (familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,especificacoes,ativo)
SELECT
  f.id,
  'Constellation 33.460 6x4',
  'constellation-33-460-6x4',
  'Extrapesado Volkswagen para aplicacoes off-road e uso misto. Recorte historico preservado para benchmark de ergonomia.',
  'MAN D26 13 l',
  '460 cv',
  '2.300 Nm',
  'ZF TraXon automatizada, 12 ou 16 marchas',
  JSON_OBJECT(
    'tipo_veiculo','Caminhao',
    'configuracao','6x4',
    'aplicacao','Off-road e uso misto',
    'situacao_comercial','Historico',
    'fonte_oficial','https://www.vwco.com.br/noticias/158',
    'conferido_em','2026-10-24'
  ),
  1
FROM familias f
JOIN marcas ma ON ma.id=f.marca_id
WHERE LOWER(TRIM(f.nome))='constellation'
  AND (
    LOWER(ma.slug) LIKE '%volkswagen%'
    OR LOWER(ma.slug) LIKE '%vwco%'
    OR LOWER(ma.nome) LIKE '%volkswagen%'
  )
  AND NOT EXISTS (
    SELECT 1
    FROM modelos mx
    JOIN familias fx ON fx.id=mx.familia_id
    JOIN marcas bx ON bx.id=fx.marca_id
    WHERE (
      LOWER(bx.slug) LIKE '%volkswagen%'
      OR LOWER(bx.slug) LIKE '%vwco%'
      OR LOWER(bx.nome) LIKE '%volkswagen%'
    )
      AND (
        mx.slug='constellation-33-460-6x4'
        OR REPLACE(REPLACE(REPLACE(LOWER(mx.nome),' ',''),'.',''),'-','') LIKE '%constellation334606x4%'
      )
  )
ORDER BY f.id
LIMIT 1;

-- Configuracao VWCO observada no comparativo.
INSERT INTO benchmark_configuracoes
  (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,aplicacao,data_referencia,situacao_comercial,descricao,ativo)
SELECT
  m.id,
  'Constellation 33.460 6x4 · COFCO Votuporanga',
  NULL,
  '33.460',
  'Constellation',
  '6x4',
  'Brasil',
  'Off-road e uso misto',
  '2026-10-24',
  'historico',
  'Recorte do veiculo considerado na pesquisa de campo realizada na COFCO, unidade de Votuporanga-SP. Ano-modelo e pacote exatos devem ser confirmados com a frota antes da validacao final.',
  1
FROM modelos m
JOIN familias f ON f.id=m.familia_id
JOIN marcas ma ON ma.id=f.marca_id
WHERE (
    LOWER(ma.slug) LIKE '%volkswagen%'
    OR LOWER(ma.slug) LIKE '%vwco%'
    OR LOWER(ma.nome) LIKE '%volkswagen%'
  )
  AND (
    m.slug='constellation-33-460-6x4'
    OR REPLACE(REPLACE(REPLACE(LOWER(m.nome),' ',''),'.',''),'-','') LIKE '%constellation334606x4%'
  )
  AND NOT EXISTS (
    SELECT 1 FROM benchmark_configuracoes
    WHERE nome='Constellation 33.460 6x4 · COFCO Votuporanga'
  )
ORDER BY CASE WHEN m.slug='constellation-33-460-6x4' THEN 0 ELSE 1 END,m.id
LIMIT 1;

-- Fontes oficiais e fonte de campo mantidas separadas.
INSERT INTO benchmark_fontes
  (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT
  'VW Constellation — arquitetura do seletor V-Tronic',
  'site_oficial',
  'https://ofertas.vwco.com.br/familiaconstellation',
  'Volkswagen Caminhoes e Onibus',
  '2026-10-24',
  'A pagina oficial informa a alavanca da transmissao automatizada V-Tronic posicionada na coluna de direcao nos modelos da nova geracao acima de 320 cv.'
WHERE NOT EXISTS (
  SELECT 1 FROM benchmark_fontes
  WHERE url='https://ofertas.vwco.com.br/familiaconstellation'
);

INSERT INTO benchmark_fontes
  (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT
  'VW Constellation 33.460 6x4 — apresentacao oficial',
  'site_oficial',
  'https://www.vwco.com.br/noticias/158',
  'Volkswagen Caminhoes e Onibus',
  '2026-10-24',
  'A fonte confirma o modelo, sua aplicacao off-road/uso misto e o foco ergonomico da cabine. A posicao do seletor e documentada na pagina oficial da familia.'
WHERE NOT EXISTS (
  SELECT 1 FROM benchmark_fontes
  WHERE url='https://www.vwco.com.br/noticias/158'
);

INSERT INTO benchmark_fontes
  (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT
  'Volvo FH — evolucao ergonomica do seletor I-Shift',
  'site_oficial',
  'https://www.volvotrucks.com/en-en/news-stories/stories/2020/feb/transport-improvements-fh-cab.html',
  'Volvo Trucks',
  '2026-10-24',
  'A Volvo descreve a unidade I-Shift mais fina, mais baixa e posicionada mais a frente. A configuracao exata deve ser confirmada no veiculo avaliado.'
WHERE NOT EXISTS (
  SELECT 1 FROM benchmark_fontes
  WHERE url='https://www.volvotrucks.com/en-en/news-stories/stories/2020/feb/transport-improvements-fh-cab.html'
);

INSERT INTO benchmark_fontes
  (titulo,tipo,publicador,consultado_em,observacao)
SELECT
  'Pesquisa de campo — seletor de marchas',
  'inspecao',
  'COFCO — unidade de Votuporanga-SP',
  '2026-10-24',
  'Relato anonimizado de motorista participante. Foi informada preferencia pelo seletor lateral do Volvo devido a melhor identificacao visual e percepcao de alcance. Segundo o participante, o comando do Volkswagen atras do volante pode dificultar a visualizacao da posicao selecionada. Data original da entrevista, identificacao do veiculo e roteiro da pesquisa ainda devem ser anexados.'
WHERE NOT EXISTS (
  SELECT 1 FROM benchmark_fontes
  WHERE titulo='Pesquisa de campo — seletor de marchas'
    AND publicador='COFCO — unidade de Votuporanga-SP'
);

-- Caracteristica oficial do Constellation. Nao incorpora a preferencia do motorista ao valor tecnico.
INSERT INTO benchmark_valores
  (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT
  c.id,
  a.id,
  'Alavanca da transmissao automatizada posicionada na coluna de direcao, atras/ao lado do volante',
  'informado',
  'serie',
  'validado',
  'pesquisa_documental',
  (SELECT MIN(s.id) FROM benchmark_fontes s WHERE s.url='https://ofertas.vwco.com.br/familiaconstellation'),
  96,
  'A fonte oficial confirma a arquitetura na coluna de direcao. Visibilidade, identificacao da posicao e risco de selecao incorreta permanecem como aspectos a validar em campo para o veiculo e pacote exatos.'
FROM benchmark_configuracoes c
JOIN benchmark_atributos a ON a.slug='seletor-marchas'
WHERE c.nome='Constellation 33.460 6x4 · COFCO Votuporanga'
ON DUPLICATE KEY UPDATE
  valor_texto=VALUES(valor_texto),
  status_dado=VALUES(status_dado),
  disponibilidade=VALUES(disponibilidade),
  status_revisao=VALUES(status_revisao),
  origem=VALUES(origem),
  fonte_id=VALUES(fonte_id),
  confianca=VALUES(confianca),
  observacao=VALUES(observacao);

-- Caracteristica oficial do Volvo FH. Mantem a disponibilidade como nao confirmada
-- porque a arquitetura pode variar conforme ano, mercado e especificacao do pedido.
INSERT INTO benchmark_valores
  (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT
  c.id,
  a.id,
  'Seletor I-Shift lateral; unidade mais fina, baixa e posicionada mais a frente',
  'informado',
  'nao_confirmado',
  'validado',
  'pesquisa_documental',
  (SELECT MIN(s.id) FROM benchmark_fontes s WHERE s.url='https://www.volvotrucks.com/en-en/news-stories/stories/2020/feb/transport-improvements-fh-cab.html'),
  92,
  'A fonte oficial confirma o redesenho ergonomico. A posicao junto ao banco foi informada na pesquisa de campo e deve ser confirmada no FH 540 da COFCO, incluindo ano-modelo, cabine e especificacao, antes de transformar a percepcao em conclusao de produto.'
FROM benchmark_configuracoes c
JOIN benchmark_atributos a ON a.slug='seletor-marchas'
WHERE c.nome='Volvo FH 540 6x4T · Brasil'
ON DUPLICATE KEY UPDATE
  valor_texto=VALUES(valor_texto),
  status_dado=VALUES(status_dado),
  disponibilidade=VALUES(disponibilidade),
  status_revisao=VALUES(status_revisao),
  origem=VALUES(origem),
  fonte_id=VALUES(fonte_id),
  confianca=VALUES(confianca),
  observacao=VALUES(observacao);

-- Comparacao pronta para continuidade no modulo.
INSERT INTO benchmark_comparacoes
  (titulo,descricao,referencia_configuracao_id,filtros_json,publico_interno)
SELECT
  'Seletor de marchas — Constellation 33.460 x Volvo FH 540',
  'Comparacao qualitativa da arquitetura, visibilidade, alcance e identificacao do seletor. Nao define vencedor; combina documentacao oficial e percepcao de campo a validar.',
  c.id,
  JSON_OBJECT('categoria','comandos-ergonomia','atributo','seletor-marchas','status','em_analise'),
  1
FROM benchmark_configuracoes c
WHERE c.nome='Constellation 33.460 6x4 · COFCO Votuporanga'
  AND NOT EXISTS (
    SELECT 1 FROM benchmark_comparacoes
    WHERE titulo='Seletor de marchas — Constellation 33.460 x Volvo FH 540'
  )
LIMIT 1;

INSERT IGNORE INTO benchmark_comparacao_configuracoes
  (comparacao_id,configuracao_id,ordem)
SELECT cp.id,c.id,1
FROM benchmark_comparacoes cp
JOIN benchmark_configuracoes c ON c.nome='Constellation 33.460 6x4 · COFCO Votuporanga'
WHERE cp.titulo='Seletor de marchas — Constellation 33.460 x Volvo FH 540';

INSERT IGNORE INTO benchmark_comparacao_configuracoes
  (comparacao_id,configuracao_id,ordem)
SELECT cp.id,c.id,2
FROM benchmark_comparacoes cp
JOIN benchmark_configuracoes c ON c.nome='Volvo FH 540 6x4T · Brasil'
WHERE cp.titulo='Seletor de marchas — Constellation 33.460 x Volvo FH 540';

-- Analise: fato, voz do motorista e interpretacao permanecem explicitamente separados.
INSERT INTO benchmark_analises
  (titulo,tipo,impacto,prioridade,status,area_responsavel,fato_observado,citacao_motorista,interpretacao_tecnica,proximo_passo)
SELECT
  'Visibilidade e alcance do seletor — Constellation 33.460 x FH 540',
  'investigacao',
  'medio',
  'P3',
  'em_analise',
  'Engenharia de Cabine / Ergonomia e HMI',
  'A fonte oficial da VWCO documenta o seletor V-Tronic na coluna de direcao. A Volvo documenta a unidade I-Shift redesenhada, mais fina, baixa e posicionada mais a frente. Na pesquisa de campo realizada na COFCO, unidade de Votuporanga-SP, o motorista identificou o comando do FH avaliado junto ao banco e informou preferir essa arquitetura por perceber melhor visualizacao e alcance. O participante relatou que o comando do Volkswagen, posicionado atras do volante, pode dificultar a identificacao visual da posicao e contribuir para selecionar uma posicao diferente da pretendida. Trata-se de um relato individual ainda nao validado por ensaio comparativo.',
  NULL,
  'O ponto levantado esta relacionado a visibilidade, descobribilidade do comando, confirmacao da selecao e alcance relativo ao motorista. A arquitetura junto ao banco pode acompanhar sua regulagem e seus movimentos; a arquitetura na coluna reduz o deslocamento da mao a partir do volante e libera a lateral da cabine. Os dados atuais nao permitem afirmar superioridade. Tambem deve ser verificado se a dificuldade decorre da posicao fisica, da logica de acionamento, da sinalizacao no cluster, da familiaridade ou da combinacao desses fatores.',
  'Confirmar ano-modelo, cabine e transmissao dos dois veiculos da COFCO; fotografar o campo de visao real; aplicar roteiro padronizado com mais motoristas; medir acerto de D/N/R e modo manual, tempo de selecao, desvio do olhar, alcance e preferencia em veiculo parado e em percurso controlado. Nao solicitar troca manual durante curva em via aberta.'
WHERE NOT EXISTS (
  SELECT 1 FROM benchmark_analises
  WHERE titulo='Visibilidade e alcance do seletor — Constellation 33.460 x FH 540'
);

UPDATE benchmark_analises
SET tipo='investigacao',
    impacto='medio',
    prioridade='P3',
    status='em_analise',
    area_responsavel='Engenharia de Cabine / Ergonomia e HMI',
    fato_observado='A fonte oficial da VWCO documenta o seletor V-Tronic na coluna de direcao. A Volvo documenta a unidade I-Shift redesenhada, mais fina, baixa e posicionada mais a frente. Na pesquisa de campo realizada na COFCO, unidade de Votuporanga-SP, o motorista identificou o comando do FH avaliado junto ao banco e informou preferir essa arquitetura por perceber melhor visualizacao e alcance. O participante relatou que o comando do Volkswagen, posicionado atras do volante, pode dificultar a identificacao visual da posicao e contribuir para selecionar uma posicao diferente da pretendida. Trata-se de um relato individual ainda nao validado por ensaio comparativo.',
    citacao_motorista=NULL,
    interpretacao_tecnica='O ponto levantado esta relacionado a visibilidade, descobribilidade do comando, confirmacao da selecao e alcance relativo ao motorista. A arquitetura junto ao banco pode acompanhar sua regulagem e seus movimentos; a arquitetura na coluna reduz o deslocamento da mao a partir do volante e libera a lateral da cabine. Os dados atuais nao permitem afirmar superioridade. Tambem deve ser verificado se a dificuldade decorre da posicao fisica, da logica de acionamento, da sinalizacao no cluster, da familiaridade ou da combinacao desses fatores.',
    proximo_passo='Confirmar ano-modelo, cabine e transmissao dos dois veiculos da COFCO; fotografar o campo de visao real; aplicar roteiro padronizado com mais motoristas; medir acerto de D/N/R e modo manual, tempo de selecao, desvio do olhar, alcance e preferencia em veiculo parado e em percurso controlado. Nao solicitar troca manual durante curva em via aberta.'
WHERE titulo='Visibilidade e alcance do seletor — Constellation 33.460 x FH 540';

INSERT IGNORE INTO benchmark_analise_configuracoes
  (analise_id,configuracao_id)
SELECT a.id,c.id
FROM benchmark_analises a
JOIN benchmark_configuracoes c ON c.nome='Constellation 33.460 6x4 · COFCO Votuporanga'
WHERE a.titulo='Visibilidade e alcance do seletor — Constellation 33.460 x FH 540';

INSERT IGNORE INTO benchmark_analise_configuracoes
  (analise_id,configuracao_id)
SELECT a.id,c.id
FROM benchmark_analises a
JOIN benchmark_configuracoes c ON c.nome='Volvo FH 540 6x4T · Brasil'
WHERE a.titulo='Visibilidade e alcance do seletor — Constellation 33.460 x FH 540';

INSERT IGNORE INTO benchmark_analise_atributos
  (analise_id,atributo_id)
SELECT a.id,ba.id
FROM benchmark_analises a
JOIN benchmark_atributos ba ON ba.slug='seletor-marchas'
WHERE a.titulo='Visibilidade e alcance do seletor — Constellation 33.460 x FH 540';

-- Diagnostico final. O resultado esperado e uma linha com duas configuracoes,
-- dois valores e uma analise. Se algum total for menor, confirme se a migration 033 foi executada.
SELECT
  cp.titulo,
  COUNT(DISTINCT cc.configuracao_id) AS configuracoes_vinculadas,
  COUNT(DISTINCT bv.id) AS valores_seletor,
  COUNT(DISTINCT an.id) AS analises_vinculadas
FROM benchmark_comparacoes cp
LEFT JOIN benchmark_comparacao_configuracoes cc ON cc.comparacao_id=cp.id
LEFT JOIN benchmark_valores bv
  ON bv.configuracao_id=cc.configuracao_id
 AND bv.atributo_id=(SELECT MIN(id) FROM benchmark_atributos WHERE slug='seletor-marchas')
LEFT JOIN benchmark_analise_configuracoes ac ON ac.configuracao_id=cc.configuracao_id
LEFT JOIN benchmark_analises an
  ON an.id=ac.analise_id
 AND an.titulo='Visibilidade e alcance do seletor — Constellation 33.460 x FH 540'
WHERE cp.titulo='Seletor de marchas — Constellation 33.460 x Volvo FH 540'
GROUP BY cp.id,cp.titulo;
