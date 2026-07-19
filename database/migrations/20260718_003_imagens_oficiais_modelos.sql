-- Drive Learn VW - Migração 003: imagens oficiais de famílias e modelos concorrentes
-- Data: 18/07/2026
-- Pré-requisito: enviar a pasta public/assets/images/modelos junto com a atualização do sistema.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP PROCEDURE IF EXISTS dl_imagem_familia;
DELIMITER $$
CREATE PROCEDURE dl_imagem_familia(
    IN p_marca VARCHAR(120), IN p_familia VARCHAR(100),
    IN p_imagem VARCHAR(255), IN p_fonte VARCHAR(700)
)
BEGIN
    UPDATE familias fa JOIN marcas ma ON ma.id=fa.marca_id
       SET fa.imagem=p_imagem
     WHERE ma.slug=p_marca AND fa.nome=p_familia;

    UPDATE modelos mo
      JOIN familias fa ON fa.id=mo.familia_id
      JOIN marcas ma ON ma.id=fa.marca_id
       SET mo.imagem=p_imagem,
           mo.especificacoes=JSON_SET(COALESCE(mo.especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial',p_fonte)
     WHERE ma.slug=p_marca AND fa.nome=p_familia;
END$$
DELIMITER ;

CALL dl_imagem_familia('iveco','Daily','public/assets/images/modelos/iveco-daily-oficial.jpg','https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi');
CALL dl_imagem_familia('iveco','Tector','public/assets/images/modelos/iveco-tector-oficial.jpg','https://www.iveco.com/brasil/Tector/Semipesados');
CALL dl_imagem_familia('iveco','S-Way','public/assets/images/modelos/iveco-s-way-4x2-oficial.png','https://www.iveco.com/brasil/Pesados-S-Way');
UPDATE modelos SET imagem='public/assets/images/modelos/iveco-s-way-6x2-oficial.png' WHERE slug='iveco-s-way-480-6x2';
UPDATE modelos SET imagem='public/assets/images/modelos/iveco-s-way-6x4-oficial.png' WHERE slug='iveco-s-way-540-6x4';

CALL dl_imagem_familia('volvo','FH','public/assets/images/modelos/volvo-fh-oficial.webp','https://www.volvotrucks.com.br/pt-br/trucks/models.html');
CALL dl_imagem_familia('volvo','FM','public/assets/images/modelos/volvo-fm-oficial.webp','https://www.volvotrucks.com.br/pt-br/trucks/models.html');
CALL dl_imagem_familia('volvo','FMX','public/assets/images/modelos/volvo-fmx-oficial.webp','https://www.volvotrucks.com.br/pt-br/trucks/models.html');
CALL dl_imagem_familia('volvo','VM','public/assets/images/modelos/volvo-vm-oficial.webp','https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-vm.html');

CALL dl_imagem_familia('mercedes-benz','Novo Accelo','public/assets/images/modelos/mercedes-novo-accelo-oficial.webp','https://www.mercedes-benz-trucks.com.br/caminhoes/');
CALL dl_imagem_familia('mercedes-benz','Atego','public/assets/images/modelos/mercedes-atego-oficial.webp','https://www.mercedes-benz-trucks.com.br/caminhoes/');
CALL dl_imagem_familia('mercedes-benz','Axor','public/assets/images/modelos/mercedes-axor-oficial.webp','https://www.mercedes-benz-trucks.com.br/caminhoes/');
CALL dl_imagem_familia('mercedes-benz','Actros','public/assets/images/modelos/mercedes-actros-oficial.webp','https://www.mercedes-benz-trucks.com.br/caminhoes/');
CALL dl_imagem_familia('mercedes-benz','Arocs','public/assets/images/modelos/mercedes-arocs-oficial.webp','https://www.mercedes-benz-trucks.com.br/caminhoes/');
CALL dl_imagem_familia('mercedes-benz','eActros','public/assets/images/modelos/mercedes-actros-oficial.webp','https://www.mercedes-benz-trucks.com.br/caminhoes/');

CALL dl_imagem_familia('scania','Linha P','public/assets/images/modelos/scania-linha-p-oficial.jpeg','https://www.scania.com/br/pt/home/products/trucks/p-series.html');
CALL dl_imagem_familia('scania','Linha G','public/assets/images/modelos/scania-linha-g-oficial.jpeg','https://www.scania.com/br/pt/home/products/trucks/g-series.html');
CALL dl_imagem_familia('scania','Linha R','public/assets/images/modelos/scania-linha-r-oficial.jpeg','https://www.scania.com/br/pt/home/products/trucks/r-series.html');
CALL dl_imagem_familia('scania','Linha S','public/assets/images/modelos/scania-linha-s-oficial.jpeg','https://www.scania.com/br/pt/home/products/trucks/s-series.html');
CALL dl_imagem_familia('scania','XT','public/assets/images/modelos/scania-linha-g-oficial.jpeg','https://www.scania.com/br/pt/home/products/trucks/g-series.html');
CALL dl_imagem_familia('scania','Caminhões a gás','public/assets/images/modelos/scania-linha-g-oficial.jpeg','https://www.scania.com/br/pt/home/products/trucks.html');

DROP PROCEDURE dl_imagem_familia;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_003','Imagens oficiais para famílias e modelos IVECO, Volvo, Mercedes-Benz e Scania')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
