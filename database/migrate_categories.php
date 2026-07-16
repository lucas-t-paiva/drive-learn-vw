<?php
declare(strict_types=1);
require __DIR__ . '/../app/bootstrap.php';
$pdo = db();
if (!$pdo) throw new RuntimeException('Banco indisponível.');

function addColumnIfMissing(PDO $pdo, string $table, string $column, string $definition): void {
    $check=$pdo->prepare('SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND COLUMN_NAME=?');
    $check->execute([$table,$column]);
    if (!(int)$check->fetchColumn()) $pdo->exec("ALTER TABLE `{$table}` ADD COLUMN `{$column}` {$definition}");
}
function addIndexIfMissing(PDO $pdo, string $table, string $index, string $definition): void {
    $check=$pdo->prepare('SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND INDEX_NAME=?');
    $check->execute([$table,$index]);
    if (!(int)$check->fetchColumn()) $pdo->exec("ALTER TABLE `{$table}` ADD {$definition}");
}
addColumnIfMissing($pdo,'categorias','imagem','VARCHAR(255) NULL AFTER icone');
addColumnIfMissing($pdo,'subcategorias','imagem','VARCHAR(255) NULL AFTER descricao');
addIndexIfMissing($pdo,'categorias','uk_categoria_nome','UNIQUE KEY uk_categoria_nome(nome)');
addIndexIfMissing($pdo,'subcategorias','uk_subcategoria_categoria_nome','UNIQUE KEY uk_subcategoria_categoria_nome(categoria_id,nome)');

$legacy = [
['Direção e volante','Ajustes da direção, comandos do volante e recursos de assistência à condução.','sign-turn-right'],
['Freios e segurança','Sistemas de frenagem, segurança ativa e condução preventiva.','shield-check'],
['Painel e comandos','Leitura do painel, indicadores e utilização dos comandos da cabine.','speedometer2'],
['Motor e desempenho','Operação do motor, desempenho e uso correto do trem de força.','gear-wide-connected'],
['Condução econômica','Recursos e práticas para reduzir o consumo e melhorar a eficiência.','leaf'],
['Manutenção básica','Inspeções preventivas e cuidados essenciais com o veículo.','tools'],
];
$legacyUpdate=$pdo->prepare("UPDATE categorias SET descricao=IF(descricao IS NULL OR descricao='',?,descricao),icone=? WHERE nome=?");
foreach($legacy as [$name,$description,$icon]) $legacyUpdate->execute([$description,$icon,$name]);

$categories = [
['Motor — Combustível','Abastecimento, alimentação, injeção e cuidados relacionados ao combustível.','fuel-pump'],
['Motor — Arrefecimento','Controle de temperatura do motor, líquido de arrefecimento e verificações preventivas.','thermometer-half'],
['Chassi','Componentes estruturais, inspeções e pontos de atenção do chassi.','truck-flatbed'],
['Retarder','Funcionamento e uso correto do sistema auxiliar de frenagem retarder.','speedometer2'],
['Carroceria','Operação, inspeção e cuidados com carrocerias e implementos.','box-seam'],
['Ar-condicionado','Comandos, regulagens e utilização eficiente do sistema de climatização.','snow'],
['Sistema de exaustão','Pós-tratamento, regeneração e indicadores do sistema de emissões.','wind'],
['Suspensão','Operação e cuidados com suspensão mecânica ou pneumática.','arrows-expand'],
['Painel do cluster','Leitura de indicadores, alertas, menus e informações do computador de bordo.','speedometer'],
['Botões no painel','Funções e utilização dos comandos localizados no painel do veículo.','toggles'],
['Botões no volante','Navegação, atalhos e funções disponíveis nos comandos do volante.','controller'],
['Direção','Ajustes, assistência à condução e utilização correta do sistema de direção.','sign-turn-right'],
];
$find=$pdo->prepare('SELECT id FROM categorias WHERE nome=? LIMIT 1');
$insert=$pdo->prepare('INSERT INTO categorias(nome,descricao,icone,ordem,ativo) VALUES(?,?,?,?,1)');
$max=(int)$pdo->query('SELECT COALESCE(MAX(ordem),0) FROM categorias')->fetchColumn();
foreach($categories as $index=>[$name,$description,$icon]) { $find->execute([$name]); if(!$find->fetchColumn()) $insert->execute([$name,$description,$icon,$max+$index+1]); }

$examples = [
['Botões no painel','Modos ECO, NORMAL e POWER','Acionamento e diferenças entre os modos de condução.'],
['Retarder','Freio-motor e retarder','Seleção dos níveis e uso correto dos sistemas auxiliares de frenagem.'],
['Direção','Velocidade constante','Ativação, ajuste e cancelamento da função de velocidade constante.'],
['Botões no volante','Consultar consumo','Como visualizar o consumo atual e médio no computador de bordo.'],
['Botões no volante','Verificar o modo atual','Consulta do modo de condução selecionado no painel.'],
['Painel do cluster','Verificar portas e alertas','Identificação dos avisos de portas e demais alertas do veículo.'],
];
$categoryId=$pdo->prepare('SELECT id FROM categorias WHERE nome=? LIMIT 1');
$subExists=$pdo->prepare('SELECT id FROM subcategorias WHERE categoria_id=? AND nome=? LIMIT 1');
$subInsert=$pdo->prepare('INSERT INTO subcategorias(categoria_id,nome,descricao,ordem,ativo) VALUES(?,?,?,?,1)');
$orders=[];
foreach($examples as [$categoryName,$name,$description]) { $categoryId->execute([$categoryName]); $id=(int)$categoryId->fetchColumn(); if(!$id)continue; $subExists->execute([$id,$name]); if(!$subExists->fetchColumn()){ $orders[$id]=($orders[$id]??0)+1; $subInsert->execute([$id,$name,$description,$orders[$id]]); } }

$actions = ['view','create','update','delete'];
$permissionInsert = $pdo->prepare('INSERT IGNORE INTO permissoes(recurso,acao,descricao) VALUES(?,?,?)');
foreach ($actions as $action) $permissionInsert->execute(['subcategories',$action,ucfirst($action).' em subcategorias']);
$adminPermissions = $pdo->prepare("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso='subcategories' WHERE pf.slug='administrador'");
$adminPermissions->execute();
$assistancePermissions = $pdo->prepare("INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido) SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso='subcategories' AND p.acao IN('view','create','update') WHERE pf.slug='assistencia'");
$assistancePermissions->execute();
echo "Estrutura e dados iniciais de categorias atualizados.\n";
