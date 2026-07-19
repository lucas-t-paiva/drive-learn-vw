-- Drive Learn VW - Migração 005: acesso ao catálogo técnico e comparador
-- Data: 18/07/2026
-- Escopo: permissão de visualização para perfis internos autorizados.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO permissoes(recurso,acao,descricao)
VALUES('technical_catalog','view','Visualizar: Catálogo técnico e comparador de veículos')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

INSERT INTO perfil_permissoes(perfil_id,permissao_id,permitido)
SELECT pf.id,pm.id,1
  FROM perfis pf
  JOIN permissoes pm ON pm.recurso='technical_catalog' AND pm.acao='view'
 WHERE pf.slug IN('administrador','admin-empresa','assistencia','comercial-vwco')
ON DUPLICATE KEY UPDATE permitido=1;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_005','Catálogo técnico e comparador para perfis internos autorizados')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
