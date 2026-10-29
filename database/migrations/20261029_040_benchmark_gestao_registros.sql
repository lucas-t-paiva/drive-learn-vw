-- Drive Learn VW
-- Gestão de registros do Benchmark: origem rastreável das análises.
-- Idempotente e compatível com MySQL/MariaDB que não aceita ADD COLUMN IF NOT EXISTS.

SET @benchmark_schema := DATABASE();

SET @benchmark_has_analysis_origin := (
  SELECT COUNT(*)
  FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = @benchmark_schema
    AND TABLE_NAME = 'benchmark_analises'
    AND COLUMN_NAME = 'origem'
);

SET @benchmark_sql := IF(
  @benchmark_has_analysis_origin = 0,
  "ALTER TABLE benchmark_analises ADD COLUMN origem ENUM('manual','ia','importacao','pesquisa_documental') NOT NULL DEFAULT 'manual' AFTER status",
  'SELECT 1'
);
PREPARE benchmark_stmt FROM @benchmark_sql;
EXECUTE benchmark_stmt;
DEALLOCATE PREPARE benchmark_stmt;

-- Registros criados por migrations não possuem usuário criador e devem ser
-- identificados como importação. Cadastros feitos pela interface permanecem manuais.
UPDATE benchmark_analises
SET origem = CASE WHEN criado_por IS NULL THEN 'importacao' ELSE 'manual' END
WHERE origem IS NULL
   OR origem = ''
   OR (origem = 'manual' AND criado_por IS NULL);

INSERT INTO schema_migrations (versao,descricao)
VALUES ('20261029_040','Gestão de observações, evidências e origem rastreável das análises de benchmark')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

