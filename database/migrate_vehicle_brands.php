<?php
declare(strict_types=1);

require __DIR__ . '/../app/bootstrap.php';

$pdo = db();
if (!$pdo) $pdo = new PDO('mysql:host=127.0.0.1;port=3306;dbname=drive-learn-vw;charset=utf8mb4','root','',[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]);

function vehicle_column_exists(PDO $pdo, string $table, string $column): bool
{
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND COLUMN_NAME=?');
    $stmt->execute([$table,$column]);
    return (bool)$stmt->fetchColumn();
}

function vehicle_index_exists(PDO $pdo, string $table, string $index): bool
{
    $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND INDEX_NAME=?');
    $stmt->execute([$table,$index]);
    return (bool)$stmt->fetchColumn();
}

$pdo->exec("CREATE TABLE IF NOT EXISTS marcas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    slug VARCHAR(120) NOT NULL,
    logo VARCHAR(255) NULL,
    pais_origem VARCHAR(80) NULL,
    site_oficial VARCHAR(500) NULL,
    descricao TEXT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_marca_nome(nome),
    UNIQUE KEY uk_marca_slug(slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci");

$brands = [
    ['Volkswagen Caminhões e Ônibus','volkswagen-caminhoes-onibus','Brasil','https://www.vwco.com.br/','Veículos comerciais Volkswagen desenvolvidos para transporte de cargas e passageiros.'],
    ['IVECO','iveco','Itália','https://www.iveco.com/brasil/','Caminhões e veículos comerciais leves das linhas Daily, Tector e S-Way.'],
    ['Volvo','volvo','Suécia','https://www.volvotrucks.com.br/pt-br/','Caminhões para distribuição, transporte rodoviário e operações severas.'],
    ['Mercedes-Benz','mercedes-benz','Alemanha','https://www.mercedes-benz-trucks.com/br/pt/','Caminhões e ônibus Mercedes-Benz para diferentes aplicações de transporte.'],
    ['Scania','scania','Suécia','https://www.scania.com/br/pt/home.html','Caminhões e ônibus configuráveis por cabine, potência, aplicação e tração.'],
    ['DAF','daf','Países Baixos','https://www.dafcaminhoes.com.br/','Caminhões DAF para operações rodoviárias e vocacionais.'],
    ['Agrale','agrale','Brasil','https://www.agrale.com.br/','Veículos comerciais, chassis e soluções para transporte.'],
    ['Foton','foton','China','https://www.fotonmotor.com.br/','Veículos comerciais leves, médios e pesados.'],
    ['Ford','ford-caminhoes','Estados Unidos','https://www.ford.com.br/','Marca mantida para o histórico de frotas e veículos comerciais.'],
    ['MAN','man','Alemanha','https://www.man.eu/','Caminhões e ônibus para transporte de cargas e passageiros.'],
    ['Renault Trucks','renault-trucks','França','https://www.renault-trucks.com/','Caminhões para distribuição, construção e longa distância.'],
];
$insertBrand=$pdo->prepare('INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES(?,?,?,?,?,1) ON DUPLICATE KEY UPDATE pais_origem=VALUES(pais_origem),site_oficial=VALUES(site_oficial),descricao=VALUES(descricao)');
foreach($brands as $brand)$insertBrand->execute($brand);
$vwBrandId=(int)$pdo->query("SELECT id FROM marcas WHERE slug='volkswagen-caminhoes-onibus'")->fetchColumn();

if(!vehicle_column_exists($pdo,'familias','marca_id'))$pdo->exec('ALTER TABLE familias ADD marca_id BIGINT UNSIGNED NULL AFTER id');
$pdo->prepare('UPDATE familias SET marca_id=? WHERE marca_id IS NULL')->execute([$vwBrandId]);
$pdo->exec('ALTER TABLE familias MODIFY marca_id BIGINT UNSIGNED NOT NULL');
if(vehicle_index_exists($pdo,'familias','nome'))$pdo->exec('ALTER TABLE familias DROP INDEX nome');
if(!vehicle_index_exists($pdo,'familias','uk_familia_marca_nome'))$pdo->exec('ALTER TABLE familias ADD UNIQUE KEY uk_familia_marca_nome(marca_id,nome)');
if(!vehicle_index_exists($pdo,'familias','idx_familia_marca'))$pdo->exec('ALTER TABLE familias ADD KEY idx_familia_marca(marca_id)');
$fk=$pdo->query("SELECT COUNT(*) FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='familias' AND CONSTRAINT_NAME='fk_familia_marca'")->fetchColumn();
if(!$fk)$pdo->exec('ALTER TABLE familias ADD CONSTRAINT fk_familia_marca FOREIGN KEY(marca_id) REFERENCES marcas(id)');

if(!vehicle_column_exists($pdo,'frotas','marca_id'))$pdo->exec('ALTER TABLE frotas ADD marca_id BIGINT UNSIGNED NULL AFTER cliente_id');
if(!vehicle_column_exists($pdo,'frotas','familia_id'))$pdo->exec('ALTER TABLE frotas ADD familia_id BIGINT UNSIGNED NULL AFTER marca_id');
if(!vehicle_column_exists($pdo,'frotas','veiculo_nome'))$pdo->exec('ALTER TABLE frotas ADD veiculo_nome VARCHAR(160) NULL AFTER modelo_id');
if(!vehicle_column_exists($pdo,'frotas','familia_nome_livre'))$pdo->exec('ALTER TABLE frotas ADD familia_nome_livre VARCHAR(120) NULL AFTER veiculo_nome');
$pdo->exec('UPDATE frotas fr JOIN modelos m ON m.id=fr.modelo_id JOIN familias fa ON fa.id=m.familia_id SET fr.marca_id=fa.marca_id,fr.familia_id=fa.id WHERE fr.marca_id IS NULL OR fr.familia_id IS NULL');
$pdo->exec('ALTER TABLE frotas MODIFY marca_id BIGINT UNSIGNED NOT NULL');
if(vehicle_index_exists($pdo,'frotas','uk_frota_composicao'))$pdo->exec('ALTER TABLE frotas DROP INDEX uk_frota_composicao');
$pdo->exec('ALTER TABLE frotas MODIFY modelo_id BIGINT UNSIGNED NULL');
if(!vehicle_index_exists($pdo,'frotas','idx_frota_marca'))$pdo->exec('ALTER TABLE frotas ADD KEY idx_frota_marca(marca_id)');
if(!vehicle_index_exists($pdo,'frotas','idx_frota_familia'))$pdo->exec('ALTER TABLE frotas ADD KEY idx_frota_familia(familia_id)');
$fleetFks=$pdo->query("SELECT CONSTRAINT_NAME FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='frotas'")->fetchAll(PDO::FETCH_COLUMN);
if(!in_array('fk_frota_marca',$fleetFks,true))$pdo->exec('ALTER TABLE frotas ADD CONSTRAINT fk_frota_marca FOREIGN KEY(marca_id) REFERENCES marcas(id)');
if(!in_array('fk_frota_familia',$fleetFks,true))$pdo->exec('ALTER TABLE frotas ADD CONSTRAINT fk_frota_familia FOREIGN KEY(familia_id) REFERENCES familias(id)');

$permission=$pdo->prepare('INSERT INTO permissoes(recurso,acao,descricao) VALUES(?,?,?) ON DUPLICATE KEY UPDATE descricao=VALUES(descricao)');
foreach(['view'=>'Visualizar marcas','create'=>'Cadastrar marcas','update'=>'Editar marcas','delete'=>'Excluir marcas'] as $action=>$description)$permission->execute(['brands',$action,$description]);
$pdo->exec("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso='brands' WHERE pf.slug IN('administrador','admin-empresa')");

echo "Migração de marcas e frota multimarcas concluída.\n";
