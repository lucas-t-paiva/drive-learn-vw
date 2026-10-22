-- Repara a referência VWCO do Benchmark quando o Meteor possui nome/slug alternativo.
-- Reexecução segura em MySQL 5.7+/MariaDB 10.4+.
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO benchmark_configuracoes
  (modelo_id,nome,ano_modelo,versao_comercial,cabine,tracao,mercado,data_referencia,situacao_comercial,descricao,ativo)
SELECT
  m.id,'Meteor 29.530 6x4 · Highline','2026','Highline','Highline','6x4','Brasil','2026-10-21','linha_atual',
  'Configuração VWCO de referência. Os valores de interface referem-se ao pacote Highline divulgado oficialmente para a linha Meteor.',1
FROM modelos m
JOIN familias f ON f.id=m.familia_id
JOIN marcas ma ON ma.id=f.marca_id
WHERE (LOWER(ma.nome) LIKE '%volkswagen%' OR LOWER(ma.slug) LIKE '%volkswagen%' OR LOWER(ma.slug) LIKE '%vwco%')
  AND (
    m.slug IN ('meteor-29-530','meteor-6x4-29-530','novo-meteor-highline-29-530')
    OR REPLACE(REPLACE(LOWER(m.nome),' ',''),'.','') LIKE '%meteor%29530%'
  )
  AND NOT EXISTS (
    SELECT 1 FROM benchmark_configuracoes
    WHERE nome='Meteor 29.530 6x4 · Highline'
  )
ORDER BY CASE WHEN m.slug='meteor-6x4-29-530' THEN 0 WHEN m.slug='meteor-29-530' THEN 1 ELSE 2 END
LIMIT 1;

INSERT INTO benchmark_fontes (titulo,tipo,url,publicador,consultado_em,observacao)
SELECT 'Meteor 29.530 — tecnologia Highline','site_oficial','https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220','Volkswagen Caminhões e Ônibus','2026-10-21','Página oficial do modelo confirma cluster de 10 polegadas, central de 7 polegadas, espelhamento, assistentes de voz e carregamento por indução.'
WHERE NOT EXISTS (
  SELECT 1 FROM benchmark_fontes
  WHERE url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220'
);

INSERT INTO benchmark_valores
  (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,10,'pol','informado','serie','validado','pesquisa_documental',s.id,98,'Cluster 100% digital com mais de 80 funcionalidades na configuração Highline.'
FROM benchmark_configuracoes c
JOIN benchmark_atributos a ON a.slug='tamanho-cluster'
JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220'
WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

INSERT INTO benchmark_valores
  (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Cluster 100% digital, personalizável','informado','serie','validado','pesquisa_documental',s.id,98,'Recorte exclusivo da configuração Highline.'
FROM benchmark_configuracoes c
JOIN benchmark_atributos a ON a.slug='arquitetura-cluster'
JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220'
WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

INSERT INTO benchmark_valores
  (configuracao_id,atributo_id,valor_numero,unidade,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,7,'pol','informado','serie','validado','pesquisa_documental',s.id,98,'Central multimídia sensível ao toque na configuração Highline.'
FROM benchmark_configuracoes c
JOIN benchmark_atributos a ON a.slug='tamanho-tela-multimidia'
JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220'
WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_numero=VALUES(valor_numero),unidade=VALUES(unidade),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

INSERT INTO benchmark_valores
  (configuracao_id,atributo_id,valor_texto,status_dado,disponibilidade,status_revisao,origem,fonte_id,confianca,observacao)
SELECT c.id,a.id,'Espelhamento de smartphone; assistentes Google e Siri','informado','serie','validado','pesquisa_documental',s.id,98,'Não converter espelhamento genericamente em CarPlay/Android Auto sem declaração nominal.'
FROM benchmark_configuracoes c
JOIN benchmark_atributos a ON a.slug='integracao-smartphone'
JOIN benchmark_fontes s ON s.url='https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220'
WHERE c.nome='Meteor 29.530 6x4 · Highline'
ON DUPLICATE KEY UPDATE valor_texto=VALUES(valor_texto),status_dado=VALUES(status_dado),disponibilidade=VALUES(disponibilidade),status_revisao=VALUES(status_revisao),origem=VALUES(origem),fonte_id=VALUES(fonte_id),confianca=VALUES(confianca),observacao=VALUES(observacao);

-- Diagnóstico: deve retornar uma linha VWCO com quatro atributos validados.
SELECT c.id,c.nome,m.nome AS modelo,ma.nome AS marca,COUNT(v.id) AS atributos_validados
FROM benchmark_configuracoes c
JOIN modelos m ON m.id=c.modelo_id
JOIN familias f ON f.id=m.familia_id
JOIN marcas ma ON ma.id=f.marca_id
LEFT JOIN benchmark_valores v ON v.configuracao_id=c.id AND v.status_revisao='validado'
WHERE c.nome='Meteor 29.530 6x4 · Highline'
GROUP BY c.id,c.nome,m.nome,ma.nome;
