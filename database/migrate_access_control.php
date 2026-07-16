<?php
declare(strict_types=1);

require __DIR__ . '/../app/bootstrap.php';

$pdo = db();
if (!$pdo) throw new RuntimeException('Banco de dados indisponível.');

function column_exists(PDO $pdo, string $table, string $column): bool
{
    $stmt = $pdo->prepare('SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND COLUMN_NAME=?');
    $stmt->execute([$table, $column]);
    return (bool)$stmt->fetchColumn();
}

function index_exists(PDO $pdo, string $table, string $index): bool
{
    $stmt = $pdo->prepare('SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND INDEX_NAME=?');
    $stmt->execute([$table, $index]);
    return (bool)$stmt->fetchColumn();
}

function foreign_key_exists(PDO $pdo, string $table, string $constraint): bool
{
    $stmt = $pdo->prepare('SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME=? AND CONSTRAINT_NAME=? AND CONSTRAINT_TYPE="FOREIGN KEY"');
    $stmt->execute([$table, $constraint]);
    return (bool)$stmt->fetchColumn();
}

$pdo->exec("CREATE TABLE IF NOT EXISTS estados(
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo_ibge TINYINT UNSIGNED NOT NULL UNIQUE,
    sigla CHAR(2) NOT NULL UNIQUE,
    nome VARCHAR(60) NOT NULL UNIQUE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

$pdo->exec("CREATE TABLE IF NOT EXISTS cidades(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    estado_id SMALLINT UNSIGNED NOT NULL,
    codigo_ibge INT UNSIGNED NULL UNIQUE,
    nome VARCHAR(120) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE KEY uk_cidade_estado_nome(estado_id,nome),
    CONSTRAINT fk_cidade_estado FOREIGN KEY(estado_id) REFERENCES estados(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

$pdo->exec("CREATE TABLE IF NOT EXISTS empresas(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    empresa_pai_id BIGINT UNSIGNED NULL,
    tipo ENUM('vwco','concessionaria','cliente') NOT NULL,
    subtipo ENUM('fabrica','polo','matriz','filial','assistencia','outro') NOT NULL DEFAULT 'matriz',
    razao_social VARCHAR(180) NOT NULL,
    nome_fantasia VARCHAR(180) NOT NULL,
    documento VARCHAR(20) NULL UNIQUE,
    email VARCHAR(180) NULL,
    telefone VARCHAR(30) NULL,
    cidade_id BIGINT UNSIGNED NULL,
    endereco VARCHAR(220) NULL,
    cep VARCHAR(10) NULL,
    logo VARCHAR(255) NULL,
    origem_legacy VARCHAR(30) NULL,
    origem_legacy_id BIGINT UNSIGNED NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_empresa_legacy(origem_legacy,origem_legacy_id),
    CONSTRAINT fk_empresa_pai FOREIGN KEY(empresa_pai_id) REFERENCES empresas(id) ON DELETE SET NULL,
    CONSTRAINT fk_empresa_cidade FOREIGN KEY(cidade_id) REFERENCES cidades(id) ON DELETE SET NULL,
    INDEX idx_empresa_tipo_ativo(tipo,ativo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

if (!column_exists($pdo, 'empresas', 'logo')) $pdo->exec('ALTER TABLE empresas ADD logo VARCHAR(255) NULL AFTER cep');
if (!column_exists($pdo, 'usuarios', 'foto')) $pdo->exec('ALTER TABLE usuarios ADD foto VARCHAR(255) NULL AFTER email');

if (!column_exists($pdo, 'perfis', 'empresa_id')) $pdo->exec('ALTER TABLE perfis ADD empresa_id BIGINT UNSIGNED NULL AFTER id');
if (!column_exists($pdo, 'perfis', 'nivel')) $pdo->exec('ALTER TABLE perfis ADD nivel TINYINT UNSIGNED NOT NULL DEFAULT 50 AFTER escopo');
if (!column_exists($pdo, 'perfis', 'sistema')) $pdo->exec('ALTER TABLE perfis ADD sistema BOOLEAN NOT NULL DEFAULT FALSE AFTER nivel');
if (!column_exists($pdo, 'perfis', 'tipo_empresa')) $pdo->exec("ALTER TABLE perfis ADD tipo_empresa ENUM('qualquer','vwco','concessionaria','cliente') NOT NULL DEFAULT 'qualquer' AFTER sistema");
if (!column_exists($pdo, 'perfis', 'pode_gerenciar_usuarios')) $pdo->exec('ALTER TABLE perfis ADD pode_gerenciar_usuarios BOOLEAN NOT NULL DEFAULT FALSE AFTER tipo_empresa');
$pdo->exec("ALTER TABLE perfis MODIFY escopo ENUM('global','unidade','cliente','empresa') NOT NULL DEFAULT 'empresa'");
if (!index_exists($pdo, 'perfis', 'idx_perfil_empresa')) $pdo->exec('ALTER TABLE perfis ADD INDEX idx_perfil_empresa(empresa_id)');
if (!foreign_key_exists($pdo, 'perfis', 'fk_perfil_empresa')) $pdo->exec('ALTER TABLE perfis ADD CONSTRAINT fk_perfil_empresa FOREIGN KEY(empresa_id) REFERENCES empresas(id) ON DELETE CASCADE');

$pdo->exec("CREATE TABLE IF NOT EXISTS usuario_empresas(
    usuario_id BIGINT UNSIGNED NOT NULL,
    empresa_id BIGINT UNSIGNED NOT NULL,
    perfil_id BIGINT UNSIGNED NOT NULL,
    principal BOOLEAN NOT NULL DEFAULT FALSE,
    administrador BOOLEAN NOT NULL DEFAULT FALSE,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    cadastrado_por BIGINT UNSIGNED NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(usuario_id,empresa_id),
    CONSTRAINT fk_usuario_empresa_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_empresa_empresa FOREIGN KEY(empresa_id) REFERENCES empresas(id) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_empresa_perfil FOREIGN KEY(perfil_id) REFERENCES perfis(id),
    CONSTRAINT fk_usuario_empresa_cadastrado_por FOREIGN KEY(cadastrado_por) REFERENCES usuarios(id) ON DELETE SET NULL,
    INDEX idx_usuario_empresa_contexto(empresa_id,ativo,perfil_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

$pdo->exec("CREATE TABLE IF NOT EXISTS empresa_clientes(
    empresa_vw_id BIGINT UNSIGNED NOT NULL,
    cliente_id BIGINT UNSIGNED NOT NULL,
    tipo_relacao ENUM('comercial','assistencia','pos_venda','treinamento','outro') NOT NULL DEFAULT 'assistencia',
    observacao VARCHAR(500) NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_por BIGINT UNSIGNED NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(empresa_vw_id,cliente_id),
    CONSTRAINT fk_empresa_cliente_vw FOREIGN KEY(empresa_vw_id) REFERENCES empresas(id) ON DELETE CASCADE,
    CONSTRAINT fk_empresa_cliente_cliente FOREIGN KEY(cliente_id) REFERENCES empresas(id) ON DELETE CASCADE,
    CONSTRAINT fk_empresa_cliente_criador FOREIGN KEY(criado_por) REFERENCES usuarios(id) ON DELETE SET NULL,
    INDEX idx_empresa_cliente_cliente(cliente_id,ativo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

$pdo->exec("CREATE TABLE IF NOT EXISTS convites_usuarios(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT UNSIGNED NOT NULL,
    empresa_id BIGINT UNSIGNED NOT NULL,
    token_hash CHAR(64) NOT NULL UNIQUE,
    expira_em DATETIME NOT NULL,
    utilizado_em DATETIME NULL,
    criado_por BIGINT UNSIGNED NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_convite_usuario FOREIGN KEY(usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_convite_empresa FOREIGN KEY(empresa_id) REFERENCES empresas(id) ON DELETE CASCADE,
    CONSTRAINT fk_convite_criador FOREIGN KEY(criado_por) REFERENCES usuarios(id) ON DELETE SET NULL,
    INDEX idx_convite_validade(usuario_id,expira_em,utilizado_em)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

if (!column_exists($pdo, 'clientes', 'empresa_id')) $pdo->exec('ALTER TABLE clientes ADD empresa_id BIGINT UNSIGNED NULL AFTER id');
if (!index_exists($pdo, 'clientes', 'uk_cliente_empresa')) $pdo->exec('ALTER TABLE clientes ADD UNIQUE KEY uk_cliente_empresa(empresa_id)');
if (!foreign_key_exists($pdo, 'clientes', 'fk_cliente_empresa')) $pdo->exec('ALTER TABLE clientes ADD CONSTRAINT fk_cliente_empresa FOREIGN KEY(empresa_id) REFERENCES empresas(id) ON DELETE SET NULL');

$states = [
    [12,'AC','Acre'],[27,'AL','Alagoas'],[16,'AP','Amapá'],[13,'AM','Amazonas'],[29,'BA','Bahia'],[23,'CE','Ceará'],[53,'DF','Distrito Federal'],
    [32,'ES','Espírito Santo'],[52,'GO','Goiás'],[21,'MA','Maranhão'],[51,'MT','Mato Grosso'],[50,'MS','Mato Grosso do Sul'],[31,'MG','Minas Gerais'],
    [15,'PA','Pará'],[25,'PB','Paraíba'],[41,'PR','Paraná'],[26,'PE','Pernambuco'],[22,'PI','Piauí'],[33,'RJ','Rio de Janeiro'],[24,'RN','Rio Grande do Norte'],
    [43,'RS','Rio Grande do Sul'],[11,'RO','Rondônia'],[14,'RR','Roraima'],[42,'SC','Santa Catarina'],[35,'SP','São Paulo'],[28,'SE','Sergipe'],[17,'TO','Tocantins'],
];
$stateStmt = $pdo->prepare('INSERT INTO estados(codigo_ibge,sigla,nome) VALUES(?,?,?) ON DUPLICATE KEY UPDATE nome=VALUES(nome),ativo=1');
foreach ($states as $state) $stateStmt->execute($state);

$findState = $pdo->prepare('SELECT id FROM estados WHERE sigla=?');
$cityStmt = $pdo->prepare('INSERT INTO cidades(estado_id,nome) VALUES(?,?) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id),ativo=1');
$companyStmt = $pdo->prepare("INSERT INTO empresas(tipo,subtipo,razao_social,nome_fantasia,cidade_id,origem_legacy,origem_legacy_id,ativo) VALUES(?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE razao_social=VALUES(razao_social),nome_fantasia=VALUES(nome_fantasia),cidade_id=VALUES(cidade_id),ativo=VALUES(ativo),id=LAST_INSERT_ID(id)");

$unitCompanyIds = [];
foreach ($pdo->query('SELECT * FROM unidades ORDER BY id')->fetchAll() as $unit) {
    $cityId = null;
    if ($unit['uf'] && $unit['cidade']) {
        $findState->execute([$unit['uf']]); $stateId = (int)$findState->fetchColumn();
        if ($stateId) { $cityStmt->execute([$stateId,$unit['cidade']]); $cityId = (int)$pdo->lastInsertId(); }
    }
    $type = $unit['tipo'] === 'assistencia' ? 'concessionaria' : 'vwco';
    $subtype = $unit['tipo'] === 'fabrica' ? 'fabrica' : ($unit['tipo'] === 'assistencia' ? 'assistencia' : 'matriz');
    $companyStmt->execute([$type,$subtype,$unit['nome'],$unit['nome'],$cityId,'unidade',(int)$unit['id'],(int)$unit['ativo']]);
    $unitCompanyIds[(int)$unit['id']] = (int)$pdo->lastInsertId();
}

$clientCompanyIds = [];
$updateLegacyClient = $pdo->prepare('UPDATE clientes SET empresa_id=? WHERE id=?');
foreach ($pdo->query('SELECT * FROM clientes ORDER BY id')->fetchAll() as $client) {
    $unitCompanyId = $unitCompanyIds[(int)($client['unidade_id'] ?? 0)] ?? null;
    $cityId = null;
    if ($unitCompanyId) { $findCity = $pdo->prepare('SELECT cidade_id FROM empresas WHERE id=?'); $findCity->execute([$unitCompanyId]); $cityId = $findCity->fetchColumn() ?: null; }
    $companyStmt->execute(['cliente','matriz',$client['nome'],$client['nome_fantasia'] ?: $client['nome'],$cityId,'cliente',(int)$client['id'],(int)$client['ativo']]);
    $companyId = (int)$pdo->lastInsertId();
    $clientCompanyIds[(int)$client['id']] = $companyId;
    $updateLegacyClient->execute([$companyId,(int)$client['id']]);
    if ($unitCompanyId) {
        $link = $pdo->prepare('INSERT INTO empresa_clientes(empresa_vw_id,cliente_id,tipo_relacao,ativo) VALUES(?,?,"assistencia",1) ON DUPLICATE KEY UPDATE ativo=1');
        $link->execute([$unitCompanyId,$companyId]);
    }
}

$profileSeed = [
    ['Administrador Master','administrador','global',100,1,'qualquer',1],
    ['Administrador da Empresa','admin-empresa','empresa',80,1,'qualquer',1],
    ['Assistência Técnica','assistencia','empresa',65,1,'concessionaria',0],
    ['Comercial VWCO','comercial-vwco','empresa',60,1,'qualquer',0],
    ['Gestor do Cliente','cliente','cliente',60,1,'cliente',1],
    ['Colaborador do Cliente','colaborador-cliente','cliente',30,1,'cliente',0],
];
$profileStmt = $pdo->prepare('INSERT INTO perfis(nome,slug,escopo,nivel,sistema,tipo_empresa,pode_gerenciar_usuarios,ativo) VALUES(?,?,?,?,?,?,?,1) ON DUPLICATE KEY UPDATE nome=VALUES(nome),escopo=VALUES(escopo),nivel=VALUES(nivel),sistema=VALUES(sistema),tipo_empresa=VALUES(tipo_empresa),pode_gerenciar_usuarios=VALUES(pode_gerenciar_usuarios),ativo=1');
foreach ($profileSeed as $profile) $profileStmt->execute($profile);

$resources = [
    'dashboard'=>'Visão geral','library'=>'Biblioteca','fleet'=>'Frotas','families'=>'Famílias','models'=>'Modelos','categories'=>'Categorias',
    'subcategories'=>'Subcategorias','videos'=>'Vídeos','organizations'=>'Empresas VWCO','clients'=>'Clientes','client_links'=>'Vínculos de atendimento',
    'users'=>'Usuários','permissions'=>'Perfis e permissões','reports'=>'Relatórios','feedback'=>'Feedbacks','locations'=>'Estados e cidades',
];
$permissionStmt = $pdo->prepare('INSERT INTO permissoes(recurso,acao,descricao) VALUES(?,?,?) ON DUPLICATE KEY UPDATE descricao=VALUES(descricao)');
foreach ($resources as $resource => $label) foreach (['view'=>'Visualizar','create'=>'Cadastrar','update'=>'Editar','delete'=>'Excluir'] as $action => $verb) $permissionStmt->execute([$resource,$action,"{$verb}: {$label}"]);

$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf CROSS JOIN permissoes p WHERE pf.slug='administrador'");
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso<>'permissions' WHERE pf.slug='admin-empresa'");
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON (p.recurso IN('dashboard','library','fleet','clients','client_links','users','reports','feedback') AND p.acao IN('view','create','update')) WHERE pf.slug IN('assistencia','comercial-vwco')");
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON ((p.recurso IN('dashboard','library','fleet','users','reports') AND p.acao='view') OR (p.recurso IN('fleet','users') AND p.acao IN('create','update')) OR (p.recurso='feedback' AND p.acao='create')) WHERE pf.slug='cliente'");
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON ((p.recurso IN('dashboard','library','fleet') AND p.acao='view') OR (p.recurso='feedback' AND p.acao='create')) WHERE pf.slug='colaborador-cliente'");

$findProfile = $pdo->prepare('SELECT id FROM perfis WHERE slug=?');
$membershipStmt = $pdo->prepare('INSERT INTO usuario_empresas(usuario_id,empresa_id,perfil_id,principal,administrador,ativo) VALUES(?,?,?,?,?,?) ON DUPLICATE KEY UPDATE perfil_id=VALUES(perfil_id),principal=VALUES(principal),administrador=VALUES(administrador),ativo=VALUES(ativo)');
foreach ($pdo->query('SELECT u.*,p.slug perfil_slug FROM usuarios u JOIN perfis p ON p.id=u.perfil_id ORDER BY u.id')->fetchAll() as $account) {
    $companyId = $account['cliente_id'] ? ($clientCompanyIds[(int)$account['cliente_id']] ?? null) : ($unitCompanyIds[(int)($account['unidade_id'] ?? 0)] ?? null);
    if (!$companyId) continue;
    $membershipStmt->execute([(int)$account['id'],$companyId,(int)$account['perfil_id'],1,$account['perfil_slug']==='administrador'?1:0,(int)$account['ativo']]);
}

echo 'Migração de empresas e acessos concluída com sucesso.' . PHP_EOL;
