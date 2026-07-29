-- Drive Learn VWCO
-- Corrige master_categories e category_terms criadas por uma versão legada
-- com colunas em inglês. Preserva IDs, termos e vínculos existentes.
--
-- ORDEM DE RECUPERAÇÃO:
-- 1. Execute este arquivo.
-- 2. Execute novamente 20260729_019_master_categories_automotivas.sql.
-- 3. Execute novamente 20260729_020_category_terms_automotivos.sql.
-- 4. Execute 20260729_021_gestao_setores_equipes.sql, caso ainda não tenha executado.

SET NAMES utf8mb4;

-- Copia os valores válidos das colunas legadas antes de removê-las.
SET @dl_has_legacy_name := (
    SELECT COUNT(*) FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='name'
);
SET @dl_sql := IF(@dl_has_legacy_name>0,
    'UPDATE master_categories SET nome=CASE WHEN nome IS NULL OR TRIM(nome)='''' OR nome=''Categoria sem nome'' THEN name ELSE nome END, descricao=COALESCE(descricao,description), ativo=COALESCE(active,ativo)',
    'SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

-- Converte os slugs das 15 categorias originais para a taxonomia atual.
UPDATE master_categories SET slug='powertrain-desempenho' WHERE id=1 AND slug='categoria-1';
UPDATE master_categories SET slug='transmissao-embreagem' WHERE id=2 AND slug='categoria-2';
UPDATE master_categories SET slug='sistema-arrefecimento' WHERE id=3 AND slug='categoria-3';
UPDATE master_categories SET slug='sistema-combustivel' WHERE id=4 AND slug='categoria-4';
UPDATE master_categories SET slug='admissao-turbo-exaustao' WHERE id=5 AND slug='categoria-5';
UPDATE master_categories SET slug='suspensao' WHERE id=6 AND slug='categoria-6';
UPDATE master_categories SET slug='direcao' WHERE id=7 AND slug='categoria-7';
UPDATE master_categories SET slug='freios-retarder-freio-motor' WHERE id=8 AND slug='categoria-8';
UPDATE master_categories SET slug='sistema-eletrico-alimentacao' WHERE id=9 AND slug='categoria-9';
UPDATE master_categories SET slug='cabine-ergonomia-conforto' WHERE id=10 AND slug='categoria-10';
UPDATE master_categories SET slug='climatizacao-ventilacao' WHERE id=11 AND slug='categoria-11';
UPDATE master_categories SET slug='carroceria-portas-acabamento' WHERE id=12 AND slug='categoria-12';
UPDATE master_categories SET slug='seguranca-ativa-adas' WHERE id=13 AND slug='categoria-13';
UPDATE master_categories SET slug='nvh-ruidos-vibracoes' WHERE id=14 AND slug='categoria-14';
UPDATE master_categories SET slug='ruidos-externos-aerodinamica' WHERE id=15 AND slug='categoria-15';

-- O registro 16 concentrou indevidamente as tentativas de inserção por causa do
-- índice UNIQUE legado em name=''. Ele é recuperado como a categoria de fallback.
UPDATE master_categories
   SET nome='Outros relatos',
       slug='outros-relatos',
       tipo='geral',
       descricao='Relatos ainda sem categoria específica.',
       sla_primeira_resposta_horas=8,
       sla_resolucao_horas=72,
       ativo=1
 WHERE id=16 AND (slug='conforto-termico' OR nome='Conectividade e telemática');

-- Migra os 79 termos originais para as colunas utilizadas pelo sistema atual.
SET @dl_has_legacy_term := (
    SELECT COUNT(*) FROM information_schema.COLUMNS
     WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='term'
);
SET @dl_sql := IF(@dl_has_legacy_term>0,
    'UPDATE category_terms SET categoria_id=COALESCE(categoria_id,master_category_id), termo=CASE WHEN termo IS NULL OR TRIM(termo)='''' THEN term ELSE termo END, peso=CASE WHEN peso IS NULL OR peso=1 THEN GREATEST(1,LEAST(10,ROUND(weight))) ELSE peso END, ativo=COALESCE(active,ativo)',
    'SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

-- Remove a chave estrangeira e os índices da estrutura antiga.
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND CONSTRAINT_NAME='category_terms_master_category_fk')>0,
    'ALTER TABLE category_terms DROP FOREIGN KEY category_terms_master_category_fk','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND INDEX_NAME='category_terms_category_term_unique')>0,
    'ALTER TABLE category_terms DROP INDEX category_terms_category_term_unique','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND INDEX_NAME='category_terms_term_fulltext')>0,
    'ALTER TABLE category_terms DROP INDEX category_terms_term_fulltext','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND INDEX_NAME='master_categories_name_unique')>0,
    'ALTER TABLE master_categories DROP INDEX master_categories_name_unique','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

-- Remove somente as colunas antigas, agora redundantes.
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='master_category_id')>0,
    'ALTER TABLE category_terms DROP COLUMN master_category_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='term')>0,
    'ALTER TABLE category_terms DROP COLUMN term','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='weight')>0,
    'ALTER TABLE category_terms DROP COLUMN weight','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='active')>0,
    'ALTER TABLE category_terms DROP COLUMN active','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='name')>0,
    'ALTER TABLE master_categories DROP COLUMN name','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='description')>0,
    'ALTER TABLE master_categories DROP COLUMN description','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='color')>0,
    'ALTER TABLE master_categories DROP COLUMN color','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='icon')>0,
    'ALTER TABLE master_categories DROP COLUMN icon','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='active')>0,
    'ALTER TABLE master_categories DROP COLUMN active','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='created_at')>0,
    'ALTER TABLE master_categories DROP COLUMN created_at','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='updated_at')>0,
    'ALTER TABLE master_categories DROP COLUMN updated_at','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

-- Reforça as regras da estrutura nova.
ALTER TABLE master_categories
    MODIFY nome VARCHAR(120) NOT NULL,
    MODIFY slug VARCHAR(140) NOT NULL;

ALTER TABLE category_terms
    MODIFY categoria_id BIGINT UNSIGNED NOT NULL,
    MODIFY termo VARCHAR(120) NOT NULL;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND CONSTRAINT_NAME='fk_category_term_categoria')=0,
    'ALTER TABLE category_terms ADD CONSTRAINT fk_category_term_categoria FOREIGN KEY (categoria_id) REFERENCES master_categories(id) ON DELETE CASCADE','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

-- Força a reaplicação das cargas que foram marcadas como executadas durante a colisão.
DELETE FROM schema_migrations
 WHERE versao IN (
    '20260729_019_master_categories_automotivas',
    '20260729_020_category_terms_automotivos'
 );

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260729_022_corrige_taxonomia_legada');
