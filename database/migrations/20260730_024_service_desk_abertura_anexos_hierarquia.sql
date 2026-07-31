-- Drive Learn VWCO
-- Abertura manual, rascunhos, anexos e hierarquia do Service Desk.
-- Execute após 20260730_023_service_desk_prioridades_workflow.sql.

START TRANSACTION;

ALTER TABLE service_reports
    MODIFY COLUMN status ENUM(
        'rascunho',
        'novo',
        'transferido',
        'em_tratamento',
        'possivel_solucao',
        'finalizado',
        'cancelado'
    ) NOT NULL DEFAULT 'novo';

CREATE TABLE IF NOT EXISTS service_report_attachments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id BIGINT UNSIGNED NOT NULL,
    message_id BIGINT UNSIGNED NULL,
    usuario_id BIGINT UNSIGNED NULL,
    contexto ENUM('abertura','interacao','assistente') NOT NULL DEFAULT 'abertura',
    tipo ENUM('imagem','video','audio','documento') NOT NULL DEFAULT 'documento',
    nome_original VARCHAR(255) NOT NULL,
    caminho VARCHAR(700) NOT NULL,
    mime VARCHAR(120) NOT NULL,
    tamanho BIGINT UNSIGNED NOT NULL DEFAULT 0,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_service_attachment_report (report_id, criado_em),
    INDEX idx_service_attachment_message (message_id),
    CONSTRAINT fk_service_attachment_report
        FOREIGN KEY (report_id) REFERENCES service_reports(id) ON DELETE CASCADE,
    CONSTRAINT fk_service_attachment_message
        FOREIGN KEY (message_id) REFERENCES service_report_messages(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_attachment_user
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO perfis
    (empresa_id,nome,slug,escopo,nivel,sistema,tipo_empresa,pode_gerenciar_usuarios,ativo)
VALUES
    (NULL,'Coordenação','coordenacao','global',70,1,'qualquer',0,1),
    (NULL,'Colaborador VWCO','colaborador-vwco','empresa',30,1,'vwco',0,1)
ON DUPLICATE KEY UPDATE
    nome=VALUES(nome),
    nivel=VALUES(nivel),
    sistema=1,
    tipo_empresa=VALUES(tipo_empresa),
    ativo=1;

INSERT INTO permissoes (recurso,acao,descricao) VALUES
    ('service_desk','view','Visualizar chamados conforme a hierarquia do perfil'),
    ('service_desk','create','Criar chamados e salvar rascunhos'),
    ('service_desk','update','Tratar, transferir, recategorizar e solucionar chamados'),
    ('service_desk','delete','Excluir chamados e seus anexos')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

DELETE pp
  FROM perfil_permissoes pp
  JOIN perfis pf ON pf.id=pp.perfil_id
  JOIN permissoes pm ON pm.id=pp.permissao_id
 WHERE pm.recurso='service_desk'
   AND pf.slug IN ('cliente','colaborador-cliente','coordenacao','colaborador-vwco')
   AND pm.acao IN ('update','delete');

INSERT INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,pm.id,1
  FROM perfis pf
  JOIN permissoes pm ON pm.recurso='service_desk' AND pm.acao IN ('view','create')
 WHERE pf.slug IN ('cliente','colaborador-cliente','coordenacao','colaborador-vwco')
ON DUPLICATE KEY UPDATE permitido=1;

INSERT INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,pm.id,1
  FROM perfis pf
  JOIN permissoes pm ON pm.recurso='service_desk'
 WHERE pf.slug='administrador'
ON DUPLICATE KEY UPDATE permitido=1;

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260730_024_service_desk_abertura_anexos_hierarquia');

COMMIT;
