-- Drive Learn VW - Migração 008
-- Importação e exportação de modelos; separação de PBT/PBTC e relação de redução.
-- Execute este arquivo uma única vez no banco da HostGator.

SET NAMES utf8mb4;

DELIMITER $$

DROP PROCEDURE IF EXISTS dl_migracao_008$$
CREATE PROCEDURE dl_migracao_008()
BEGIN
    IF NOT EXISTS (
        SELECT 1
          FROM information_schema.COLUMNS
         WHERE TABLE_SCHEMA = DATABASE()
           AND TABLE_NAME = 'modelos'
           AND COLUMN_NAME = 'pbtc'
    ) THEN
        ALTER TABLE modelos
            ADD COLUMN pbtc VARCHAR(100) NULL AFTER pbt;
    END IF;

    IF NOT EXISTS (
        SELECT 1
          FROM information_schema.COLUMNS
         WHERE TABLE_SCHEMA = DATABASE()
           AND TABLE_NAME = 'modelos'
           AND COLUMN_NAME = 'relacao_reducao'
    ) THEN
        ALTER TABLE modelos
            ADD COLUMN relacao_reducao VARCHAR(160) NULL AFTER pbtc;
    END IF;
END$$

CALL dl_migracao_008()$$
DROP PROCEDURE IF EXISTS dl_migracao_008$$

DELIMITER ;

-- Os dados antigos que estavam identificados explicitamente como PBTC
-- são movidos para a nova coluna, sem sobrescrever valores já revisados.
UPDATE modelos
   SET pbtc = NULLIF(TRIM(REPLACE(REPLACE(pbt, 'PBTC', ''), 'pbtc', '')), ''),
       pbt = NULL
 WHERE NULLIF(TRIM(pbtc), '') IS NULL
   AND UPPER(COALESCE(pbt, '')) LIKE '%PBTC%';

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260725_008','Importação e exportação de modelos, PBT/PBTC e relação de redução')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
