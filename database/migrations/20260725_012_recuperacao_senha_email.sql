-- Drive Learn VW - códigos de recuperação de senha por e-mail
-- Execute após 20260725_011_lembrar_login.sql.
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS usuario_codigos_senha (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id BIGINT UNSIGNED NOT NULL,
    codigo_hash VARCHAR(255) NOT NULL,
    expira_em DATETIME NOT NULL,
    tentativas TINYINT UNSIGNED NOT NULL DEFAULT 0,
    usado_em DATETIME NULL,
    ip_hash CHAR(64) NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_codigo_senha_usuario (usuario_id,usado_em,expira_em),
    KEY idx_codigo_senha_expiracao (expira_em),
    KEY idx_codigo_senha_ip (ip_hash,criado_em),
    CONSTRAINT fk_codigo_senha_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO schema_migrations(versao) VALUES ('20260725_012_recuperacao_senha_email');
