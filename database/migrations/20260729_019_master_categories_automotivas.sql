-- Drive Learn VWCO
-- Taxonomia automotiva para categorização e roteamento dos relatos.
-- Execute após 20260729_018_taxonomia_relato_limites_assistente.sql.
-- Idempotente: categorias existentes são atualizadas pelo slug.

SET NAMES utf8mb4;

INSERT INTO setores (empresa_id,nome,slug,descricao,ativo)
SELECT NULL,'Engenharia de Powertrain','engenharia-powertrain','Motor, transmissão, arrefecimento, combustível, emissões e desempenho do trem de força.',1
WHERE NOT EXISTS (SELECT 1 FROM setores WHERE empresa_id IS NULL AND slug='engenharia-powertrain');

INSERT INTO setores (empresa_id,nome,slug,descricao,ativo)
SELECT NULL,'Engenharia de Chassi e Dinâmica Veicular','engenharia-chassi-dinamica','Freios, direção, suspensão, eixos, pneus e comportamento dinâmico.',1
WHERE NOT EXISTS (SELECT 1 FROM setores WHERE empresa_id IS NULL AND slug='engenharia-chassi-dinamica');

INSERT INTO setores (empresa_id,nome,slug,descricao,ativo)
SELECT NULL,'Elétrica, Eletrônica e Software','eletrica-eletronica-software','Sistemas elétricos, eletrônicos, sensores, redes, painel, ADAS e conectividade.',1
WHERE NOT EXISTS (SELECT 1 FROM setores WHERE empresa_id IS NULL AND slug='eletrica-eletronica-software');

INSERT INTO setores (empresa_id,nome,slug,descricao,ativo)
SELECT NULL,'Cabine, Carroceria e Ônibus','cabine-carroceria-onibus','Cabine, climatização, ergonomia, carroceria, portas, visibilidade e sistemas de passageiros.',1
WHERE NOT EXISTS (SELECT 1 FROM setores WHERE empresa_id IS NULL AND slug='cabine-carroceria-onibus');

INSERT INTO setores (empresa_id,nome,slug,descricao,ativo)
SELECT NULL,'Qualidade do Produto e Campo','qualidade-produto-campo','Triagem técnica, recorrência de campo, oportunidades e sugestões de melhoria do produto.',1
WHERE NOT EXISTS (SELECT 1 FROM setores WHERE empresa_id IS NULL AND slug='qualidade-produto-campo');

SET @setor_powertrain := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='engenharia-powertrain' ORDER BY id LIMIT 1);
SET @setor_chassi := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='engenharia-chassi-dinamica' ORDER BY id LIMIT 1);
SET @setor_eletronica := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='eletrica-eletronica-software' ORDER BY id LIMIT 1);
SET @setor_cabine := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='cabine-carroceria-onibus' ORDER BY id LIMIT 1);
SET @setor_qualidade := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='qualidade-produto-campo' ORDER BY id LIMIT 1);
SET @setor_triagem := (SELECT id FROM setores WHERE empresa_id IS NULL AND slug='triagem-service-desk' ORDER BY id LIMIT 1);

-- As categorias iniciais da migration 017 eram abrangentes e continuam preservadas
-- para o histórico. Elas são inativadas para não concorrerem com a nova taxonomia.
UPDATE master_categories
   SET ativo=0
 WHERE slug IN (
    'conforto-termico','ar-condicionado-ventilacao','motor-arrefecimento',
    'freios-seguranca','painel-eletrica-eletronica','transmissao-tracao',
    'chassi-suspensao-direcao','ergonomia-acabamento'
 );

INSERT INTO master_categories
    (setor_padrao_id,nome,slug,tipo,descricao,sla_primeira_resposta_horas,sla_resolucao_horas,ativo)
VALUES
(@setor_powertrain,'Powertrain e desempenho','powertrain-desempenho','geral','Desempenho geral do trem de força, perda de potência, torque, consumo e dirigibilidade.',4,48,1),
(@setor_powertrain,'Motor','motor','geral','Funcionamento mecânico do motor, lubrificação, partida, ruídos, fumaça e falhas de combustão.',2,24,1),
(@setor_powertrain,'Transmissão e embreagem','transmissao-embreagem','geral','Câmbio manual ou automatizado, seleção de marchas, embreagem e tomada de força.',4,48,1),
(@setor_powertrain,'Sistema de arrefecimento','sistema-arrefecimento','geral','Controle térmico do motor, radiador, reservatório, mangueiras, bomba e líquido de arrefecimento.',2,24,1),
(@setor_powertrain,'Sistema de combustível','sistema-combustivel','geral','Tanque, alimentação, injeção, bomba, filtros, vazamentos e qualidade do combustível.',2,24,1),
(@setor_powertrain,'Admissão, turbo e exaustão','admissao-turbo-exaustao','geral','Entrada de ar, turbocompressor, intercooler, coletor e sistema de escapamento.',2,36,1),
(@setor_powertrain,'Pós-tratamento de emissões','pos-tratamento-emissoes','geral','ARLA 32, SCR, DPF, regeneração, catalisadores e alertas de emissões.',2,36,1),
(@setor_chassi,'Freios, retarder e freio-motor','freios-retarder-freio-motor','geral','Freio de serviço, estacionamento, ABS/EBS, retarder, freio-motor e perda de frenagem.',1,12,1),
(@setor_chassi,'Direção','direcao','geral','Volante, coluna, caixa de direção, assistência hidráulica ou elétrica e alinhamento direcional.',2,24,1),
(@setor_chassi,'Suspensão','suspensao','geral','Molas, bolsas pneumáticas, amortecedores, nivelamento, estabilidade e altura do veículo.',4,48,1),
(@setor_chassi,'Chassi, eixos e diferencial','chassi-eixos-diferencial','geral','Longarinas, travessas, eixos, diferencial, cardã, redução e tração mecânica.',4,48,1),
(@setor_chassi,'Rodas e pneus','rodas-pneus','geral','Pneus, rodas, calibragem, desgaste, balanceamento e fixação.',2,36,1),
(@setor_eletronica,'Sistema elétrico e alimentação','sistema-eletrico-alimentacao','geral','Bateria de 12/24 V, alternador, motor de partida, chicotes, fusíveis e alimentação elétrica.',2,36,1),
(@setor_eletronica,'Eletrônica, sensores e redes','eletronica-sensores-redes','geral','Módulos, sensores, atuadores, rede CAN, comunicação e falhas eletrônicas.',4,48,1),
(@setor_eletronica,'Painel, cluster e comandos','painel-cluster-comandos','geral','Cluster, computador de bordo, botões, alavancas, indicadores, mensagens e alertas do painel.',4,36,1),
(@setor_eletronica,'Iluminação e sinalização','iluminacao-sinalizacao','geral','Faróis, lanternas, setas, luzes internas, sinalização e iluminação externa.',4,48,1),
(@setor_cabine,'Visibilidade e limpeza dos vidros','visibilidade-limpeza-vidros','geral','Para-brisa, vidros, espelhos, limpadores, palhetas, lavador, desembaçamento e campo de visão.',4,48,1),
(@setor_cabine,'Climatização e ventilação','climatizacao-ventilacao','geral','Ar-condicionado, aquecimento, ventilação, refrigeração, fluxo e distribuição de ar.',4,48,1),
(@setor_cabine,'Cabine, ergonomia e conforto térmico','cabine-ergonomia-conforto','geral','Bancos, posição de dirigir, isolamento, temperatura no assoalho, ruídos, vibração e conforto.',4,72,1),
(@setor_cabine,'Carroceria, portas e acabamento','carroceria-portas-acabamento','geral','Estrutura da cabine ou carroceria, portas, tampas, revestimentos, vedação e acabamento.',4,72,1),
(@setor_eletronica,'Segurança ativa e ADAS','seguranca-ativa-adas','geral','ACC, alerta de faixa, frenagem autônoma, câmeras, radares e assistência à condução.',1,24,1),
(@setor_eletronica,'Tração elétrica, bateria e recarga','tracao-eletrica-bateria-recarga','geral','Motor elétrico, bateria de alta tensão, inversor, autonomia, carregamento e regeneração.',1,24,1),
(@setor_cabine,'Acessibilidade e sistemas de passageiros','acessibilidade-passageiros','geral','Elevador, rampa, ajoelhamento, catraca, campainha, portas e recursos para passageiros de ônibus.',2,36,1),
(@setor_eletronica,'Conectividade e telemática','conectividade-telematica','geral','Rastreamento, telemetria, conectividade, multimídia, GPS, aplicativos e comunicação remota.',4,48,1),
(@setor_chassi,'NVH — ruídos e vibrações','nvh-ruidos-vibracoes','geral','Ruídos, vibrações, trepidações e aspereza percebidos durante a operação do veículo.',4,48,1),
(@setor_cabine,'Ruídos externos e aerodinâmica','ruidos-externos-aerodinamica','geral','Ruído de vento, pneus, carga, vedação e efeitos aerodinâmicos externos.',4,72,1),
(@setor_qualidade,'Sugestão de produto','sugestao-produto','sugestao','Ideias de novas funções, equipamentos ou melhorias do produto.',8,120,1)
ON DUPLICATE KEY UPDATE
    setor_padrao_id=VALUES(setor_padrao_id),
    nome=VALUES(nome),
    tipo=VALUES(tipo),
    descricao=VALUES(descricao),
    sla_primeira_resposta_horas=VALUES(sla_primeira_resposta_horas),
    sla_resolucao_horas=VALUES(sla_resolucao_horas),
    ativo=1;

UPDATE master_categories
   SET setor_padrao_id=@setor_qualidade,
       descricao='Ideias de novas funções, equipamentos ou melhorias do produto.',
       ativo=1
 WHERE slug='sugestao-produto';

UPDATE master_categories
   SET setor_padrao_id=COALESCE(@setor_triagem,@setor_qualidade),
       ativo=1
 WHERE slug='outros-relatos';

INSERT IGNORE INTO schema_migrations (versao)
VALUES ('20260729_019_master_categories_automotivas');
