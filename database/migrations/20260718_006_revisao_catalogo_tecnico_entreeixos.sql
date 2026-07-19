-- Drive Learn VW - Migração 006: revisão técnica, imagens auditadas e entre-eixos
-- Data: 18/07/2026
-- Escopo: especificações técnicas oficiais (não inclui manuais).
-- Fonte principal Daily: IVECO Daily Chassi-cabine Brasil.

SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(80) NOT NULL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Estrutura normalizada preparada para consultas técnicas e futuro lookup inteligente.
CREATE TABLE IF NOT EXISTS modelo_especificacoes_tecnicas (
    modelo_id BIGINT UNSIGNED NOT NULL,
    chave VARCHAR(80) NOT NULL,
    rotulo VARCHAR(120) NOT NULL,
    valor VARCHAR(255) NOT NULL,
    unidade VARCHAR(30) NULL,
    fonte_url VARCHAR(700) NULL,
    conferido_em DATE NULL,
    PRIMARY KEY(modelo_id,chave),
    CONSTRAINT fk_modelo_especificacao_modelo FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE,
    INDEX idx_modelo_especificacao_chave(chave)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET @daily_fonte='https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f';
SET @daily_pagina='https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi';

DROP PROCEDURE IF EXISTS dl_revisar_daily;
DELIMITER $$
CREATE PROCEDURE dl_revisar_daily(
    IN p_nome VARCHAR(120), IN p_slug VARCHAR(140), IN p_imagem VARCHAR(255),
    IN p_potencia VARCHAR(100), IN p_torque VARCHAR(100), IN p_transmissao VARCHAR(180),
    IN p_pbt VARCHAR(80), IN p_entre_eixos VARCHAR(120), IN p_arquivo VARCHAR(255)
)
BEGIN
    DECLARE v_modelo BIGINT UNSIGNED;
    INSERT INTO modelos(
        familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,pbt,especificacoes,ativo
    )
    SELECT fa.id,p_nome,p_slug,
           CONCAT(p_nome,' chassi-cabine, revisada conforme ficha técnica oficial IVECO.'),
           p_imagem,'FPT F1C Max 3,0 l',p_potencia,p_torque,p_transmissao,p_pbt,
           JSON_OBJECT(
               'configuracao','4x2, chassi-cabine','tipo_carroceria','Chassi-cabine',
               'emissoes','Proconve P8 / Euro 6','entre_eixos',p_entre_eixos,
               'fonte_oficial',@daily_fonte,'fonte_pagina',@daily_pagina,
               'conferido_em','2026-07-18','auditoria_status','Conferido em ficha técnica oficial',
               'imagem_escopo','Imagem oficial do modelo ou grupo de versões'
           ),1
      FROM familias fa JOIN marcas ma ON ma.id=fa.marca_id
     WHERE ma.slug='iveco' AND fa.nome='Daily'
    ON DUPLICATE KEY UPDATE
       familia_id=VALUES(familia_id),nome=VALUES(nome),descricao=VALUES(descricao),imagem=VALUES(imagem),
       motor=VALUES(motor),potencia=VALUES(potencia),torque=VALUES(torque),
       transmissao=VALUES(transmissao),pbt=VALUES(pbt),especificacoes=VALUES(especificacoes),ativo=1;

    SELECT id INTO v_modelo FROM modelos WHERE slug=p_slug LIMIT 1;
    INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
    VALUES(v_modelo,'ficha_tecnica',CONCAT('Especificações técnicas oficiais — ',p_nome),p_arquivo,@daily_fonte,@daily_pagina,1)
    ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),arquivo=VALUES(arquivo),url_origem=VALUES(url_origem),
                            fonte_pagina=VALUES(fonte_pagina),ativo=1;

    INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
    VALUES
      (v_modelo,'entre_eixos','Entre-eixos',p_entre_eixos,'mm',@daily_fonte,'2026-07-18'),
      (v_modelo,'pbt','Peso Bruto Total',p_pbt,'kg',@daily_fonte,'2026-07-18'),
      (v_modelo,'tipo_carroceria','Tipo de carroceria','Chassi-cabine',NULL,@daily_fonte,'2026-07-18')
    ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),valor=VALUES(valor),unidade=VALUES(unidade),
                            fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);
END$$
DELIMITER ;

CALL dl_revisar_daily(
 'Daily 30-160','daily-30-160','public/assets/images/modelos/iveco-daily-30-160-oficial.webp',
 '160 cv @ 3.500 rpm','380 Nm @ 1.600–2.900 rpm','ZF 6S 480 VO manual, 6 marchas',
 '3.500 kg','3.750 mm','public/assets/documents/modelos/iveco-daily-30-160-ficha-tecnica.pdf');

CALL dl_revisar_daily(
 'Daily 35-160','daily-35-160','public/assets/images/modelos/iveco-daily-35-160-35-180-oficial.webp',
 '160 cv @ 3.500 rpm','380 Nm @ 1.600–2.900 rpm','ZF 6S 480 VO manual, 6 marchas',
 '3.500 kg','3.520 ou 3.750 mm','public/assets/documents/modelos/iveco-daily-35-160-35-180-ficha-tecnica.pdf');

CALL dl_revisar_daily(
 'Daily 35-180 Hi-Matic','daily-35-180-hi-matic','public/assets/images/modelos/iveco-daily-35-160-35-180-oficial.webp',
 '180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 8HP Hi-Matic automática, 8 marchas',
 '3.500 kg','3.520 ou 3.750 mm','public/assets/documents/modelos/iveco-daily-35-160-35-180-ficha-tecnica.pdf');

CALL dl_revisar_daily(
 'Daily 45-160','daily-45-160','public/assets/images/modelos/iveco-daily-45-160-45-180-oficial.webp',
 '160 cv @ 3.500 rpm','380 Nm @ 1.600–2.900 rpm','ZF 6S 480 VO manual, 6 marchas',
 '4.400 kg','3.520 ou 3.750 mm','public/assets/documents/modelos/iveco-daily-45-160-45-180-ficha-tecnica.pdf');

CALL dl_revisar_daily(
 'Daily 45-180 Hi-Matic','daily-45-180-hi-matic','public/assets/images/modelos/iveco-daily-45-160-45-180-oficial.webp',
 '180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 8HP Hi-Matic automática, 8 marchas',
 '4.400 kg','3.520 ou 3.750 mm','public/assets/documents/modelos/iveco-daily-45-160-45-180-ficha-tecnica.pdf');

CALL dl_revisar_daily(
 'Daily 55-180','daily-55-180','public/assets/images/modelos/iveco-daily-55-180-oficial.webp',
 '180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 6S 480 VO manual ou ZF 8HP Hi-Matic automática',
 '5.300 kg','3.520 ou 3.750 mm','public/assets/documents/modelos/iveco-daily-55-180-ficha-tecnica.pdf');

CALL dl_revisar_daily(
 'Daily 65-180','daily-65-180','public/assets/images/modelos/iveco-daily-65-180-oficial.webp',
 '180 cv @ 3.500 rpm','430 Nm @ 1.600–2.900 rpm','ZF 6S 480 VO manual ou ZF 8HP Hi-Matic automática',
 '6.500 kg','4.350 mm','public/assets/documents/modelos/iveco-daily-65-180-ficha-tecnica.pdf');

DROP PROCEDURE dl_revisar_daily;

-- Delivery Express: entre-eixos conferido na ficha VWCO local, edição 04/2026.
UPDATE modelos
   SET especificacoes=JSON_SET(
       IF(JSON_VALID(especificacoes),especificacoes,JSON_OBJECT()),
       '$.entre_eixos','3.000 ou 3.600 mm',
       '$.tipo_carroceria','Chassi-cabine',
       '$.auditoria_status','Conferido em ficha técnica oficial',
       '$.conferido_em','2026-07-18'
   )
 WHERE slug='delivery-express';

INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT id,'entre_eixos','Entre-eixos','3.000 ou 3.600 mm','mm',
       'https://www.vwco.com.br/caminhoes/Delivery/Deliveryexpress?id=1&productid=197','2026-07-18'
  FROM modelos WHERE slug='delivery-express'
ON DUPLICATE KEY UPDATE valor=VALUES(valor),unidade=VALUES(unidade),fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);

-- Imagens compartilhadas por várias versões são verdadeiras para a família, mas não necessariamente para cada configuração.
UPDATE modelos SET especificacoes=JSON_SET(
    IF(JSON_VALID(especificacoes),especificacoes,JSON_OBJECT()),
    '$.imagem_escopo','Imagem oficial representativa da família; configuração visual pode variar'
)
WHERE imagem IN (
 'public/assets/images/modelos/iveco-tector-oficial.jpg',
 'public/assets/images/modelos/mercedes-atego-oficial.webp',
 'public/assets/images/modelos/mercedes-arocs-oficial.webp',
 'public/assets/images/modelos/mercedes-novo-accelo-oficial.webp',
 'public/assets/images/modelos/mercedes-axor-oficial.webp',
 'public/assets/images/modelos/scania-linha-g-oficial.jpeg',
 'public/assets/images/modelos/scania-linha-r-oficial.jpeg',
 'public/assets/images/modelos/scania-linha-s-oficial.jpeg',
 'public/assets/images/modelos/volvo-fh-oficial.webp',
 'public/assets/images/modelos/volvo-fm-oficial.webp',
 'public/assets/images/modelos/volvo-fmx-oficial.webp',
 'public/assets/images/modelos/volvo-vm-oficial.webp'
);

-- Remove do catálogo apenas cadastros genéricos redundantes, sem frota ou vídeo vinculados.
UPDATE modelos m SET m.ativo=0
WHERE m.slug IN (
 'iveco-tector-17-t-4x2','iveco-tector-17-t-4x2-trator','iveco-tector-24-t-6x2',
 'iveco-tector-27-t-6x4','iveco-tector-31-t-8x2',
 'volvo-volvo-fh','volvo-volvo-fmx','volvo-volvo-vm',
 'mercedes-benz-mercedes-benz-atego','mercedes-benz-mercedes-benz-arocs',
 'scania-scania-g','scania-scania-r','scania-scania-s'
)
AND NOT EXISTS(SELECT 1 FROM video_modelos vm WHERE vm.modelo_id=m.id)
AND NOT EXISTS(SELECT 1 FROM frotas fr WHERE fr.modelo_id=m.id);

-- Registros ainda genéricos ficam explicitamente marcados, evitando tratá-los como ficha conferida.
UPDATE modelos SET especificacoes=JSON_SET(
    IF(JSON_VALID(especificacoes),especificacoes,JSON_OBJECT()),
    '$.auditoria_status','Pendente de ficha técnica específica',
    '$.imagem_escopo','Imagem oficial representativa da família; configuração visual pode variar'
)
WHERE slug IN ('iveco-s-way-natural-460-6x2','scania-scania-xt','scania-scania-g-as');

INSERT INTO schema_migrations(versao,descricao) VALUES
('20260718_006','Revisão técnica geral, Daily chassi-cabine, imagens auditadas e entre-eixos')
ON DUPLICATE KEY UPDATE descricao=VALUES(descricao);
