-- Drive Learn VW - Migração 001: marcas e frota multimarcas
-- Data: 18/07/2026
-- Aplicação: importar uma única vez pelo phpMyAdmin/HostGator antes da migração 002.
-- Recomendação: faça backup do banco antes da importação.

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS marcas (
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
    UNIQUE KEY uk_marca_nome (nome),
    UNIQUE KEY uk_marca_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES
('Volkswagen Caminhões e Ônibus','volkswagen-caminhoes-onibus','Brasil','https://www.vwco.com.br/','Veículos comerciais Volkswagen para cargas e passageiros.',1),
('IVECO','iveco','Itália','https://www.iveco.com/brasil/','Veículos comerciais leves, médios, semipesados e pesados.',1),
('Volvo','volvo','Suécia','https://www.volvotrucks.com.br/pt-br/','Caminhões para distribuição, transporte rodoviário e operações severas.',1),
('Mercedes-Benz','mercedes-benz','Alemanha','https://www.mercedes-benz-trucks.com.br/','Caminhões para distribuição, longa distância, construção e operações severas.',1),
('Scania','scania','Suécia','https://www.scania.com/br/pt/home.html','Caminhões configuráveis por cabine, potência, aplicação e tração.',1),
('DAF','daf','Países Baixos','https://www.dafcaminhoes.com.br/','Caminhões rodoviários e vocacionais.',1),
('Agrale','agrale','Brasil','https://www.agrale.com.br/','Veículos comerciais e chassis.',1),
('Foton','foton','China','https://www.fotonmotor.com.br/','Veículos comerciais leves, médios e pesados.',1),
('Ford','ford-caminhoes','Estados Unidos','https://www.ford.com.br/','Marca disponível para o histórico de frotas.',1),
('MAN','man','Alemanha','https://www.man.eu/','Caminhões e ônibus para cargas e passageiros.',1),
('Renault Trucks','renault-trucks','França','https://www.renault-trucks.com/','Caminhões para distribuição, construção e longa distância.',1)
ON DUPLICATE KEY UPDATE pais_origem=VALUES(pais_origem),site_oficial=VALUES(site_oficial),descricao=VALUES(descricao),ativo=1;

DROP PROCEDURE IF EXISTS dl_migracao_multimarcas;
DELIMITER $$
CREATE PROCEDURE dl_migracao_multimarcas()
BEGIN
    DECLARE vw_id BIGINT UNSIGNED;
    SELECT id INTO vw_id FROM marcas WHERE slug='volkswagen-caminhoes-onibus' LIMIT 1;

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='familias' AND COLUMN_NAME='marca_id') THEN
        ALTER TABLE familias ADD COLUMN marca_id BIGINT UNSIGNED NULL AFTER id;
    END IF;
    UPDATE familias SET marca_id=vw_id WHERE marca_id IS NULL;
    ALTER TABLE familias MODIFY marca_id BIGINT UNSIGNED NOT NULL;
    IF EXISTS (SELECT 1 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='familias' AND INDEX_NAME='nome') THEN
        ALTER TABLE familias DROP INDEX nome;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='familias' AND INDEX_NAME='uk_familia_marca_nome') THEN
        ALTER TABLE familias ADD UNIQUE KEY uk_familia_marca_nome(marca_id,nome);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='familias' AND CONSTRAINT_NAME='fk_familia_marca') THEN
        ALTER TABLE familias ADD CONSTRAINT fk_familia_marca FOREIGN KEY(marca_id) REFERENCES marcas(id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND COLUMN_NAME='marca_id') THEN
        ALTER TABLE frotas ADD COLUMN marca_id BIGINT UNSIGNED NULL AFTER cliente_id;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND COLUMN_NAME='familia_id') THEN
        ALTER TABLE frotas ADD COLUMN familia_id BIGINT UNSIGNED NULL AFTER marca_id;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND COLUMN_NAME='veiculo_nome') THEN
        ALTER TABLE frotas ADD COLUMN veiculo_nome VARCHAR(160) NULL AFTER modelo_id;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND COLUMN_NAME='familia_nome_livre') THEN
        ALTER TABLE frotas ADD COLUMN familia_nome_livre VARCHAR(120) NULL AFTER veiculo_nome;
    END IF;
    UPDATE frotas fr JOIN modelos m ON m.id=fr.modelo_id JOIN familias fa ON fa.id=m.familia_id
       SET fr.marca_id=fa.marca_id,fr.familia_id=fa.id
     WHERE fr.marca_id IS NULL OR fr.familia_id IS NULL;
    ALTER TABLE frotas MODIFY marca_id BIGINT UNSIGNED NOT NULL, MODIFY modelo_id BIGINT UNSIGNED NULL;
    IF EXISTS (SELECT 1 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND INDEX_NAME='uk_frota_composicao') THEN
        ALTER TABLE frotas DROP INDEX uk_frota_composicao;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND INDEX_NAME='idx_frota_marca') THEN
        ALTER TABLE frotas ADD KEY idx_frota_marca(marca_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.STATISTICS WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND INDEX_NAME='idx_frota_familia') THEN
        ALTER TABLE frotas ADD KEY idx_frota_familia(familia_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND CONSTRAINT_NAME='fk_frota_marca') THEN
        ALTER TABLE frotas ADD CONSTRAINT fk_frota_marca FOREIGN KEY(marca_id) REFERENCES marcas(id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA=DATABASE() AND TABLE_NAME='frotas' AND CONSTRAINT_NAME='fk_frota_familia') THEN
        ALTER TABLE frotas ADD CONSTRAINT fk_frota_familia FOREIGN KEY(familia_id) REFERENCES familias(id);
    END IF;
END$$
DELIMITER ;
CALL dl_migracao_multimarcas();
DROP PROCEDURE dl_migracao_multimarcas;

INSERT INTO permissoes(recurso,acao,descricao) VALUES
('brands','view','Visualizar marcas'),('brands','create','Cadastrar marcas'),
('brands','update','Editar marcas'),('brands','delete','Excluir marcas')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
INSERT IGNORE INTO perfil_permissoes(perfil_id,permissao_id,permitido)
SELECT pf.id,p.id,1 FROM perfis pf JOIN permissoes p ON p.recurso='brands'
WHERE pf.slug IN('administrador','admin-empresa');

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_001','Marcas e frota multimarcas')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

SET FOREIGN_KEY_CHECKS = 1;
