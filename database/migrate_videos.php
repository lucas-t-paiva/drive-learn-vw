<?php
declare(strict_types=1);
require __DIR__ . '/../app/bootstrap.php';
$pdo=db();
if(!$pdo) throw new RuntimeException('Banco indisponível.');
$check=$pdo->prepare('SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME=? AND COLUMN_NAME=?');
$check->execute(['videos','atualizado_em']);
if(!(int)$check->fetchColumn()) $pdo->exec('ALTER TABLE videos ADD COLUMN atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER criado_em');
echo "Estrutura de vídeos atualizada.\n";
