-- Drive Learn VW - Migração 004: ônibus elétricos BYD e Mercedes-Benz
-- Data: 18/07/2026
-- Fontes: páginas e especificações técnicas oficiais dos fabricantes.
-- Escopo: especificações técnicas; não cadastra manuais.
-- Pré-requisito: enviar as quatro imagens novas de public/assets/images/modelos.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo)
VALUES(
    'BYD','byd','China','https://www.byd.com/br',
    'Fabricante de veículos eletrificados, incluindo chassis e ônibus urbanos 100% elétricos.',1
)
ON DUPLICATE KEY UPDATE
    nome=VALUES(nome),pais_origem=VALUES(pais_origem),site_oficial=VALUES(site_oficial),
    descricao=VALUES(descricao),ativo=1;

DROP PROCEDURE IF EXISTS dl_familia_onibus_eletrico;
DROP PROCEDURE IF EXISTS dl_modelo_onibus_eletrico;
DELIMITER $$

CREATE PROCEDURE dl_familia_onibus_eletrico(
    IN p_marca VARCHAR(120), IN p_nome VARCHAR(100), IN p_descricao TEXT,
    IN p_imagem VARCHAR(255)
)
BEGIN
    INSERT INTO familias(marca_id,nome,descricao,imagem,ativo)
    SELECT ma.id,p_nome,p_descricao,p_imagem,1
      FROM marcas ma
     WHERE ma.slug=p_marca
    ON DUPLICATE KEY UPDATE
      descricao=VALUES(descricao),imagem=VALUES(imagem),ativo=1;
END$$

CREATE PROCEDURE dl_modelo_onibus_eletrico(
    IN p_marca VARCHAR(120), IN p_familia VARCHAR(100), IN p_nome VARCHAR(120),
    IN p_slug VARCHAR(140), IN p_descricao TEXT, IN p_imagem VARCHAR(255),
    IN p_motor VARCHAR(120), IN p_potencia VARCHAR(100), IN p_torque VARCHAR(100),
    IN p_transmissao VARCHAR(140), IN p_pbt VARCHAR(80), IN p_configuracao VARCHAR(120),
    IN p_bateria VARCHAR(100), IN p_autonomia VARCHAR(100),
    IN p_capacidade VARCHAR(100), IN p_comprimento VARCHAR(100),
    IN p_carregamento VARCHAR(160), IN p_mercado VARCHAR(100),
    IN p_fonte VARCHAR(700), IN p_fonte_imagem VARCHAR(700)
)
BEGIN
    DECLARE v_modelo BIGINT UNSIGNED;

    INSERT INTO modelos(
        familia_id,nome,slug,descricao,imagem,motor,potencia,torque,
        transmissao,pbt,especificacoes,ativo
    )
    SELECT
        fa.id,p_nome,p_slug,p_descricao,p_imagem,p_motor,p_potencia,p_torque,
        p_transmissao,p_pbt,
        JSON_OBJECT(
            'tipo_veiculo','Ônibus elétrico',
            'energia','100% elétrico',
            'configuracao',p_configuracao,
            'bateria',p_bateria,
            'autonomia',p_autonomia,
            'capacidade_passageiros',p_capacidade,
            'comprimento',p_comprimento,
            'carregamento',p_carregamento,
            'mercado',p_mercado,
            'fonte_oficial',p_fonte,
            'fonte_imagem_oficial',p_fonte_imagem,
            'conferido_em','2026-07-18'
        ),1
      FROM familias fa
      JOIN marcas ma ON ma.id=fa.marca_id
     WHERE ma.slug=p_marca AND fa.nome=p_familia
    ON DUPLICATE KEY UPDATE
      familia_id=VALUES(familia_id),nome=VALUES(nome),descricao=VALUES(descricao),
      imagem=VALUES(imagem),motor=VALUES(motor),potencia=VALUES(potencia),
      torque=VALUES(torque),transmissao=VALUES(transmissao),pbt=VALUES(pbt),
      especificacoes=VALUES(especificacoes),ativo=1;

    SELECT id INTO v_modelo FROM modelos WHERE slug=p_slug LIMIT 1;

    INSERT INTO modelo_documentos(modelo_id,tipo,titulo,url_origem,fonte_pagina,ativo)
    VALUES(
        v_modelo,'ficha_tecnica',CONCAT('Especificações técnicas oficiais — ',p_nome),
        p_fonte,p_fonte,1
    )
    ON DUPLICATE KEY UPDATE
      titulo=VALUES(titulo),url_origem=VALUES(url_origem),
      fonte_pagina=VALUES(fonte_pagina),ativo=1;
END$$
DELIMITER ;

-- BYD: modelo brasileiro e referências atuais do catálogo internacional.
CALL dl_familia_onibus_eletrico(
    'byd','Ônibus Elétricos Urbanos',
    'Ônibus urbanos 100% elétricos da BYD, com versões de piso baixo ou entrada baixa.',
    'public/assets/images/modelos/byd-d9a-oficial.jpg'
);

CALL dl_modelo_onibus_eletrico(
    'byd','Ônibus Elétricos Urbanos','BYD D9A','byd-d9a',
    'Ônibus elétrico Padron utilizado em operações urbanas brasileiras, com suspensão pneumática, freios a disco com ABS e frenagem regenerativa.',
    'public/assets/images/modelos/byd-d9a-oficial.jpg',
    'Dois motores elétricos integrados às rodas traseiras',NULL,NULL,
    'Tração elétrica direta com frenagem regenerativa',NULL,'Padron urbano',
    NULL,'Até 250 km','Até 78 passageiros',NULL,NULL,'Brasil',
    'https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH',
    'https://www.byd.com/material/byd-site/br/news-byd-brasil/onibus-BH.jpg'
);

CALL dl_modelo_onibus_eletrico(
    'byd','Ônibus Elétricos Urbanos','BYD eBus B12.b','byd-ebus-b12b',
    'Ônibus elétrico urbano de piso baixo do catálogo internacional BYD, equipado com Blade Battery LFP e trem de força integrado.',
    'public/assets/images/modelos/byd-ebus-b12b-oficial.png',
    'Dois motores elétricos Hairpin','2 × 150 kW (máxima)',NULL,
    'Tração elétrica direta','20 t PBT','Piso baixo, entre-eixos de 5.950 mm',
    'Blade Battery LFP, até 500 kWh','Até 600 km','Até 105 passageiros','12.130 mm',
    'CCS; pantógrafo opcional, até 500 kW','Catálogo internacional',
    'https://bydeurope.com/byd-ebus-b12',
    'https://bydeurope.com/img/bus/b12/banner.png'
);

CALL dl_modelo_onibus_eletrico(
    'byd','Ônibus Elétricos Urbanos','BYD eBus B13','byd-ebus-b13',
    'Ônibus elétrico de entrada baixa do catálogo internacional BYD, destinado a operações urbanas e intermunicipais.',
    'public/assets/images/modelos/byd-ebus-b13-oficial.png',
    'Dois motores elétricos integrados às rodas','2 × 150 kW (máxima)',NULL,
    'Tração elétrica direta','19,1 t PBT','Entrada baixa, entre-eixos de 7.100 mm',
    'Bateria LFP, até 422 kWh','Até 400 km','Até 59 passageiros','13.275 mm',
    'CCS ou pantógrafo','Catálogo internacional',
    'https://bydeurope.com/pdp-bus-model-13',
    'https://bydeurope.com/img/bus/pdp-bus-model-13-bus.png'
);

-- Mercedes-Benz: chassi elétrico produzido no Brasil.
CALL dl_familia_onibus_eletrico(
    'mercedes-benz','eO500',
    'Chassis de ônibus urbanos 100% elétricos Mercedes-Benz produzidos no Brasil.',
    'public/assets/images/modelos/mercedes-eo500u-oficial.webp'
);

CALL dl_modelo_onibus_eletrico(
    'mercedes-benz','eO500','Mercedes-Benz eO500U','mercedes-benz-eo500u',
    'Primeiro chassi de ônibus de propulsão elétrica produzido pela Mercedes-Benz do Brasil, com piso baixo e configuração modular de baterias.',
    'public/assets/images/modelos/mercedes-eo500u-oficial.webp',
    'Dois motores assíncronos integrados ao eixo traseiro','250 kW / 340 cv (total)',
    '2 × 485 Nm','Tração elétrica direta','21,2 t PBT','4x2, piso baixo',
    '3 a 6 pacotes NMC de 98 kWh; até 588 kWh','Até 270 km',
    'Mais de 80 passageiros nas configurações de 3 a 5 baterias','Carroceria de até 13,2 m',
    'CCS2, até 150 kW; recarga completa em até 3 horas','Brasil',
    'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u',
    'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/content-block/main/img-8948-20250710-182437-925-FCE2-20250710-181407-792-85A6_eo500u-sobre.jpg.webp'
);

DROP PROCEDURE dl_modelo_onibus_eletrico;
DROP PROCEDURE dl_familia_onibus_eletrico;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_004','Ônibus elétricos BYD e Mercedes-Benz com imagens e especificações técnicas oficiais')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

