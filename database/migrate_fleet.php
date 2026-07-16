<?php
declare(strict_types=1);

require __DIR__ . '/../app/bootstrap.php';

$pdo = db();
if (!$pdo) throw new RuntimeException('Banco de dados indisponível.');

function fleet_column_exists(PDO $pdo, string $table, string $column): bool
{
    $stmt = $pdo->prepare('SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND COLUMN_NAME=?');
    $stmt->execute([$table, $column]);
    return (bool)$stmt->fetchColumn();
}

function fleet_index_exists(PDO $pdo, string $table, string $index): bool
{
    $stmt = $pdo->prepare('SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND INDEX_NAME=?');
    $stmt->execute([$table, $index]);
    return (bool)$stmt->fetchColumn();
}

$pdo->exec("CREATE TABLE IF NOT EXISTS normas_emissoes(
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(500) NULL,
    ordem SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

$seed = $pdo->prepare('INSERT INTO normas_emissoes(codigo,nome,descricao,ordem,ativo) VALUES(?,?,?,?,1) ON DUPLICATE KEY UPDATE nome=VALUES(nome),descricao=VALUES(descricao),ordem=VALUES(ordem)');
foreach ([
    ['EURO-3','Euro 3','Norma de emissões utilizada em veículos de gerações anteriores.',30],
    ['EURO-5','Euro 5','Norma de emissões com controle eletrônico e pós-tratamento mais avançado.',50],
    ['EURO-6','Euro 6','Norma atual com limites mais rigorosos de emissões.',60],
    ['ELETRICO','Elétrico / zero emissão local','Veículo com propulsão elétrica e sem emissão local de escapamento.',100],
] as $standard) $seed->execute($standard);

if (!fleet_column_exists($pdo, 'frotas', 'norma_emissao_id')) $pdo->exec('ALTER TABLE frotas ADD norma_emissao_id SMALLINT UNSIGNED NULL AFTER ano');
if (!fleet_column_exists($pdo, 'frotas', 'cadastrado_por')) $pdo->exec('ALTER TABLE frotas ADD cadastrado_por BIGINT UNSIGNED NULL AFTER observacao');
if (!fleet_column_exists($pdo, 'frotas', 'atualizado_em')) $pdo->exec('ALTER TABLE frotas ADD atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER criado_em');
if (!fleet_index_exists($pdo, 'frotas', 'idx_frota_cliente')) $pdo->exec('ALTER TABLE frotas ADD INDEX idx_frota_cliente(cliente_id)');
if (fleet_index_exists($pdo, 'frotas', 'uk_frota')) $pdo->exec('ALTER TABLE frotas DROP INDEX uk_frota');
if (!fleet_index_exists($pdo, 'frotas', 'uk_frota_composicao')) $pdo->exec('ALTER TABLE frotas ADD UNIQUE KEY uk_frota_composicao(cliente_id,modelo_id,ano,norma_emissao_id)');
if (!fleet_index_exists($pdo, 'frotas', 'idx_frota_norma')) $pdo->exec('ALTER TABLE frotas ADD INDEX idx_frota_norma(norma_emissao_id)');
if (!fleet_index_exists($pdo, 'frotas', 'idx_frota_usuario')) $pdo->exec('ALTER TABLE frotas ADD INDEX idx_frota_usuario(cadastrado_por)');

$foreignKeys = $pdo->query("SELECT CONSTRAINT_NAME FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND CONSTRAINT_TYPE='FOREIGN KEY'")->fetchAll(PDO::FETCH_COLUMN);
if (!in_array('fk_frota_norma_emissao', $foreignKeys, true)) $pdo->exec('ALTER TABLE frotas ADD CONSTRAINT fk_frota_norma_emissao FOREIGN KEY(norma_emissao_id) REFERENCES normas_emissoes(id)');
if (!in_array('fk_frota_cadastrado_por', $foreignKeys, true)) $pdo->exec('ALTER TABLE frotas ADD CONSTRAINT fk_frota_cadastrado_por FOREIGN KEY(cadastrado_por) REFERENCES usuarios(id) ON DELETE SET NULL');

$permission = $pdo->prepare('INSERT INTO permissoes(recurso,acao,descricao) VALUES(?,?,?) ON DUPLICATE KEY UPDATE descricao=VALUES(descricao)');
foreach (['view'=>'Visualizar','create'=>'Cadastrar','update'=>'Editar','delete'=>'Excluir'] as $action => $verb) $permission->execute(['emission_standards',$action,"{$verb}: Normas de emissões"]);
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso='emission_standards' WHERE pf.slug IN('administrador','admin-empresa')");
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso='fleet' AND p.acao='delete' WHERE pf.slug='cliente'");

echo 'Migração do módulo de frota concluída com sucesso.' . PHP_EOL;
