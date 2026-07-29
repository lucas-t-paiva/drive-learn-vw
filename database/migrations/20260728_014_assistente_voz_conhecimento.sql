-- Drive Learn - assistente técnico por voz, histórico e base reutilizável
-- Execute após 20260728_013_vinculos_marcas_videos_usuarios.sql.
SET NAMES utf8mb4;

-- A HostGator pode utilizar uma versão que ainda não aceita
-- ALTER TABLE ... ADD COLUMN IF NOT EXISTS. Por isso, cada coluna
-- é verificada no information_schema antes da alteração.

SET @dl_sql = IF(
    EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='videos' AND COLUMN_NAME='transcricao'),
    'SELECT 1',
    'ALTER TABLE videos ADD COLUMN transcricao LONGTEXT NULL AFTER descricao'
);
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql = IF(
    EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='videos' AND COLUMN_NAME='resumo_ia'),
    'SELECT 1',
    'ALTER TABLE videos ADD COLUMN resumo_ia TEXT NULL AFTER transcricao'
);
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql = IF(
    EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='videos' AND COLUMN_NAME='transcricao_status'),
    'SELECT 1',
    'ALTER TABLE videos ADD COLUMN transcricao_status ENUM(''pendente'',''processando'',''concluida'',''erro'') NOT NULL DEFAULT ''pendente'' AFTER resumo_ia'
);
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql = IF(
    EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='videos' AND COLUMN_NAME='transcricao_idioma'),
    'SELECT 1',
    'ALTER TABLE videos ADD COLUMN transcricao_idioma VARCHAR(10) NULL AFTER transcricao_status'
);
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql = IF(
    EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='videos' AND COLUMN_NAME='transcricao_atualizada_em'),
    'SELECT 1',
    'ALTER TABLE videos ADD COLUMN transcricao_atualizada_em DATETIME NULL AFTER transcricao_idioma'
);
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

CREATE TABLE IF NOT EXISTS assistente_respostas (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    contexto_hash CHAR(64) NOT NULL,
    pergunta_hash CHAR(64) NOT NULL,
    pergunta_base TEXT NOT NULL,
    pergunta_normalizada TEXT NOT NULL,
    resposta LONGTEXT NOT NULL,
    fontes JSON NULL,
    modelo_api VARCHAR(80) NULL,
    validada BOOLEAN NOT NULL DEFAULT FALSE,
    reutilizavel BOOLEAN NOT NULL DEFAULT TRUE,
    usos INT UNSIGNED NOT NULL DEFAULT 0,
    criada_por BIGINT UNSIGNED NULL,
    criada_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizada_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_assistente_contexto_hash (contexto_hash),
    KEY idx_assistente_pergunta_hash (pergunta_hash),
    KEY idx_assistente_reutilizacao (reutilizavel,validada),
    CONSTRAINT fk_assistente_resposta_usuario
        FOREIGN KEY (criada_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS assistente_interacoes (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id BIGINT UNSIGNED NOT NULL,
    empresa_id BIGINT UNSIGNED NULL,
    resposta_id BIGINT UNSIGNED NULL,
    pergunta TEXT NOT NULL,
    pergunta_normalizada TEXT NOT NULL,
    resposta LONGTEXT NULL,
    entrada ENUM('texto','voz') NOT NULL DEFAULT 'texto',
    origem_resposta ENUM('cache','ia','indisponivel') NOT NULL DEFAULT 'ia',
    tokens_entrada INT UNSIGNED NOT NULL DEFAULT 0,
    tokens_saida INT UNSIGNED NOT NULL DEFAULT 0,
    audio_segundos SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    custo_estimado_usd DECIMAL(12,6) NOT NULL DEFAULT 0,
    latencia_ms INT UNSIGNED NOT NULL DEFAULT 0,
    status ENUM('sucesso','erro','bloqueada') NOT NULL DEFAULT 'sucesso',
    erro VARCHAR(500) NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_assistente_usuario_data (usuario_id,criado_em),
    KEY idx_assistente_empresa_data (empresa_id,criado_em),
    KEY idx_assistente_resposta (resposta_id),
    CONSTRAINT fk_assistente_interacao_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_assistente_interacao_empresa
        FOREIGN KEY (empresa_id) REFERENCES empresas(id) ON DELETE SET NULL,
    CONSTRAINT fk_assistente_interacao_resposta
        FOREIGN KEY (resposta_id) REFERENCES assistente_respostas(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO schema_migrations(versao)
VALUES ('20260728_014_assistente_voz_conhecimento');
