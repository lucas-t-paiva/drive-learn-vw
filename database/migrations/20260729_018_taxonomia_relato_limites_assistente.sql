-- Drive Learn VWCO
-- Cadastros da taxonomia do Service Desk e política de uso do assistente.
-- Execute após 20260729_017_service_desk_relato_setores_sla.sql.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS assistente_limites (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    empresa_id BIGINT UNSIGNED NULL,
    chave_escopo VARCHAR(80) NOT NULL UNIQUE,
    limite_diario SMALLINT UNSIGNED NOT NULL DEFAULT 40,
    observacao VARCHAR(500) NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_por BIGINT UNSIGNED NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_assistente_limite_empresa (empresa_id, ativo),
    CONSTRAINT fk_assistente_limite_empresa FOREIGN KEY (empresa_id) REFERENCES empresas(id) ON DELETE CASCADE,
    CONSTRAINT fk_assistente_limite_usuario FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO assistente_limites (empresa_id,chave_escopo,limite_diario,observacao,ativo)
SELECT NULL,'global',40,'Limite padrão para empresas sem configuração específica.',1
 WHERE NOT EXISTS (SELECT 1 FROM assistente_limites WHERE chave_escopo='global');

-- Distingue consultas que consomem franquia de passos locais do Service Desk.
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='assistente_interacoes' AND COLUMN_NAME='tipo_interacao')=0,
    'ALTER TABLE assistente_interacoes ADD COLUMN tipo_interacao VARCHAR(30) NOT NULL DEFAULT ''consulta'' AFTER entrada','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

INSERT IGNORE INTO permissoes (recurso,acao,descricao) VALUES
('report_categories','view','Visualizar categorias mestre de relatos'),
('report_categories','create','Cadastrar categorias mestre de relatos'),
('report_categories','update','Editar categorias mestre de relatos'),
('report_categories','delete','Excluir categorias mestre de relatos'),
('report_terms','view','Visualizar termos de classificação'),
('report_terms','create','Cadastrar termos de classificação'),
('report_terms','update','Editar termos de classificação'),
('report_terms','delete','Excluir termos de classificação');

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1
  FROM perfis pf
  JOIN permissoes p ON p.recurso IN ('report_categories','report_terms')
 WHERE pf.slug IN ('administrador','admin-empresa');

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1
  FROM perfis pf
  JOIN permissoes p ON p.recurso IN ('report_categories','report_terms')
 WHERE pf.slug='assistencia'
   AND p.acao IN ('view','create','update');

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260729_018_taxonomia_relato_limites_assistente');
