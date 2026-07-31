-- Drive Learn VW - Migração 026
-- Ampliação do catálogo Mercedes-Benz de ônibus com fichas técnicas oficiais.
-- Data: 31/07/2026
-- Escopo: micro-ônibus, escolar/rural, urbano, fretamento, rodoviário,
--         articulado e superarticulado.
-- Importante:
--   1. Este arquivo é idempotente e pode ser executado novamente.
--   2. Não contém manuais; somente dados e fichas técnicas oficiais.
--   3. Envie também os PDFs novos de public/assets/documents/modelos.

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
    CONSTRAINT fk_modelo_especificacao_modelo_026 FOREIGN KEY(modelo_id)
        REFERENCES modelos(id) ON DELETE CASCADE,
    INDEX idx_modelo_especificacao_chave_026(chave)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES
('Mercedes-Benz','mercedes-benz','Alemanha','https://www.mercedes-benz-trucks.com.br/onibus/',
 'Fabricante de chassis de ônibus urbanos, escolares, rurais, rodoviários, articulados e elétricos.',1)
ON DUPLICATE KEY UPDATE
    nome=VALUES(nome),site_oficial=VALUES(site_oficial),
    descricao=VALUES(descricao),ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'LO Micro-Ônibus e Escolar',
       'Chassis Mercedes-Benz LO para micro-ônibus, transporte escolar, rural, urbano e fretamento.',
       'onibus',1
  FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo='onibus',ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'OF Urbanos e Fretamento',
       'Chassis Mercedes-Benz OF com motor dianteiro para aplicações urbanas, escolares, rurais e fretamento.',
       'onibus',1
  FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo='onibus',ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'O 500 Urbanos',
       'Chassis Mercedes-Benz O 500 urbanos com motor traseiro, incluindo Padron, articulados e superarticulados.',
       'onibus',1
  FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo='onibus',ativo=1;

INSERT INTO familias(marca_id,nome,descricao,tipo_veiculo,ativo)
SELECT id,'O 500 Rodoviários',
       'Chassis Mercedes-Benz O 500 para fretamento e transporte rodoviário de curta, média e longa distância.',
       'onibus',1
  FROM marcas WHERE slug='mercedes-benz'
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),tipo_veiculo='onibus',ativo=1;

DROP PROCEDURE IF EXISTS dl_mercedes_bus_spec_026;
DROP PROCEDURE IF EXISTS dl_mercedes_bus_026;

DELIMITER $$

CREATE PROCEDURE dl_mercedes_bus_spec_026(
    IN p_modelo_id BIGINT UNSIGNED,
    IN p_chave VARCHAR(80),
    IN p_rotulo VARCHAR(120),
    IN p_valor VARCHAR(255),
    IN p_fonte VARCHAR(700)
)
BEGIN
    IF NULLIF(TRIM(p_valor),'') IS NOT NULL THEN
        INSERT INTO modelo_especificacoes_tecnicas(
            modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em
        ) VALUES (
            p_modelo_id,p_chave,p_rotulo,p_valor,NULL,p_fonte,'2026-07-31'
        )
        ON DUPLICATE KEY UPDATE
            rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
    END IF;
END$$

CREATE PROCEDURE dl_mercedes_bus_026(
    IN p_familia VARCHAR(100),
    IN p_nome VARCHAR(120),
    IN p_slug VARCHAR(140),
    IN p_descricao TEXT,
    IN p_motor VARCHAR(120),
    IN p_potencia VARCHAR(100),
    IN p_torque VARCHAR(100),
    IN p_transmissao VARCHAR(140),
    IN p_pbt VARCHAR(80),
    IN p_reducao VARCHAR(160),
    IN p_configuracao VARCHAR(140),
    IN p_tipo_carroceria VARCHAR(140),
    IN p_entre_eixos VARCHAR(120),
    IN p_capacidade VARCHAR(120),
    IN p_comprimento VARCHAR(120),
    IN p_aplicacao VARCHAR(160),
    IN p_arquivo VARCHAR(255),
    IN p_url_ficha VARCHAR(700),
    IN p_fonte_pagina VARCHAR(700)
)
BEGIN
    DECLARE v_modelo BIGINT UNSIGNED DEFAULT NULL;

    INSERT INTO modelos(
        familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,
        pbt,pbtc,relacao_reducao,especificacoes,ativo
    )
    SELECT
        f.id,p_nome,p_slug,p_descricao,p_motor,p_potencia,p_torque,p_transmissao,
        p_pbt,'Não se aplica',p_reducao,
        JSON_OBJECT(
            'tipo_veiculo','Ônibus',
            'energia','Diesel',
            'configuracao',p_configuracao,
            'tipo_carroceria',p_tipo_carroceria,
            'emissoes','Proconve P8 / Euro 6',
            'entre_eixos',p_entre_eixos,
            'capacidade_passageiros',p_capacidade,
            'comprimento',p_comprimento,
            'mercado',p_aplicacao,
            'bateria','Não se aplica',
            'autonomia','Não se aplica',
            'carregamento','Não se aplica',
            'fonte_oficial',IF(NULLIF(p_url_ficha,'') IS NOT NULL,p_url_ficha,p_fonte_pagina),
            'fonte_pagina',p_fonte_pagina,
            'auditoria_status','Conferido em ficha técnica oficial Mercedes-Benz',
            'conferido_em','2026-07-31'
        ),1
      FROM familias f
      JOIN marcas ma ON ma.id=f.marca_id
     WHERE ma.slug='mercedes-benz'
       AND f.nome=p_familia
     LIMIT 1
    ON DUPLICATE KEY UPDATE
        familia_id=VALUES(familia_id),nome=VALUES(nome),descricao=VALUES(descricao),
        motor=VALUES(motor),potencia=VALUES(potencia),torque=VALUES(torque),
        transmissao=VALUES(transmissao),pbt=VALUES(pbt),pbtc=VALUES(pbtc),
        relacao_reducao=VALUES(relacao_reducao),
        especificacoes=VALUES(especificacoes),ativo=1;

    SELECT id INTO v_modelo FROM modelos WHERE slug=p_slug LIMIT 1;

    IF v_modelo IS NOT NULL AND
       (NULLIF(TRIM(p_arquivo),'') IS NOT NULL OR NULLIF(TRIM(p_url_ficha),'') IS NOT NULL) THEN
        INSERT INTO modelo_documentos(
            modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo
        ) VALUES (
            v_modelo,'ficha_tecnica',CONCAT('Ficha técnica oficial — ',p_nome),
            NULLIF(p_arquivo,''),NULLIF(p_url_ficha,''),p_fonte_pagina,1
        )
        ON DUPLICATE KEY UPDATE
            titulo=VALUES(titulo),arquivo=VALUES(arquivo),
            url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1;
    END IF;

    IF v_modelo IS NOT NULL THEN
        CALL dl_mercedes_bus_spec_026(v_modelo,'pbt','Peso Bruto Total',p_pbt,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'pbtc','Peso Bruto Total Combinado','Não se aplica',p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'relacao_reducao','Relação de redução',p_reducao,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'entre_eixos','Entre-eixos',p_entre_eixos,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'capacidade_passageiros','Capacidade de passageiros',p_capacidade,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'comprimento','Comprimento encarroçado',p_comprimento,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'configuracao','Configuração',p_configuracao,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'tipo_carroceria','Tipo de carroceria',p_tipo_carroceria,p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'tipo_veiculo','Tipo de veículo','Ônibus',p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'emissoes','Norma de emissões','Proconve P8 / Euro 6',p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'energia','Energia / propulsão','Diesel',p_url_ficha);
        CALL dl_mercedes_bus_spec_026(v_modelo,'mercado','Mercado / aplicação',p_aplicacao,p_url_ficha);
    END IF;
END$$

DELIMITER ;

-- Micro-ônibus, escolar e rural
CALL dl_mercedes_bus_026(
 'LO Micro-Ônibus e Escolar','LO 916/42/48','mercedes-lo-916-42-48',
 'Chassi 4x2 de piso alto para aplicações urbana, escolar, fretamento e rodoviária.',
 'MB OM 924 LA 4,8 l','163 cv (120 kW) @ 2.200 rpm','610 Nm @ 1.200–1.600 rpm',
 'Eaton ESBO 6206 manual, 6 marchas','9.400 kg','4,30:1',
 '4x2, piso alto','Chassi para micro-ônibus','4.200 / 4.800 mm',
 'Até 40 passageiros; até 24 assentos urbano ou 32 fretamento','Até 9,2 m',
 'Urbano, escolar, fretamento e rodoviário',
 'public/assets/documents/modelos/mercedes-lo-916-42-48-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-42-e-48.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916'
);

CALL dl_mercedes_bus_026(
 'LO Micro-Ônibus e Escolar','LO 916/48 Rural','mercedes-lo-916-48-rural',
 'Chassi 4x2 de piso alto com proteção de cárter e diferencial autoblocante para uso escolar e fretamento rural.',
 'MB OM 924 LA 4,8 l','163 cv (120 kW) @ 2.200 rpm','610 Nm @ 1.200–1.600 rpm',
 'Eaton ESBO 6206 manual, 6 marchas','9.400 kg','4,30:1',
 '4x2, piso alto rural','Chassi para micro-ônibus rural','4.800 mm',
 'Até 32 passageiros / assentos','Até 9,2 m','Escolar rural e fretamento rural',
 'public/assets/documents/modelos/mercedes-lo-916-rural-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-916-48-rural.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916-r'
);

CALL dl_mercedes_bus_026(
 'LO Micro-Ônibus e Escolar','LO 1116/48/55','mercedes-lo-1116-48-55',
 'Chassi 4x2 para micro-ônibus urbano, escolar e fretamento com duas opções de entre-eixos.',
 'MB OM 924 LA 4,8 l','163 cv (120 kW) @ 2.200 rpm','610 Nm @ 1.200–1.600 rpm',
 'Eaton ESBO 6206 manual, 6 marchas','10.800 kg','4,30:1',
 '4x2, piso alto','Chassi para micro-ônibus','4.800 / 5.500 mm',
 'Até 50 passageiros urbano; até 38 assentos + motorista e auxiliar no fretamento','9,2 a 10,65 m',
 'Urbano, escolar e fretamento',
 'public/assets/documents/modelos/mercedes-lo-1116-48-55-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-1116-48-55.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-1116'
);

CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1519R/60','mercedes-of-1519r-60',
 'Chassi 4x2 de piso alto para transporte escolar e fretamento rural.',
 'MB OM 924 LA 4,8 l','185 cv (136 kW) @ 2.200 rpm','700 Nm @ 1.200–1.600 rpm',
 'MB G 71-6 manual, 6 marchas','15.000 kg','4,778:1',
 '4x2, piso alto rural','Chassi de ônibus escolar/rural','6.000 mm',
 'Até 60 estudantes','Até 10,8 m','Escolar e fretamento rural',
 'public/assets/documents/modelos/mercedes-of-1519r-60-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1519r-60.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/escolar/of-1519-r'
);

-- Linha OF urbana e de fretamento
CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1619/52','mercedes-of-1619-52',
 'Chassi 4x2 de piso alto para uso urbano, fretamento e rodoviário.',
 'MB OM 924 LA 4,8 l','185 cv (136 kW) @ 2.200 rpm','700 Nm @ 1.200–1.600 rpm',
 'MB G 71-6 manual, 6 marchas','16.000 kg','4,778:1',
 '4x2, piso alto','Chassi de ônibus','5.200 mm',
 'Até 65 passageiros; até 38 assentos urbano ou 42 fretamento/rodoviário','Até 11,3 m',
 'Urbano, fretamento e rodoviário',
 'public/assets/documents/modelos/mercedes-of-1619-52-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619-52-a.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619'
);

CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1619L/52','mercedes-of-1619l-52',
 'Chassi 4x2 com suspensão pneumática para uso urbano, fretamento e rodoviário.',
 'MB OM 924 LA 4,8 l','185 cv (136 kW) @ 2.200 rpm','700 Nm @ 1.200–1.600 rpm',
 'MB G 71-6 manual, 6 marchas','16.000 kg','4,778:1',
 '4x2, piso alto, suspensão pneumática','Chassi de ônibus','5.200 mm',
 'Até 65 passageiros; até 38 assentos urbano ou 42 fretamento/rodoviário','Até 11,3 m',
 'Urbano, fretamento e rodoviário',
 'public/assets/documents/modelos/mercedes-of-1619l-52-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1619l-52.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619l'
);

CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1621/59','mercedes-of-1621-59',
 'Chassi 4x2 de piso alto desenvolvido para fretamento.',
 'MB OM 924 LA 4,8 l','208 cv (153 kW) @ 2.200 rpm','780 Nm @ 1.200–1.600 rpm',
 'MB G 90-6 manual, 6 marchas','16.500 kg','5,875:1',
 '4x2, piso alto','Chassi de ônibus','5.950 mm',
 'Até 48 passageiros / assentos','12,55 m','Fretamento',
 'public/assets/documents/modelos/mercedes-of-1621-59-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1621-59.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1621'
);

CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1721/59','mercedes-of-1721-59',
 'Chassi 4x2 para versões encurtadas ou alongadas, aplicável em operações urbanas, de fretamento e rodoviárias.',
 'MB OM 924 LA 4,8 l','208 cv (153 kW) @ 2.200 rpm','780 Nm @ 1.200–1.600 rpm',
 'MB G 90-6 manual, 6 marchas','17.000 kg','5,875:1',
 '4x2, piso alto','Chassi de ônibus','5.950 mm',
 '70 a 80 passageiros; 34 a 42 assentos urbano ou 42 a 46 rodoviário','11,3 m ou 12,7 a 13,2 m',
 'Urbano, fretamento e rodoviário',
 'public/assets/documents/modelos/mercedes-of-1721-59-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721-59-v.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721'
);

CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1726/59','mercedes-of-1726-59',
 'Chassi 4x2 de 260 cv para uso urbano, fretamento e rodoviário.',
 'MB OM 926 LA 7,2 l','260 cv (191 kW) @ 2.200 rpm','900 Nm @ 1.200–1.600 rpm',
 'MB G 90-6 manual, 6 marchas','17.000 kg','5,875:1',
 '4x2, piso alto','Chassi de ônibus','5.950 mm',
 '70 a 80 passageiros; 34 a 42 assentos urbano ou 42 a 46 rodoviário','11,3 m ou 12,7 a 13,2 m',
 'Urbano, fretamento e rodoviário',
 'public/assets/documents/modelos/mercedes-of-1726-59-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726-59.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726'
);

CALL dl_mercedes_bus_026(
 'OF Urbanos e Fretamento','OF 1726L/59','mercedes-of-1726l-59',
 'Chassi 4x2 alongado com suspensão pneumática para uso urbano, fretamento e rodoviário.',
 'MB OM 926 LA 7,2 l','260 cv (191 kW) @ 2.200 rpm','900 Nm @ 1.200–1.600 rpm',
 'MB G 90-6 manual, 6 marchas','17.000 kg','5,875:1',
 '4x2, piso alto, suspensão pneumática','Chassi de ônibus','5.950 mm',
 '70 a 80 passageiros; 34 a 42 assentos urbano ou 42 a 46 rodoviário','12,7 a 13,2 m',
 'Urbano, fretamento e rodoviário',
 'public/assets/documents/modelos/mercedes-of-1726l-59-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1726l-59.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726l'
);

-- O 500 urbanos, articulados e superarticulados
CALL dl_mercedes_bus_026(
 'O 500 Urbanos','O 500 U 1928/59','mercedes-o500-u-1928-59',
 'Chassi urbano 4x2 de entrada baixa com transmissão automática e retarder.',
 'MB OM 926 LA 7,2 l','286 cv (210 kW) @ 2.200 rpm','1.100 Nm @ 1.200–1.600 rpm',
 'ZF EcoLife 6 AP 1220B ou Voith DIWA 6 D854.6, com retarder','19.600 kg','5,875:1',
 '4x2, entrada baixa','Chassi urbano de entrada baixa','5.950 mm',
 '80 a 90 passageiros; até 34 assentos','Até 13,2 m','Urbano',
 'public/assets/documents/modelos/mercedes-o500-u-1928-59-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-u-1928-59-a.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500u'
);

CALL dl_mercedes_bus_026(
 'O 500 Urbanos','O 500 M 1928/59 Super Padron','mercedes-o500-m-1928-59',
 'Chassi urbano Super Padron 4x2 de piso alto e suspensão pneumática integral.',
 'MB OM 926 LA 7,2 l','286 cv (210 kW) @ 2.200 rpm','1.100 Nm @ 1.200–1.600 rpm',
 'ZF EcoLife 6 AP 1220B ou Voith DIWA 6 D854.6, com retarder','20.000 kg','5,875:1',
 '4x2, Super Padron','Chassi urbano de piso alto','5.950 mm',
 '85 a 95 passageiros; até 51 assentos','Até 14,0 m','Urbano',
 'public/assets/documents/modelos/mercedes-o500-m-1928-59-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-m-1928-59.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500m'
);

CALL dl_mercedes_bus_026(
 'O 500 Urbanos','O 500 MA 2938','mercedes-o500-ma-2938',
 'Chassi urbano articulado 6x2 de piso alto para transporte de alta capacidade.',
 'MB OM 460 LA 12,8 l','381 cv (280 kW) @ 1.600 rpm','1.900 Nm @ 1.100 rpm',
 'ZF EcoLife AP 2020 B ou Voith DIWA 6 D884.6, com retarder','29.000 kg','7,73:1',
 '6x2 articulado','Chassi articulado de piso alto','5.250 + 6.700 mm',
 'Até 173 passageiros; até 48 assentos','Até 18,6 m','Urbano / BRT',
 'public/assets/documents/modelos/mercedes-o500-ma-2938-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ma-2938.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ma'
);

CALL dl_mercedes_bus_026(
 'O 500 Urbanos','O 500 UDA 3738','mercedes-o500-uda-3738',
 'Chassi urbano superarticulado 8x2 de entrada baixa para corredores e sistemas BRT.',
 'MB OM 460 LA 12,8 l','381 cv (280 kW) @ 1.600 rpm','1.900 Nm @ 1.100 rpm',
 'ZF EcoLife AP 2020 B ou Voith DIWA 6 D884.6, com retarder','37.000 kg','7,73:1',
 '8x2 superarticulado','Chassi superarticulado de entrada baixa','3.000 + 7.600 ou 9.000 + 1.600 mm',
 'Até 175 passageiros; até 57 assentos','Até 23,0 m','Urbano / BRT',
 'public/assets/documents/modelos/mercedes-o500-uda-3738-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-uda-3738-a.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500uda'
);

CALL dl_mercedes_bus_026(
 'O 500 Urbanos','O 500 MDA 3738','mercedes-o500-mda-3738',
 'Chassi urbano superarticulado 8x2 de piso alto para corredores e sistemas BRT.',
 'MB OM 460 LA 12,8 l','381 cv (280 kW) @ 1.600 rpm','1.900 Nm @ 1.100 rpm',
 'ZF EcoLife AP 2020 B ou Voith DIWA 6 D884.6, com retarder','37.000 kg','6,00:1',
 '8x2 superarticulado','Chassi superarticulado de piso alto','3.000 + 9.000 + 1.600 mm',
 'Até 190 passageiros; até 58 assentos','Até 23,0 m','Urbano / BRT',
 'public/assets/documents/modelos/mercedes-o500-mda-3738-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-mda-3738.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500mda'
);

-- O 500 rodoviários
CALL dl_mercedes_bus_026(
 'O 500 Rodoviários','O 500 R 1931/30','mercedes-o500-r-1931-30',
 'Chassi rodoviário 4x2 para fretamento e percursos de curta distância.',
 'MB OM 926 LA 7,2 l','310 cv (228 kW) @ 2.200 rpm','1.250 Nm @ 1.200–1.600 rpm',
 'MB GO 190-6 manual, 6 marchas','20.000 kg','3,583:1',
 '4x2 rodoviário','Chassi rodoviário','3.000 mm',
 'Até 50 assentos','Até 14,0 m','Fretamento e rodoviário de curta distância',
 'public/assets/documents/modelos/mercedes-o500-r-1931-30-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-r-1931-30.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-r'
);

CALL dl_mercedes_bus_026(
 'O 500 Rodoviários','O 500 RS 1938/30','mercedes-o500-rs-1938-30',
 'Chassi rodoviário 4x2 para operações de média e longa distância.',
 'MB OM 460 LA 12,8 l','381 cv (280 kW) @ 1.600 rpm','1.900 Nm @ 1.100 rpm',
 'ZF TraXon AMT 12TX BD automatizada, 12 marchas','20.000 kg','2,533:1; opcional 2,846:1',
 '4x2 rodoviário','Chassi rodoviário','3.000 mm',
 'Até 50 passageiros / assentos','Até 14,0 m','Rodoviário de média e longa distância',
 'public/assets/documents/modelos/mercedes-o500-rs-1938-30-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rs-1938-30.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rs'
);

CALL dl_mercedes_bus_026(
 'O 500 Rodoviários','O 500 RSD 2445/30','mercedes-o500-rsd-2445-30',
 'Chassi rodoviário 6x2 para operações de média e longa distância, apto a carrocerias de até 14 metros.',
 'MB OM 460 LA 12,8 l','449 cv (330 kW) @ 1.600 rpm','2.200 Nm @ 1.100 rpm',
 'ZF TraXon automatizada, 12 marchas, com Eco Roll e Power Mode','24.500 kg','2,533:1; opcional 2,846:1',
 '6x2 rodoviário','Chassi rodoviário','3.000 + 1.350 mm',
 'Até 50 assentos','Até 14,0 m','Rodoviário de média e longa distância',
 'public/assets/documents/modelos/mercedes-o500-rsd-2445-30-ficha-tecnica.pdf',
 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsd-2445-30.pdf',
 'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2445'
);

-- Modelo atual do portfólio cuja página oficial está disponível, mas o PDF
-- público informado pela própria página estava indisponível na data da auditoria.
CALL dl_mercedes_bus_026(
 'O 500 Rodoviários','O 500 RSD 2438','mercedes-o500-rsd-2438',
 'Chassi rodoviário 6x2 para médias e longas distâncias, com aplicação Double Decker e Low Driver.',
 'MB OM 460 LA 12,8 l','381 cv (280 kW) @ 1.600 rpm','1.900 Nm @ 1.100 rpm',
 'Não publicado na página oficial','24.000 kg','Não publicado na página oficial',
 '6x2 rodoviário','Chassi rodoviário','Conforme implementação; carroceria de até 14,0 m',
 'Não publicado na página oficial','Até 14,0 m','Rodoviário de média e longa distância',
 NULL,NULL,
 'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2438'
);

-- Imagens oficiais dos chassis, obtidas nas páginas públicas de cada linha.
UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-lo-916-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-916')
 WHERE slug IN ('mercedes-lo-916-42-48','mercedes-lo-916-48-rural','mercedes-lo-916-48-ore2','lo-916-48-ore-2');

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-lo-1116-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/micro-onibus/lo-1116')
 WHERE slug='mercedes-lo-1116-48-55';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-of-1519r-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/escolar/of-1519-r')
 WHERE slug='mercedes-of-1519r-60';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-of-1619-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1619')
 WHERE slug IN ('mercedes-of-1619-52','mercedes-of-1619l-52');

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-of-1621-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/of-1621')
 WHERE slug='mercedes-of-1621-59';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-of-1721-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1721')
 WHERE slug IN ('mercedes-of-1721-59','mercedes-of-1721l-59','of-1721l-59');

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-of-1726-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/of-1726')
 WHERE slug IN ('mercedes-of-1726-59','mercedes-of-1726l-59');

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-u-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500u')
 WHERE slug='mercedes-o500-u-1928-59';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-m-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500m')
 WHERE slug='mercedes-o500-m-1928-59';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-ma-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ma')
 WHERE slug='mercedes-o500-ma-2938';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-ua-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua')
 WHERE slug IN ('mercedes-o500-ua-2938','o-500-ua-2938');

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-uda-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500uda')
 WHERE slug='mercedes-o500-uda-3738';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-mda-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500mda')
 WHERE slug='mercedes-o500-mda-3738';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-r-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-r')
 WHERE slug='mercedes-o500-r-1931-30';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-rs-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rs')
 WHERE slug='mercedes-o500-rs-1938-30';

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-rsd-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsd-2445')
 WHERE slug IN ('mercedes-o500-rsd-2445-30','mercedes-o500-rsd-2438');

UPDATE modelos
   SET imagem='public/assets/images/modelos/mercedes-o500-rsdd-oficial.webp',
       especificacoes=JSON_SET(COALESCE(especificacoes,JSON_OBJECT()),'$.fonte_imagem_oficial','https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd')
 WHERE slug IN ('mercedes-o500-rsdd-2745-30','o-500-rsdd-2745-30');

DROP PROCEDURE dl_mercedes_bus_026;
DROP PROCEDURE dl_mercedes_bus_spec_026;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260731_026','Catálogo ampliado de ônibus Mercedes-Benz com fichas técnicas oficiais')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
