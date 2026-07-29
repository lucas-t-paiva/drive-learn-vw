-- Drive Learn VWCO
-- Permissões do módulo dedicado de Setores e equipes.
-- Execute após 20260729_020_category_terms_automotivos.sql.

SET NAMES utf8mb4;

INSERT IGNORE INTO permissoes (recurso,acao,descricao) VALUES
('sectors','view','Visualizar setores e equipes'),
('sectors','create','Cadastrar setores'),
('sectors','update','Editar setores e gerenciar integrantes'),
('sectors','delete','Inativar setores');

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1
  FROM perfis pf
  JOIN permissoes p ON p.recurso='sectors'
 WHERE pf.slug IN ('administrador','admin-empresa');

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260729_021_gestao_setores_equipes');
