-- Drive Learn VW - Migração 002: catálogo técnico de concorrentes
-- Data: 18/07/2026
-- Fontes: páginas e fichas técnicas oficiais dos fabricantes.
-- Escopo: especificações técnicas; não cadastra manuais.

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP PROCEDURE IF EXISTS dl_familia_tecnica;
DROP PROCEDURE IF EXISTS dl_modelo_tecnico;
DELIMITER $$
CREATE PROCEDURE dl_familia_tecnica(
    IN p_marca VARCHAR(120), IN p_nome VARCHAR(100), IN p_descricao TEXT
)
BEGIN
    INSERT INTO familias(marca_id,nome,descricao,ativo)
    SELECT ma.id,p_nome,p_descricao,1 FROM marcas ma WHERE ma.slug=p_marca
    ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),ativo=1;
END$$

CREATE PROCEDURE dl_modelo_tecnico(
    IN p_marca VARCHAR(120), IN p_familia VARCHAR(100), IN p_nome VARCHAR(120), IN p_slug VARCHAR(140),
    IN p_motor VARCHAR(120), IN p_potencia VARCHAR(100), IN p_torque VARCHAR(100),
    IN p_transmissao VARCHAR(140), IN p_pbt VARCHAR(80), IN p_configuracao VARCHAR(120),
    IN p_emissoes VARCHAR(80), IN p_fonte VARCHAR(700)
)
BEGIN
    DECLARE v_modelo BIGINT UNSIGNED;
    INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,especificacoes,ativo)
    SELECT fa.id,p_nome,p_slug,
           CONCAT('Versão ',p_nome,' cadastrada a partir das especificações técnicas oficiais do fabricante.'),
           p_motor,p_potencia,p_torque,p_transmissao,p_pbt,
           JSON_OBJECT('configuracao',p_configuracao,'emissoes',p_emissoes,'fonte_oficial',p_fonte,'conferido_em','2026-07-18'),1
      FROM familias fa JOIN marcas ma ON ma.id=fa.marca_id
     WHERE ma.slug=p_marca AND fa.nome=p_familia
    ON DUPLICATE KEY UPDATE familia_id=VALUES(familia_id),nome=VALUES(nome),descricao=VALUES(descricao),
      motor=VALUES(motor),potencia=VALUES(potencia),torque=VALUES(torque),transmissao=VALUES(transmissao),
      pbt=VALUES(pbt),especificacoes=VALUES(especificacoes),ativo=1;
    SELECT id INTO v_modelo FROM modelos WHERE slug=p_slug LIMIT 1;
    INSERT INTO modelo_documentos(modelo_id,tipo,titulo,url_origem,fonte_pagina,ativo)
    VALUES(v_modelo,'ficha_tecnica',CONCAT('Especificações técnicas oficiais — ',p_nome),p_fonte,p_fonte,1)
    ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1;
END$$
DELIMITER ;

-- Famílias atuais no Brasil
CALL dl_familia_tecnica('iveco','Daily','Veículos comerciais leves em versões chassi-cabine.');
CALL dl_familia_tecnica('iveco','Tector','Caminhões médios e semipesados para distribuição, estrada e aplicações vocacionais.');
CALL dl_familia_tecnica('iveco','S-Way','Caminhões pesados para transporte rodoviário, também disponíveis com motorização a gás.');
CALL dl_familia_tecnica('volvo','FH','Caminhões pesados para transporte de longa distância.');
CALL dl_familia_tecnica('volvo','FM','Caminhões versáteis para transporte rodoviário e distribuição.');
CALL dl_familia_tecnica('volvo','FMX','Caminhões para construção, mineração e operações severas.');
CALL dl_familia_tecnica('volvo','VM','Caminhões médios e semipesados para distribuição e operações vocacionais.');
CALL dl_familia_tecnica('mercedes-benz','Novo Accelo','Caminhões leves para distribuição urbana e regional.');
CALL dl_familia_tecnica('mercedes-benz','Atego','Caminhões médios e semipesados para distribuição e construção.');
CALL dl_familia_tecnica('mercedes-benz','Axor','Cavalos mecânicos para transporte rodoviário.');
CALL dl_familia_tecnica('mercedes-benz','Actros','Caminhões extrapesados para longa distância.');
CALL dl_familia_tecnica('mercedes-benz','Arocs','Caminhões extrapesados para construção e operações severas.');
CALL dl_familia_tecnica('scania','Linha P','Cabine baixa para operações urbanas, regionais e vocacionais.');
CALL dl_familia_tecnica('scania','Linha G','Cabine para operações regionais, rodoviárias e severas.');
CALL dl_familia_tecnica('scania','Linha R','Cabine premium para transporte de longa distância.');
CALL dl_familia_tecnica('scania','Linha S','Cabine de piso plano para transporte de longa distância.');

-- IVECO Daily: ficha técnica oficial Daily chassi-cabine
SET @iveco_daily='https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f';
CALL dl_modelo_tecnico('iveco','Daily','Daily 35-160','iveco-daily-35-160','FPT F1C Max 3,0 l','160 cv @ 3.500 rpm','380 Nm @ 1.600–2.900 rpm','ZF 6S480 VO manual, 6 marchas','3.500 kg','4x2, chassi-cabine','Proconve P8 / Euro 6',@iveco_daily);
CALL dl_modelo_tecnico('iveco','Daily','Daily 35-180 Hi-Matic','iveco-daily-35-180-hi-matic','FPT F1C Max 3,0 l','180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 8HP Hi-Matic automática, 8 marchas','3.500 kg','4x2, chassi-cabine','Proconve P8 / Euro 6',@iveco_daily);
CALL dl_modelo_tecnico('iveco','Daily','Daily 45-180 Hi-Matic','iveco-daily-45-180-hi-matic','FPT F1C Max 3,0 l','180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 8HP Hi-Matic automática, 8 marchas','4.500 kg','4x2, chassi-cabine','Proconve P8 / Euro 6',@iveco_daily);
CALL dl_modelo_tecnico('iveco','Daily','Daily 55-180','iveco-daily-55-180','FPT F1C Max 3,0 l','180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 6S480 VO manual, 6 marchas','5.500 kg','4x2, chassi-cabine','Proconve P8 / Euro 6',@iveco_daily);
CALL dl_modelo_tecnico('iveco','Daily','Daily 65-180','iveco-daily-65-180','FPT F1C Max 3,0 l','180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 6S480 VO manual, 6 marchas','6.500 kg','4x2, chassi-cabine','Proconve P8 / Euro 6',@iveco_daily);

-- IVECO Tector: fichas técnicas oficiais de médios e semipesados
SET @iveco_tector_medio='https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794';
SET @iveco_tector_pesado='https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed';
CALL dl_modelo_tecnico('iveco','Tector','Tector 9-190','iveco-tector-9-190','FPT NEF4 4,5 l','190 cv @ 2.200–2.500 rpm','610 Nm @ 1.200–2.100 rpm','Eaton ESO6106B manual, 6 marchas','9.300 kg','4x2','Proconve P8 / Euro 6',@iveco_tector_medio);
CALL dl_modelo_tecnico('iveco','Tector','Tector 11-190','iveco-tector-11-190','FPT NEF4 4,5 l','190 cv @ 2.200–2.500 rpm','610 Nm @ 1.200–2.100 rpm','Eaton ESO6106B manual, 6 marchas','10.700 kg','4x2','Proconve P8 / Euro 6',@iveco_tector_medio);
CALL dl_modelo_tecnico('iveco','Tector','Tector 15-210','iveco-tector-15-210','FPT NEF4 4,5 l','207 cv @ 2.100–2.500 rpm','720 Nm @ 1.300–1.900 rpm','Eaton FS 5406A manual, 6 marchas','15.400 kg','4x2','Proconve P8 / Euro 6',@iveco_tector_medio);
CALL dl_modelo_tecnico('iveco','Tector','Tector 17-320','iveco-tector-17-320','FPT NEF6 6,7 l','320 cv @ 2.200–2.500 rpm','1.100 Nm @ 1.300–1.900 rpm','Eaton MHD EVO AutoShift, 10 marchas','17.100 kg','4x2','Proconve P8 / Euro 6',@iveco_tector_pesado);
CALL dl_modelo_tecnico('iveco','Tector','Tector 17-320T','iveco-tector-17-320t','FPT NEF6 6,7 l','320 cv @ 2.200–2.500 rpm','1.100 Nm @ 1.300–1.900 rpm','Eaton MHD EVO AutoShift, 10 marchas','36.000 kg PBTC','4x2, cavalo mecânico','Proconve P8 / Euro 6',@iveco_tector_pesado);
CALL dl_modelo_tecnico('iveco','Tector','Tector 24-280','iveco-tector-24-280','FPT NEF6 6,7 l','280 cv @ 2.100–2.500 rpm','950 Nm @ 1.250–1.950 rpm','Eaton 6406B manual, 6 marchas','23.000 kg','6x2','Proconve P8 / Euro 6',@iveco_tector_pesado);
CALL dl_modelo_tecnico('iveco','Tector','Tector 24-320','iveco-tector-24-320','FPT NEF6 6,7 l','320 cv @ 2.200–2.500 rpm','1.100 Nm @ 1.300–1.900 rpm','Eaton MHD EVO AutoShift, 10 marchas','23.000 kg','6x2','Proconve P8 / Euro 6',@iveco_tector_pesado);
CALL dl_modelo_tecnico('iveco','Tector','Tector 27-320','iveco-tector-27-320','FPT NEF6 6,7 l','320 cv @ 2.200–2.500 rpm','1.100 Nm @ 1.300–1.900 rpm','Eaton MHD EVO AutoShift, 10 marchas','27.000 kg','6x4','Proconve P8 / Euro 6',@iveco_tector_pesado);
CALL dl_modelo_tecnico('iveco','Tector','Tector 31-280','iveco-tector-31-280','FPT NEF6 6,7 l','280 cv @ 2.100–2.500 rpm','950 Nm @ 1.250–1.950 rpm','Eaton 6406B manual, 6 marchas','31.000 kg','8x2','Proconve P8 / Euro 6',@iveco_tector_pesado);
CALL dl_modelo_tecnico('iveco','Tector','Tector 31-320','iveco-tector-31-320','FPT NEF6 6,7 l','320 cv @ 2.200–2.500 rpm','1.100 Nm @ 1.300–1.900 rpm','Eaton MHD EVO AutoShift, 10 marchas','31.000 kg','8x2','Proconve P8 / Euro 6',@iveco_tector_pesado);

-- IVECO S-Way
SET @iveco_sway='https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf';
CALL dl_modelo_tecnico('iveco','S-Way','S-Way 480 4x2','iveco-s-way-480-4x2','FPT Cursor 13 12,9 l','480 cv @ 1.400–1.900 rpm','2.450 Nm @ 1.000–1.400 rpm','ZF TraXon 12TX2620TD automatizada, 12 marchas','60 t CMT','4x2, cavalo mecânico','Proconve P8 / Euro 6',@iveco_sway);
CALL dl_modelo_tecnico('iveco','S-Way','S-Way 480 6x2','iveco-s-way-480-6x2','FPT Cursor 13 12,9 l','480 cv @ 1.400–1.900 rpm','2.450 Nm @ 1.000–1.400 rpm','ZF TraXon automatizada, 12 marchas','60 t CMT','6x2, cavalo mecânico','Proconve P8 / Euro 6',@iveco_sway);
CALL dl_modelo_tecnico('iveco','S-Way','S-Way 540 6x4','iveco-s-way-540-6x4','FPT Cursor 13 12,9 l','540 cv @ 1.500–1.900 rpm','2.550 Nm @ 1.000–1.500 rpm','ZF TraXon 12TX2624TD automatizada, 12 marchas','80 t CMT','6x4, cavalo mecânico','Proconve P8 / Euro 6',@iveco_sway);

-- Volvo FH, FM, FMX e VM
SET @volvo_fh='https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf';
CALL dl_modelo_tecnico('volvo','FH','FH 420 6x2T','volvo-fh-420-6x2t','Volvo D13K 12,8 l','420 cv @ 1.400–1.800 rpm','2.100 Nm @ 905–1.400 rpm','I-Shift AT2612 G automatizada, 12 marchas',NULL,'6x2T, suspensão pneumática','Proconve P8 / Euro 6',@volvo_fh);
CALL dl_modelo_tecnico('volvo','FH','FH 460 6x2T','volvo-fh-460-6x2t','Volvo D13K 12,8 l','460 cv @ 1.400–1.800 rpm','2.300 Nm @ 945–1.400 rpm','I-Shift AT2612 G automatizada, 12 marchas',NULL,'6x2T, suspensão pneumática','Proconve P8 / Euro 6',@volvo_fh);
CALL dl_modelo_tecnico('volvo','FH','FH 500 6x2T','volvo-fh-500-6x2t','Volvo D13K 12,8 l','500 cv @ 1.400–1.800 rpm','2.500 Nm @ 980–1.400 rpm','I-Shift AT2612 G automatizada, 12 marchas',NULL,'6x2T, suspensão pneumática','Proconve P8 / Euro 6',@volvo_fh);
CALL dl_modelo_tecnico('volvo','FH','FH 540 6x2T','volvo-fh-540-6x2t','Volvo D13K 12,8 l','540 cv @ 1.460–1.800 rpm','2.600 Nm @ 1.000–1.460 rpm','I-Shift AT2612 G automatizada, 12 marchas',NULL,'6x2T, suspensão pneumática','Proconve P8 / Euro 6',@volvo_fh);
SET @volvo_fm='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html';
CALL dl_modelo_tecnico('volvo','FM','FM 380 6x2R','volvo-fm-380-6x2r','Volvo D13K 12,8 l','380 cv',NULL,'I-Shift de 7ª geração',NULL,'6x2 rígido','Proconve P8 / Euro 6',@volvo_fm);
SET @volvo_fmx='https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html';
CALL dl_modelo_tecnico('volvo','FMX','FMX 420 6x4R','volvo-fmx-420-6x4r','Volvo D13K 12,8 l','420 cv @ 1.400–1.800 rpm','2.100 Nm @ 905–1.400 rpm','I-Shift automatizada',NULL,'6x4 rígido','Proconve P8 / Euro 6',@volvo_fmx);
CALL dl_modelo_tecnico('volvo','FMX','FMX 460 6x4T','volvo-fmx-460-6x4t','Volvo D13K 12,8 l','460 cv @ 1.400–1.800 rpm','2.300 Nm @ 945–1.400 rpm','I-Shift automatizada',NULL,'6x4, cavalo mecânico','Proconve P8 / Euro 6',@volvo_fmx);
CALL dl_modelo_tecnico('volvo','FMX','FMX 500 8x4R','volvo-fmx-500-8x4r','Volvo D13K 12,8 l','500 cv @ 1.400–1.800 rpm','2.500 Nm @ 980–1.400 rpm','I-Shift automatizada',NULL,'8x4 rígido','Proconve P8 / Euro 6',@volvo_fmx);
CALL dl_modelo_tecnico('volvo','FMX','FMX 540 6x4T','volvo-fmx-540-6x4t','Volvo D13K 12,8 l','540 cv @ 1.460–1.800 rpm','2.600 Nm @ 1.000–1.460 rpm','I-Shift automatizada',NULL,'6x4, cavalo mecânico','Proconve P8 / Euro 6',@volvo_fmx);
SET @volvo_vm='https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf';
CALL dl_modelo_tecnico('volvo','VM','VM 290 4x2R','volvo-vm-290-4x2r','Volvo D8K 7,7 l','290 cv @ 1.900 rpm','1.050 Nm @ 1.000–1.700 rpm','ZT1309 manual ou I-Shift AT2612 G','17,5 t PBT técnico','4x2 rígido','Proconve P8 / Euro 6',@volvo_vm);
CALL dl_modelo_tecnico('volvo','VM','VM 360 4x2R','volvo-vm-360-4x2r','Volvo D8K 7,7 l','360 cv @ 2.200 rpm','1.400 Nm @ 1.100–1.600 rpm','I-Shift AT2612 G automatizada, 12 marchas','17,5 t PBT técnico / 45 t CMT','4x2 rígido','Proconve P8 / Euro 6',@volvo_vm);

-- Mercedes-Benz: catálogo técnico oficial brasileiro
SET @mb_accelo='https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo';
CALL dl_modelo_tecnico('mercedes-benz','Novo Accelo','Accelo 917','mercedes-accelo-917','Mercedes-Benz OM 924 4,8 l','163 cv','610 Nm',NULL,'9.600 kg','4x2','Proconve P8 / Euro 6',@mb_accelo);
CALL dl_modelo_tecnico('mercedes-benz','Novo Accelo','Accelo 1117','mercedes-accelo-1117','Mercedes-Benz OM 924 4,8 l','163 cv','610 Nm',NULL,'10.700 kg','4x2','Proconve P8 / Euro 6',@mb_accelo);
CALL dl_modelo_tecnico('mercedes-benz','Novo Accelo','Accelo 1317','mercedes-accelo-1317','Mercedes-Benz OM 924 4,8 l','163 cv','610 Nm',NULL,'13.000 kg','6x2','Proconve P8 / Euro 6',@mb_accelo);
CALL dl_modelo_tecnico('mercedes-benz','Novo Accelo','Accelo 1417','mercedes-accelo-1417','Mercedes-Benz OM 924 4,8 l','163 cv','610 Nm',NULL,'14.000 kg','6x2','Proconve P8 / Euro 6',@mb_accelo);
SET @mb_atego='https://www.mercedes-benz-trucks.com.br/caminhoes/atego';
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 1719 K 4x2','mercedes-atego-1719-k-4x2','Mercedes-Benz OM 924','185 cv',NULL,'PowerShift 3 automatizada','17.100 kg','4x2 basculante','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 1726 P 4x2','mercedes-atego-1726-p-4x2','Mercedes-Benz OM 926','260 cv','900 Nm','PowerShift 3 automatizada','17.100 kg','4x2 plataforma','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 1733 K 4x2','mercedes-atego-1733-k-4x2','Mercedes-Benz OM 926','321 cv','1.250 Nm','PowerShift 3 automatizada','17.100 kg','4x2 basculante','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 1933 LS 4x2','mercedes-atego-1933-ls-4x2','Mercedes-Benz OM 926','321 cv','1.250 Nm','PowerShift 3 automatizada','45,1 t CMT','4x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 2429 P 6x2','mercedes-atego-2429-p-6x2','Mercedes-Benz OM 926','286 cv','1.100 Nm','PowerShift 3 automatizada','24.100 kg','6x2 plataforma','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 2433 P 6x2','mercedes-atego-2433-p-6x2','Mercedes-Benz OM 926','321 cv','1.250 Nm','PowerShift 3 automatizada','24.100 kg','6x2 plataforma','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 2730 P 6x4','mercedes-atego-2730-p-6x4','Mercedes-Benz OM 926','286 cv','1.100 Nm','PowerShift 3 automatizada','26.600 kg','6x4 plataforma','Proconve P8 / Euro 6',@mb_atego);
CALL dl_modelo_tecnico('mercedes-benz','Atego','Atego 3033 P 8x2','mercedes-atego-3033-p-8x2','Mercedes-Benz OM 926','321 cv','1.250 Nm','PowerShift 3 automatizada','30.200 kg','8x2 plataforma','Proconve P8 / Euro 6',@mb_atego);
SET @mb_axor='https://www.mercedes-benz-trucks.com.br/caminhoes/axor';
CALL dl_modelo_tecnico('mercedes-benz','Axor','Axor 2038 S 4x2','mercedes-axor-2038-s-4x2','Mercedes-Benz OM 460 LA 12,8 l','380 cv','1.900 Nm','Automatizada','68 t CMT','4x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_axor);
CALL dl_modelo_tecnico('mercedes-benz','Axor','Axor 2538 S 6x2','mercedes-axor-2538-s-6x2','Mercedes-Benz OM 460 LA 12,8 l','380 cv','1.900 Nm','Automatizada','68 t CMT','6x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_axor);
CALL dl_modelo_tecnico('mercedes-benz','Axor','Axor 2545 S 6x2','mercedes-axor-2545-s-6x2','Mercedes-Benz OM 460 LA 12,8 l','449 cv','2.200 Nm','Automatizada','68 t CMT','6x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_axor);
SET @mb_actros='https://www.mercedes-benz-trucks.com.br/caminhoes/actros';
CALL dl_modelo_tecnico('mercedes-benz','Actros','Actros 2045 S 4x2','mercedes-actros-2045-s-4x2','Mercedes-Benz OM 460 / OM 471','449 cv','2.200 Nm','PowerShift automatizada','68 t CMT','4x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_actros);
CALL dl_modelo_tecnico('mercedes-benz','Actros','Actros 2548 S 6x2','mercedes-actros-2548-s-6x2','Mercedes-Benz OM 460 / OM 471','476 cv','2.300 Nm','PowerShift automatizada','68 t CMT','6x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_actros);
CALL dl_modelo_tecnico('mercedes-benz','Actros','Actros 2553 S 6x2','mercedes-actros-2553-s-6x2','Mercedes-Benz OM 471','530 cv','2.600 Nm','PowerShift automatizada','68 t CMT','6x2, cavalo mecânico','Proconve P8 / Euro 6',@mb_actros);
CALL dl_modelo_tecnico('mercedes-benz','Actros','Actros 2651 S 6x4','mercedes-actros-2651-s-6x4','Mercedes-Benz OM 460 / OM 471','495 cv','2.400 Nm','PowerShift automatizada','120 t CMT','6x4, cavalo mecânico','Proconve P8 / Euro 6',@mb_actros);
CALL dl_modelo_tecnico('mercedes-benz','Actros','Actros 2653 S 6x4','mercedes-actros-2653-s-6x4','Mercedes-Benz OM 471','530 cv','2.600 Nm','PowerShift automatizada','120 t CMT','6x4, cavalo mecânico','Proconve P8 / Euro 6',@mb_actros);
SET @mb_arocs='https://www.mercedes-benz-trucks.com.br/caminhoes/arocs';
CALL dl_modelo_tecnico('mercedes-benz','Arocs','Arocs 3351 K 6x4','mercedes-arocs-3351-k-6x4','Mercedes-Benz OM 460 / OM 471','495 cv','2.400 Nm','PowerShift automatizada','33.500 kg PBT / 150 t CMT','6x4 basculante','Proconve P8 / Euro 6',@mb_arocs);
CALL dl_modelo_tecnico('mercedes-benz','Arocs','Arocs 3353 S 6x4','mercedes-arocs-3353-s-6x4','Mercedes-Benz OM 471','530 cv','2.600 Nm','PowerShift automatizada','33.500 kg PBT / 150 t CMT','6x4, cavalo mecânico','Proconve P8 / Euro 6',@mb_arocs);
CALL dl_modelo_tecnico('mercedes-benz','Arocs','Arocs 4151 K 6x4','mercedes-arocs-4151-k-6x4','Mercedes-Benz OM 460 / OM 471','495 cv','2.400 Nm','PowerShift automatizada','41.000 kg PBT / 150 t CMT','6x4 basculante','Proconve P8 / Euro 6',@mb_arocs);
CALL dl_modelo_tecnico('mercedes-benz','Arocs','Arocs 5851 K 8x4','mercedes-arocs-5851-k-8x4','Mercedes-Benz OM 460 / OM 471','495 cv','2.400 Nm','PowerShift automatizada','58.000 kg PBT / 150 t CMT','8x4 basculante','Proconve P8 / Euro 6',@mb_arocs);

-- Scania Super: motores 13 l Twin-SCR e Scania Opticruise
SET @scania_super='https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html';
CALL dl_modelo_tecnico('scania','Linha R','Scania R 420 Super','scania-r-420-super','Scania Super 13 l','420 hp (309 kW) @ 1.800 rpm','2.300 Nm @ 900–1.280 rpm','Scania Opticruise G25/G33',NULL,'Cabine R; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha R','Scania R 460 Super','scania-r-460-super','Scania Super 13 l','460 hp (338 kW) @ 1.800 rpm','2.500 Nm @ 900–1.290 rpm','Scania Opticruise G25/G33',NULL,'Cabine R; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha R','Scania R 500 Super','scania-r-500-super','Scania Super 13 l','500 hp (368 kW) @ 1.800 rpm','2.650 Nm @ 900–1.320 rpm','Scania Opticruise G25/G33',NULL,'Cabine R; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha R','Scania R 560 Super','scania-r-560-super','Scania Super 13 l','560 hp (412 kW) @ 1.800 rpm','2.800 Nm @ 900–1.400 rpm','Scania Opticruise G25/G33',NULL,'Cabine R; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha S','Scania S 420 Super','scania-s-420-super','Scania Super 13 l','420 hp (309 kW) @ 1.800 rpm','2.300 Nm @ 900–1.280 rpm','Scania Opticruise G25/G33',NULL,'Cabine S de piso plano','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha S','Scania S 460 Super','scania-s-460-super','Scania Super 13 l','460 hp (338 kW) @ 1.800 rpm','2.500 Nm @ 900–1.290 rpm','Scania Opticruise G25/G33',NULL,'Cabine S de piso plano','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha S','Scania S 500 Super','scania-s-500-super','Scania Super 13 l','500 hp (368 kW) @ 1.800 rpm','2.650 Nm @ 900–1.320 rpm','Scania Opticruise G25/G33',NULL,'Cabine S de piso plano','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha S','Scania S 560 Super','scania-s-560-super','Scania Super 13 l','560 hp (412 kW) @ 1.800 rpm','2.800 Nm @ 900–1.400 rpm','Scania Opticruise G25/G33',NULL,'Cabine S de piso plano','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha P','Scania P 420 Super','scania-p-420-super','Scania Super 13 l','420 hp (309 kW) @ 1.800 rpm','2.300 Nm @ 900–1.280 rpm','Scania Opticruise G25/G33',NULL,'Cabine P; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha P','Scania P 460 Super','scania-p-460-super','Scania Super 13 l','460 hp (338 kW) @ 1.800 rpm','2.500 Nm @ 900–1.290 rpm','Scania Opticruise G25/G33',NULL,'Cabine P; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha P','Scania P 500 Super','scania-p-500-super','Scania Super 13 l','500 hp (368 kW) @ 1.800 rpm','2.650 Nm @ 900–1.320 rpm','Scania Opticruise G25/G33',NULL,'Cabine P; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha G','Scania G 420 Super','scania-g-420-super','Scania Super 13 l','420 hp (309 kW) @ 1.800 rpm','2.300 Nm @ 900–1.280 rpm','Scania Opticruise G25/G33',NULL,'Cabine G; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha G','Scania G 460 Super','scania-g-460-super','Scania Super 13 l','460 hp (338 kW) @ 1.800 rpm','2.500 Nm @ 900–1.290 rpm','Scania Opticruise G25/G33',NULL,'Cabine G; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha G','Scania G 500 Super','scania-g-500-super','Scania Super 13 l','500 hp (368 kW) @ 1.800 rpm','2.650 Nm @ 900–1.320 rpm','Scania Opticruise G25/G33',NULL,'Cabine G; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);
CALL dl_modelo_tecnico('scania','Linha G','Scania G 560 Super','scania-g-560-super','Scania Super 13 l','560 hp (412 kW) @ 1.800 rpm','2.800 Nm @ 900–1.400 rpm','Scania Opticruise G25/G33',NULL,'Cabine G; configuração conforme aplicação','Proconve P8 / Euro 6',@scania_super);

DROP PROCEDURE dl_modelo_tecnico;
DROP PROCEDURE dl_familia_tecnica;

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_002','Catálogo e especificações técnicas oficiais de IVECO, Volvo, Mercedes-Benz e Scania')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);

SET FOREIGN_KEY_CHECKS = 1;
