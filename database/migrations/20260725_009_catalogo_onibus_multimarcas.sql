-- Drive Learn VW - Migração 009
-- Catálogo de ônibus multimarcas e fichas técnicas oficiais.
-- Data: 25/07/2026
-- Escopo: Mercedes-Benz, Volvo, Scania e IVECO BUS.
-- Importante: cadastra fichas/especificações técnicas; não cadastra manuais.
-- Pré-requisito: executar as migrações até 20260725_008 e enviar os PDFs
-- de public/assets/documents/modelos para o mesmo caminho na hospedagem.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS modelo_especificacoes_tecnicas (
    modelo_id BIGINT UNSIGNED NOT NULL,
    chave VARCHAR(80) NOT NULL,
    rotulo VARCHAR(120) NOT NULL,
    valor VARCHAR(255) NOT NULL,
    unidade VARCHAR(30) NULL,
    fonte_url VARCHAR(700) NULL,
    conferido_em DATE NULL,
    PRIMARY KEY(modelo_id,chave),
    CONSTRAINT fk_modelo_especificacao_modelo FOREIGN KEY(modelo_id)
        REFERENCES modelos(id) ON DELETE CASCADE,
    INDEX idx_modelo_especificacao_chave(chave)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES
('Mercedes-Benz','mercedes-benz','Alemanha','https://www.mercedes-benz-trucks.com.br/onibus/',
 'Fabricante de chassis de ônibus urbanos, escolares, rodoviários e elétricos.',1),
('Volvo','volvo','Suécia','https://www.volvobuses.com/br/',
 'Fabricante de chassis de ônibus urbanos, rodoviários e elétricos.',1),
('Scania','scania','Suécia','https://www.scania.com/br/pt/home/products/onibus.html',
 'Fabricante de chassis de ônibus urbanos e rodoviários.',1),
('IVECO','iveco','Itália','https://www.iveco.com/brasil/',
 'Fabricante de veículos comerciais e chassis para ônibus.',1)
ON DUPLICATE KEY UPDATE
    nome=VALUES(nome),pais_origem=VALUES(pais_origem),
    site_oficial=VALUES(site_oficial),descricao=VALUES(descricao),ativo=1;

DROP PROCEDURE IF EXISTS dl_onibus_familia_009;
DROP PROCEDURE IF EXISTS dl_onibus_modelo_009;

DELIMITER $$

CREATE PROCEDURE dl_onibus_familia_009(
    IN p_marca_slug VARCHAR(120),
    IN p_nome VARCHAR(100),
    IN p_descricao TEXT
)
BEGIN
    INSERT INTO familias(marca_id,nome,descricao,ativo)
    SELECT ma.id,p_nome,p_descricao,1
      FROM marcas ma
     WHERE ma.slug=p_marca_slug
    ON DUPLICATE KEY UPDATE
        descricao=VALUES(descricao),ativo=1;
END$$

CREATE PROCEDURE dl_onibus_modelo_009(
    IN p_marca_slug VARCHAR(120),
    IN p_familia VARCHAR(100),
    IN p_nome VARCHAR(120),
    IN p_slug VARCHAR(140),
    IN p_descricao TEXT,
    IN p_motor VARCHAR(120),
    IN p_potencia VARCHAR(100),
    IN p_torque VARCHAR(100),
    IN p_transmissao VARCHAR(140),
    IN p_pbt VARCHAR(80),
    IN p_pbtc VARCHAR(100),
    IN p_reducao VARCHAR(160),
    IN p_configuracao VARCHAR(120),
    IN p_energia VARCHAR(100),
    IN p_emissoes VARCHAR(100),
    IN p_entre_eixos VARCHAR(120),
    IN p_capacidade VARCHAR(100),
    IN p_comprimento VARCHAR(100),
    IN p_bateria VARCHAR(120),
    IN p_arquivo VARCHAR(255),
    IN p_url_ficha VARCHAR(700),
    IN p_fonte_pagina VARCHAR(700)
)
BEGIN
    DECLARE v_modelo BIGINT UNSIGNED;

    INSERT INTO modelos(
        familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,
        pbt,pbtc,relacao_reducao,especificacoes,ativo
    )
    SELECT
        fa.id,p_nome,p_slug,p_descricao,p_motor,p_potencia,p_torque,p_transmissao,
        p_pbt,p_pbtc,p_reducao,
        JSON_OBJECT(
            'tipo_veiculo','Ônibus',
            'energia',p_energia,
            'configuracao',p_configuracao,
            'emissoes',p_emissoes,
            'entre_eixos',p_entre_eixos,
            'capacidade_passageiros',p_capacidade,
            'comprimento',p_comprimento,
            'bateria',p_bateria,
            'mercado','Brasil',
            'fonte_oficial',p_url_ficha,
            'fonte_pagina',p_fonte_pagina,
            'auditoria_status','Conferido em ficha técnica oficial',
            'conferido_em','2026-07-25'
        ),1
      FROM familias fa
      JOIN marcas ma ON ma.id=fa.marca_id
     WHERE ma.slug=p_marca_slug
       AND fa.nome=p_familia
    ON DUPLICATE KEY UPDATE
        familia_id=VALUES(familia_id),nome=VALUES(nome),descricao=VALUES(descricao),
        motor=VALUES(motor),potencia=VALUES(potencia),torque=VALUES(torque),
        transmissao=VALUES(transmissao),pbt=VALUES(pbt),pbtc=VALUES(pbtc),
        relacao_reducao=VALUES(relacao_reducao),
        especificacoes=VALUES(especificacoes),ativo=1;

    SELECT id INTO v_modelo
      FROM modelos
     WHERE slug=p_slug
     LIMIT 1;

    INSERT INTO modelo_documentos(
        modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo
    ) VALUES (
        v_modelo,'ficha_tecnica',
        CONCAT('Ficha técnica oficial — ',p_nome),
        p_arquivo,p_url_ficha,p_fonte_pagina,1
    )
    ON DUPLICATE KEY UPDATE
        titulo=VALUES(titulo),arquivo=VALUES(arquivo),
        url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1;

    IF NULLIF(TRIM(p_pbt),'') IS NOT NULL THEN
        INSERT INTO modelo_especificacoes_tecnicas(
            modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em
        ) VALUES (
            v_modelo,'pbt','Peso Bruto Total',p_pbt,NULL,p_url_ficha,'2026-07-25'
        )
        ON DUPLICATE KEY UPDATE
            rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
    END IF;

    IF NULLIF(TRIM(p_pbtc),'') IS NOT NULL THEN
        INSERT INTO modelo_especificacoes_tecnicas(
            modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em
        ) VALUES (
            v_modelo,'pbtc','Peso Bruto Total Combinado',p_pbtc,NULL,p_url_ficha,'2026-07-25'
        )
        ON DUPLICATE KEY UPDATE
            rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
    END IF;

    IF NULLIF(TRIM(p_reducao),'') IS NOT NULL THEN
        INSERT INTO modelo_especificacoes_tecnicas(
            modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em
        ) VALUES (
            v_modelo,'relacao_reducao','Relação de redução',p_reducao,NULL,p_url_ficha,'2026-07-25'
        )
        ON DUPLICATE KEY UPDATE
            rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
    END IF;

    IF NULLIF(TRIM(p_entre_eixos),'') IS NOT NULL THEN
        INSERT INTO modelo_especificacoes_tecnicas(
            modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em
        ) VALUES (
            v_modelo,'entre_eixos','Entre-eixos',p_entre_eixos,NULL,p_url_ficha,'2026-07-25'
        )
        ON DUPLICATE KEY UPDATE
            rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
    END IF;

    IF NULLIF(TRIM(p_capacidade),'') IS NOT NULL THEN
        INSERT INTO modelo_especificacoes_tecnicas(
            modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em
        ) VALUES (
            v_modelo,'capacidade_passageiros','Capacidade de passageiros',
            p_capacidade,NULL,p_url_ficha,'2026-07-25'
        )
        ON DUPLICATE KEY UPDATE
            rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
    END IF;
END$$

DELIMITER ;

-- Famílias Mercedes-Benz
CALL dl_onibus_familia_009(
    'mercedes-benz','LO Micro-Ônibus e Escolar',
    'Chassis Mercedes-Benz LO para micro-ônibus, transporte escolar, urbano e fretamento.'
);
CALL dl_onibus_familia_009(
    'mercedes-benz','OF Urbanos e Fretamento',
    'Chassis Mercedes-Benz OF com motor dianteiro para aplicações urbanas, fretamento e curtas distâncias.'
);
CALL dl_onibus_familia_009(
    'mercedes-benz','O 500 Urbanos',
    'Chassis Mercedes-Benz O 500 urbanos com motor traseiro, incluindo versões articuladas.'
);
CALL dl_onibus_familia_009(
    'mercedes-benz','O 500 Rodoviários',
    'Chassis Mercedes-Benz O 500 para fretamento e transporte rodoviário de média e longa distância.'
);

-- Famílias Volvo
CALL dl_onibus_familia_009(
    'volvo','B13R Rodoviários',
    'Chassis Volvo B13R Euro 6 para fretamento e transporte rodoviário.'
);
CALL dl_onibus_familia_009(
    'volvo','BZR Elétrico',
    'Plataforma Volvo BZR 100% elétrica para ônibus urbanos e intermunicipais.'
);

-- Famílias Scania e IVECO
CALL dl_onibus_familia_009(
    'scania','Série K Rodoviários',
    'Chassis Scania Série K Proconve P8 para ônibus rodoviários.'
);
CALL dl_onibus_familia_009(
    'iveco','IVECO BUS',
    'Chassis IVECO BUS Proconve P8 para transporte urbano e fretamento.'
);

-- Mercedes-Benz
CALL dl_onibus_modelo_009(
    'mercedes-benz','LO Micro-Ônibus e Escolar',
    'LO 916/48 ORE 2','mercedes-lo-916-48-ore2',
    'Chassi 4x2 de piso alto para transporte escolar rural, com carroceria de até 9,2 m.',
    'MB OM 924 LA 4,8 l','163 cv (120 kW) @ 2.200 rpm',
    '610 Nm @ 1.200–1.600 rpm','Eaton ESBO 6206 manual, 6 marchas',
    '9.400 kg',NULL,'4,30:1',
    '4x2, piso alto escolar','Diesel','Proconve P8 / Euro 6',
    '4.800 mm','Até 45 pessoas, incluindo motorista','Até 9,2 m',NULL,
    'public/assets/documents/modelos/mercedes-lo-916-ore2-ficha-tecnica.pdf',
    'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf',
    'https://www.mercedes-benz-trucks.com.br/showroom/onibus/escolar/lo-916'
);

CALL dl_onibus_modelo_009(
    'mercedes-benz','OF Urbanos e Fretamento',
    'OF 1721L/59','mercedes-of-1721l-59',
    'Chassi 4x2 de piso alto e suspensão pneumática para uso urbano, fretamento e rodoviário de curta distância.',
    'MB OM 924 LA 4,8 l','208 cv (153 kW) @ 2.200 rpm',
    '780 Nm @ 1.200–1.600 rpm','MB G 90-6 manual, 6 marchas',
    '17.000 kg',NULL,'5,875:1; opcional rodoviária 5,222:1',
    '4x2, piso alto','Diesel','Proconve P8 / Euro 6',
    '5.950 mm','70 a 80 passageiros','11,3 m ou 12,7 a 13,2 m',NULL,
    'public/assets/documents/modelos/mercedes-of-1721l-59-ficha-tecnica.pdf',
    'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf',
    'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/of-1721l'
);

CALL dl_onibus_modelo_009(
    'mercedes-benz','O 500 Urbanos',
    'O 500 UA 2938','mercedes-o500-ua-2938',
    'Chassi articulado 6x2 de entrada baixa para operações urbanas de alta capacidade.',
    'MB OM 460 LA 12,8 l','381 cv (280 kW) @ 1.600 rpm',
    '1.900 Nm @ 1.100 rpm',
    'ZF EcoLife AP 2020 B, 6 marchas, ou Voith DIWA 6 D884.6',
    '29.000 kg',NULL,'7,73:1; opcional 6,00:1',
    '6x2 articulado, entrada baixa','Diesel','Proconve P8 / Euro 6',
    NULL,'Até 135 passageiros','Até 18,6 m',NULL,
    'public/assets/documents/modelos/mercedes-o500-ua-2938-ficha-tecnica.pdf',
    'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf',
    'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua'
);

CALL dl_onibus_modelo_009(
    'mercedes-benz','O 500 Rodoviários',
    'O 500 RSDD 2745/30','mercedes-o500-rsdd-2745-30',
    'Chassi rodoviário 8x2 para média e longa distância, com pacote de segurança ativa.',
    'MB OM 460 LA 12,8 l','449 cv (330 kW) @ 1.600 rpm',
    '2.200 Nm @ 1.100 rpm','ZF TraXon automatizada, 12 marchas',
    '27.000 kg',NULL,'2,533:1; opcional 2,846:1',
    '8x2 rodoviário','Diesel','Proconve P8 / Euro 6',
    'Módulo central de 3.000 mm; dimensões completas na ficha',
    'Até 68 passageiros','15,0 m',NULL,
    'public/assets/documents/modelos/mercedes-o500-rsdd-2745-30-ficha-tecnica.pdf',
    'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf',
    'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd'
);

-- Volvo
CALL dl_onibus_modelo_009(
    'volvo','B13R Rodoviários',
    'Volvo B420R 6x2','volvo-b420r-6x2-onibus',
    'Chassi rodoviário Volvo B13R 6x2 com suspensão pneumática e freios a disco EBS.',
    'Volvo D13K420 12,8 l','420 cv (309 kW) @ 1.400–1.800 rpm',
    '2.100 Nm @ 860–1.400 rpm','Volvo I-Shift automatizada',
    '24.750 kg; até 26.500 kg com terceiro eixo direcional',NULL,
    '2,64:1; opcional 2,85:1',
    '6x2 rodoviário','Diesel','Proconve P8 / Euro 6',
    '4.000 mm (entre-eixos de transporte)',NULL,'10,47 a 10,57 m de chassi',NULL,
    'public/assets/documents/modelos/volvo-b420r-6x2-ficha-tecnica.pdf',
    'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf',
    'https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html'
);

CALL dl_onibus_modelo_009(
    'volvo','B13R Rodoviários',
    'Volvo B510R 8x2','volvo-b510r-8x2-onibus',
    'Chassi rodoviário Volvo B13R 8x2 para aplicações de alta capacidade.',
    'Volvo D13K500 12,8 l','500 cv (368 kW) @ 1.530–1.800 rpm',
    '2.500 Nm @ 980–1.270 rpm','Volvo I-Shift automatizada',
    '29.250 kg',NULL,'2,64:1; opcional 2,85:1',
    '8x2 rodoviário','Diesel','Proconve P8 / Euro 6',
    '2.600 mm (entre-eixos de transporte)',NULL,'10,47 m de chassi',NULL,
    'public/assets/documents/modelos/volvo-b510r-8x2-ficha-tecnica.pdf',
    'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf',
    'https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html'
);

CALL dl_onibus_modelo_009(
    'volvo','BZR Elétrico',
    'Volvo BZR Elétrico 4x2 Piso Médio','volvo-bzr-eletrico-4x2-piso-medio',
    'Plataforma elétrica 4x2 de piso médio, com uma ou duas máquinas elétricas e baterias modulares.',
    'Volvo EPT402 ou EPT802','200 kW ou 400 kW (máxima)',
    '425 Nm ou 850 Nm','Volvo automatizada de 2 marchas',
    '20.800 kg',NULL,NULL,
    '4x2, piso médio','100% elétrico','Zero emissão local',
    '6.000 mm; opcional 6.300 mm','Conforme carroceria','9,5 a 13,26 m',
    'NCA, 360 a 450 kWh úteis com 4 ou 5 baterias',
    'public/assets/documents/modelos/volvo-bzr-eletrico-4x2-piso-medio-ficha-tecnica.pdf',
    'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf',
    'https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html'
);

CALL dl_onibus_modelo_009(
    'volvo','BZR Elétrico',
    'Volvo BZR Elétrico 4x2 Entrada Baixa','volvo-bzr-eletrico-4x2-entrada-baixa',
    'Plataforma elétrica 4x2 de entrada baixa para aplicações urbanas e intermunicipais.',
    'Volvo EPT402 ou EPT802','200 kW ou 400 kW (máxima)',
    '425 Nm ou 850 Nm','Volvo automatizada de 2 marchas',
    '21.000 kg',NULL,NULL,
    '4x2, entrada baixa','100% elétrico','Zero emissão local',
    '4.450 a 7.400 mm aprovados','Conforme carroceria','9,85 a 13,13 m',
    'NCA, 360 a 450 kWh úteis com 4 ou 5 baterias',
    'public/assets/documents/modelos/volvo-bzr-eletrico-4x2-entrada-baixa-ficha-tecnica.pdf',
    'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf',
    'https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html'
);

-- Scania
CALL dl_onibus_modelo_009(
    'scania','Série K Rodoviários',
    'Scania K 370 4x2NB','scania-k370-4x2nb-onibus',
    'Chassi Scania rodoviário 4x2 com trem de força de 13 litros e caixa automatizada de 12 marchas.',
    'Scania 13 l, 6 cilindros','370 hp (272 kW) @ 1.800 rpm',
    '1.900 Nm @ 900–1.340 rpm',
    'Scania GRS895R ou GRSO895R automatizada, 12 marchas',
    NULL,NULL,'2,72:1; 2,92:1; 3,07:1 ou 3,42:1',
    '4x2 rodoviário','Diesel','Proconve P8',
    NULL,NULL,NULL,NULL,
    'public/assets/documents/modelos/scania-k370-4x2-ficha-tecnica.pdf',
    'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf',
    'https://www.scania.com/br/pt/home/products/onibus.html'
);

CALL dl_onibus_modelo_009(
    'scania','Série K Rodoviários',
    'Scania K 500 8x2NB','scania-k500-8x2nb-onibus',
    'Chassi Scania rodoviário 8x2 com motor de 13 litros, freios a disco e retarder.',
    'Scania 13 l, 6 cilindros','500 hp (368 kW) @ 1.800 rpm',
    '2.550 Nm @ 925–1.340 rpm',
    'Scania GRSO895R automatizada, 12 marchas',
    NULL,NULL,'2,71:1; 2,92:1 ou 3,08:1',
    '8x2 rodoviário','Diesel','Proconve P8',
    NULL,NULL,NULL,NULL,
    'public/assets/documents/modelos/scania-k500-8x2-ficha-tecnica.pdf',
    'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf',
    'https://www.scania.com/br/pt/home/products/onibus.html'
);

-- IVECO BUS
CALL dl_onibus_modelo_009(
    'iveco','IVECO BUS',
    'IVECO BUS 10-190','iveco-bus-10-190',
    'Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.',
    'FPT NEF 4 ID','190 cv (138 kW) @ 2.500 rpm',
    '610 Nm @ 1.350–2.100 rpm','Eaton 6206 B manual, 6 marchas',
    '10.500 kg',NULL,'4,56:1',
    '4x2, motor dianteiro','Diesel','Proconve P8 / Euro 6',
    '4.500 ou 4.800 mm',NULL,NULL,NULL,
    'public/assets/documents/modelos/iveco-bus-10-190-17-280-ficha-tecnica.pdf',
    'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1',
    'https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas'
);

CALL dl_onibus_modelo_009(
    'iveco','IVECO BUS',
    'IVECO BUS 17-280','iveco-bus-17-280',
    'Chassi 4x2 para ônibus de maior capacidade, com motor FPT NEF 6 Euro VI.',
    'FPT NEF 6 Euro VI HiSCR','280 cv (207 kW) @ 2.500 rpm',
    '950 Nm @ 1.250–1.970 rpm','ZF 6S 1010 BO manual, 6 marchas',
    '16.000 kg',NULL,'5,57:1; opcionais 5,13:1 ou 6,57:1',
    '4x2, motor dianteiro','Diesel','Proconve P8 / Euro 6',
    '5.950 mm',NULL,NULL,NULL,
    'public/assets/documents/modelos/iveco-bus-10-190-17-280-ficha-tecnica.pdf',
    'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1',
    'https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas'
);

DROP PROCEDURE dl_onibus_modelo_009;
DROP PROCEDURE dl_onibus_familia_009;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260725_009','Catálogo de ônibus multimarcas com fichas técnicas oficiais')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
