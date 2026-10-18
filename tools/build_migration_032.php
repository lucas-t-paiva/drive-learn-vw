<?php
declare(strict_types=1);

$models = [
 ['Mercedes-Benz','mercedes-benz','Sprinter','Sprinter Furgão 317 Street 3,5 t L2H2','mercedes-sprinter-furgao-317-street-l2h2','Furgão de carga com rodado simples e teto alto.','', 'OM 654 2.0 turbodiesel','143 cv','','Manual de 6 marchas','3.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","entre_eixos":"3.665","tipo_carroceria":"Furgão","emissoes":"PROCONVE P8","mercado":"Distribuição urbana e regional"}','https://www2.mercedes-benz.com.br/vans','/public/assets/documents/modelos/mercedes-sprinter-tabela-precos-maio-2026.pdf','sob_consulta',null,null,'317 Street 3,5 t L2H2','25/26'],
 ['Mercedes-Benz','mercedes-benz','Sprinter','Sprinter Van 417 15+1','mercedes-sprinter-van-417-15-1','Van para transporte de passageiros.','', 'OM 654 2.0 turbodiesel','163 cv','','Manual de 6 marchas','4.100 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","entre_eixos":"3.665","tipo_carroceria":"Van de passageiros","capacidade_passageiros":"15 passageiros + motorista","emissoes":"PROCONVE P8","mercado":"Transporte executivo e fretamento"}','https://www2.mercedes-benz.com.br/vans','/public/assets/documents/modelos/mercedes-sprinter-tabela-precos-maio-2026.pdf','sob_consulta',null,null,'Van 417','25/26'],
 ['Mercedes-Benz','mercedes-benz','eSprinter','eSprinter Furgão 320 Street 113 kWh','mercedes-esprinter-furgao-320-113-kwh','Furgão elétrico extra-longo de 3,5 toneladas.','/public/assets/images/modelos/mercedes-esprinter-20261017.webp','Motor elétrico','200 cv','','Transmissão direta','3.500 kg','','','{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"4x2, tração traseira","bateria":"113 kWh","autonomia":"Até 478 km WLTP conforme versão","carregamento":"CCS; DC até 50 kW","tipo_carroceria":"Furgão","mercado":"Distribuição urbana de zero emissão local"}','https://www2.mercedes-benz.com.br/vans/campaigns/esprinter-launch.html','/public/assets/documents/modelos/mercedes-sprinter-tabela-precos-maio-2026.pdf','sugerido',465059,507334.74,'F32A UP3e; ICMS SP 19,5% a ICMS 12%','25/26'],
 ['Mercedes-Benz','mercedes-benz','eSprinter','eSprinter Furgão 420 81 kWh','mercedes-esprinter-furgao-420-81-kwh','Furgão elétrico de 4,25 toneladas.','/public/assets/images/modelos/mercedes-esprinter-20261017.webp','Motor elétrico','200 cv','','Transmissão direta','4.250 kg','','','{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"4x2, tração traseira","bateria":"81 kWh","carregamento":"CCS; DC até 50 kW","tipo_carroceria":"Furgão","mercado":"Distribuição urbana de zero emissão local"}','https://www2.mercedes-benz.com.br/vans/campaigns/esprinter-launch.html','/public/assets/documents/modelos/mercedes-sprinter-tabela-precos-maio-2026.pdf','sugerido',508414,597659.93,'F42A/F43A; conforme configuração e ICMS','25/26'],

 ['Ford','ford','Transit','Transit Furgão Médio 10,7 m³ MT','ford-transit-furgao-medio-10-7-mt','Furgão L2H3 para CNH B.','/public/assets/images/modelos/ford-transit-20261017.webp','2.0 EcoBlue Diesel','165 cv @ 3.500 rpm','39,7 kgf.m @ 1.750–2.500 rpm','Manual de 6 marchas','3.500 kg','6.300 kg','3,73:1','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","entre_eixos":"3.300","comprimento":"5.531","tipo_carroceria":"Furgão L2H3","emissoes":"PROCONVE P8","capacidade_carga":"1.254 kg","volume_carga":"10,7 m³","mercado":"Carga urbana e regional"}','https://www.ford.com.br/veiculos-comerciais/transit-furgao/','/public/assets/documents/modelos/ford-transit-furgao-ficha-tecnica-2026.pdf','sob_consulta',null,null,'Furgão Médio 10,7 m³ MT','2026'],
 ['Ford','ford','Transit','Transit Furgão Longo 12,4 m³ AT','ford-transit-furgao-longo-12-4-at','Furgão L3H3 com transmissão automática.','/public/assets/images/modelos/ford-transit-20261017.webp','2.0 EcoBlue Diesel','165 cv @ 3.500 rpm','39,7 kgf.m @ 1.750–2.500 rpm','Automática de 10 marchas','3.500 kg','6.300 kg','3,73:1','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","entre_eixos":"3.750","comprimento":"5.981","tipo_carroceria":"Furgão L3H3","emissoes":"PROCONVE P8","capacidade_carga":"1.151 kg","volume_carga":"12,4 m³","mercado":"Carga urbana e regional"}','https://www.ford.com.br/veiculos-comerciais/transit-furgao/','/public/assets/documents/modelos/ford-transit-furgao-ficha-tecnica-2026.pdf','sob_consulta',null,null,'Furgão Longo 12,4 m³ AT','2026'],
 ['Ford','ford','Transit','Transit Furgão Cargo 12,4 m³ AT','ford-transit-furgao-cargo-12-4-at','Furgão Cargo L3H3 de maior capacidade homologada.','/public/assets/images/modelos/ford-transit-20261017.webp','2.0 EcoBlue Diesel','165 cv @ 3.500 rpm','39,7 kgf.m @ 1.750–2.500 rpm','Automática de 10 marchas','3.995 kg','6.300 kg','3,73:1','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","entre_eixos":"3.750","comprimento":"5.981","tipo_carroceria":"Furgão L3H3 Cargo","emissoes":"PROCONVE P8","capacidade_carga":"1.646 kg","volume_carga":"12,4 m³","mercado":"Carga urbana e regional"}','https://www.ford.com.br/veiculos-comerciais/transit-furgao/','/public/assets/documents/modelos/ford-transit-furgao-ficha-tecnica-2026.pdf','sob_consulta',null,null,'Furgão Cargo 12,4 m³ AT','2026'],
 ['Ford','ford','Transit','Transit Minibus','ford-transit-minibus','Van para transporte profissional de passageiros.','/public/assets/images/modelos/ford-transit-minibus-20261017.webp','2.0 EcoBlue Diesel','165 cv','39,7 kgf.m','Manual de 6 marchas','4.100 kg','','3,73:1','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","tipo_carroceria":"Minibus","capacidade_passageiros":"Conforme versão homologada","emissoes":"PROCONVE P8","mercado":"Fretamento e transporte executivo"}','https://www.ford.com.br/veiculos-comerciais/transit-minibus/','/public/assets/documents/modelos/ford-transit-minibus-ficha-tecnica-2026.pdf','sob_consulta',null,null,'Transit Minibus','2026'],
 ['Ford','ford','E-Transit','E-Transit Furgão L2H3 350M','ford-e-transit-furgao-l2h3-350m','Furgão elétrico para distribuição urbana.','/public/assets/images/modelos/ford-transit-20261017.webp','Motor elétrico','269 cv (198 kW)','','Transmissão direta','3.500 kg','','','{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"4x2, tração traseira","tipo_carroceria":"Furgão L2H3","carregamento":"CA e CC; 10–80% em até 34 min em CC","mercado":"Distribuição urbana de zero emissão local"}','https://www.ford.com.br/veiculos-comerciais/e-transit-furgao/','', 'sob_consulta',null,null,'E-Transit Furgão L2H3 350M','2026'],

 ['Renault','renault','Kangoo','Kangoo Advanced 1.6 SCe','renault-kangoo-advanced-1-6-sce','Furgão compacto flex com porta lateral deslizante.','', '1.6 SCe Flex','112 cv','','Manual','2.050 kg','','','{"tipo_veiculo":"Van","energia":"Flex","configuracao":"4x2, tração dianteira","entre_eixos":"2.812","comprimento":"4.409","tipo_carroceria":"Furgão compacto","capacidade_carga":"750 kg","volume_carga":"3,3 m³","mercado":"Entregas urbanas e serviços"}','https://www.renault.com.br/veiculos-utilitarios/kangoo/versoes-e-precos.html','', 'a_partir_de',139390,null,'Kangoo Advanced 1.6 SCe','2026'],
 ['Renault','renault','Kangoo E-Tech','Kangoo E-Tech 100% Elétrico','renault-kangoo-e-tech-eletrico','Furgão compacto elétrico.','', 'Motor elétrico','120 cv (90 kW)','','Transmissão direta','','','','{"tipo_veiculo":"Van","energia":"100% elétrico","configuracao":"4x2, tração dianteira","autonomia":"210 km PBEV/Inmetro","carregamento":"Até 170 km recuperados em 30 min em terminal de 80 kW","tipo_carroceria":"Furgão compacto","mercado":"Entregas urbanas de zero emissão local"}','https://www.renault.com.br/electric-vehicles/kangoo-e-tech.html','', 'a_partir_de',299390,null,'Kangoo E-Tech','2026'],
 ['Renault','renault','Master','Master Furgão L1H1','renault-master-furgao-l1h1','Furgão compacto da linha Master.','/public/assets/images/modelos/renault-master-20261017.webp','2.3 dCi Diesel','','','Manual de 6 marchas','','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2","tipo_carroceria":"Furgão L1H1","capacidade_carga":"1.450 kg","volume_carga":"8 m³","mercado":"Carga urbana e regional"}','https://www.renault.com.br/veiculos-utilitarios/master-furgao/versoes-e-precos.html','', 'a_partir_de',306390,null,'Master Furgão L1H1','2026'],
 ['Renault','renault','Master','Master Furgão L2H2','renault-master-furgao-l2h2','Furgão médio da linha Master.','/public/assets/images/modelos/renault-master-20261017.webp','2.3 dCi Diesel','','','Manual de 6 marchas','','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2","tipo_carroceria":"Furgão L2H2","capacidade_carga":"1.392 kg","volume_carga":"10,8 m³","mercado":"Carga urbana e regional"}','https://www.renault.com.br/veiculos-utilitarios/master-furgao/versoes-e-precos.html','', 'a_partir_de',317590,null,'Master Furgão L2H2','2026'],
 ['Renault','renault','Master','Master Furgão L3H2','renault-master-furgao-l3h2','Furgão longo da linha Master.','/public/assets/images/modelos/renault-master-20261017.webp','2.3 dCi Diesel','','','Manual de 6 marchas','','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2","tipo_carroceria":"Furgão L3H2","capacidade_carga":"1.314 kg","volume_carga":"13 m³","mercado":"Carga urbana e regional"}','https://www.renault.com.br/veiculos-utilitarios/master-furgao/versoes-e-precos.html','', 'a_partir_de',325190,null,'Master Furgão L3H2','2026'],
 ['Renault','renault','Master','Master Vitré','renault-master-vitre','Van vidrada preparada para passageiros e transformações.','/public/assets/images/modelos/renault-master-20261017.webp','2.3 dCi Diesel','','','Manual de 6 marchas','','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2","tipo_carroceria":"Van vidrada","mercado":"Transformação e transporte de passageiros"}','https://www.renault.com.br/veiculos-utilitarios.html','', 'a_partir_de',332090,null,'Master Vitré','2026'],
 ['Renault','renault','Master','Master Minibus','renault-master-minibus','Minibus para transporte profissional de passageiros.','/public/assets/images/modelos/renault-master-20261017.webp','2.3 dCi Diesel','','','Manual de 6 marchas','','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2","tipo_carroceria":"Minibus","mercado":"Fretamento e transporte executivo"}','https://www.renault.com.br/veiculos-utilitarios.html','', 'a_partir_de',406290,null,'Master Minibus','2026'],

 ['Fiat','fiat','Ducato','Ducato Maxicargo 13 m³','fiat-ducato-maxicargo-13m3','Furgão de carga de 13 m³ para CNH B.','', '2.2 Turbo Diesel BlueHDi','140 cv','350 Nm','Manual de 6 marchas','3.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Furgão","volume_carga":"13 m³","mercado":"Carga urbana e regional"}','https://ducato.fiat.com.br/monte.html','', 'sugerido',307990,null,'Novo Ducato Maxicargo 13M 2.2 Diesel','2027'],
 ['Fiat','fiat','Ducato','Ducato Multi','fiat-ducato-multi','Van multiuso para carga e transformação.','', '2.2 Turbo Diesel BlueHDi','140 cv','350 Nm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Furgão multiuso","capacidade_carga":"1.590 kg","volume_carga":"13 m³","mercado":"Carga e transformação"}','https://ducato.fiat.com.br/monte.html','', 'sugerido',315990,null,'Novo Ducato Multi 2.2 Diesel','2027'],
 ['Fiat','fiat','Ducato','Ducato Minibus Comfort 18L','fiat-ducato-minibus-comfort-18l','Minibus para transporte de passageiros.','', '2.2 Turbo Diesel BlueHDi','140 cv','350 Nm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Minibus","capacidade_passageiros":"18 lugares","mercado":"Fretamento e transporte executivo"}','https://ducato.fiat.com.br/monte.html','', 'sugerido',389990,null,'Novo Ducato Minibus Comfort 18L','2027'],

 ['Peugeot','peugeot','Boxer','Boxer Furgão L3H2','peugeot-boxer-furgao-l3h2','Furgão de grande volume para carga.','/public/assets/images/modelos/peugeot-boxer-20261017.webp','2.2 BlueHDi Diesel','140 cv','340 Nm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","entre_eixos":"4.035","comprimento":"5.998","tipo_carroceria":"Furgão L3H2","volume_carga":"13 m³","mercado":"Carga urbana e regional"}','https://www.peugeot.com.br/gama/peugeot-boxer/monte.html','', 'sugerido',280990,null,'Boxer L3H2 Furgão','25/26'],
 ['Peugeot','peugeot','Boxer','Boxer Cargo L3H2','peugeot-boxer-cargo-l3h2','Furgão Cargo para CNH B.','/public/assets/images/modelos/peugeot-boxer-20261017.webp','2.2 BlueHDi Diesel','140 cv','340 Nm','Manual de 6 marchas','3.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","entre_eixos":"4.035","comprimento":"5.998","tipo_carroceria":"Furgão Cargo L3H2","volume_carga":"13 m³","mercado":"Carga urbana e regional"}','https://www.peugeot.com.br/gama/peugeot-boxer/monte.html','', 'sugerido',295990,null,'Boxer L3H2 Cargo','25/26'],
 ['Peugeot','peugeot','Boxer','Boxer Minibus Comfort 17+1','peugeot-boxer-minibus-comfort-17-1','Minibus para transporte profissional de passageiros.','/public/assets/images/modelos/peugeot-boxer-20261017.webp','2.2 BlueHDi Diesel','140 cv','340 Nm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Minibus","capacidade_passageiros":"17 passageiros + motorista","mercado":"Fretamento e transporte executivo"}','https://www.peugeot.com.br/gama/peugeot-boxer/monte.html','', 'sugerido',375990,null,'Boxer Comfort 17+1','25/26'],
 ['Peugeot','peugeot','Boxer','Boxer Minibus Luxo 15+1','peugeot-boxer-minibus-luxo-15-1','Minibus de acabamento executivo.','/public/assets/images/modelos/peugeot-boxer-20261017.webp','2.2 BlueHDi Diesel','140 cv','340 Nm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Minibus","capacidade_passageiros":"15 passageiros + motorista","mercado":"Transporte executivo"}','https://www.peugeot.com.br/gama/peugeot-boxer/monte.html','', 'sugerido',384990,null,'Boxer Luxo 15+1','25/26'],

 ['Citroën','citroen','Jumper','Jumper Furgão L3H2','citroen-jumper-furgao-l3h2','Furgão de grande volume com até 1.590 kg de carga útil na linha atual.','/public/assets/images/modelos/citroen-jumper-20261017.webp','2.2 Turbo Diesel BlueHDi','140 cv @ 3.750 rpm','340 Nm @ 1.750 rpm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","entre_eixos":"4.035","comprimento":"5.998","tipo_carroceria":"Furgão L3H2","volume_carga":"13 m³","emissoes":"PROCONVE L8","mercado":"Carga urbana e regional"}','https://www.citroen.com.br/monte-o-seu/jumper.html','/public/assets/documents/modelos/citroen-jumper-ficha-tecnica.pdf','sugerido',280990,null,'Jumper L3H2 Furgão','2026'],
 ['Citroën','citroen','Jumper','Jumper Cargo L3H2','citroen-jumper-cargo-l3h2','Furgão Cargo para CNH B.','/public/assets/images/modelos/citroen-jumper-20261017.webp','2.2 Turbo Diesel BlueHDi','140 cv @ 3.750 rpm','340 Nm @ 1.750 rpm','Manual de 6 marchas','3.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","entre_eixos":"4.035","comprimento":"5.998","tipo_carroceria":"Furgão Cargo L3H2","capacidade_carga":"Até 1.240 kg na linha atual","volume_carga":"13 m³","emissoes":"PROCONVE L8","mercado":"Carga urbana e regional"}','https://www.citroen.com.br/monte-o-seu/jumper.html','/public/assets/documents/modelos/citroen-jumper-ficha-tecnica.pdf','sugerido',301990,null,'Jumper L3H2 Cargo','2026'],
 ['Citroën','citroen','Jumper','Jumper Minibus Luxo 15+1','citroen-jumper-minibus-luxo-15-1','Minibus para transporte executivo.','/public/assets/images/modelos/citroen-jumper-20261017.webp','2.2 Turbo Diesel BlueHDi','140 cv @ 3.750 rpm','340 Nm @ 1.750 rpm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Minibus","capacidade_passageiros":"15 passageiros + motorista","emissoes":"PROCONVE L8","mercado":"Transporte executivo"}','https://www.citroen.com.br/veiculos-utilitarios/citroen-jumper.html','/public/assets/documents/modelos/citroen-jumper-ficha-tecnica.pdf','sob_consulta',null,null,'Jumper Minibus Luxo 15+1','2026'],
 ['Citroën','citroen','Jumper','Jumper Minibus Comfort 17+1','citroen-jumper-minibus-comfort-17-1','Minibus para fretamento e transporte profissional.','/public/assets/images/modelos/citroen-jumper-20261017.webp','2.2 Turbo Diesel BlueHDi','140 cv @ 3.750 rpm','340 Nm @ 1.750 rpm','Manual de 6 marchas','3.850 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração dianteira","tipo_carroceria":"Minibus","capacidade_passageiros":"17 passageiros + motorista","emissoes":"PROCONVE L8","mercado":"Fretamento"}','https://www.citroen.com.br/veiculos-utilitarios/citroen-jumper.html','/public/assets/documents/modelos/citroen-jumper-ficha-tecnica.pdf','sob_consulta',null,null,'Jumper Minibus Comfort 17+1','2026'],

 ['IVECO','iveco','Daily Furgão','Daily Furgão 30-160','iveco-daily-furgao-30-160','Furgão urbano da linha Daily.','/public/assets/images/modelos/iveco-daily-30-160-oficial.webp','FPT F1C 3.0 Diesel','160 cv','380 Nm','Manual de 6 marchas','3.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","tipo_carroceria":"Furgão","emissoes":"PROCONVE P8","mercado":"Carga urbana e regional"}','https://new.iveco.com/brasil/Daily/Daily-Furgao','/public/assets/documents/modelos/iveco-daily-30-160-ficha-tecnica.pdf','sob_consulta',null,null,'Daily Furgão 30-160','2026'],
 ['IVECO','iveco','Daily Furgão','Daily Furgão 45-160','iveco-daily-furgao-45-160','Furgão de 4,5 toneladas.','/public/assets/images/modelos/iveco-daily-45-160-45-180-oficial.webp','FPT F1C 3.0 Diesel','160 cv','380 Nm','Manual de 6 marchas','4.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","tipo_carroceria":"Furgão","emissoes":"PROCONVE P8","mercado":"Carga urbana e regional"}','https://new.iveco.com/brasil/Daily/Daily-Furgao','/public/assets/documents/modelos/iveco-daily-45-160-45-180-ficha-tecnica.pdf','sob_consulta',null,null,'Daily Furgão 45-160','2026'],
 ['IVECO','iveco','Daily Furgão','Daily Furgão 45-180 Hi-Matic','iveco-daily-furgao-45-180-hi-matic','Furgão automático de 4,5 toneladas.','/public/assets/images/modelos/iveco-daily-45-160-45-180-oficial.webp','FPT F1C 3.0 Diesel','180 cv','430 Nm','Hi-Matic automática de 8 marchas','4.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","tipo_carroceria":"Furgão","emissoes":"PROCONVE P8","mercado":"Carga urbana e regional"}','https://new.iveco.com/brasil/Daily/Daily-Furgao','/public/assets/documents/modelos/iveco-daily-45-160-45-180-ficha-tecnica.pdf','sob_consulta',null,null,'Daily Furgão 45-180 Hi-Matic','2026'],
 ['IVECO','iveco','Daily Furgão','Daily Furgão 55-180','iveco-daily-furgao-55-180','Furgão de 5,5 toneladas para operações de maior capacidade.','/public/assets/images/modelos/iveco-daily-55-180-oficial.webp','FPT F1C 3.0 Diesel','180 cv','430 Nm','Manual de 6 marchas','5.500 kg','','','{"tipo_veiculo":"Van","energia":"Diesel S10","configuracao":"4x2, tração traseira","tipo_carroceria":"Furgão","emissoes":"PROCONVE P8","mercado":"Carga urbana e regional"}','https://new.iveco.com/brasil/Daily/Daily-Furgao','/public/assets/documents/modelos/iveco-daily-55-180-ficha-tecnica.pdf','sob_consulta',null,null,'Daily Furgão 55-180','2026'],
];

function q(mixed $value): string {
    if ($value === null) return 'NULL';
    if (is_int($value) || is_float($value)) return (string)$value;
    return "'" . str_replace(["\\", "'"], ["\\\\", "''"], (string)$value) . "'";
}

$header = <<<'SQL'
-- Drive Learn VW | Segmento vans, fichas e preços oficiais
-- Gerado em 17/10/2026. Idempotente para reexecução.
-- IMPORTANTE: preços são referências oficiais na data indicada; condições, tributos e disponibilidade podem mudar.

SET NAMES utf8mb4;

ALTER TABLE familias MODIFY tipo_veiculo ENUM('caminhao','onibus','van') NOT NULL DEFAULT 'caminhao';
ALTER TABLE frotas MODIFY tipo_veiculo ENUM('caminhao','onibus','van') NOT NULL DEFAULT 'caminhao';

CREATE TABLE IF NOT EXISTS modelo_precos(
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 modelo_id BIGINT UNSIGNED NOT NULL,
 variante VARCHAR(180), ano_modelo VARCHAR(20),
 tipo_preco ENUM('sugerido','a_partir_de','oferta','sob_consulta') NOT NULL DEFAULT 'sob_consulta',
 valor_min DECIMAL(14,2), valor_max DECIMAL(14,2), moeda CHAR(3) NOT NULL DEFAULT 'BRL',
 uf CHAR(2), aliquota_icms DECIMAL(5,2), vigencia_inicio DATE, vigencia_fim DATE,
 fonte_url VARCHAR(700) NOT NULL,
 fonte_tipo ENUM('fabricante','configurador_fabricante','tabela_fabricante') NOT NULL DEFAULT 'fabricante',
 consultado_em DATE NOT NULL, observacao TEXT, ativo BOOLEAN NOT NULL DEFAULT TRUE,
 criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 INDEX idx_modelo_precos_catalogo(modelo_id,ativo,consultado_em),
 CONSTRAINT fk_modelo_precos_modelo FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS modelo_especificacoes_tecnicas(
 modelo_id BIGINT UNSIGNED NOT NULL, chave VARCHAR(80) NOT NULL, rotulo VARCHAR(120) NOT NULL,
 valor VARCHAR(255) NOT NULL, unidade VARCHAR(30), fonte_url VARCHAR(700), conferido_em DATE,
 PRIMARY KEY(modelo_id,chave), INDEX idx_met_chave_032(chave),
 CONSTRAINT fk_met_modelo_032 FOREIGN KEY(modelo_id) REFERENCES modelos(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS migration_vans_20261017;
CREATE TABLE migration_vans_20261017(
 marca VARCHAR(120), marca_slug VARCHAR(140), familia VARCHAR(120), modelo VARCHAR(180), slug VARCHAR(180), descricao TEXT,
 imagem VARCHAR(255), motor VARCHAR(160), potencia VARCHAR(120), torque VARCHAR(120), transmissao VARCHAR(180),
 pbt VARCHAR(80), pbtc VARCHAR(100), reducao VARCHAR(160), specs_json LONGTEXT, fonte_url VARCHAR(700),
 documento VARCHAR(255), preco_tipo VARCHAR(30), preco_min DECIMAL(14,2), preco_max DECIMAL(14,2),
 preco_variante VARCHAR(180), preco_ano VARCHAR(20), PRIMARY KEY(slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SQL;

$rows=[];
foreach($models as $m)$rows[]='('.implode(',',array_map('q',$m)).')';
$sql=$header."INSERT INTO migration_vans_20261017 VALUES\n".implode(",\n",$rows).";\n\n";
$sql.=<<<'SQL'
INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo)
SELECT s.marca,s.marca_slug,NULL,MIN(s.fonte_url),CONCAT('Fabricante com veículos comerciais no segmento de vans.'),1
FROM migration_vans_20261017 s
WHERE NOT EXISTS(SELECT 1 FROM marcas m WHERE m.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci OR LOWER(m.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.marca) COLLATE utf8mb4_unicode_ci)
GROUP BY s.marca,s.marca_slug;

INSERT INTO familias(marca_id,tipo_veiculo,nome,descricao,ativo)
SELECT ma.id,'van',s.familia,CONCAT('Linha de vans ',s.familia,' da ',s.marca,'.'),1
FROM (SELECT DISTINCT marca_slug,familia,marca FROM migration_vans_20261017) s
JOIN marcas ma ON ma.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci
WHERE NOT EXISTS(SELECT 1 FROM familias f WHERE f.marca_id=ma.id AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.familia) COLLATE utf8mb4_unicode_ci);

UPDATE familias f JOIN marcas ma ON ma.id=f.marca_id JOIN (SELECT DISTINCT marca_slug,familia FROM migration_vans_20261017) s ON s.marca_slug COLLATE utf8mb4_unicode_ci=ma.slug COLLATE utf8mb4_unicode_ci AND LOWER(s.familia) COLLATE utf8mb4_unicode_ci=LOWER(f.nome) COLLATE utf8mb4_unicode_ci
SET f.tipo_veiculo='van',f.ativo=1;

INSERT INTO modelos(familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo)
SELECT f.id,s.modelo,s.slug,s.descricao,NULLIF(s.imagem,''),NULLIF(s.motor,''),NULLIF(s.potencia,''),NULLIF(s.torque,''),NULLIF(s.transmissao,''),NULLIF(s.pbt,''),NULLIF(s.pbtc,''),NULLIF(s.reducao,''),s.specs_json,1
FROM migration_vans_20261017 s JOIN marcas ma ON ma.slug COLLATE utf8mb4_unicode_ci=s.marca_slug COLLATE utf8mb4_unicode_ci JOIN familias f ON f.marca_id=ma.id AND LOWER(f.nome) COLLATE utf8mb4_unicode_ci=LOWER(s.familia) COLLATE utf8mb4_unicode_ci
WHERE NOT EXISTS(SELECT 1 FROM modelos m WHERE m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci);

UPDATE modelos m JOIN migration_vans_20261017 s ON s.slug COLLATE utf8mb4_unicode_ci=m.slug COLLATE utf8mb4_unicode_ci
SET m.nome=s.modelo,m.descricao=s.descricao,m.imagem=COALESCE(NULLIF(s.imagem,''),m.imagem),m.motor=NULLIF(s.motor,''),m.potencia=NULLIF(s.potencia,''),m.torque=NULLIF(s.torque,''),m.transmissao=NULLIF(s.transmissao,''),m.pbt=NULLIF(s.pbt,''),m.pbtc=NULLIF(s.pbtc,''),m.relacao_reducao=NULLIF(s.reducao,''),m.especificacoes=s.specs_json,m.ativo=1;

INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo)
SELECT m.id,'ficha_tecnica',CONCAT('Ficha técnica / fonte oficial — ',s.modelo),NULLIF(s.documento,''),s.fonte_url,s.fonte_url,1
FROM migration_vans_20261017 s JOIN modelos m ON m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci WHERE NULLIF(s.documento,'') IS NOT NULL
ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),arquivo=VALUES(arquivo),url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1;

DELETE mp FROM modelo_precos mp JOIN modelos m ON m.id=mp.modelo_id JOIN migration_vans_20261017 s ON s.slug COLLATE utf8mb4_unicode_ci=m.slug COLLATE utf8mb4_unicode_ci WHERE mp.consultado_em='2026-10-17';
INSERT INTO modelo_precos(modelo_id,variante,ano_modelo,tipo_preco,valor_min,valor_max,moeda,fonte_url,fonte_tipo,consultado_em,observacao,ativo)
SELECT m.id,NULLIF(s.preco_variante,''),NULLIF(s.preco_ano,''),s.preco_tipo,s.preco_min,s.preco_max,'BRL',s.fonte_url,
 CASE WHEN s.marca_slug='mercedes-benz' THEN 'tabela_fabricante' WHEN s.preco_min IS NOT NULL THEN 'configurador_fabricante' ELSE 'fabricante' END,
 '2026-10-17',CASE WHEN s.preco_min IS NULL THEN 'O fabricante não publicou preço de veículo zero km para esta configuração; solicitar cotação.' ELSE 'Referência pública oficial; confirmar impostos, frete, pintura, opcionais e disponibilidade.' END,1
FROM migration_vans_20261017 s JOIN modelos m ON m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci;

INSERT INTO modelo_especificacoes_tecnicas(modelo_id,chave,rotulo,valor,unidade,fonte_url,conferido_em)
SELECT m.id,k.chave,k.rotulo,JSON_UNQUOTE(JSON_EXTRACT(s.specs_json,CONCAT('$.',k.chave))),NULL,s.fonte_url,'2026-10-17'
FROM migration_vans_20261017 s JOIN modelos m ON m.slug COLLATE utf8mb4_unicode_ci=s.slug COLLATE utf8mb4_unicode_ci
CROSS JOIN (
 SELECT 'tipo_veiculo' chave,'Tipo de veículo' rotulo UNION ALL SELECT 'energia','Energia / propulsão'
 UNION ALL SELECT 'configuracao','Configuração / tração' UNION ALL SELECT 'entre_eixos','Entre-eixos'
 UNION ALL SELECT 'comprimento','Comprimento' UNION ALL SELECT 'tipo_carroceria','Tipo de carroceria'
 UNION ALL SELECT 'emissoes','Norma de emissões' UNION ALL SELECT 'bateria','Bateria'
 UNION ALL SELECT 'autonomia','Autonomia' UNION ALL SELECT 'carregamento','Carregamento'
 UNION ALL SELECT 'capacidade_passageiros','Capacidade de passageiros' UNION ALL SELECT 'capacidade_carga','Capacidade de carga'
 UNION ALL SELECT 'volume_carga','Volume de carga' UNION ALL SELECT 'mercado','Mercado / aplicação'
) k
WHERE JSON_EXTRACT(s.specs_json,CONCAT('$.',k.chave)) IS NOT NULL
ON DUPLICATE KEY UPDATE rotulo=VALUES(rotulo),valor=VALUES(valor),fonte_url=VALUES(fonte_url),conferido_em=VALUES(conferido_em);

DROP TABLE migration_vans_20261017;
SQL;

$target=__DIR__.'/../database/migrations/20261017_032_segmento_vans_precos_catalogo.sql';
file_put_contents($target,$sql);
echo $target."\n".count($models)." modelos preparados\n";

