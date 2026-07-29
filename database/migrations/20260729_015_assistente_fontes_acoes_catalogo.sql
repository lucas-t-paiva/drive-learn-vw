-- Drive Learn - rastreabilidade das fontes utilizadas pelo assistente
-- Execute após 20260728_014_assistente_voz_conhecimento.sql.
SET NAMES utf8mb4;

SET @dl_sql = IF(
    EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='assistente_interacoes' AND COLUMN_NAME='acao_json'),
    'SELECT 1',
    'ALTER TABLE assistente_interacoes ADD COLUMN acao_json JSON NULL AFTER erro'
);
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

ALTER TABLE assistente_interacoes
    MODIFY COLUMN origem_resposta ENUM('cache','local','ia','indisponivel') NOT NULL DEFAULT 'ia';

CREATE TABLE IF NOT EXISTS assistente_interacao_fontes (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    interacao_id BIGINT UNSIGNED NOT NULL,
    tipo ENUM('video','modelo') NOT NULL,
    video_id BIGINT UNSIGNED NULL,
    modelo_id BIGINT UNSIGNED NULL,
    titulo VARCHAR(255) NOT NULL,
    transcricao_snapshot LONGTEXT NULL,
    conteudo_snapshot LONGTEXT NULL,
    fonte_atualizada_em DATETIME NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_assistente_fonte_interacao (interacao_id),
    KEY idx_assistente_fonte_video (video_id),
    KEY idx_assistente_fonte_modelo (modelo_id),
    CONSTRAINT fk_assistente_fonte_interacao
        FOREIGN KEY (interacao_id) REFERENCES assistente_interacoes(id) ON DELETE CASCADE,
    CONSTRAINT fk_assistente_fonte_video
        FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE SET NULL,
    CONSTRAINT fk_assistente_fonte_modelo
        FOREIGN KEY (modelo_id) REFERENCES modelos(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO schema_migrations(versao)
VALUES ('20260729_015_assistente_fontes_acoes_catalogo');
