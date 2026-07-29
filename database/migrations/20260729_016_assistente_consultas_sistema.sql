-- Drive Learn - consultas analíticas de frota, clientes, marcas e regiões
-- Execute após 20260729_015_assistente_fontes_acoes_catalogo.sql.
SET NAMES utf8mb4;

ALTER TABLE assistente_interacao_fontes
    MODIFY COLUMN tipo ENUM('video','modelo','frota') NOT NULL;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO schema_migrations(versao)
VALUES ('20260729_016_assistente_consultas_sistema');
