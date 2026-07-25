-- Drive Learn VW - classificação de famílias e frotas por tipo de veículo
-- Execute após 20260725_009_catalogo_onibus_multimarcas.sql.
SET NAMES utf8mb4;
START TRANSACTION;
SET @schema_name = DATABASE();

SET @sql = IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=@schema_name AND TABLE_NAME='familias' AND COLUMN_NAME='tipo_veiculo')=0,
'ALTER TABLE familias ADD COLUMN tipo_veiculo ENUM(''caminhao'',''onibus'') NOT NULL DEFAULT ''caminhao'' AFTER marca_id','SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @sql = IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=@schema_name AND TABLE_NAME='frotas' AND COLUMN_NAME='tipo_veiculo')=0,
'ALTER TABLE frotas ADD COLUMN tipo_veiculo ENUM(''caminhao'',''onibus'') NOT NULL DEFAULT ''caminhao'' AFTER marca_id','SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

UPDATE familias SET tipo_veiculo='onibus'
WHERE LOWER(nome) LIKE '%ônibus%' OR LOWER(nome) LIKE '%onibus%' OR LOWER(nome) LIKE '%escolar%'
   OR LOWER(nome) LIKE '%rodoviár%' OR LOWER(nome) LIKE '%rodoviar%' OR LOWER(nome) LIKE '%fretamento%'
   OR LOWER(nome) LIKE '%urbano%' OR LOWER(nome) LIKE '%volksbus%' OR LOWER(nome) LIKE '%micro-ônibus%'
   OR LOWER(nome) LIKE '%micro-onibus%' OR LOWER(nome) LIKE '%iveco bus%' OR LOWER(nome) LIKE '%b13r%'
   OR LOWER(nome) LIKE '%bzr%' OR LOWER(nome) LIKE '%eo500%' OR LOWER(nome) LIKE '%e-o500%';

UPDATE frotas fr
LEFT JOIN modelos m ON m.id=fr.modelo_id
LEFT JOIN familias fa ON fa.id=COALESCE(m.familia_id,fr.familia_id)
SET fr.tipo_veiculo=COALESCE(fa.tipo_veiculo,fr.tipo_veiculo,'caminhao');

SET @sql = IF((SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=@schema_name AND TABLE_NAME='familias' AND INDEX_NAME='idx_familias_tipo_veiculo')=0,
'ALTER TABLE familias ADD INDEX idx_familias_tipo_veiculo(tipo_veiculo,ativo)','SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @sql = IF((SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=@schema_name AND TABLE_NAME='frotas' AND INDEX_NAME='idx_frotas_tipo_veiculo')=0,
'ALTER TABLE frotas ADD INDEX idx_frotas_tipo_veiculo(tipo_veiculo,cliente_id)','SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

CREATE TABLE IF NOT EXISTS schema_migrations(versao VARCHAR(100) NOT NULL PRIMARY KEY,aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT IGNORE INTO schema_migrations(versao) VALUES ('20260725_010_tipo_veiculo_familias_frotas');
COMMIT;
