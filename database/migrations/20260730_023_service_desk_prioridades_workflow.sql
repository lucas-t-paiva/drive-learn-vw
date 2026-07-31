-- Drive Learn VWCO
-- Service Desk profissional: prioridades, SLA, recorrência, origem, soluções e protocolo RE/RQ.
-- Execute após 20260729_022_corrige_taxonomia_legada.sql.
-- Compatível com MySQL/MariaDB sem ADD COLUMN IF NOT EXISTS.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS service_priorities (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(5) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(500) NULL,
    cor VARCHAR(10) NOT NULL DEFAULT '#64748b',
    ordem TINYINT UNSIGNED NOT NULL DEFAULT 3,
    sla_primeira_interacao_minutos INT UNSIGNED NOT NULL,
    sla_resolucao_minutos INT UNSIGNED NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_service_priority_codigo (codigo),
    INDEX idx_service_priority_ativo_ordem (ativo, ordem)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO service_priorities
    (codigo,nome,descricao,cor,ordem,sla_primeira_interacao_minutos,sla_resolucao_minutos,ativo)
VALUES
    ('P1','Crítica','Risco à segurança, indisponibilidade total ou impacto operacional crítico.','#c81e3a',1,15,240,1),
    ('P2','Alta','Falha relevante, operação comprometida ou impacto em vários usuários.','#e4572e',2,60,480,1),
    ('P3','Moderada','Impacto controlado, com alternativa operacional disponível.','#e59b15',3,240,1440,1),
    ('P4','Baixa','Impacto limitado, dúvida, ajuste ou ocorrência sem bloqueio.','#1683b5',4,480,4320,1),
    ('P5','Planejada','Sugestão ou melhoria para análise de produto e planejamento.','#64748b',5,1440,10800,1)
ON DUPLICATE KEY UPDATE
    nome=VALUES(nome),
    descricao=VALUES(descricao),
    cor=VALUES(cor),
    ordem=VALUES(ordem),
    sla_primeira_interacao_minutos=VALUES(sla_primeira_interacao_minutos),
    sla_resolucao_minutos=VALUES(sla_resolucao_minutos);

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='prioridade_padrao_id')=0,
    'ALTER TABLE master_categories ADD COLUMN prioridade_padrao_id BIGINT UNSIGNED NULL AFTER setor_padrao_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND COLUMN_NAME='prioridade_id')=0,
    'ALTER TABLE service_reports ADD COLUMN prioridade_id BIGINT UNSIGNED NULL AFTER responsavel_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND COLUMN_NAME='grupo')=0,
    'ALTER TABLE service_reports ADD COLUMN grupo VARCHAR(20) NOT NULL DEFAULT ''incidente'' AFTER prioridade_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND COLUMN_NAME='origem_item')=0,
    'ALTER TABLE service_reports ADD COLUMN origem_item VARCHAR(20) NOT NULL DEFAULT ''veiculo'' AFTER grupo','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND COLUMN_NAME='recorrente')=0,
    'ALTER TABLE service_reports ADD COLUMN recorrente BOOLEAN NOT NULL DEFAULT FALSE AFTER origem_item','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND COLUMN_NAME='ticket_pai_id')=0,
    'ALTER TABLE service_reports ADD COLUMN ticket_pai_id BIGINT UNSIGNED NULL AFTER recorrente','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_report_history' AND COLUMN_NAME='dados_json')=0,
    'ALTER TABLE service_report_history ADD COLUMN dados_json LONGTEXT NULL AFTER observacao','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

CREATE TABLE IF NOT EXISTS service_report_solutions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id BIGINT UNSIGNED NOT NULL,
    usuario_id BIGINT UNSIGNED NULL,
    tipo ENUM('proposta','aplicada') NOT NULL DEFAULT 'proposta',
    descricao LONGTEXT NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_service_solution_report (report_id, criado_em),
    CONSTRAINT fk_service_solution_report FOREIGN KEY (report_id) REFERENCES service_reports(id) ON DELETE CASCADE,
    CONSTRAINT fk_service_solution_user FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO service_report_solutions (report_id,usuario_id,tipo,descricao,criado_em)
SELECT sr.id,sr.responsavel_id,'proposta',sr.solucao_proposta,COALESCE(sr.atualizado_em,sr.criado_em)
  FROM service_reports sr
 WHERE NULLIF(TRIM(sr.solucao_proposta),'') IS NOT NULL
   AND NOT EXISTS (SELECT 1 FROM service_report_solutions ss WHERE ss.report_id=sr.id AND ss.tipo='proposta' AND ss.descricao=sr.solucao_proposta);

INSERT INTO service_report_solutions (report_id,usuario_id,tipo,descricao,criado_em)
SELECT sr.id,sr.responsavel_id,'aplicada',sr.solucao_final,COALESCE(sr.finalizado_em,sr.atualizado_em,sr.criado_em)
  FROM service_reports sr
 WHERE NULLIF(TRIM(sr.solucao_final),'') IS NOT NULL
   AND NOT EXISTS (SELECT 1 FROM service_report_solutions ss WHERE ss.report_id=sr.id AND ss.tipo='aplicada' AND ss.descricao=sr.solucao_final);

SET @dl_has_fk := (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND CONSTRAINT_NAME='fk_master_category_priority');
SET @dl_sql := IF(@dl_has_fk=0,
    'ALTER TABLE master_categories ADD CONSTRAINT fk_master_category_priority FOREIGN KEY (prioridade_padrao_id) REFERENCES service_priorities(id) ON DELETE SET NULL','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_has_fk := (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND CONSTRAINT_NAME='fk_service_report_priority');
SET @dl_sql := IF(@dl_has_fk=0,
    'ALTER TABLE service_reports ADD CONSTRAINT fk_service_report_priority FOREIGN KEY (prioridade_id) REFERENCES service_priorities(id) ON DELETE SET NULL','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_has_fk := (SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND CONSTRAINT_NAME='fk_service_report_parent');
SET @dl_sql := IF(@dl_has_fk=0,
    'ALTER TABLE service_reports ADD CONSTRAINT fk_service_report_parent FOREIGN KEY (ticket_pai_id) REFERENCES service_reports(id) ON DELETE SET NULL','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_has_index := (SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND INDEX_NAME='idx_service_report_priority_status');
SET @dl_sql := IF(@dl_has_index=0,
    'ALTER TABLE service_reports ADD INDEX idx_service_report_priority_status (prioridade_id,status)','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_has_index := (SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='service_reports' AND INDEX_NAME='idx_service_report_parent');
SET @dl_sql := IF(@dl_has_index=0,
    'ALTER TABLE service_reports ADD INDEX idx_service_report_parent (ticket_pai_id)','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @p1 := (SELECT id FROM service_priorities WHERE codigo='P1' LIMIT 1);
SET @p2 := (SELECT id FROM service_priorities WHERE codigo='P2' LIMIT 1);
SET @p3 := (SELECT id FROM service_priorities WHERE codigo='P3' LIMIT 1);
SET @p4 := (SELECT id FROM service_priorities WHERE codigo='P4' LIMIT 1);
SET @p5 := (SELECT id FROM service_priorities WHERE codigo='P5' LIMIT 1);

UPDATE master_categories
   SET prioridade_padrao_id=CASE
       WHEN tipo IN ('melhoria','sugestao') THEN @p5
       WHEN slug IN ('freios-retarder-freio-motor','seguranca-ativa-adas') THEN @p2
       ELSE @p3
   END
 WHERE prioridade_padrao_id IS NULL;

UPDATE service_reports
   SET prioridade_id=CASE criticidade
       WHEN 'critica' THEN @p1
       WHEN 'alta' THEN @p2
       WHEN 'baixa' THEN @p4
       ELSE @p3
   END
 WHERE prioridade_id IS NULL;

UPDATE service_reports
   SET grupo=CASE WHEN tipo IN ('melhoria','sugestao') THEN 'requisicao' ELSE 'incidente' END
 WHERE grupo IS NULL OR grupo='' OR grupo NOT IN ('incidente','requisicao');

INSERT INTO master_categories
    (setor_padrao_id,prioridade_padrao_id,nome,slug,tipo,descricao,sla_primeira_resposta_horas,sla_resolucao_horas,ativo)
SELECT
    (SELECT id FROM setores WHERE slug='triagem-service-desk' ORDER BY id LIMIT 1),
    @p3,
    'Sistemas',
    'sistemas',
    'erro',
    'Falhas, erros e oportunidades relacionados à plataforma, portal ou sistemas web.',
    8,
    72,
    1
WHERE NOT EXISTS (SELECT 1 FROM master_categories WHERE slug='sistemas');

INSERT IGNORE INTO category_terms (categoria_id,termo,peso,ativo)
SELECT id,'sistemas web',10,1 FROM master_categories WHERE slug='sistemas'
UNION ALL SELECT id,'sistema web',10,1 FROM master_categories WHERE slug='sistemas'
UNION ALL SELECT id,'plataforma',8,1 FROM master_categories WHERE slug='sistemas'
UNION ALL SELECT id,'portal',7,1 FROM master_categories WHERE slug='sistemas'
UNION ALL SELECT id,'site',6,1 FROM master_categories WHERE slug='sistemas'
UNION ALL SELECT id,'tela',5,1 FROM master_categories WHERE slug='sistemas';

INSERT IGNORE INTO permissoes (recurso,acao,descricao) VALUES
('service_priorities','view','Visualizar prioridades e SLAs do Service Desk'),
('service_priorities','create','Cadastrar prioridades e SLAs do Service Desk'),
('service_priorities','update','Editar prioridades e SLAs do Service Desk'),
('service_priorities','delete','Excluir prioridades sem vínculos');

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id)
SELECT p.id,pm.id FROM perfis p JOIN permissoes pm ON pm.recurso='service_priorities'
WHERE p.slug='administrador';

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id)
SELECT p.id,pm.id FROM perfis p JOIN permissoes pm ON pm.recurso='service_priorities' AND pm.acao IN ('view','create','update')
WHERE p.slug IN ('administrador-empresa','assistencia-tecnica');

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260730_023_service_desk_prioridades_workflow');
