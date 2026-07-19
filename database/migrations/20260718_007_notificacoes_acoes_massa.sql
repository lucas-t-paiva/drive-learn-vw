-- Drive Learn VW - Migração 007: central de notificações
-- Data: 18/07/2026
-- A edição em massa utiliza as tabelas existentes; esta migração registra apenas leituras de notificações.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS notificacoes_lidas (
    usuario_id BIGINT UNSIGNED NOT NULL,
    notification_key VARCHAR(190) NOT NULL,
    lida_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(usuario_id,notification_key),
    CONSTRAINT fk_notificacao_lida_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_notificacao_lida_data(lida_em)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_007','Central de notificações e suporte às ações em massa de modelos')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
