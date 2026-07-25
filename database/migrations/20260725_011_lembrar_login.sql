-- Drive Learn VW - autenticação persistente para "Lembrar de mim"
-- Execute após 20260725_010_tipo_veiculo_familias_frotas.sql.
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS usuario_tokens_lembrar (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id BIGINT UNSIGNED NOT NULL,
    seletor CHAR(24) NOT NULL,
    token_hash CHAR(64) NOT NULL,
    expira_em DATETIME NOT NULL,
    user_agent_hash CHAR(64) NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ultimo_uso_em DATETIME NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_usuario_token_lembrar_seletor (seletor),
    KEY idx_usuario_token_lembrar_usuario (usuario_id),
    KEY idx_usuario_token_lembrar_expiracao (expira_em),
    CONSTRAINT fk_usuario_token_lembrar_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO schema_migrations(versao) VALUES ('20260725_011_lembrar_login');
