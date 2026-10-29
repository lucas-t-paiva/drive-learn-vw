-- Drive Learn VW | Correcao de referencia do benchmark Volvo
-- O veiculo observado na COFCO e o Volvo FMX 540 6x4T, nao o FH 540.
-- Executar depois da migration 035. Reexecucao segura.

SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP PROCEDURE IF EXISTS dl_corrige_benchmark_fmx_039;
DELIMITER $$
CREATE PROCEDURE dl_corrige_benchmark_fmx_039()
BEGIN
  DECLARE v_modelo_fmx BIGINT UNSIGNED DEFAULT NULL;
  DECLARE v_config_antiga BIGINT UNSIGNED DEFAULT NULL;
  DECLARE v_config_fmx BIGINT UNSIGNED DEFAULT NULL;

  SELECT m.id INTO v_modelo_fmx
  FROM modelos m
  WHERE m.slug IN ('fmx-540-6x4t','volvo-fmx-540-6x4t')
     OR LOWER(TRIM(m.nome))='fmx 540 6x4t'
  ORDER BY CASE WHEN m.slug='fmx-540-6x4t' THEN 0 ELSE 1 END,m.id
  LIMIT 1;

  SELECT MIN(id) INTO v_config_antiga
  FROM benchmark_configuracoes
  WHERE nome='Volvo FH 540 6x4T · Brasil';

  SELECT MIN(id) INTO v_config_fmx
  FROM benchmark_configuracoes
  WHERE nome='Volvo FMX 540 6x4T · Brasil';

  -- Caminho normal: reaproveita a configuracao importada incorretamente,
  -- preservando observacoes, evidencias e relacionamentos.
  IF v_modelo_fmx IS NOT NULL AND v_config_antiga IS NOT NULL AND v_config_fmx IS NULL THEN
    UPDATE benchmark_configuracoes
    SET modelo_id=v_modelo_fmx,
        nome='Volvo FMX 540 6x4T · Brasil',
        versao_comercial='FMX 540',
        cabine='FMX / conforme pedido',
        tracao='6x4T',
        descricao='Recorte brasileiro do FMX 540 6x4T. O seletor junto ao banco foi observado na unidade da pesquisa de campo; pacote e ano-modelo devem ser confirmados.',
        ativo=1
    WHERE id=v_config_antiga;
    SET v_config_fmx=v_config_antiga;
  END IF;

  -- Se a configuracao correta ja foi criada manualmente, consolida os dados
  -- da configuracao antiga nela antes de remover a duplicata incorreta.
  IF v_modelo_fmx IS NOT NULL AND v_config_fmx IS NOT NULL
     AND v_config_antiga IS NOT NULL AND v_config_antiga<>v_config_fmx THEN

    INSERT INTO benchmark_valores
      (configuracao_id,atributo_id,valor_texto,valor_numero,valor_booleano,unidade,
       status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao,
       criado_por,atualizado_por)
    SELECT v_config_fmx,atributo_id,valor_texto,valor_numero,valor_booleano,unidade,
           status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao,
           criado_por,atualizado_por
    FROM benchmark_valores WHERE configuracao_id=v_config_antiga
    ON DUPLICATE KEY UPDATE
      valor_texto=VALUES(valor_texto),valor_numero=VALUES(valor_numero),
      valor_booleano=VALUES(valor_booleano),unidade=VALUES(unidade),
      status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),
      status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),
      confianca=VALUES(confianca),observacao=VALUES(observacao),atualizado_por=VALUES(atualizado_por);

    INSERT IGNORE INTO benchmark_atributo_configuracoes (atributo_id,configuracao_id)
    SELECT atributo_id,v_config_fmx FROM benchmark_atributo_configuracoes WHERE configuracao_id=v_config_antiga;
    INSERT IGNORE INTO benchmark_evidencia_configuracoes (evidencia_id,configuracao_id)
    SELECT evidencia_id,v_config_fmx FROM benchmark_evidencia_configuracoes WHERE configuracao_id=v_config_antiga;
    INSERT IGNORE INTO benchmark_comparacao_configuracoes (comparacao_id,configuracao_id,ordem)
    SELECT comparacao_id,v_config_fmx,ordem FROM benchmark_comparacao_configuracoes WHERE configuracao_id=v_config_antiga;
    INSERT IGNORE INTO benchmark_analise_configuracoes (analise_id,configuracao_id)
    SELECT analise_id,v_config_fmx FROM benchmark_analise_configuracoes WHERE configuracao_id=v_config_antiga;

    UPDATE benchmark_comparacoes SET referencia_configuracao_id=v_config_fmx
    WHERE referencia_configuracao_id=v_config_antiga;
    UPDATE benchmark_pendencias SET configuracao_id=v_config_fmx
    WHERE configuracao_id=v_config_antiga;

    DELETE FROM benchmark_configuracoes WHERE id=v_config_antiga;
  END IF;

  -- Caso a carga 033 nao tenha criado a configuracao, cria agora a correta.
  IF v_modelo_fmx IS NOT NULL AND v_config_fmx IS NULL THEN
    INSERT INTO benchmark_configuracoes
      (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,
       data_referencia,situacao_comercial,descricao,ativo)
    VALUES
      (v_modelo_fmx,'Volvo FMX 540 6x4T · Brasil','2026','FMX 540',
       'FMX / conforme pedido','6x4T','Brasil','2026-10-21','linha_atual',
       'Recorte brasileiro do FMX 540 6x4T. Pacote e ano-modelo do veiculo de campo devem ser confirmados.',1);
    SET v_config_fmx=LAST_INSERT_ID();
  END IF;

  -- Corrige os textos criados pelas migrations anteriores.
  UPDATE benchmark_comparacoes
  SET titulo=REPLACE(titulo,'Volvo FH 540','Volvo FMX 540'),
      descricao=REPLACE(REPLACE(descricao,'Volvo FH 540','Volvo FMX 540'),'FH 540','FMX 540')
  WHERE titulo LIKE '%FH 540%' OR descricao LIKE '%FH 540%';

  UPDATE benchmark_analises
  SET titulo=REPLACE(titulo,'FH 540','FMX 540'),
      fato_observado=REPLACE(REPLACE(fato_observado,'Volvo FH','Volvo FMX'),'FH avaliado','FMX avaliado'),
      interpretacao_tecnica=REPLACE(interpretacao_tecnica,'FH 540','FMX 540'),
      proximo_passo=REPLACE(proximo_passo,'FH 540','FMX 540')
  WHERE titulo LIKE '%FH 540%' OR fato_observado LIKE '%FH avaliado%';

  UPDATE benchmark_fontes
  SET titulo='Volvo FMX — seletor I-Shift e ergonomia de cabine',
      url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx.html',
      observacao='Pagina oficial do Volvo FMX. A posicao do seletor junto ao banco e uma observacao da pesquisa de campo e deve ser confirmada na configuracao exata.'
  WHERE url='https://www.volvotrucks.com/en-en/news-stories/stories/2020/feb/transport-improvements-fh-cab.html';

  UPDATE benchmark_fontes
  SET titulo='Volvo FMX — pagina oficial Brasil',
      url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx.html',
      observacao='Pagina oficial brasileira do Volvo FMX. Recursos e opcionais devem ser confirmados no pedido do veiculo avaliado.'
  WHERE url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html';

END$$
DELIMITER ;

CALL dl_corrige_benchmark_fmx_039();
DROP PROCEDURE dl_corrige_benchmark_fmx_039;

INSERT INTO schema_migrations (versao,descricao)
VALUES ('20261027_039','Corrige benchmark COFCO de Volvo FH 540 para Volvo FMX 540')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

SELECT c.id,c.nome,m.nome AS modelo_catalogo,f.nome AS familia
FROM benchmark_configuracoes c
JOIN modelos m ON m.id=c.modelo_id
JOIN familias f ON f.id=m.familia_id
WHERE c.nome='Volvo FMX 540 6x4T · Brasil';
