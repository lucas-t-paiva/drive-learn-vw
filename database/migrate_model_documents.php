<?php
declare(strict_types=1);
require_once __DIR__ . '/../app/bootstrap.php';
$pdo = db();
if (!$pdo) exit("Banco de dados indisponível.\n");
$pdo->exec("CREATE TABLE IF NOT EXISTS modelo_documentos(
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    modelo_id BIGINT UNSIGNED NOT NULL,
    tipo ENUM('ficha_tecnica','diretriz_implementacao','manual','outro') NOT NULL DEFAULT 'ficha_tecnica',
    titulo VARCHAR(180) NOT NULL,
    arquivo VARCHAR(255) NULL,
    url_origem VARCHAR(700) NULL,
    fonte_pagina VARCHAR(700) NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_modelo_documento_tipo(modelo_id,tipo),
    CONSTRAINT fk_modelo_documento_modelo FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE,
    INDEX idx_modelo_documento_ativo(modelo_id,ativo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
echo "Estrutura de documentos técnicos preparada.\n";
