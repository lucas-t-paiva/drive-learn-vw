-- Drive Learn VWCO
-- Service Desk de relatos, categorização, setores, SLA e satisfação.
-- Compatível com MySQL/MariaDB sem ADD COLUMN IF NOT EXISTS.
-- Pode ser executado novamente após uma importação parcial: as estruturas e sementes são idempotentes.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS setores (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    empresa_id BIGINT UNSIGNED NULL,
    nome VARCHAR(120) NOT NULL,
    slug VARCHAR(140) NOT NULL,
    descricao VARCHAR(500) NULL,
    email VARCHAR(180) NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_setor_empresa_slug (empresa_id, slug),
    INDEX idx_setor_empresa_ativo (empresa_id, ativo),
    CONSTRAINT fk_setor_empresa FOREIGN KEY (empresa_id) REFERENCES empresas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS usuario_setores (
    usuario_id BIGINT UNSIGNED NOT NULL,
    setor_id BIGINT UNSIGNED NOT NULL,
    principal BOOLEAN NOT NULL DEFAULT FALSE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, setor_id),
    INDEX idx_usuario_setor_ativo (setor_id, ativo),
    CONSTRAINT fk_usuario_setor_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_setor_setor FOREIGN KEY (setor_id) REFERENCES setores(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS master_categories (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    parent_id BIGINT UNSIGNED NULL,
    setor_padrao_id BIGINT UNSIGNED NULL,
    nome VARCHAR(120) NOT NULL,
    slug VARCHAR(140) NOT NULL UNIQUE,
    tipo ENUM('falha','erro','melhoria','sugestao','geral') NOT NULL DEFAULT 'geral',
    descricao VARCHAR(500) NULL,
    sla_primeira_resposta_horas SMALLINT UNSIGNED NOT NULL DEFAULT 8,
    sla_resolucao_horas SMALLINT UNSIGNED NOT NULL DEFAULT 72,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_master_categoria_tipo_ativo (tipo, ativo),
    CONSTRAINT fk_master_categoria_parent FOREIGN KEY (parent_id) REFERENCES master_categories(id) ON DELETE SET NULL,
    CONSTRAINT fk_master_categoria_setor FOREIGN KEY (setor_padrao_id) REFERENCES setores(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- A HostGator pode já possuir master_categories de uma versão anterior.
-- Como o servidor não aceita ADD COLUMN IF NOT EXISTS, cada coluna é criada por SQL dinâmico.
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='parent_id')=0,
    'ALTER TABLE master_categories ADD COLUMN parent_id BIGINT UNSIGNED NULL AFTER id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='setor_padrao_id')=0,
    'ALTER TABLE master_categories ADD COLUMN setor_padrao_id BIGINT UNSIGNED NULL AFTER parent_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='nome')=0,
    'ALTER TABLE master_categories ADD COLUMN nome VARCHAR(120) NOT NULL DEFAULT ''Categoria sem nome'' AFTER setor_padrao_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='slug')=0,
    'ALTER TABLE master_categories ADD COLUMN slug VARCHAR(140) NULL AFTER nome','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='tipo')=0,
    'ALTER TABLE master_categories ADD COLUMN tipo VARCHAR(30) NOT NULL DEFAULT ''geral'' AFTER slug','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

-- VARCHAR preserva tipos antigos e aceita os novos valores sem conflito com ENUM legado.
ALTER TABLE master_categories MODIFY COLUMN tipo VARCHAR(30) NOT NULL DEFAULT 'geral';

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='descricao')=0,
    'ALTER TABLE master_categories ADD COLUMN descricao VARCHAR(500) NULL AFTER tipo','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='sla_primeira_resposta_horas')=0,
    'ALTER TABLE master_categories ADD COLUMN sla_primeira_resposta_horas SMALLINT UNSIGNED NOT NULL DEFAULT 8 AFTER descricao','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='sla_resolucao_horas')=0,
    'ALTER TABLE master_categories ADD COLUMN sla_resolucao_horas SMALLINT UNSIGNED NOT NULL DEFAULT 72 AFTER sla_primeira_resposta_horas','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='ativo')=0,
    'ALTER TABLE master_categories ADD COLUMN ativo BOOLEAN NOT NULL DEFAULT TRUE AFTER sla_resolucao_horas','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='criado_em')=0,
    'ALTER TABLE master_categories ADD COLUMN criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER ativo','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND COLUMN_NAME='atualizado_em')=0,
    'ALTER TABLE master_categories ADD COLUMN atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER criado_em','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

UPDATE master_categories SET slug=CONCAT('categoria-',id) WHERE slug IS NULL OR TRIM(slug)='';

SET @dl_has_index := (SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='master_categories' AND INDEX_NAME='uk_master_category_slug');
SET @dl_has_duplicate := (SELECT COUNT(*) FROM (SELECT slug FROM master_categories WHERE slug IS NOT NULL GROUP BY slug HAVING COUNT(*)>1) dl_duplicate_slugs);
SET @dl_sql := IF(@dl_has_index=0 AND @dl_has_duplicate=0,
    'ALTER TABLE master_categories ADD UNIQUE KEY uk_master_category_slug (slug)','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

CREATE TABLE IF NOT EXISTS category_terms (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    categoria_id BIGINT UNSIGNED NOT NULL,
    termo VARCHAR(120) NOT NULL,
    peso TINYINT UNSIGNED NOT NULL DEFAULT 1,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY uk_category_term (categoria_id, termo),
    INDEX idx_category_term_ativo (ativo, termo),
    CONSTRAINT fk_category_term_categoria FOREIGN KEY (categoria_id) REFERENCES master_categories(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Compatibilidade equivalente para uma category_terms já existente.
SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='categoria_id')=0,
    'ALTER TABLE category_terms ADD COLUMN categoria_id BIGINT UNSIGNED NULL AFTER id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='termo')=0,
    'ALTER TABLE category_terms ADD COLUMN termo VARCHAR(120) NULL AFTER categoria_id','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='peso')=0,
    'ALTER TABLE category_terms ADD COLUMN peso TINYINT UNSIGNED NOT NULL DEFAULT 1 AFTER termo','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='ativo')=0,
    'ALTER TABLE category_terms ADD COLUMN ativo BOOLEAN NOT NULL DEFAULT TRUE AFTER peso','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_sql := IF((SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND COLUMN_NAME='criado_em')=0,
    'ALTER TABLE category_terms ADD COLUMN criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER ativo','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

SET @dl_has_index := (SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='category_terms' AND INDEX_NAME='uk_category_term');
SET @dl_has_duplicate := (SELECT COUNT(*) FROM (SELECT categoria_id,termo FROM category_terms WHERE categoria_id IS NOT NULL AND termo IS NOT NULL GROUP BY categoria_id,termo HAVING COUNT(*)>1) dl_duplicate_terms);
SET @dl_sql := IF(@dl_has_index=0 AND @dl_has_duplicate=0,
    'ALTER TABLE category_terms ADD UNIQUE KEY uk_category_term (categoria_id,termo)','SELECT 1');
PREPARE dl_stmt FROM @dl_sql; EXECUTE dl_stmt; DEALLOCATE PREPARE dl_stmt;

CREATE TABLE IF NOT EXISTS service_reports (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    protocolo VARCHAR(30) NULL UNIQUE,
    usuario_id BIGINT UNSIGNED NOT NULL,
    empresa_cliente_id BIGINT UNSIGNED NULL,
    marca_id BIGINT UNSIGNED NULL,
    familia_id BIGINT UNSIGNED NULL,
    modelo_id BIGINT UNSIGNED NULL,
    setor_id BIGINT UNSIGNED NULL,
    categoria_id BIGINT UNSIGNED NULL,
    responsavel_id BIGINT UNSIGNED NULL,
    tipo ENUM('falha','erro','melhoria','sugestao') NOT NULL,
    canal ENUM('texto','voz') NOT NULL DEFAULT 'texto',
    titulo VARCHAR(190) NOT NULL,
    relato_original LONGTEXT NOT NULL,
    relato_normalizado LONGTEXT NULL,
    resumo_triagem TEXT NULL,
    criticidade ENUM('baixa','media','alta','critica') NOT NULL DEFAULT 'media',
    status ENUM('novo','transferido','em_tratamento','possivel_solucao','finalizado','cancelado') NOT NULL DEFAULT 'novo',
    solucao_proposta TEXT NULL,
    solucao_final TEXT NULL,
    sla_primeira_resposta_em DATETIME NULL,
    primeira_resposta_em DATETIME NULL,
    sla_resolucao_em DATETIME NULL,
    finalizado_em DATETIME NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_service_report_empresa_status (empresa_cliente_id, status),
    INDEX idx_service_report_setor_status (setor_id, status),
    INDEX idx_service_report_responsavel_status (responsavel_id, status),
    INDEX idx_service_report_categoria (categoria_id, criado_em),
    INDEX idx_service_report_usuario (usuario_id, criado_em),
    CONSTRAINT fk_service_report_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT fk_service_report_empresa FOREIGN KEY (empresa_cliente_id) REFERENCES empresas(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_report_marca FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_report_familia FOREIGN KEY (familia_id) REFERENCES familias(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_report_modelo FOREIGN KEY (modelo_id) REFERENCES modelos(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_report_setor FOREIGN KEY (setor_id) REFERENCES setores(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_report_categoria FOREIGN KEY (categoria_id) REFERENCES master_categories(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_report_responsavel FOREIGN KEY (responsavel_id) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS service_report_messages (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id BIGINT UNSIGNED NOT NULL,
    usuario_id BIGINT UNSIGNED NULL,
    origem ENUM('usuario','assistente','interno','sistema') NOT NULL,
    mensagem LONGTEXT NOT NULL,
    audio_segundos SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_service_message_report (report_id, criado_em),
    CONSTRAINT fk_service_message_report FOREIGN KEY (report_id) REFERENCES service_reports(id) ON DELETE CASCADE,
    CONSTRAINT fk_service_message_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS service_report_history (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id BIGINT UNSIGNED NOT NULL,
    usuario_id BIGINT UNSIGNED NULL,
    evento VARCHAR(80) NOT NULL,
    status_anterior VARCHAR(40) NULL,
    status_novo VARCHAR(40) NULL,
    setor_anterior_id BIGINT UNSIGNED NULL,
    setor_novo_id BIGINT UNSIGNED NULL,
    responsavel_anterior_id BIGINT UNSIGNED NULL,
    responsavel_novo_id BIGINT UNSIGNED NULL,
    observacao TEXT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_service_history_report (report_id, criado_em),
    CONSTRAINT fk_service_history_report FOREIGN KEY (report_id) REFERENCES service_reports(id) ON DELETE CASCADE,
    CONSTRAINT fk_service_history_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_history_setor_anterior FOREIGN KEY (setor_anterior_id) REFERENCES setores(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_history_setor_novo FOREIGN KEY (setor_novo_id) REFERENCES setores(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_history_responsavel_anterior FOREIGN KEY (responsavel_anterior_id) REFERENCES usuarios(id) ON DELETE SET NULL,
    CONSTRAINT fk_service_history_responsavel_novo FOREIGN KEY (responsavel_novo_id) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS service_report_satisfaction (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    report_id BIGINT UNSIGNED NOT NULL UNIQUE,
    usuario_id BIGINT UNSIGNED NOT NULL,
    nota TINYINT UNSIGNED NOT NULL,
    resolvido BOOLEAN NOT NULL DEFAULT TRUE,
    comentario VARCHAR(1000) NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_service_satisfaction_report FOREIGN KEY (report_id) REFERENCES service_reports(id) ON DELETE CASCADE,
    CONSTRAINT fk_service_satisfaction_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS assistente_satisfacoes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    interacao_id BIGINT UNSIGNED NULL,
    usuario_id BIGINT UNSIGNED NOT NULL,
    nota TINYINT UNSIGNED NOT NULL,
    comentario VARCHAR(1000) NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_assistente_satisfacao_usuario (usuario_id, criado_em),
    CONSTRAINT fk_assistente_satisfacao_interacao FOREIGN KEY (interacao_id) REFERENCES assistente_interacoes(id) ON DELETE SET NULL,
    CONSTRAINT fk_assistente_satisfacao_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO setores (empresa_id, nome, slug, descricao, ativo)
SELECT NULL, 'Triagem Service Desk', 'triagem-service-desk', 'Primeiro atendimento e direcionamento dos relatos recebidos pela plataforma.', 1
 WHERE NOT EXISTS (SELECT 1 FROM setores WHERE empresa_id IS NULL AND slug='triagem-service-desk');

SET @setor_triagem := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='triagem-service-desk' ORDER BY id LIMIT 1);

INSERT INTO master_categories (setor_padrao_id,nome,slug,tipo,descricao,sla_primeira_resposta_horas,sla_resolucao_horas,ativo) VALUES
(@setor_triagem,'Conforto térmico','conforto-termico','falha','Temperatura, calor, isolamento térmico e desconforto na cabine.',4,48,1),
(@setor_triagem,'Ar-condicionado e ventilação','ar-condicionado-ventilacao','falha','Climatização, ventilação, refrigeração e fluxo de ar.',4,48,1),
(@setor_triagem,'Motor e arrefecimento','motor-arrefecimento','falha','Motor, temperatura do motor, fluidos e sistema de arrefecimento.',2,24,1),
(@setor_triagem,'Freios e segurança','freios-seguranca','falha','Freios, retarder, freio-motor e itens de segurança.',1,12,1),
(@setor_triagem,'Painel, elétrica e eletrônica','painel-eletrica-eletronica','erro','Cluster, luzes, botões, sensores, alertas e sistemas elétricos.',4,48,1),
(@setor_triagem,'Transmissão e tração','transmissao-tracao','falha','Câmbio, embreagem, diferencial, eixos e tração.',4,48,1),
(@setor_triagem,'Chassi, suspensão e direção','chassi-suspensao-direcao','falha','Chassi, suspensão, estabilidade, direção e vibrações.',4,48,1),
(@setor_triagem,'Ergonomia e acabamento','ergonomia-acabamento','melhoria','Posição de dirigir, bancos, acabamento, ruídos e usabilidade.',8,96,1),
(@setor_triagem,'Sugestão de produto','sugestao-produto','sugestao','Ideias de novas funções, equipamentos ou melhorias do produto.',8,120,1),
(@setor_triagem,'Outros relatos','outros-relatos','geral','Relatos ainda sem categoria específica.',8,72,1)
ON DUPLICATE KEY UPDATE nome=VALUES(nome), descricao=VALUES(descricao), ativo=1;

INSERT IGNORE INTO category_terms (categoria_id,termo,peso)
SELECT id,'calor',5 FROM master_categories WHERE slug='conforto-termico'
UNION ALL SELECT id,'quente',5 FROM master_categories WHERE slug='conforto-termico'
UNION ALL SELECT id,'temperatura',4 FROM master_categories WHERE slug='conforto-termico'
UNION ALL SELECT id,'assoalho',5 FROM master_categories WHERE slug='conforto-termico'
UNION ALL SELECT id,'pernas',4 FROM master_categories WHERE slug='conforto-termico'
UNION ALL SELECT id,'cabine',2 FROM master_categories WHERE slug='conforto-termico'
UNION ALL SELECT id,'ar condicionado',5 FROM master_categories WHERE slug='ar-condicionado-ventilacao'
UNION ALL SELECT id,'ventilacao',4 FROM master_categories WHERE slug='ar-condicionado-ventilacao'
UNION ALL SELECT id,'gelando',3 FROM master_categories WHERE slug='ar-condicionado-ventilacao'
UNION ALL SELECT id,'motor',3 FROM master_categories WHERE slug='motor-arrefecimento'
UNION ALL SELECT id,'arrefecimento',5 FROM master_categories WHERE slug='motor-arrefecimento'
UNION ALL SELECT id,'radiador',5 FROM master_categories WHERE slug='motor-arrefecimento'
UNION ALL SELECT id,'freio',5 FROM master_categories WHERE slug='freios-seguranca'
UNION ALL SELECT id,'retarder',5 FROM master_categories WHERE slug='freios-seguranca'
UNION ALL SELECT id,'painel',4 FROM master_categories WHERE slug='painel-eletrica-eletronica'
UNION ALL SELECT id,'cluster',5 FROM master_categories WHERE slug='painel-eletrica-eletronica'
UNION ALL SELECT id,'sensor',4 FROM master_categories WHERE slug='painel-eletrica-eletronica'
UNION ALL SELECT id,'cambio',5 FROM master_categories WHERE slug='transmissao-tracao'
UNION ALL SELECT id,'transmissao',5 FROM master_categories WHERE slug='transmissao-tracao'
UNION ALL SELECT id,'suspensao',5 FROM master_categories WHERE slug='chassi-suspensao-direcao'
UNION ALL SELECT id,'direcao',5 FROM master_categories WHERE slug='chassi-suspensao-direcao'
UNION ALL SELECT id,'vibracao',4 FROM master_categories WHERE slug='chassi-suspensao-direcao'
UNION ALL SELECT id,'banco',3 FROM master_categories WHERE slug='ergonomia-acabamento'
UNION ALL SELECT id,'ruido',4 FROM master_categories WHERE slug='ergonomia-acabamento'
UNION ALL SELECT id,'melhoria',3 FROM master_categories WHERE slug='sugestao-produto'
UNION ALL SELECT id,'sugestao',5 FROM master_categories WHERE slug='sugestao-produto';

INSERT IGNORE INTO permissoes (recurso,acao,descricao) VALUES
('service_desk','view','Visualizar relatos e chamados'),
('service_desk','create','Registrar relatos e chamados'),
('service_desk','update','Tratar, transferir e finalizar chamados'),
('service_desk','delete','Cancelar ou excluir chamados');

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1
  FROM perfis pf
  JOIN permissoes p ON p.recurso='service_desk'
 WHERE pf.slug='administrador';

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1
  FROM perfis pf
  JOIN permissoes p ON p.recurso='service_desk'
 WHERE pf.slug IN ('admin-empresa','assistencia','comercial-vwco')
   AND p.acao IN ('view','create','update');

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1
  FROM perfis pf
  JOIN permissoes p ON p.recurso='service_desk'
 WHERE pf.slug IN ('cliente','colaborador-cliente')
   AND p.acao IN ('view','create');

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260729_017_service_desk_relato_setores_sla');
