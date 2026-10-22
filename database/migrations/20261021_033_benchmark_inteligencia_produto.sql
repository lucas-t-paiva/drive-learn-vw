-- Drive Learn | Benchmark & Inteligência de Produto
-- Compatível com MySQL 5.7+/MariaDB 10.4+. Reexecução segura para estrutura e carga-base.
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_categorias (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL,
  descricao TEXT NULL,
  icone VARCHAR(60) NULL,
  ordem INT NOT NULL DEFAULT 0,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_benchmark_categoria_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_atributos (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  categoria_id BIGINT UNSIGNED NOT NULL,
  nome VARCHAR(160) NOT NULL,
  slug VARCHAR(180) NOT NULL,
  descricao TEXT NULL,
  tipo ENUM('booleano','numero','texto','selecao_unica','selecao_multipla') NOT NULL DEFAULT 'texto',
  unidade VARCHAR(40) NULL,
  criterio ENUM('maior_melhor','menor_melhor','atende_requisito','qualitativo','neutro') NOT NULL DEFAULT 'neutro',
  casas_decimais TINYINT UNSIGNED NOT NULL DEFAULT 0,
  obrigatorio TINYINT(1) NOT NULL DEFAULT 0,
  ordem INT NOT NULL DEFAULT 0,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_benchmark_atributo_slug (slug),
  KEY idx_benchmark_atributo_categoria (categoria_id),
  CONSTRAINT fk_benchmark_atributo_categoria FOREIGN KEY (categoria_id) REFERENCES benchmark_categorias(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_atributo_opcoes (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  atributo_id BIGINT UNSIGNED NOT NULL,
  valor VARCHAR(120) NOT NULL,
  rotulo VARCHAR(160) NOT NULL,
  ordem INT NOT NULL DEFAULT 0,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  UNIQUE KEY uk_benchmark_opcao (atributo_id,valor),
  CONSTRAINT fk_benchmark_opcao_atributo FOREIGN KEY (atributo_id) REFERENCES benchmark_atributos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_atributo_marcas (
  atributo_id BIGINT UNSIGNED NOT NULL, marca_id BIGINT UNSIGNED NOT NULL, PRIMARY KEY(atributo_id,marca_id),
  FOREIGN KEY(atributo_id) REFERENCES benchmark_atributos(id) ON DELETE CASCADE,
  FOREIGN KEY(marca_id) REFERENCES marcas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS benchmark_atributo_familias (
  atributo_id BIGINT UNSIGNED NOT NULL, familia_id BIGINT UNSIGNED NOT NULL, PRIMARY KEY(atributo_id,familia_id),
  FOREIGN KEY(atributo_id) REFERENCES benchmark_atributos(id) ON DELETE CASCADE,
  FOREIGN KEY(familia_id) REFERENCES familias(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS benchmark_atributo_modelos (
  atributo_id BIGINT UNSIGNED NOT NULL, modelo_id BIGINT UNSIGNED NOT NULL, PRIMARY KEY(atributo_id,modelo_id),
  FOREIGN KEY(atributo_id) REFERENCES benchmark_atributos(id) ON DELETE CASCADE,
  FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_configuracoes (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  modelo_id BIGINT UNSIGNED NOT NULL,
  nome VARCHAR(180) NOT NULL,
  ano_modelo VARCHAR(20) NULL,
  ano_fabricacao VARCHAR(20) NULL,
  geracao VARCHAR(100) NULL,
  versao_comercial VARCHAR(140) NULL,
  cabine VARCHAR(100) NULL,
  tracao VARCHAR(40) NULL,
  suspensao VARCHAR(120) NULL,
  pacote VARCHAR(140) NULL,
  mercado VARCHAR(80) NOT NULL DEFAULT 'Brasil',
  aplicacao VARCHAR(140) NULL,
  data_referencia DATE NULL,
  situacao_comercial ENUM('linha_atual','historico','anunciado','nao_confirmado') NOT NULL DEFAULT 'nao_confirmado',
  descricao TEXT NULL,
  imagem_capa VARCHAR(255) NULL,
  ativo TINYINT(1) NOT NULL DEFAULT 1,
  criado_por BIGINT UNSIGNED NULL,
  atualizado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_benchmark_config_modelo (modelo_id),
  KEY idx_benchmark_config_situacao (situacao_comercial,ativo),
  CONSTRAINT fk_benchmark_config_modelo FOREIGN KEY (modelo_id) REFERENCES modelos(id),
  CONSTRAINT fk_benchmark_config_criador FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_config_atualizador FOREIGN KEY (atualizado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_atributo_configuracoes (
  atributo_id BIGINT UNSIGNED NOT NULL, configuracao_id BIGINT UNSIGNED NOT NULL, PRIMARY KEY(atributo_id,configuracao_id),
  FOREIGN KEY(atributo_id) REFERENCES benchmark_atributos(id) ON DELETE CASCADE,
  FOREIGN KEY(configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_fontes (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  tipo ENUM('site_oficial','ficha_tecnica','manual','inspecao','evento','video','outra') NOT NULL DEFAULT 'outra',
  url VARCHAR(1000) NULL,
  arquivo VARCHAR(255) NULL,
  publicador VARCHAR(160) NULL,
  publicado_em DATE NULL,
  consultado_em DATE NULL,
  observacao TEXT NULL,
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_benchmark_fonte_usuario FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_valores (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  configuracao_id BIGINT UNSIGNED NOT NULL,
  atributo_id BIGINT UNSIGNED NOT NULL,
  valor_texto TEXT NULL,
  valor_numero DECIMAL(18,4) NULL,
  valor_booleano TINYINT(1) NULL,
  unidade VARCHAR(40) NULL,
  status_dado ENUM('informado','nao_confirmado','nao_aplicavel') NOT NULL DEFAULT 'nao_confirmado',
  disponibilidade ENUM('serie','opcional','acessorio','indisponivel_confirmado','nao_confirmado') NOT NULL DEFAULT 'nao_confirmado',
  status_revisao ENUM('rascunho','em_revisao','validado','rejeitado') NOT NULL DEFAULT 'rascunho',
  origem ENUM('manual','pesquisa_documental','inspecao','teste') NOT NULL DEFAULT 'manual',
  fonte_id BIGINT UNSIGNED NULL,
  confianca TINYINT UNSIGNED NOT NULL DEFAULT 50,
  observacao TEXT NULL,
  criado_por BIGINT UNSIGNED NULL,
  atualizado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uk_benchmark_valor (configuracao_id,atributo_id),
  KEY idx_benchmark_valor_revisao (status_revisao),
  CONSTRAINT fk_benchmark_valor_config FOREIGN KEY (configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_valor_atributo FOREIGN KEY (atributo_id) REFERENCES benchmark_atributos(id),
  CONSTRAINT fk_benchmark_valor_fonte FOREIGN KEY (fonte_id) REFERENCES benchmark_fontes(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_valor_criador FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_valor_atualizador FOREIGN KEY (atualizado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_valor_opcoes (
  valor_id BIGINT UNSIGNED NOT NULL,
  opcao_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (valor_id,opcao_id),
  CONSTRAINT fk_benchmark_vo_valor FOREIGN KEY (valor_id) REFERENCES benchmark_valores(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_vo_opcao FOREIGN KEY (opcao_id) REFERENCES benchmark_atributo_opcoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_evidencias (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  tipo ENUM('imagem','pdf','link','video','manual','outro') NOT NULL DEFAULT 'imagem',
  arquivo VARCHAR(255) NULL,
  url VARCHAR(1000) NULL,
  legenda TEXT NULL,
  credito VARCHAR(180) NULL,
  origem VARCHAR(180) NULL,
  posicao_captura VARCHAR(140) NULL,
  escopo VARCHAR(180) NULL,
  capturado_em DATE NULL,
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_benchmark_evidencia_usuario FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_evidencia_configuracoes (
  evidencia_id BIGINT UNSIGNED NOT NULL,
  configuracao_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (evidencia_id,configuracao_id),
  CONSTRAINT fk_benchmark_ec_evidencia FOREIGN KEY (evidencia_id) REFERENCES benchmark_evidencias(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_ec_config FOREIGN KEY (configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_evidencia_valores (
  evidencia_id BIGINT UNSIGNED NOT NULL,
  valor_id BIGINT UNSIGNED NOT NULL,
  ordem INT NOT NULL DEFAULT 0,
  PRIMARY KEY (evidencia_id,valor_id),
  CONSTRAINT fk_benchmark_ev_evidencia FOREIGN KEY (evidencia_id) REFERENCES benchmark_evidencias(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_ev_valor FOREIGN KEY (valor_id) REFERENCES benchmark_valores(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_valor_historico (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  valor_id BIGINT UNSIGNED NOT NULL,
  acao VARCHAR(40) NOT NULL,
  snapshot_json LONGTEXT NOT NULL,
  usuario_id BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY idx_benchmark_historico_valor (valor_id,criado_em),
  CONSTRAINT fk_benchmark_historico_valor FOREIGN KEY (valor_id) REFERENCES benchmark_valores(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_historico_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_comparacoes (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  descricao TEXT NULL,
  referencia_configuracao_id BIGINT UNSIGNED NULL,
  filtros_json LONGTEXT NULL,
  publico_interno TINYINT(1) NOT NULL DEFAULT 1,
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_benchmark_comparacao_ref FOREIGN KEY (referencia_configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_comparacao_usuario FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_comparacao_configuracoes (
  comparacao_id BIGINT UNSIGNED NOT NULL,
  configuracao_id BIGINT UNSIGNED NOT NULL,
  ordem INT NOT NULL DEFAULT 0,
  PRIMARY KEY (comparacao_id,configuracao_id),
  CONSTRAINT fk_benchmark_cc_comparacao FOREIGN KEY (comparacao_id) REFERENCES benchmark_comparacoes(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_cc_config FOREIGN KEY (configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_analises (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  tipo ENUM('vantagem_vwco','equivalencia','oportunidade_produto','oportunidade_treinamento','investigacao') NOT NULL,
  impacto ENUM('baixo','medio','alto','critico') NOT NULL DEFAULT 'medio',
  prioridade ENUM('P1','P2','P3','P4','P5') NOT NULL DEFAULT 'P3',
  status ENUM('rascunho','em_analise','validada','planejada','concluida','arquivada') NOT NULL DEFAULT 'rascunho',
  area_responsavel VARCHAR(140) NULL,
  responsavel_id BIGINT UNSIGNED NULL,
  fato_observado TEXT NOT NULL,
  citacao_motorista TEXT NULL,
  interpretacao_tecnica TEXT NULL,
  proximo_passo TEXT NULL,
  prazo DATE NULL,
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_benchmark_analise_responsavel FOREIGN KEY (responsavel_id) REFERENCES usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_analise_criador FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_analise_configuracoes (
  analise_id BIGINT UNSIGNED NOT NULL,
  configuracao_id BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (analise_id,configuracao_id),
  CONSTRAINT fk_benchmark_ac_analise FOREIGN KEY (analise_id) REFERENCES benchmark_analises(id) ON DELETE CASCADE,
  CONSTRAINT fk_benchmark_ac_config FOREIGN KEY (configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_analise_atributos (
  analise_id BIGINT UNSIGNED NOT NULL, atributo_id BIGINT UNSIGNED NOT NULL, PRIMARY KEY(analise_id,atributo_id),
  FOREIGN KEY(analise_id) REFERENCES benchmark_analises(id) ON DELETE CASCADE,
  FOREIGN KEY(atributo_id) REFERENCES benchmark_atributos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS benchmark_pendencias (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  configuracao_id BIGINT UNSIGNED NULL,
  atributo_id BIGINT UNSIGNED NULL,
  titulo VARCHAR(200) NOT NULL,
  descricao TEXT NULL,
  prioridade ENUM('baixa','media','alta','critica') NOT NULL DEFAULT 'media',
  status ENUM('aberta','em_apuracao','resolvida','descartada') NOT NULL DEFAULT 'aberta',
  responsavel_id BIGINT UNSIGNED NULL,
  prazo DATE NULL,
  criado_por BIGINT UNSIGNED NULL,
  criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  atualizado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_benchmark_pendencia_config FOREIGN KEY (configuracao_id) REFERENCES benchmark_configuracoes(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_pendencia_atributo FOREIGN KEY (atributo_id) REFERENCES benchmark_atributos(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_pendencia_responsavel FOREIGN KEY (responsavel_id) REFERENCES usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_benchmark_pendencia_criador FOREIGN KEY (criado_por) REFERENCES usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO benchmark_categorias (nome,slug,descricao,icone,ordem,ativo) VALUES
('Multimídia e conectividade','multimidia-conectividade','Telas, integração móvel, áudio, conectividade e interfaces.','bi-display',10,1),
('Cluster e instrumentação','cluster-instrumentacao','Instrumentação digital ou analógica, telas e informação ao condutor.','bi-speedometer2',20,1),
('Comandos e ergonomia','comandos-ergonomia','Posição, alcance, esforço, arquitetura e usabilidade dos comandos.','bi-sliders2',30,1),
('ADAS e segurança','adas-seguranca','Assistências ao condutor e recursos de segurança ativa.','bi-shield-check',40,1),
('Visibilidade e retrovisores','visibilidade-retrovisores','Espelhos, câmeras, área visível e pontos cegos.','bi-eye',50,1),
('Iluminação','iluminacao','Faróis, iluminação funcional e iluminação interna.','bi-lightbulb',60,1),
('Conforto e vida a bordo','conforto-vida-bordo','Banco, climatização, leito, armazenamento e habitabilidade.','bi-house-heart',70,1),
('Acesso, inspeção e manutenção','acesso-inspecao-manutencao','Degraus, pontos de inspeção e manutenibilidade.','bi-tools',80,1),
('Condução e eficiência','conducao-eficiencia','Controles de condução, transmissão, desempenho e eficiência.','bi-graph-up-arrow',90,1),
('Serviços digitais','servicos-digitais','Telemetria, portais, aplicativos e serviços conectados.','bi-cloud-check',100,1)
ON DUPLICATE KEY UPDATE nome=VALUES(nome),descricao=VALUES(descricao),icone=VALUES(icone),ordem=VALUES(ordem),ativo=1;

INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,unidade,criterio,ordem,ativo)
SELECT id,'Tamanho da tela multimídia','tamanho-tela-multimidia','Diagonal nominal da tela central.','numero','pol','maior_melhor',10,1 FROM benchmark_categorias WHERE slug='multimidia-conectividade'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),unidade=VALUES(unidade),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Integração Apple CarPlay / Android Auto','integracao-smartphone','Disponibilidade e modalidade de integração com smartphone.','texto','atende_requisito',20,1 FROM benchmark_categorias WHERE slug='multimidia-conectividade'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,unidade,criterio,ordem,ativo)
SELECT id,'Tamanho do cluster','tamanho-cluster','Diagonal nominal da tela do painel de instrumentos.','numero','pol','maior_melhor',10,1 FROM benchmark_categorias WHERE slug='cluster-instrumentacao'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),unidade=VALUES(unidade),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Arquitetura do cluster','arquitetura-cluster','Digital, híbrido ou analógico e sua organização visual.','texto','qualitativo',20,1 FROM benchmark_categorias WHERE slug='cluster-instrumentacao'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Seletor de marchas','seletor-marchas','Tipo, posição, ângulo, alcance e lógica do seletor.','texto','qualitativo',10,1 FROM benchmark_categorias WHERE slug='comandos-ergonomia'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Assistente de frenagem de emergência','frenagem-emergencia','Presença e escopo funcional declarado.','booleano','atende_requisito',10,1 FROM benchmark_categorias WHERE slug='adas-seguranca'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Sistema de retrovisão','sistema-retrovisao','Espelhos convencionais, câmeras ou solução combinada.','texto','qualitativo',10,1 FROM benchmark_categorias WHERE slug='visibilidade-retrovisores'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Piloto automático adaptativo (ACC)','piloto-adaptativo','Controle de velocidade com ajuste de distância conforme descrição oficial.','booleano','atende_requisito',20,1 FROM benchmark_categorias WHERE slug='adas-seguranca'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Alerta de saída de faixa (LDWS)','alerta-saida-faixa','Sistema que alerta desvio ou saída involuntária da faixa.','booleano','atende_requisito',30,1 FROM benchmark_categorias WHERE slug='adas-seguranca'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Assistência de ponto cego / lateral','assistencia-ponto-cego','Detecção, alerta ou visualização de usuários e veículos nas laterais.','texto','qualitativo',40,1 FROM benchmark_categorias WHERE slug='adas-seguranca'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Tecnologia dos faróis','tecnologia-farois','Tecnologia de iluminação principal e funções adaptativas.','texto','qualitativo',10,1 FROM benchmark_categorias WHERE slug='iluminacao'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;
INSERT INTO benchmark_atributos (categoria_id,nome,slug,descricao,tipo,criterio,ordem,ativo)
SELECT id,'Ecossistema digital e telemetria','ecossistema-digital','Aplicativos, gestão remota, telemetria e serviços conectados divulgados.','texto','qualitativo',10,1 FROM benchmark_categorias WHERE slug='servicos-digitais'
ON DUPLICATE KEY UPDATE categoria_id=VALUES(categoria_id),nome=VALUES(nome),criterio=VALUES(criterio),ativo=1;

INSERT INTO permissoes (recurso,acao,descricao) VALUES
('benchmark','view','Visualizar benchmark e inteligência de produto'),
('benchmark','create','Cadastrar configurações, observações e evidências'),
('benchmark','update','Revisar e validar o benchmark'),
('benchmark','delete','Excluir registros sem histórico do benchmark')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,pm.id,1 FROM perfis pf JOIN permissoes pm ON pm.recurso='benchmark'
WHERE pf.slug='administrador';
INSERT IGNORE INTO perfil_permissoes (perfil_id,permissao_id,permitido)
SELECT pf.id,pm.id,1 FROM perfis pf JOIN permissoes pm ON pm.recurso='benchmark' AND pm.acao IN('view','create','update')
WHERE pf.slug IN('assistencia','comercial-vwco','coordenacao');

-- Recortes comparáveis comprovados. Só são inseridos quando o modelo exato já existe no catálogo.
INSERT INTO benchmark_configuracoes (modelo_id,nome,ano_modelo,versao_comercial,mercado,data_referencia,situacao_comercial,descricao)
SELECT m.id,'Meteor 29.530 6x4 · Highline','2026','Highline','Brasil','2026-10-21','linha_atual','Configuração VWCO de referência. Os valores de interface referem-se ao pacote Highline divulgado para a linha Meteor.' FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE (LOWER(ma.nome) LIKE '%volkswagen%' OR LOWER(ma.slug) LIKE '%volkswagen%' OR LOWER(ma.slug) LIKE '%vwco%') AND (m.slug IN('meteor-29-530','meteor-6x4-29-530','novo-meteor-highline-29-530') OR REPLACE(REPLACE(LOWER(m.nome),' ',''),'.','') LIKE '%meteor%29530%') AND NOT EXISTS (SELECT 1 FROM benchmark_configuracoes WHERE nome='Meteor 29.530 6x4 · Highline') ORDER BY CASE WHEN m.slug='meteor-6x4-29-530' THEN 0 WHEN m.slug='meteor-29-530' THEN 1 ELSE 2 END LIMIT 1;
INSERT INTO benchmark_configuracoes (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,data_referencia,situacao_comercial,descricao)
SELECT m.id,'Volvo FH 540 6x4T · Brasil','2026','FH 540','Globetrotter / conforme pedido','6x4T','Brasil','2026-10-21','linha_atual','Recorte brasileiro do FH 540 6x4T. Recursos opcionais permanecem identificados como opcionais.' FROM modelos m WHERE (m.slug='fh-540-6x4t' OR LOWER(TRIM(m.nome))='fh 540 6x4t') AND NOT EXISTS (SELECT 1 FROM benchmark_configuracoes WHERE nome='Volvo FH 540 6x4T · Brasil') LIMIT 1;
INSERT INTO benchmark_configuracoes (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,data_referencia,situacao_comercial,descricao)
SELECT m.id,'Actros 2653 S 6x4 · Top Space MY2024','2024','2653 S','Top Space','6x4','Brasil','2026-10-21','historico','Recorte da Linha Actros 2024 divulgado oficialmente. Não extrapolar equipamentos da Top Space para a cabina Space.' FROM modelos m WHERE (m.slug='mercedes-actros-2653-s-6x4' OR LOWER(TRIM(m.nome))='actros 2653 s 6x4') AND NOT EXISTS (SELECT 1 FROM benchmark_configuracoes WHERE nome='Actros 2653 S 6x4 · Top Space MY2024') LIMIT 1;
INSERT INTO benchmark_configuracoes (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,data_referencia,situacao_comercial,descricao)
SELECT m.id,'Scania R 500 6x4 Super · Smart Dash','2026','Super / Smart Dash','R','6x4','Brasil','2026-10-21','linha_atual','Recorte da linha Super brasileira com o painel digital e a multimídia divulgados pela Scania Brasil.' FROM modelos m WHERE (m.slug='scania-r-500-6x4-super' OR LOWER(TRIM(m.nome))='scania r 500 6x4 super') AND NOT EXISTS (SELECT 1 FROM benchmark_configuracoes WHERE nome='Scania R 500 6x4 Super · Smart Dash') LIMIT 1;
INSERT INTO benchmark_configuracoes (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,data_referencia,situacao_comercial,descricao)
SELECT m.id,'DAF XF FTT 6x4 530 · Brasil','2025','XF 530','Space Cab / Super Space Cab','6x4','Brasil','2026-10-21','linha_atual','Recorte brasileiro do XF FTT 6x4 530. A central multimídia pesquisada é acessório PACCAR Parts e não item de série.' FROM modelos m WHERE (m.slug='xf-ftt-6x4-530-cv' OR LOWER(TRIM(m.nome))='xf ftt 6x4 530 cv') AND NOT EXISTS (SELECT 1 FROM benchmark_configuracoes WHERE nome='DAF XF FTT 6x4 530 · Brasil') LIMIT 1;

INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Meteor Highline — tecnologia e conectividade','site_oficial','https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219','Volkswagen Caminhões e Ônibus','2026-10-21','Página oficial informa painel digital de 10 polegadas e central multimídia de 7 polegadas.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Volvo FH — página oficial Brasil','site_oficial','https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html','Volvo Trucks Brasil','2026-10-21','A página explicita a escolha entre sistema de câmeras e espelhos e alerta que recursos variam conforme configuração.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Actros — página oficial Brasil','site_oficial','https://www.mercedes-benz-trucks.com.br/caminhoes/actros','Mercedes-Benz Trucks Brasil','2026-10-21','Página oficial informa MirrorCam, ABA 5 e opções de painel analógico ou digital.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.mercedes-benz-trucks.com.br/caminhoes/actros');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Meteor 29.530 — tecnologia Highline','site_oficial','https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220','Volkswagen Caminhões e Ônibus','2026-10-21','Página oficial do modelo confirma cluster de 10 polegadas, central de 7 polegadas, espelhamento, assistentes de voz e carregamento por indução.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Volvo FH — Camera Monitor System','site_oficial','https://www.volvotrucks.com.br/pt-br/trucks/features/camera-monitor-system.html','Volvo Trucks Brasil','2026-10-21','Descrição oficial do componente: câmeras, visão noturna, diferentes campos de visão e modo de vigilância.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.volvotrucks.com.br/pt-br/trucks/features/camera-monitor-system.html');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Linha Actros 2024 — equipamentos por cabina','site_oficial','https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460','Mercedes-Benz Trucks Brasil','2026-10-21','Fonte oficial diferencia Top Space e Space e identifica equipamentos de série e opcionais.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Scania Super — Smart Dash e multimídia','site_oficial','https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html','Scania Brasil','2026-10-21','Página brasileira da linha Super informa painel digital e multimídia de 10,1 ou 12,9 polegadas com CarPlay e Android Auto.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,publicado_em,consultado_em,observacao)
SELECT 'DAF in Action 2025 — XF Brasil','site_oficial','https://www.dafcaminhoes.com.br/-/media/files/countries/br/daf-in-action/2025/daf-in-action-01-2025.pdf?rev=073f315b24af41f2aa54d380dad5afff','DAF Caminhões Brasil','2025-01-01','2026-10-21','Publicação oficial brasileira confirma ACC, AEBS, LDWS e configurações XF 530.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.dafcaminhoes.com.br/-/media/files/countries/br/daf-in-action/2025/daf-in-action-01-2025.pdf?rev=073f315b24af41f2aa54d380dad5afff');
INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'PACCAR Parts — central multimídia para DAF XF','ficha_tecnica','https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/novo-daf-xf/30-11-2020-guia-de-bolso-paccar-parts.pdf','PACCAR Parts Brasil','2026-10-21','Catálogo oficial de acessórios. A central 2 DIN oferece CarPlay, Android Auto e WebLink; não representa item de série.'
WHERE NOT EXISTS (SELECT 1 FROM benchmark_fontes WHERE url='https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/novo-daf-xf/30-11-2020-guia-de-bolso-paccar-parts.pdf');

INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,10,'pol','informado','serie','validado','pesquisa_documental',s.id,95,'Painel de instrumentos 100% digital dentro da configuração Highline.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tamanho-cluster' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,7,'pol','informado','serie','validado','pesquisa_documental',s.id,95,'Central multimídia dentro da configuração Highline.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tamanho-tela-multimidia' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Espelhamento de celular e assistentes de voz Google e Siri','informado','serie','validado','pesquisa_documental',s.id,95,'A fonte oficial confirma espelhamento e os assistentes, mas não nomeia CarPlay ou Android Auto.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='integracao-smartphone' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Sistema de monitoramento por câmeras com visão noturna e modo de vigilância; espelhos laterais permanecem como alternativa','informado','opcional','validado','pesquisa_documental',s.id,95,'A própria Volvo informa escolha entre câmeras e espelhos; não tratar como série em toda configuração.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='sistema-retrovisao' JOIN benchmark_fontes s ON s.url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html' WHERE c.nome='Volvo FH 540 6x4T · Brasil'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'MirrorCam de 2ª geração com duas telas internas','informado','opcional','validado','pesquisa_documental',s.id,95,'A Linha Actros 2024 declara MirrorCam opcional; não confundir com retrovisor convencional de série.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='sistema-retrovisao' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/caminhoes/actros' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','serie','validado','pesquisa_documental',s.id,95,'ABA 5 com reconhecimento de pedestres, listado entre os itens de série da Top Space.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='frenagem-emergencia' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/caminhoes/actros' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Painel digital configurável na cabina Top Space','informado','serie','validado','pesquisa_documental',s.id,95,'O painel analógico é associado à cabina Space; este recorte é Top Space.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='arquitetura-cluster' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/caminhoes/actros' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

-- Homologação componente a componente. Ausência de linha significa "sem dado oficial comparável", nunca "veículo não possui".
-- Meteor 29.530 Highline: interface contra interface.
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,10,'pol','informado','serie','validado','pesquisa_documental',s.id,98,'Cluster 100% digital com mais de 80 funcionalidades na configuração Highline.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tamanho-cluster' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Cluster 100% digital, personalizável','informado','serie','validado','pesquisa_documental',s.id,98,'Recorte exclusivo da configuração Highline.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='arquitetura-cluster' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,7,'pol','informado','serie','validado','pesquisa_documental',s.id,98,'Central multimídia sensível ao toque na configuração Highline.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tamanho-tela-multimidia' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Espelhamento de smartphone; assistentes Google e Siri','informado','serie','validado','pesquisa_documental',s.id,98,'Não converter espelhamento genericamente em CarPlay/Android Auto sem declaração nominal.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='integracao-smartphone' JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220' WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

-- Volvo FH 540 6x4T: segurança e visibilidade oficialmente descritas no Brasil.
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','nao_confirmado','validado','pesquisa_documental',s.id,94,'A página brasileira descreve ACC até a parada e reinício automático, mas alerta que recursos variam por configuração.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='piloto-adaptativo' JOIN benchmark_fontes s ON s.url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html' WHERE c.nome='Volvo FH 540 6x4T · Brasil'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Câmera lateral com apoio de radares para revelar ângulos ocultos no lado do passageiro','informado','nao_confirmado','validado','pesquisa_documental',s.id,92,'Não equiparar alerta lateral automaticamente a frenagem lateral autônoma.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='assistencia-ponto-cego' JOIN benchmark_fontes s ON s.url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html' WHERE c.nome='Volvo FH 540 6x4T · Brasil'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'LED anti-ofuscamento com adaptação dinâmica do facho','informado','nao_confirmado','validado','pesquisa_documental',s.id,92,'Disponibilidade deve ser confirmada no pedido da configuração.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tecnologia-farois' JOIN benchmark_fontes s ON s.url='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html' WHERE c.nome='Volvo FH 540 6x4T · Brasil'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Camera Monitor System: até três câmeras, visão noturna infravermelha, campos estreito/amplo e modo de vigilância','informado','opcional','validado','pesquisa_documental',s.id,98,'Comparar com MirrorCam apenas como sistema de retrovisão por câmera; funções adicionais permanecem descritas separadamente.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='sistema-retrovisao' JOIN benchmark_fontes s ON s.url='https://www.volvotrucks.com.br/pt-br/trucks/features/camera-monitor-system.html' WHERE c.nome='Volvo FH 540 6x4T · Brasil'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

-- Actros Top Space MY2024: os itens abaixo são exclusivos do recorte de cabina declarado.
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,12,'pol','informado','serie','validado','pesquisa_documental',s.id,98,'Tela principal configurável de 12 polegadas da cabina Top Space.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tamanho-cluster' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Painel digital configurável','informado','serie','validado','pesquisa_documental',s.id,98,'Não extrapolar para a cabina Space, cuja fonte associa painel analógico.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='arquitetura-cluster' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'MirrorCam de 2ª geração, com braços 10 cm mais curtos e novos parâmetros de imagem','informado','opcional','validado','pesquisa_documental',s.id,98,'Sistema opcional na Linha Actros 2024.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='sistema-retrovisao' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','serie','validado','pesquisa_documental',s.id,98,'ABA 5 com reconhecimento de pedestres listado entre os itens de série da Top Space.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='frenagem-emergencia' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','serie','validado','pesquisa_documental',s.id,98,'Piloto automático adaptativo com limitador listado entre os itens de série da Top Space.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='piloto-adaptativo' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','serie','validado','pesquisa_documental',s.id,98,'Lane Warning System listado entre os itens de série da Top Space.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='alerta-saida-faixa' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Side Guard Assist (assistente de ponto cego)','informado','serie','validado','pesquisa_documental',s.id,98,'A fonte confirma assistência lateral, sem equipará-la automaticamente a frenagem lateral.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='assistencia-ponto-cego' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Faróis em LED e farol alto inteligente','informado','nao_confirmado','validado','pesquisa_documental',s.id,94,'A fonte confirma ambos na Linha 2024, mas não declara de modo inequívoco a disponibilidade de cada item para todo pedido.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tecnologia-farois' JOIN benchmark_fontes s ON s.url='https://www.mercedes-benz-trucks.com.br/imprensa/releases/com-linha-actros-2024-mercedes-benz-entrega-solucoes-solicitadas-pelos-clientes-para-seus-negocios-de-transporte-460' WHERE c.nome='Actros 2653 S 6x4 · Top Space MY2024'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

-- Scania R 500 Super Smart Dash: não converter as duas opções de multimídia em uma única medida falsa.
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Painel digital Scania de alta resolução com campos programáveis','informado','serie','validado','pesquisa_documental',s.id,96,'O tamanho do cluster não é informado na página brasileira; por isso não foi inventado.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='arquitetura-cluster' JOIN benchmark_fontes s ON s.url='https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html' WHERE c.nome='Scania R 500 6x4 Super · Smart Dash'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'10,1 ou 12,9','pol','informado','nao_confirmado','validado','pesquisa_documental',s.id,98,'São duas alternativas oficiais; o valor permanece textual para não produzir uma média ou falsa equivalência.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='tamanho-tela-multimidia' JOIN benchmark_fontes s ON s.url='https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html' WHERE c.nome='Scania R 500 6x4 Super · Smart Dash'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),valor_numero=NULL,unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Apple CarPlay e Android Auto, Bluetooth e USB-C','informado','nao_confirmado','validado','pesquisa_documental',s.id,98,'A página confirma os protocolos; a seleção entre multimídia de 10,1 ou 12,9 deve ser fixada no pedido.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='integracao-smartphone' JOIN benchmark_fontes s ON s.url='https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html' WHERE c.nome='Scania R 500 6x4 Super · Smart Dash'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

-- DAF XF 530: ADAS de fábrica separados da central multimídia vendida como acessório.
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','nao_confirmado','validado','pesquisa_documental',s.id,96,'AEBS confirmado para a linha XF; a fonte não apresenta matriz de série/opcional por pedido.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='frenagem-emergencia' JOIN benchmark_fontes s ON s.url='https://www.dafcaminhoes.com.br/-/media/files/countries/br/daf-in-action/2025/daf-in-action-01-2025.pdf?rev=073f315b24af41f2aa54d380dad5afff' WHERE c.nome='DAF XF FTT 6x4 530 · Brasil'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','nao_confirmado','validado','pesquisa_documental',s.id,96,'ACC confirmado para a linha XF; a disponibilidade e os limites funcionais devem ser confirmados no pedido.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='piloto-adaptativo' JOIN benchmark_fontes s ON s.url='https://www.dafcaminhoes.com.br/-/media/files/countries/br/daf-in-action/2025/daf-in-action-01-2025.pdf?rev=073f315b24af41f2aa54d380dad5afff' WHERE c.nome='DAF XF FTT 6x4 530 · Brasil'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_booleano,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,1,'informado','nao_confirmado','validado','pesquisa_documental',s.id,96,'LDWS confirmado para a linha XF; disponibilidade exata deve ser confirmada no pedido.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='alerta-saida-faixa' JOIN benchmark_fontes s ON s.url='https://www.dafcaminhoes.com.br/-/media/files/countries/br/daf-in-action/2025/daf-in-action-01-2025.pdf?rev=073f315b24af41f2aa54d380dad5afff' WHERE c.nome='DAF XF FTT 6x4 530 · Brasil'
ON DUPLICATE KEY UPDATE valor_booleano=VALUES(valor_booleano),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
INSERT INTO benchmark_valores (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Apple CarPlay, Android Auto e WebLink','informado','acessorio','validado','pesquisa_documental',s.id,98,'Central multimídia PACCAR Parts 2 DIN. Comparar como acessório, nunca como equipamento de série do XF.' FROM benchmark_configuracoes c JOIN benchmark_atributos a ON a.slug='integracao-smartphone' JOIN benchmark_fontes s ON s.url='https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/novo-daf-xf/30-11-2020-guia-de-bolso-paccar-parts.pdf' WHERE c.nome='DAF XF FTT 6x4 530 · Brasil'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);
