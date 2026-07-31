-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 31/07/2026 às 00:24
-- Versão do servidor: 5.7.44-48
-- Versão do PHP: 8.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `luc66510_drive-learn-vw`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `assistente_interacao_fontes`
--

CREATE TABLE `assistente_interacao_fontes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interacao_id` bigint(20) UNSIGNED NOT NULL,
  `tipo` enum('video','modelo','frota') COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `modelo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transcricao_snapshot` longtext COLLATE utf8mb4_unicode_ci,
  `conteudo_snapshot` longtext COLLATE utf8mb4_unicode_ci,
  `fonte_atualizada_em` datetime DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assistente_interacao_fontes`
--

INSERT INTO `assistente_interacao_fontes` (`id`, `interacao_id`, `tipo`, `video_id`, `modelo_id`, `titulo`, `transcricao_snapshot`, `conteudo_snapshot`, `fonte_atualizada_em`, `criado_em`) VALUES
(1, 1, 'modelo', NULL, 116, 'BYD · Ônibus Elétricos Urbanos · BYD BC10LE', NULL, '{\"id\":116,\"nome\":\"BYD BC10LE\",\"descricao\":\"Aplicação Urbana.\\nGarantia 5 anos ou 500.000 km para motor\",\"motor\":\"Motor síncrono de ímãs permanentes - BYD - TZ290XSE\",\"potencia\":\"2× 150 kW\",\"torque\":\"2× 600 Nm\",\"transmissao\":\"Tração elétrica direta com frenagem regenerativa\",\"pbt\":\"19.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"5.420\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"100% elétrico\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"autonomia\\\":\\\"Até 250 km\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"5.420\\\",\\\"carregamento\\\":\\\"\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"Padron urbano\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.byd.com/material/byd-site/br/news-byd-brasil/onibus-BH.jpg\\\",\\\"capacidade_passageiros\\\":\\\"Até 78 passageiros\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Zero emissão local\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:22\",\"familia_nome\":\"Ônibus Elétricos Urbanos\",\"marca_nome\":\"BYD\",\"_score\":15}', '2026-07-18 21:04:22', '2026-07-29 02:55:49'),
(2, 1, 'modelo', NULL, 117, 'BYD · Ônibus Elétricos Urbanos · BYD eBus B12.b', NULL, '{\"id\":117,\"nome\":\"BYD eBus B12.b\",\"descricao\":\"Ônibus elétrico urbano de piso baixo do catálogo internacional BYD, equipado com Blade Battery LFP e trem de força integrado.\",\"motor\":\"Dois motores elétricos Hairpin\",\"potencia\":\"2 × 150 kW (máxima)\",\"torque\":\"\",\"transmissao\":\"Tração elétrica direta\",\"pbt\":\"20.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"5.950\",\"especificacoes\":\"{\\\"bateria\\\":\\\"Blade Battery LFP, até 500 kWh\\\",\\\"energia\\\":\\\"100% elétrico\\\",\\\"mercado\\\":\\\"Catálogo internacional\\\",\\\"autonomia\\\":\\\"Até 600 km\\\",\\\"comprimento\\\":\\\"12.130 mm\\\",\\\"entre_eixos\\\":\\\"5.950\\\",\\\"carregamento\\\":\\\"CCS; pantógrafo opcional, até 500 kW\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"Piso baixo, entre-eixos de 5.950 mm\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://bydeurope.com/byd-ebus-b12\\\",\\\"fonte_imagem_oficial\\\":\\\"https://bydeurope.com/img/bus/b12/banner.png\\\",\\\"capacidade_passageiros\\\":\\\"Até 105 passageiros\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Zero emissão local\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:22\",\"familia_nome\":\"Ônibus Elétricos Urbanos\",\"marca_nome\":\"BYD\",\"_score\":12}', '2026-07-18 21:04:22', '2026-07-29 02:55:49'),
(3, 1, 'modelo', NULL, 118, 'BYD · Ônibus Elétricos Urbanos · BYD eBus B13', NULL, '{\"id\":118,\"nome\":\"BYD eBus B13\",\"descricao\":\"Ônibus elétrico de entrada baixa do catálogo internacional BYD, destinado a operações urbanas e intermunicipais.\",\"motor\":\"Dois motores elétricos integrados às rodas\",\"potencia\":\"2 × 150 kW (máxima)\",\"torque\":\"\",\"transmissao\":\"Tração elétrica direta\",\"pbt\":\"19.100 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"Bateria LFP, até 422 kWh\\\",\\\"energia\\\":\\\"100% elétrico\\\",\\\"mercado\\\":\\\"Catálogo internacional\\\",\\\"autonomia\\\":\\\"Até 400 km\\\",\\\"comprimento\\\":\\\"13.275 mm\\\",\\\"carregamento\\\":\\\"CCS ou pantógrafo\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"Entrada baixa, entre-eixos de 7.100 mm\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://bydeurope.com/pdp-bus-model-13\\\",\\\"fonte_imagem_oficial\\\":\\\"https://bydeurope.com/img/bus/pdp-bus-model-13-bus.png\\\",\\\"capacidade_passageiros\\\":\\\"Até 59 passageiros\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Zero emissão local\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:22\",\"familia_nome\":\"Ônibus Elétricos Urbanos\",\"marca_nome\":\"BYD\",\"_score\":11}', '2026-07-18 21:04:22', '2026-07-29 02:55:49'),
(4, 1, 'modelo', NULL, 119, 'Mercedes-Benz · eO500 · Mercedes-Benz eO500U', NULL, '{\"id\":119,\"nome\":\"Mercedes-Benz eO500U\",\"descricao\":\"Primeiro chassi de ônibus de propulsão elétrica produzido pela Mercedes-Benz do Brasil, com piso baixo e configuração modular de baterias.\",\"motor\":\"Dois motores assíncronos integrados ao eixo traseiro\",\"potencia\":\"250 kW / 340 cv (total)\",\"torque\":\"2 × 485 Nm\",\"transmissao\":\"Tração elétrica direta\",\"pbt\":\"21.200 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"3 a 6 pacotes NMC de 98 kWh; até 588 kWh\\\",\\\"energia\\\":\\\"100% elétrico\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"autonomia\\\":\\\"Até 270 km\\\",\\\"comprimento\\\":\\\"Carroceria de até 13,2 m\\\",\\\"carregamento\\\":\\\"CCS2, até 150 kW; recarga completa em até 3 horas\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, piso baixo\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u\\\",\\\"fonte_imagem_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/content-block/main/img-8948-20250710-182437-925-FCE2-20250710-181407-792-85A6_eo500u-sobre.jpg.webp\\\",\\\"capacidade_passageiros\\\":\\\"Mais de 80 passageiros nas configurações de 3 a 5 baterias\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Zero emissão local\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:22\",\"familia_nome\":\"eO500\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":9}', '2026-07-18 21:04:22', '2026-07-29 02:55:49'),
(5, 1, 'modelo', NULL, 132, 'Mercedes-Benz · LO Micro-Ônibus e Escolar · LO 916/48 ORE 2', NULL, '{\"id\":132,\"nome\":\"LO 916/48 ORE 2\",\"descricao\":\"Chassi 4x2 de piso alto para transporte escolar rural, com carroceria de até 9,2 m.\",\"motor\":\"MB OM 924 LA 4,8 l\",\"potencia\":\"163 cv (120 kW) @ 2.200 rpm\",\"torque\":\"610 Nm @ 1.200–1.600 rpm\",\"transmissao\":\"Eaton ESBO 6206 manual, 6 marchas\",\"pbt\":\"9.400 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,30:1\",\"entre_eixos\":\"4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"Até 9,2 m\\\",\\\"entre_eixos\\\":\\\"4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, piso alto escolar\\\",\\\"fonte_pagina\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/escolar/lo-916\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"Até 45 pessoas, incluindo motorista\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"LO Micro-Ônibus e Escolar\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":7}', '2026-07-25 16:26:03', '2026-07-29 02:55:49'),
(6, 2, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 02:56:57'),
(7, 2, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":8}', '2026-07-25 16:26:03', '2026-07-29 02:56:57'),
(8, 2, 'modelo', NULL, 143, 'IVECO · IVECO BUS · IVECO BUS 17-280', NULL, '{\"id\":143,\"nome\":\"IVECO BUS 17-280\",\"descricao\":\"Chassi 4x2 para ônibus de maior capacidade, com motor FPT NEF 6 Euro VI.\",\"motor\":\"FPT NEF 6 Euro VI HiSCR\",\"potencia\":\"280 cv (207 kW) @ 2.500 rpm\",\"torque\":\"950 Nm @ 1.250–1.970 rpm\",\"transmissao\":\"ZF 6S 1010 BO manual, 6 marchas\",\"pbt\":\"16.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"5,57:1 / 5,13:1 / 6,57:1\",\"entre_eixos\":\"5.950\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"5.950\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":8}', '2026-07-25 16:26:03', '2026-07-29 02:56:57'),
(9, 2, 'modelo', NULL, 65, 'IVECO · S-Way · S-Way 540 6x4', NULL, '{\"id\":65,\"nome\":\"S-Way 540 6x4\",\"descricao\":\"Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT Cursor 13 12,9 l\",\"potencia\":\"540 cv @ 1.500–1.900 rpm\",\"torque\":\"2.550 Nm @ 1.000–1.500 rpm\",\"transmissao\":\"ZF TraXon 12TX2624TD automatizada, 12 marchas\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"3,07:1\",\"entre_eixos\":\"3.540\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.540\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Pesados-S-Way\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"S-Way\",\"marca_nome\":\"IVECO\",\"_score\":8}', '2026-07-18 21:03:44', '2026-07-29 02:56:57'),
(10, 2, 'modelo', NULL, 120, 'IVECO · Daily · Daily 30-160', NULL, '{\"id\":120,\"nome\":\"Daily 30-160\",\"descricao\":\"Daily 30-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"160 cv @ 3.500 rpm\",\"torque\":\"380 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 6S 480 VO manual, 6 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":6}', '2026-07-18 21:04:47', '2026-07-29 02:56:57'),
(11, 2, 'modelo', NULL, 121, 'IVECO · Daily · Daily 35-160', NULL, '{\"id\":121,\"nome\":\"Daily 35-160\",\"descricao\":\"Daily 35-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"160 cv @ 3.500 rpm\",\"torque\":\"380 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 6S 480 VO manual, 6 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.520 / 3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.520 / 3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":6}', '2026-07-18 21:04:47', '2026-07-29 02:56:57'),
(12, 3, 'modelo', NULL, 65, 'IVECO · S-Way · S-Way 540 6x4', NULL, '{\"id\":65,\"nome\":\"S-Way 540 6x4\",\"descricao\":\"Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT Cursor 13 12,9 l\",\"potencia\":\"540 cv @ 1.500–1.900 rpm\",\"torque\":\"2.550 Nm @ 1.000–1.500 rpm\",\"transmissao\":\"ZF TraXon 12TX2624TD automatizada, 12 marchas\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"3,07:1\",\"entre_eixos\":\"3.540\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.540\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Pesados-S-Way\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"S-Way\",\"marca_nome\":\"IVECO\",\"_score\":11}', '2026-07-18 21:03:44', '2026-07-29 02:58:35'),
(13, 3, 'modelo', NULL, 145, 'Volvo · FH · FH 540 6x4T', NULL, '{\"id\":145,\"nome\":\"FH 540 6x4T\",\"descricao\":\"Opções de Relações de redução\\r\\n2.83:1 - 3.09:1 - 3.40:1 - 3.78:1 - 4.50:1\",\"motor\":\"D13K540\",\"potencia\":\"540 cv - 397 kW  (1460-1800 rpm)\",\"torque\":\"2600 Nm (1000-1460 rpm)\",\"transmissao\":\"ATO2612 G + ASO-C (Super reduzida) 13 (12 + 1 super-reduzida\",\"pbt\":\"28.500 Kg\",\"pbtc\":\"74\",\"relacao_reducao\":\"3.40:1 / 3.78:1 / 4.50:1\",\"entre_eixos\":\"3.000 / 3.200 / 3.600\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"3.000 / 3.200 / 3.600\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel Euro 6\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"7.140 mm\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Rodoviário\\\"}\",\"atualizado_em\":\"2026-07-27 10:35:15\",\"familia_nome\":\"FH\",\"marca_nome\":\"Volvo\",\"_score\":7}', '2026-07-27 10:35:15', '2026-07-29 02:58:35'),
(14, 3, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":7}', '2026-07-25 16:26:03', '2026-07-29 02:58:35'),
(15, 3, 'modelo', NULL, 68, 'Volvo · FH · FH 500 6x2T', NULL, '{\"id\":68,\"nome\":\"FH 500 6x2T\",\"descricao\":\"Versão FH 500 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"500 cv @ 1.400–1.800 rpm\",\"torque\":\"2.500 Nm @ 980–1.400 rpm\",\"transmissao\":\"I-Shift AT2612 G automatizada, 12 marchas\",\"pbt\":\"28.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x2T, suspensão pneumática\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"3.000 / 3.200 / 3.500 / 3.700\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FH\",\"marca_nome\":\"Volvo\",\"_score\":7}', '2026-07-18 21:03:44', '2026-07-29 02:58:35'),
(16, 3, 'modelo', NULL, 74, 'Volvo · FMX · FMX 540 6x4T', NULL, '{\"id\":74,\"nome\":\"FMX 540 6x4T\",\"descricao\":\"Versão FMX 540 6x4T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"540 cv @ 1.460–1.800 rpm\",\"torque\":\"2.600 Nm @ 1.000–1.460 rpm\",\"transmissao\":\"I-Shift automatizada\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FMX\",\"marca_nome\":\"Volvo\",\"_score\":7}', '2026-07-18 21:03:44', '2026-07-29 02:58:35'),
(17, 4, 'modelo', NULL, 65, 'IVECO · S-Way · S-Way 540 6x4', NULL, '{\"id\":65,\"nome\":\"S-Way 540 6x4\",\"descricao\":\"Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT Cursor 13 12,9 l\",\"potencia\":\"540 cv @ 1.500–1.900 rpm\",\"torque\":\"2.550 Nm @ 1.000–1.500 rpm\",\"transmissao\":\"ZF TraXon 12TX2624TD automatizada, 12 marchas\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"3,07:1\",\"entre_eixos\":\"3.540\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.540\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Pesados-S-Way\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"S-Way\",\"marca_nome\":\"IVECO\",\"_score\":16}', '2026-07-18 21:03:44', '2026-07-29 02:59:49'),
(18, 4, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":15}', '2026-07-25 16:26:03', '2026-07-29 02:59:49'),
(19, 4, 'modelo', NULL, 103, 'Scania · Linha R · Scania R 500 6x4 Super', NULL, '{\"id\":103,\"nome\":\"Scania R 500 6x4 Super\",\"descricao\":\"Versão Scania R 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"DC13 174\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.650 Nm @ 900–1.320 rpm\",\"transmissao\":\"Scania Opticruise G25/G33\",\"pbt\":\"23.000 Kg\",\"pbtc\":\"74.000 Kg\",\"relacao_reducao\":\"3,07:1 | 3,42:1\",\"entre_eixos\":\"3.550\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\\\",\\\"entre_eixos\\\":\\\"3.550\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"7.110 mm\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Linha R\",\"marca_nome\":\"Scania\",\"_score\":13}', '2026-07-18 21:03:44', '2026-07-29 02:59:49'),
(20, 4, 'modelo', NULL, 107, 'Scania · Linha S · Scania S 500 Super', NULL, '{\"id\":107,\"nome\":\"Scania S 500 Super\",\"descricao\":\"Versão Scania S 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Scania Super 13 l\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.650 Nm @ 900–1.320 rpm\",\"transmissao\":\"Scania Opticruise G25/G33\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"Cabine S de piso plano\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/s-series.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Linha S\",\"marca_nome\":\"Scania\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 02:59:49'),
(21, 4, 'modelo', NULL, 111, 'Scania · Linha P · Scania P 500 Super', NULL, '{\"id\":111,\"nome\":\"Scania P 500 Super\",\"descricao\":\"Versão Scania P 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Scania Super 13 l\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.650 Nm @ 900–1.320 rpm\",\"transmissao\":\"Scania Opticruise G25/G33\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"Cabine P; configuração conforme aplicação\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/p-series.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Linha P\",\"marca_nome\":\"Scania\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 02:59:49'),
(22, 5, 'modelo', NULL, 143, 'IVECO · IVECO BUS · IVECO BUS 17-280', NULL, '{\"id\":143,\"nome\":\"IVECO BUS 17-280\",\"descricao\":\"Chassi 4x2 para ônibus de maior capacidade, com motor FPT NEF 6 Euro VI.\",\"motor\":\"FPT NEF 6 Euro VI HiSCR\",\"potencia\":\"280 cv (207 kW) @ 2.500 rpm\",\"torque\":\"950 Nm @ 1.250–1.970 rpm\",\"transmissao\":\"ZF 6S 1010 BO manual, 6 marchas\",\"pbt\":\"16.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"5,57:1 / 5,13:1 / 6,57:1\",\"entre_eixos\":\"5.950\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"5.950\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":1}', '2026-07-25 16:26:03', '2026-07-29 03:01:04'),
(23, 6, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:15:08'),
(24, 6, 'modelo', NULL, 29, 'Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 28.480HD', NULL, '{\"id\":29,\"nome\":\"Meteor 6x4 28.480HD\",\"descricao\":\"Modelo Novo Meteor Highline 28.480HD da família Volkswagen Meteor.\",\"motor\":\"MAN / D2676LFAG\",\"potencia\":\"475 (350) @ 1.800\",\"torque\":\"2.400 @ 930 - 1.350\",\"transmissao\":\"ZF / 12TX 2624 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"58.500 kg\",\"relacao_reducao\":\"2,85:1 / 3,08:1 / 3,40:1\",\"entre_eixos\":\"4.600\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.600\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:54\",\"familia_nome\":\"Meteor\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":4}', '2026-07-16 11:41:54', '2026-07-29 03:15:08'),
(25, 6, 'modelo', NULL, 4, 'Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530', NULL, '{\"id\":4,\"nome\":\"Meteor 6x4 29.530\",\"descricao\":\"Modelo Novo Meteor Highline 29.530 da família Volkswagen Meteor.\\nRelação  de redução 3,08:1 e  3,36:1\",\"motor\":\"MAN / D2676LFAD\",\"potencia\":\"525 (386) @ 1.800\",\"torque\":\"2.600 @ 930 - 1.350\",\"transmissao\":\"ZF / 12TX 2624 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,08:1 / 3,36:1\",\"entre_eixos\":\"4.600 / 4.800 / 5.000\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.600 / 4.800 / 5.000\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"tipo_carroceria\\\":\\\"Chassi-Cabine\\\",\\\"emissoes\\\":\\\"Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Rodoviário\\\"}\",\"atualizado_em\":\"2026-07-16 10:45:26\",\"familia_nome\":\"Meteor\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":4}', '2026-07-16 10:45:26', '2026-07-29 03:15:08'),
(26, 6, 'modelo', NULL, 131, 'DAF · Linha XF · XF FTT 6X4 530 cv', NULL, '{\"id\":131,\"nome\":\"XF FTT 6X4 530 cv\",\"descricao\":\"Esse modelo apresenta diferentes formas de calibração, checar na ficha técnica\\nRelação de diferencial 2,80 3,07 3,42\",\"motor\":\"PACCAR MX 13\",\"potencia\":\"530 cv - 390 kW (1.675 rpm)\",\"torque\":\"2.500 / 2.600 Nm @1.000 - 1.425 rpm\",\"transmissao\":\"ZF TRAXON Automatizada – Direct Drive 12  a frente + 2 à ré\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"2,80:1 / 3,07:1 / 3,42:1\",\"entre_eixos\":\"3.200\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"3.200\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-21 09:24:39\",\"familia_nome\":\"Linha XF\",\"marca_nome\":\"DAF\",\"_score\":1}', '2026-07-21 09:24:39', '2026-07-29 03:15:08'),
(27, 6, 'modelo', NULL, 130, 'DAF · Linha CF Semipesado Rígido · CF FAS PX-7 290 cv', NULL, '{\"id\":130,\"nome\":\"CF FAS PX-7 290 cv\",\"descricao\":\"Esse modelo apresenta três possíveis calibrações do motor, verificar na ficha técnica.\\nRelação de diferencial 3,73 - 4,10\",\"motor\":\"PACCAR PX-7\",\"potencia\":\"290 cv - 213 kW (2.300 rpm)\",\"torque\":\"1.100 Nm @1.100 - 1.600 rpm\",\"transmissao\":\"ZF Automatizada OU manual – Direct Drive 9 a frente + 1 à ré\",\"pbt\":\"23.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1 / 4,10:1\",\"entre_eixos\":\"4.900 / 5.300\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.900 / 5.300\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x2, chassi-cabine\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-21 09:16:32\",\"familia_nome\":\"Linha CF Semipesado Rígido\",\"marca_nome\":\"DAF\",\"_score\":1}', '2026-07-21 09:16:32', '2026-07-29 03:15:08'),
(28, 7, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:18:21'),
(29, 7, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:18:21'),
(30, 7, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:18:21'),
(31, 7, 'video', 3, NULL, 'DM & RM', NULL, 'Função para ajudar a manobrar o veículo', '2026-07-16 15:46:45', '2026-07-29 03:18:21'),
(32, 8, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:23:08'),
(33, 8, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:23:08'),
(34, 8, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:23:08'),
(35, 8, 'video', 3, NULL, 'DM & RM', NULL, 'Função para ajudar a manobrar o veículo', '2026-07-16 15:46:45', '2026-07-29 03:23:08'),
(36, 8, 'modelo', NULL, 77, 'Mercedes-Benz · Novo Accelo · Accelo 917', NULL, '{\"id\":77,\"nome\":\"Accelo 917\",\"descricao\":\"Versão Accelo 917 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Mercedes-Benz OM 924 4,8 l\",\"potencia\":\"163 cv\",\"torque\":\"610 Nm\",\"transmissao\":\"\",\"pbt\":\"9.600 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Novo Accelo\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":3}', '2026-07-18 21:03:44', '2026-07-29 03:23:08'),
(37, 8, 'modelo', NULL, 78, 'Mercedes-Benz · Novo Accelo · Accelo 1117', NULL, '{\"id\":78,\"nome\":\"Accelo 1117\",\"descricao\":\"Versão Accelo 1117 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Mercedes-Benz OM 924 4,8 l\",\"potencia\":\"163 cv\",\"torque\":\"610 Nm\",\"transmissao\":\"\",\"pbt\":\"10.700 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Novo Accelo\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":3}', '2026-07-18 21:03:44', '2026-07-29 03:23:08'),
(38, 8, 'modelo', NULL, 79, 'Mercedes-Benz · Novo Accelo · Accelo 1317', NULL, '{\"id\":79,\"nome\":\"Accelo 1317\",\"descricao\":\"Versão Accelo 1317 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Mercedes-Benz OM 924 4,8 l\",\"potencia\":\"163 cv\",\"torque\":\"610 Nm\",\"transmissao\":\"\",\"pbt\":\"13.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x2\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Novo Accelo\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":3}', '2026-07-18 21:03:44', '2026-07-29 03:23:08'),
(39, 8, 'modelo', NULL, 80, 'Mercedes-Benz · Novo Accelo · Accelo 1417', NULL, '{\"id\":80,\"nome\":\"Accelo 1417\",\"descricao\":\"Versão Accelo 1417 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Mercedes-Benz OM 924 4,8 l\",\"potencia\":\"163 cv\",\"torque\":\"610 Nm\",\"transmissao\":\"\",\"pbt\":\"14.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x2\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Novo Accelo\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":3}', '2026-07-18 21:03:44', '2026-07-29 03:23:08'),
(40, 8, 'modelo', NULL, 81, 'Mercedes-Benz · Atego · Atego 1719 K 4x2', NULL, '{\"id\":81,\"nome\":\"Atego 1719 K 4x2\",\"descricao\":\"Versão Atego 1719 K 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Mercedes-Benz OM 924\",\"potencia\":\"185 cv\",\"torque\":\"\",\"transmissao\":\"PowerShift 3 automatizada\",\"pbt\":\"17.100 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2 basculante\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Atego\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":3}', '2026-07-18 21:03:44', '2026-07-29 03:23:08');
INSERT INTO `assistente_interacao_fontes` (`id`, `interacao_id`, `tipo`, `video_id`, `modelo_id`, `titulo`, `transcricao_snapshot`, `conteudo_snapshot`, `fonte_atualizada_em`, `criado_em`) VALUES
(41, 9, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:24:09'),
(42, 9, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:24:09'),
(43, 9, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:24:09'),
(44, 9, 'video', 3, NULL, 'DM & RM', NULL, 'Função para ajudar a manobrar o veículo', '2026-07-16 15:46:45', '2026-07-29 03:24:09'),
(45, 9, 'modelo', NULL, 29, 'Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 28.480HD', NULL, '{\"id\":29,\"nome\":\"Meteor 6x4 28.480HD\",\"descricao\":\"Modelo Novo Meteor Highline 28.480HD da família Volkswagen Meteor.\",\"motor\":\"MAN / D2676LFAG\",\"potencia\":\"475 (350) @ 1.800\",\"torque\":\"2.400 @ 930 - 1.350\",\"transmissao\":\"ZF / 12TX 2624 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"58.500 kg\",\"relacao_reducao\":\"2,85:1 / 3,08:1 / 3,40:1\",\"entre_eixos\":\"4.600\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.600\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:54\",\"familia_nome\":\"Meteor\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":4}', '2026-07-16 11:41:54', '2026-07-29 03:24:09'),
(46, 9, 'modelo', NULL, 4, 'Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530', NULL, '{\"id\":4,\"nome\":\"Meteor 6x4 29.530\",\"descricao\":\"Modelo Novo Meteor Highline 29.530 da família Volkswagen Meteor.\\nRelação  de redução 3,08:1 e  3,36:1\",\"motor\":\"MAN / D2676LFAD\",\"potencia\":\"525 (386) @ 1.800\",\"torque\":\"2.600 @ 930 - 1.350\",\"transmissao\":\"ZF / 12TX 2624 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,08:1 / 3,36:1\",\"entre_eixos\":\"4.600 / 4.800 / 5.000\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.600 / 4.800 / 5.000\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"tipo_carroceria\\\":\\\"Chassi-Cabine\\\",\\\"emissoes\\\":\\\"Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Rodoviário\\\"}\",\"atualizado_em\":\"2026-07-16 10:45:26\",\"familia_nome\":\"Meteor\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":4}', '2026-07-16 10:45:26', '2026-07-29 03:24:09'),
(47, 10, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:24:46'),
(48, 10, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:24:46'),
(49, 10, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:24:46'),
(50, 10, 'video', 3, NULL, 'DM & RM', NULL, 'Função para ajudar a manobrar o veículo', '2026-07-16 15:46:45', '2026-07-29 03:24:46'),
(51, 11, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:25:02'),
(52, 11, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:25:02'),
(53, 11, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:25:02'),
(54, 11, 'video', 3, NULL, 'DM & RM', NULL, 'Função para ajudar a manobrar o veículo', '2026-07-16 15:46:45', '2026-07-29 03:25:02'),
(55, 12, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:25:31'),
(56, 12, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:25:31'),
(57, 12, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:25:31'),
(58, 12, 'video', 3, NULL, 'DM & RM', NULL, 'Função para ajudar a manobrar o veículo', '2026-07-16 15:46:45', '2026-07-29 03:25:31'),
(59, 13, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:33:18'),
(60, 13, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-29 03:33:18'),
(61, 13, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:33:18'),
(62, 13, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:33:18'),
(63, 14, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 03:33:33'),
(64, 14, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-29 03:33:33'),
(65, 14, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-29 03:33:33'),
(66, 14, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-29 03:33:33'),
(67, 15, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-29 03:33:51'),
(68, 15, 'modelo', NULL, 53, 'IVECO · Tector · Tector 9-190', NULL, '{\"id\":53,\"nome\":\"Tector 9-190\",\"descricao\":\"Versão Tector 9-190 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT NEF4 4,5 l\",\"potencia\":\"190 cv @ 2.200–2.500 rpm\",\"torque\":\"610 Nm @ 1.200–2.100 rpm\",\"transmissao\":\"Eaton ESO6106B manual, 6 marchas\",\"pbt\":\"8.600 kg\",\"pbtc\":\"11.000 kg\",\"relacao_reducao\":\"4,30:1\",\"entre_eixos\":\"3.906 / 4.460\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Tector/Semipesados\\\",\\\"entre_eixos\\\":\\\"3.906 / 4.460\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Tector\",\"marca_nome\":\"IVECO\",\"_score\":4}', '2026-07-18 21:03:44', '2026-07-29 03:33:51'),
(69, 15, 'modelo', NULL, 54, 'IVECO · Tector · Tector 11-190', NULL, '{\"id\":54,\"nome\":\"Tector 11-190\",\"descricao\":\"Versão Tector 11-190 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT NEF4 4,5 l\",\"potencia\":\"190 cv @ 2.200–2.500 rpm\",\"torque\":\"610 Nm @ 1.200–2.100 rpm\",\"transmissao\":\"Eaton ESO6106B manual, 6 marchas\",\"pbt\":\"10.600 kg\",\"pbtc\":\"13.000 kg\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"3.886 / 4.441\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Tector/Semipesados\\\",\\\"entre_eixos\\\":\\\"3.886 / 4.441\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Tector\",\"marca_nome\":\"IVECO\",\"_score\":4}', '2026-07-18 21:03:44', '2026-07-29 03:33:51'),
(70, 15, 'modelo', NULL, 55, 'IVECO · Tector · Tector 15-210', NULL, '{\"id\":55,\"nome\":\"Tector 15-210\",\"descricao\":\"Versão Tector 15-210 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT NEF4 4,5 l\",\"potencia\":\"207 cv @ 2.100–2.500 rpm\",\"torque\":\"720 Nm @ 1.300–1.900 rpm\",\"transmissao\":\"Eaton FS 5406A manual, 6 marchas\",\"pbt\":\"15.400 kg\",\"pbtc\":\"27.000 kg\",\"relacao_reducao\":\"4,10:1 / 5,72:1\",\"entre_eixos\":\"4.104 / 4.735\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Tector/Semipesados\\\",\\\"entre_eixos\\\":\\\"4.104 / 4.735\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Tector\",\"marca_nome\":\"IVECO\",\"_score\":4}', '2026-07-18 21:03:44', '2026-07-29 03:33:51'),
(71, 15, 'modelo', NULL, 56, 'IVECO · Tector · Tector 17-320', NULL, '{\"id\":56,\"nome\":\"Tector 17-320\",\"descricao\":\"Versão Tector 17-320 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT NEF6 6,7 l\",\"potencia\":\"320 cv @ 2.200–2.500 rpm\",\"torque\":\"1.100 Nm @ 1.300–1.900 rpm\",\"transmissao\":\"Eaton MHD EVO AutoShift, 10 marchas\",\"pbt\":\"16.000 kg\",\"pbtc\":\"33.000 kg\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"4.188 / 4.818\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Tector/Semipesados\\\",\\\"entre_eixos\\\":\\\"4.188 / 4.818\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Tector\",\"marca_nome\":\"IVECO\",\"_score\":4}', '2026-07-18 21:03:44', '2026-07-29 03:33:51'),
(72, 15, 'modelo', NULL, 57, 'IVECO · Tector · Tector 17-320T', NULL, '{\"id\":57,\"nome\":\"Tector 17-320T\",\"descricao\":\"Versão Tector 17-320T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT NEF6 6,7 l\",\"potencia\":\"320 cv @ 2.200–2.500 rpm\",\"torque\":\"1.100 Nm @ 1.300–1.900 rpm\",\"transmissao\":\"Eaton MHD EVO AutoShift, 10 marchas\",\"pbt\":\"16.000 kg\",\"pbtc\":\"35.000 kg\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"3.693\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Tector/Semipesados\\\",\\\"entre_eixos\\\":\\\"3.693\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Tector\",\"marca_nome\":\"IVECO\",\"_score\":4}', '2026-07-18 21:03:44', '2026-07-29 03:33:51'),
(73, 30, 'frota', NULL, NULL, 'Presença de marcas', NULL, '{\"answer\":\"Não encontrei frota cadastrada para a região ou escopo informado.\",\"title\":\"Presença de marcas\",\"rows\":[],\"action\":null}', '2026-07-29 03:07:34', '2026-07-29 06:07:35'),
(74, 30, 'modelo', NULL, 103, 'Scania · Linha R · Scania R 500 6x4 Super', NULL, '{\"id\":103,\"nome\":\"Scania R 500 6x4 Super\",\"descricao\":\"Versão Scania R 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"DC13 174\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.650 Nm @ 900–1.320 rpm\",\"transmissao\":\"Scania Opticruise G25/G33\",\"pbt\":\"23.000 Kg\",\"pbtc\":\"74.000 Kg\",\"relacao_reducao\":\"3,07:1 | 3,42:1\",\"entre_eixos\":\"3.550\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\\\",\\\"entre_eixos\\\":\\\"3.550\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"7.110 mm\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Linha R\",\"marca_nome\":\"Scania\",\"_score\":28}', '2026-07-18 21:03:44', '2026-07-29 06:07:35'),
(75, 30, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":27}', '2026-07-25 16:26:03', '2026-07-29 06:07:35'),
(76, 30, 'modelo', NULL, 65, 'IVECO · S-Way · S-Way 540 6x4', NULL, '{\"id\":65,\"nome\":\"S-Way 540 6x4\",\"descricao\":\"Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT Cursor 13 12,9 l\",\"potencia\":\"540 cv @ 1.500–1.900 rpm\",\"torque\":\"2.550 Nm @ 1.000–1.500 rpm\",\"transmissao\":\"ZF TraXon 12TX2624TD automatizada, 12 marchas\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"3,07:1\",\"entre_eixos\":\"3.540\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.540\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Pesados-S-Way\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"S-Way\",\"marca_nome\":\"IVECO\",\"_score\":26}', '2026-07-18 21:03:44', '2026-07-29 06:07:35'),
(77, 30, 'modelo', NULL, 131, 'DAF · Linha XF · XF FTT 6X4 530 cv', NULL, '{\"id\":131,\"nome\":\"XF FTT 6X4 530 cv\",\"descricao\":\"Esse modelo apresenta diferentes formas de calibração, checar na ficha técnica\\nRelação de diferencial 2,80 3,07 3,42\",\"motor\":\"PACCAR MX 13\",\"potencia\":\"530 cv - 390 kW (1.675 rpm)\",\"torque\":\"2.500 / 2.600 Nm @1.000 - 1.425 rpm\",\"transmissao\":\"ZF TRAXON Automatizada – Direct Drive 12  a frente + 2 à ré\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"2,80:1 / 3,07:1 / 3,42:1\",\"entre_eixos\":\"3.200\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"3.200\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-21 09:24:39\",\"familia_nome\":\"Linha XF\",\"marca_nome\":\"DAF\",\"_score\":25}', '2026-07-21 09:24:39', '2026-07-29 06:07:35'),
(78, 30, 'modelo', NULL, 68, 'Volvo · FH · FH 500 6x2T', NULL, '{\"id\":68,\"nome\":\"FH 500 6x2T\",\"descricao\":\"Versão FH 500 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"500 cv @ 1.400–1.800 rpm\",\"torque\":\"2.500 Nm @ 980–1.400 rpm\",\"transmissao\":\"I-Shift AT2612 G automatizada, 12 marchas\",\"pbt\":\"28.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x2T, suspensão pneumática\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"3.000 / 3.200 / 3.500 / 3.700\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FH\",\"marca_nome\":\"Volvo\",\"_score\":25}', '2026-07-18 21:03:44', '2026-07-29 06:07:35'),
(79, 51, 'frota', NULL, NULL, 'Ranking de marcas por frota', NULL, '{\"answer\":\"As marcas com maior presença no seu escopo são:\\n\\n1º Volvo — 77 veículo(s) em 1 cliente(s)\\n2º Scania — 2 veículo(s) em 1 cliente(s)\\n3º Volkswagen Caminhões e Ônibus — 1 veículo(s) em 1 cliente(s)\",\"title\":\"Ranking de marcas por frota\",\"rows\":[{\"id\":3,\"marca\":\"Volvo\",\"veiculos\":\"77\",\"clientes\":1},{\"id\":5,\"marca\":\"Scania\",\"veiculos\":\"2\",\"clientes\":1},{\"id\":1,\"marca\":\"Volkswagen Caminhões e Ônibus\",\"veiculos\":\"1\",\"clientes\":1}],\"action\":{\"type\":\"fleet\",\"label\":\"Abrir Minha Frota\",\"route\":\"frota\",\"query\":[]}}', '2026-07-29 17:26:25', '2026-07-29 20:26:25'),
(80, 51, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-29 20:26:25'),
(81, 51, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 20:26:25'),
(82, 51, 'modelo', NULL, 68, 'Volvo · FH · FH 500 6x2T', NULL, '{\"id\":68,\"nome\":\"FH 500 6x2T\",\"descricao\":\"Versão FH 500 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"500 cv @ 1.400–1.800 rpm\",\"torque\":\"2.500 Nm @ 980–1.400 rpm\",\"transmissao\":\"I-Shift AT2612 G automatizada, 12 marchas\",\"pbt\":\"28.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x2T, suspensão pneumática\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"3.000 / 3.200 / 3.500 / 3.700\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FH\",\"marca_nome\":\"Volvo\",\"_score\":24}', '2026-07-18 21:03:44', '2026-07-29 20:26:25'),
(83, 51, 'modelo', NULL, 134, 'Mercedes-Benz · O 500 Urbanos · O 500 UA 2938', NULL, '{\"id\":134,\"nome\":\"O 500 UA 2938\",\"descricao\":\"Chassi articulado 6x2 de entrada baixa para operações urbanas de alta capacidade.\",\"motor\":\"MB OM 460 LA 12,8 l\",\"potencia\":\"381 cv (280 kW) @ 1.600 rpm\",\"torque\":\"1.900 Nm @ 1.100 rpm\",\"transmissao\":\"ZF EcoLife AP 2020 B, 6 marchas, ou Voith DIWA 6 D884.6\",\"pbt\":\"29.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"7,73:1 / 6,00:1\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"Até 18,6 m\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"6x2 articulado, entrada baixa\\\",\\\"fonte_pagina\\\":\\\"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"Até 135 passageiros\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"O 500 Urbanos\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":16}', '2026-07-25 16:26:03', '2026-07-29 20:26:25'),
(84, 51, 'modelo', NULL, 135, 'Mercedes-Benz · O 500 Rodoviários · O 500 RSDD 2745/30', NULL, '{\"id\":135,\"nome\":\"O 500 RSDD 2745/30\",\"descricao\":\"Chassi rodoviário 8x2 para média e longa distância, com pacote de segurança ativa.\",\"motor\":\"MB OM 460 LA 12,8 l\",\"potencia\":\"449 cv (330 kW) @ 1.600 rpm\",\"torque\":\"2.200 Nm @ 1.100 rpm\",\"transmissao\":\"ZF TraXon automatizada, 12 marchas\",\"pbt\":\"27.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"2,533:1 / 2,846:1\",\"entre_eixos\":\"3.000\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"15,0 m\\\",\\\"entre_eixos\\\":\\\"3.000\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"8x2 rodoviário\\\",\\\"fonte_pagina\\\":\\\"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"Até 68 passageiros\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"O 500 Rodoviários\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":16}', '2026-07-25 16:26:03', '2026-07-29 20:26:25'),
(85, 51, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":16}', '2026-07-25 16:26:03', '2026-07-29 20:26:25'),
(86, 51, 'modelo', NULL, 119, 'Mercedes-Benz · eO500 · Mercedes-Benz eO500U', NULL, '{\"id\":119,\"nome\":\"Mercedes-Benz eO500U\",\"descricao\":\"Primeiro chassi de ônibus de propulsão elétrica produzido pela Mercedes-Benz do Brasil, com piso baixo e configuração modular de baterias.\",\"motor\":\"Dois motores assíncronos integrados ao eixo traseiro\",\"potencia\":\"250 kW / 340 cv (total)\",\"torque\":\"2 × 485 Nm\",\"transmissao\":\"Tração elétrica direta\",\"pbt\":\"21.200 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"3 a 6 pacotes NMC de 98 kWh; até 588 kWh\\\",\\\"energia\\\":\\\"100% elétrico\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"autonomia\\\":\\\"Até 270 km\\\",\\\"comprimento\\\":\\\"Carroceria de até 13,2 m\\\",\\\"carregamento\\\":\\\"CCS2, até 150 kW; recarga completa em até 3 horas\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, piso baixo\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u\\\",\\\"fonte_imagem_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/content-block/main/img-8948-20250710-182437-925-FCE2-20250710-181407-792-85A6_eo500u-sobre.jpg.webp\\\",\\\"capacidade_passageiros\\\":\\\"Mais de 80 passageiros nas configurações de 3 a 5 baterias\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Zero emissão local\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:22\",\"familia_nome\":\"eO500\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":16}', '2026-07-18 21:04:22', '2026-07-29 20:26:25'),
(87, 54, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-29 20:27:02'),
(88, 54, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 20:27:02');
INSERT INTO `assistente_interacao_fontes` (`id`, `interacao_id`, `tipo`, `video_id`, `modelo_id`, `titulo`, `transcricao_snapshot`, `conteudo_snapshot`, `fonte_atualizada_em`, `criado_em`) VALUES
(89, 54, 'modelo', NULL, 103, 'Scania · Linha R · Scania R 500 6x4 Super', NULL, '{\"id\":103,\"nome\":\"Scania R 500 6x4 Super\",\"descricao\":\"Versão Scania R 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"DC13 174\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.650 Nm @ 900–1.320 rpm\",\"transmissao\":\"Scania Opticruise G25/G33\",\"pbt\":\"23.000 Kg\",\"pbtc\":\"74.000 Kg\",\"relacao_reducao\":\"3,07:1 | 3,42:1\",\"entre_eixos\":\"3.550\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\\\",\\\"entre_eixos\\\":\\\"3.550\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"7.110 mm\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Linha R\",\"marca_nome\":\"Scania\",\"_score\":15}', '2026-07-18 21:03:44', '2026-07-29 20:27:02'),
(90, 54, 'modelo', NULL, 131, 'DAF · Linha XF · XF FTT 6X4 530 cv', NULL, '{\"id\":131,\"nome\":\"XF FTT 6X4 530 cv\",\"descricao\":\"Esse modelo apresenta diferentes formas de calibração, checar na ficha técnica\\nRelação de diferencial 2,80 3,07 3,42\",\"motor\":\"PACCAR MX 13\",\"potencia\":\"530 cv - 390 kW (1.675 rpm)\",\"torque\":\"2.500 / 2.600 Nm @1.000 - 1.425 rpm\",\"transmissao\":\"ZF TRAXON Automatizada – Direct Drive 12  a frente + 2 à ré\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"2,80:1 / 3,07:1 / 3,42:1\",\"entre_eixos\":\"3.200\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"3.200\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-21 09:24:39\",\"familia_nome\":\"Linha XF\",\"marca_nome\":\"DAF\",\"_score\":12}', '2026-07-21 09:24:39', '2026-07-29 20:27:02'),
(91, 54, 'modelo', NULL, 65, 'IVECO · S-Way · S-Way 540 6x4', NULL, '{\"id\":65,\"nome\":\"S-Way 540 6x4\",\"descricao\":\"Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT Cursor 13 12,9 l\",\"potencia\":\"540 cv @ 1.500–1.900 rpm\",\"torque\":\"2.550 Nm @ 1.000–1.500 rpm\",\"transmissao\":\"ZF TraXon 12TX2624TD automatizada, 12 marchas\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"3,07:1\",\"entre_eixos\":\"3.540\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.540\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Pesados-S-Way\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"S-Way\",\"marca_nome\":\"IVECO\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 20:27:02'),
(92, 54, 'modelo', NULL, 71, 'Volvo · FMX · FMX 420 6x4R', NULL, '{\"id\":71,\"nome\":\"FMX 420 6x4R\",\"descricao\":\"Versão FMX 420 6x4R cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"420 cv @ 1.400–1.800 rpm\",\"torque\":\"2.100 Nm @ 905–1.400 rpm\",\"transmissao\":\"I-Shift automatizada\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4 rígido\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FMX\",\"marca_nome\":\"Volvo\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 20:27:02'),
(93, 54, 'modelo', NULL, 72, 'Volvo · FMX · FMX 460 6x4T', NULL, '{\"id\":72,\"nome\":\"FMX 460 6x4T\",\"descricao\":\"Versão FMX 460 6x4T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"460 cv @ 1.400–1.800 rpm\",\"torque\":\"2.300 Nm @ 945–1.400 rpm\",\"transmissao\":\"I-Shift automatizada\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FMX\",\"marca_nome\":\"Volvo\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 20:27:02'),
(94, 57, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-29 20:27:40'),
(95, 57, 'modelo', NULL, 103, 'Scania · Linha R · Scania R 500 6x4 Super', NULL, '{\"id\":103,\"nome\":\"Scania R 500 6x4 Super\",\"descricao\":\"Versão Scania R 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"DC13 174\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.650 Nm @ 900–1.320 rpm\",\"transmissao\":\"Scania Opticruise G25/G33\",\"pbt\":\"23.000 Kg\",\"pbtc\":\"74.000 Kg\",\"relacao_reducao\":\"3,07:1 | 3,42:1\",\"entre_eixos\":\"3.550\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\\\",\\\"entre_eixos\\\":\\\"3.550\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"7.110 mm\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Linha R\",\"marca_nome\":\"Scania\",\"_score\":15}', '2026-07-18 21:03:44', '2026-07-29 20:27:40'),
(96, 57, 'modelo', NULL, 131, 'DAF · Linha XF · XF FTT 6X4 530 cv', NULL, '{\"id\":131,\"nome\":\"XF FTT 6X4 530 cv\",\"descricao\":\"Esse modelo apresenta diferentes formas de calibração, checar na ficha técnica\\nRelação de diferencial 2,80 3,07 3,42\",\"motor\":\"PACCAR MX 13\",\"potencia\":\"530 cv - 390 kW (1.675 rpm)\",\"torque\":\"2.500 / 2.600 Nm @1.000 - 1.425 rpm\",\"transmissao\":\"ZF TRAXON Automatizada – Direct Drive 12  a frente + 2 à ré\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"2,80:1 / 3,07:1 / 3,42:1\",\"entre_eixos\":\"3.200\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"3.200\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-21 09:24:39\",\"familia_nome\":\"Linha XF\",\"marca_nome\":\"DAF\",\"_score\":12}', '2026-07-21 09:24:39', '2026-07-29 20:27:40'),
(97, 57, 'modelo', NULL, 65, 'IVECO · S-Way · S-Way 540 6x4', NULL, '{\"id\":65,\"nome\":\"S-Way 540 6x4\",\"descricao\":\"Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"FPT Cursor 13 12,9 l\",\"potencia\":\"540 cv @ 1.500–1.900 rpm\",\"torque\":\"2.550 Nm @ 1.000–1.500 rpm\",\"transmissao\":\"ZF TraXon 12TX2624TD automatizada, 12 marchas\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"3,07:1\",\"entre_eixos\":\"3.540\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.540\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.iveco.com/brasil/Pesados-S-Way\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"S-Way\",\"marca_nome\":\"IVECO\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 20:27:40'),
(98, 57, 'modelo', NULL, 71, 'Volvo · FMX · FMX 420 6x4R', NULL, '{\"id\":71,\"nome\":\"FMX 420 6x4R\",\"descricao\":\"Versão FMX 420 6x4R cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"420 cv @ 1.400–1.800 rpm\",\"torque\":\"2.100 Nm @ 905–1.400 rpm\",\"transmissao\":\"I-Shift automatizada\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4 rígido\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FMX\",\"marca_nome\":\"Volvo\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 20:27:40'),
(99, 57, 'modelo', NULL, 72, 'Volvo · FMX · FMX 460 6x4T', NULL, '{\"id\":72,\"nome\":\"FMX 460 6x4T\",\"descricao\":\"Versão FMX 460 6x4T cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"460 cv @ 1.400–1.800 rpm\",\"torque\":\"2.300 Nm @ 945–1.400 rpm\",\"transmissao\":\"I-Shift automatizada\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4, cavalo mecânico\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Cavalo mecânico\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FMX\",\"marca_nome\":\"Volvo\",\"_score\":12}', '2026-07-18 21:03:44', '2026-07-29 20:27:40'),
(100, 62, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-30 11:40:14'),
(101, 62, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-30 11:40:14'),
(102, 62, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-30 11:40:14'),
(103, 62, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-30 11:40:14'),
(104, 62, 'modelo', NULL, 6, 'Volkswagen Caminhões e Ônibus · Delivery · Delivery 6.170', NULL, '{\"id\":6,\"nome\":\"Delivery 6.170\",\"descricao\":\"Modelo Delivery 6.170 da família Volkswagen Delivery.\",\"motor\":\"F1C 3.0l\",\"potencia\":\"156 cv @ 3.300 rpm\",\"torque\":\"430 Nm @ 1.400 - 2.700 rpm\",\"transmissao\":\"Manual - Eaton / ESO 4206\",\"pbt\":\"5.850 kg\",\"pbtc\":\"6.900 kg\",\"relacao_reducao\":\"5,13:1 / 4,78:1\",\"entre_eixos\":\"4.000\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.000\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:51\",\"familia_nome\":\"Delivery\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":24}', '2026-07-16 11:41:51', '2026-07-30 11:40:14'),
(105, 62, 'modelo', NULL, 41, 'Volkswagen Caminhões e Ônibus · Rodoviário · Volksbus 17.230 / S', NULL, '{\"id\":41,\"nome\":\"Volksbus 17.230 / S\",\"descricao\":\"Modelo Volksbus 17.230 / S da família Volkswagen Rodoviário.\",\"motor\":\"MAN / D0834\",\"potencia\":\"225 (166) @ 2.300\",\"torque\":\"850 @ 1.300 - 1.800\",\"transmissao\":\"ZF 8AP900B / ZF 6S1010BO\",\"pbt\":\"17.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 12:56:33\",\"familia_nome\":\"Rodoviário\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":22}', '2026-07-16 12:56:33', '2026-07-30 11:40:14'),
(106, 62, 'modelo', NULL, 9, 'Volkswagen Caminhões e Ônibus · Delivery · Delivery 14.180', NULL, '{\"id\":9,\"nome\":\"Delivery 14.180\",\"descricao\":\"Modelo Delivery 14.180 da família Volkswagen Delivery.\",\"motor\":\"Cummins / ISF 3.8l\",\"potencia\":\"175 (129) @ 2.500\",\"torque\":\"600 @ 1.100 - 1.800\",\"transmissao\":\"Eaton / ESO 6206A\",\"pbt\":\"14.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:52\",\"familia_nome\":\"Delivery\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:52', '2026-07-30 11:40:14'),
(107, 62, 'modelo', NULL, 7, 'Volkswagen Caminhões e Ônibus · Delivery · Delivery 9.180', NULL, '{\"id\":7,\"nome\":\"Delivery 9.180\",\"descricao\":\"Modelo Delivery 9.180 da família Volkswagen Delivery.\",\"motor\":\"Cummins / ISF 3.8l\",\"potencia\":\"175 (129) @ 2.500\",\"torque\":\"600 @ 1.100 - 1.800\",\"transmissao\":\"Manual Eaton ESO 6106 / Automatizada EAO 6106\",\"pbt\":\"9.200 kg\",\"pbtc\":\"11.500 kg\",\"relacao_reducao\":\"4,10:1 / 4,30:1\",\"entre_eixos\":\"3.400 / 4.000 / 4.400 / 4.600\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"3.400 / 4.000 / 4.400 / 4.600\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:51\",\"familia_nome\":\"Delivery\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:51', '2026-07-30 11:40:14'),
(108, 62, 'modelo', NULL, 8, 'Volkswagen Caminhões e Ônibus · Delivery · Delivery 11.180 4x4', NULL, '{\"id\":8,\"nome\":\"Delivery 11.180 4x4\",\"descricao\":\"Modelo Delivery 11.180 4x4 da família Volkswagen Delivery.\",\"motor\":\"Cummins / ISF 3.8l\",\"potencia\":\"175 (129) @ 2.500\",\"torque\":\"600 @ 1.100 - 1.800\",\"transmissao\":\"Eaton / ESO 6106A\",\"pbt\":\"10.800 kg\",\"pbtc\":\"13.200 kg\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.000\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.000\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x4, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:51\",\"familia_nome\":\"Delivery\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:51', '2026-07-30 11:40:14'),
(109, 65, 'frota', NULL, NULL, 'Ranking de marcas por frota', NULL, '{\"answer\":\"As marcas com maior presença no seu escopo são:\\n\\n1º Volvo — 77 veículo(s) em 1 cliente(s)\\n2º Scania — 2 veículo(s) em 1 cliente(s)\\n3º Volkswagen Caminhões e Ônibus — 1 veículo(s) em 1 cliente(s)\",\"title\":\"Ranking de marcas por frota\",\"rows\":[{\"id\":3,\"marca\":\"Volvo\",\"veiculos\":\"77\",\"clientes\":1},{\"id\":5,\"marca\":\"Scania\",\"veiculos\":\"2\",\"clientes\":1},{\"id\":1,\"marca\":\"Volkswagen Caminhões e Ônibus\",\"veiculos\":\"1\",\"clientes\":1}],\"action\":{\"type\":\"fleet\",\"label\":\"Abrir Minha Frota\",\"route\":\"frota\",\"query\":[]}}', '2026-07-30 08:41:25', '2026-07-30 11:41:25'),
(110, 65, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-30 11:41:25'),
(111, 65, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-30 11:41:25'),
(112, 65, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-30 11:41:25'),
(113, 65, 'modelo', NULL, 41, 'Volkswagen Caminhões e Ônibus · Rodoviário · Volksbus 17.230 / S', NULL, '{\"id\":41,\"nome\":\"Volksbus 17.230 / S\",\"descricao\":\"Modelo Volksbus 17.230 / S da família Volkswagen Rodoviário.\",\"motor\":\"MAN / D0834\",\"potencia\":\"225 (166) @ 2.300\",\"torque\":\"850 @ 1.300 - 1.800\",\"transmissao\":\"ZF 8AP900B / ZF 6S1010BO\",\"pbt\":\"17.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 12:56:33\",\"familia_nome\":\"Rodoviário\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":25}', '2026-07-16 12:56:33', '2026-07-30 11:41:25'),
(114, 65, 'modelo', NULL, 34, 'Volkswagen Caminhões e Ônibus · Urbano · Volksbus 17.230 / S', NULL, '{\"id\":34,\"nome\":\"Volksbus 17.230 / S\",\"descricao\":\"Modelo Volksbus 17.230 / S da família Volkswagen Urbano.\",\"motor\":\"MAN / D0834\",\"potencia\":\"225 (166) @ 2.300\",\"torque\":\"850 @ 1.300 - 1.800\",\"transmissao\":\"ZF 8AP900B / ZF 6S1010BO\",\"pbt\":\"16.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 12:56:29\",\"familia_nome\":\"Urbano\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":21}', '2026-07-16 12:56:29', '2026-07-30 11:41:25'),
(115, 65, 'modelo', NULL, 133, 'Mercedes-Benz · OF Urbanos e Fretamento · OF 1721L/59', NULL, '{\"id\":133,\"nome\":\"OF 1721L/59\",\"descricao\":\"Chassi 4x2 de piso alto e suspensão pneumática para uso urbano, fretamento e rodoviário de curta distância.\",\"motor\":\"MB OM 924 LA 4,8 l\",\"potencia\":\"208 cv (153 kW) @ 2.200 rpm\",\"torque\":\"780 Nm @ 1.200–1.600 rpm\",\"transmissao\":\"MB G 90-6 manual, 6 marchas\",\"pbt\":\"17.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"5,875:1 / 5,222:1\",\"entre_eixos\":\"5.950\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"11,3 m ou 12,7 a 13,2 m\\\",\\\"entre_eixos\\\":\\\"5.950\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, piso alto\\\",\\\"fonte_pagina\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/of-1721l\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"70 a 80 passageiros\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"OF Urbanos e Fretamento\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":18}', '2026-07-25 16:26:03', '2026-07-30 11:41:25'),
(116, 65, 'modelo', NULL, 42, 'Volkswagen Caminhões e Ônibus · Rodoviário · Volksbus 17.260 / S', NULL, '{\"id\":42,\"nome\":\"Volksbus 17.260 / S\",\"descricao\":\"Modelo Volksbus 17.260 / S da família Volkswagen Rodoviário.\",\"motor\":\"MAN / D0836LF18\",\"potencia\":\"260 (191) @ 2.200\",\"torque\":\"950 @ 1.000 - 1.800\",\"transmissao\":\"ZF 8AP900B / ZF 6S1010BO\",\"pbt\":\"17.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"4x2, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 12:56:33\",\"familia_nome\":\"Rodoviário\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":17}', '2026-07-16 12:56:33', '2026-07-30 11:41:25'),
(117, 65, 'modelo', NULL, 81, 'Mercedes-Benz · Atego · Atego 1719 K 4x2', NULL, '{\"id\":81,\"nome\":\"Atego 1719 K 4x2\",\"descricao\":\"Versão Atego 1719 K 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Mercedes-Benz OM 924\",\"potencia\":\"185 cv\",\"torque\":\"\",\"transmissao\":\"PowerShift 3 automatizada\",\"pbt\":\"17.100 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2 basculante\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/caminhoes/\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"Atego\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":13}', '2026-07-18 21:03:44', '2026-07-30 11:41:25'),
(118, 68, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-30 11:43:13'),
(119, 68, 'video', 7, NULL, 'RIO - PLATAFORMA VISÃO GERAL', NULL, 'Tendo seu primeiro contato com o serviço RIO e sua plataforma.', '2026-07-29 17:23:47', '2026-07-30 11:43:13'),
(120, 68, 'video', 6, NULL, 'RIO - MONITOR DE FROTAS', NULL, 'Aprendendo a área de monitor de frotas do RIO', '2026-07-29 17:33:37', '2026-07-30 11:43:13'),
(121, 68, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-30 11:43:13'),
(122, 68, 'modelo', NULL, 135, 'Mercedes-Benz · O 500 Rodoviários · O 500 RSDD 2745/30', NULL, '{\"id\":135,\"nome\":\"O 500 RSDD 2745/30\",\"descricao\":\"Chassi rodoviário 8x2 para média e longa distância, com pacote de segurança ativa.\",\"motor\":\"MB OM 460 LA 12,8 l\",\"potencia\":\"449 cv (330 kW) @ 1.600 rpm\",\"torque\":\"2.200 Nm @ 1.100 rpm\",\"transmissao\":\"ZF TraXon automatizada, 12 marchas\",\"pbt\":\"27.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"2,533:1 / 2,846:1\",\"entre_eixos\":\"3.000\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"15,0 m\\\",\\\"entre_eixos\\\":\\\"3.000\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"8x2 rodoviário\\\",\\\"fonte_pagina\\\":\\\"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"Até 68 passageiros\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"O 500 Rodoviários\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":16}', '2026-07-25 16:26:03', '2026-07-30 11:43:13'),
(123, 68, 'modelo', NULL, 136, 'Volvo · B13R Rodoviários · Volvo B420R 6x2', NULL, '{\"id\":136,\"nome\":\"Volvo B420R 6x2\",\"descricao\":\"Chassi rodoviário Volvo B13R 6x2 com suspensão pneumática e freios a disco EBS.\",\"motor\":\"Volvo D13K420 12,8 l\",\"potencia\":\"420 cv (309 kW) @ 1.400–1.800 rpm\",\"torque\":\"2.100 Nm @ 860–1.400 rpm\",\"transmissao\":\"Volvo I-Shift automatizada\",\"pbt\":\"24.750 / 26.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"2,64:1 / 2,85:1\",\"entre_eixos\":\"4.000\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"10,47 a 10,57 m de chassi\\\",\\\"entre_eixos\\\":\\\"4.000\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"6x2 rodoviário\\\",\\\"fonte_pagina\\\":\\\"https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"B13R Rodoviários\",\"marca_nome\":\"Volvo\",\"_score\":16}', '2026-07-25 16:26:03', '2026-07-30 11:43:13'),
(124, 68, 'modelo', NULL, 137, 'Volvo · B13R Rodoviários · Volvo B510R 8x2', NULL, '{\"id\":137,\"nome\":\"Volvo B510R 8x2\",\"descricao\":\"Chassi rodoviário Volvo B13R 8x2 para aplicações de alta capacidade.\",\"motor\":\"Volvo D13K500 12,8 l\",\"potencia\":\"500 cv (368 kW) @ 1.530–1.800 rpm\",\"torque\":\"2.500 Nm @ 980–1.270 rpm\",\"transmissao\":\"Volvo I-Shift automatizada\",\"pbt\":\"29.250 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"2,64:1 / 2,85:1\",\"entre_eixos\":\"2.600\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"10,47 m de chassi\\\",\\\"entre_eixos\\\":\\\"2.600\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"8x2 rodoviário\\\",\\\"fonte_pagina\\\":\\\"https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"B13R Rodoviários\",\"marca_nome\":\"Volvo\",\"_score\":16}', '2026-07-25 16:26:03', '2026-07-30 11:43:13'),
(125, 68, 'modelo', NULL, 140, 'Scania · Série K Rodoviários · Scania K 370 4x2NB', NULL, '{\"id\":140,\"nome\":\"Scania K 370 4x2NB\",\"descricao\":\"Chassi Scania rodoviário 4x2 com trem de força de 13 litros e caixa automatizada de 12 marchas.\",\"motor\":\"Scania 13 l, 6 cilindros\",\"potencia\":\"370 hp (272 kW) @ 1.800 rpm\",\"torque\":\"1.900 Nm @ 900–1.340 rpm\",\"transmissao\":\"Scania GRS895R ou GRSO895R automatizada, 12 marchas\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"2,72:1 / 2,92:1 / 3,07:1 / 3,42:1\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2 rodoviário\\\",\\\"fonte_pagina\\\":\\\"https://www.scania.com/br/pt/home/products/onibus.html\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"Série K Rodoviários\",\"marca_nome\":\"Scania\",\"_score\":12}', '2026-07-25 16:26:03', '2026-07-30 11:43:13'),
(126, 68, 'modelo', NULL, 141, 'Scania · Série K Rodoviários · Scania K 500 8x2NB', NULL, '{\"id\":141,\"nome\":\"Scania K 500 8x2NB\",\"descricao\":\"Chassi Scania rodoviário 8x2 com motor de 13 litros, freios a disco e retarder.\",\"motor\":\"Scania 13 l, 6 cilindros\",\"potencia\":\"500 hp (368 kW) @ 1.800 rpm\",\"torque\":\"2.550 Nm @ 925–1.340 rpm\",\"transmissao\":\"Scania GRSO895R automatizada, 12 marchas\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"2,71:1 / 2,92:1 / 3,08:1\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"8x2 rodoviário\\\",\\\"fonte_pagina\\\":\\\"https://www.scania.com/br/pt/home/products/onibus.html\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"Série K Rodoviários\",\"marca_nome\":\"Scania\",\"_score\":12}', '2026-07-25 16:26:03', '2026-07-30 11:43:13');
INSERT INTO `assistente_interacao_fontes` (`id`, `interacao_id`, `tipo`, `video_id`, `modelo_id`, `titulo`, `transcricao_snapshot`, `conteudo_snapshot`, `fonte_atualizada_em`, `criado_em`) VALUES
(127, 81, 'frota', NULL, NULL, 'Presença de marcas', NULL, '{\"answer\":\"Não encontrei frota cadastrada para a região ou escopo informado.\",\"title\":\"Presença de marcas\",\"rows\":[],\"action\":null}', '2026-07-30 09:05:29', '2026-07-30 12:05:29'),
(128, 81, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-30 12:05:29'),
(129, 81, 'modelo', NULL, 19, 'Volkswagen Caminhões e Ônibus · Constellation · Constellation 27.260 6x4', NULL, '{\"id\":19,\"nome\":\"Constellation 27.260 6x4\",\"descricao\":\"Modelo Constellation 27.260 6x4 da família Volkswagen Constellation.\",\"motor\":\"MAN / D0836LF18\",\"potencia\":\"260 (191) @ 2.200\",\"torque\":\"950 @ 1.000 - 1.800\",\"transmissao\":\"ZF / 9S 1310 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"36.000 kg\",\"relacao_reducao\":\"5,29:1 / 4,88:1\",\"entre_eixos\":\"4.800 / 5.940\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.800 / 5.940\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:53\",\"familia_nome\":\"Constellation\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:53', '2026-07-30 12:05:29'),
(130, 81, 'modelo', NULL, 20, 'Volkswagen Caminhões e Ônibus · Constellation · Novo Constellation 27.320 6x4', NULL, '{\"id\":20,\"nome\":\"Novo Constellation 27.320 6x4\",\"descricao\":\"Modelo Novo Constellation 27.320 6x4 da família Volkswagen Constellation.\",\"motor\":\"MAN / D0836LF17\",\"potencia\":\"315 (231) @ 2.200\",\"torque\":\"1.200 @ 1.200 - 1.700\",\"transmissao\":\"ZF / 9S 1310 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"74.000 kg\",\"relacao_reducao\":\"5,41:1 / 4,55:1\",\"entre_eixos\":\"4.600\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.600\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:53\",\"familia_nome\":\"Constellation\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:53', '2026-07-30 12:05:29'),
(131, 81, 'modelo', NULL, 21, 'Volkswagen Caminhões e Ônibus · Constellation · Constellation 31.320 6x4', NULL, '{\"id\":21,\"nome\":\"Constellation 31.320 6x4\",\"descricao\":\"Modelo Constellation 31.320 6x4 da família Volkswagen Constellation.\",\"motor\":\"MAN / D0836LF17\",\"potencia\":\"315 (231) @ 2.200\",\"torque\":\"1.200 @ 1.200 - 1.700\",\"transmissao\":\"Automatizada - ZF / 12TX 2424 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"42.000 kg\",\"relacao_reducao\":\"4,89:1 / 4,56:1 / 5,38:1\",\"entre_eixos\":\"4.800 / 5.940\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.800 / 5.940\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:53\",\"familia_nome\":\"Constellation\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:53', '2026-07-30 12:05:29'),
(132, 81, 'modelo', NULL, 22, 'Volkswagen Caminhões e Ônibus · Constellation · Constellation 32.380 6x4', NULL, '{\"id\":22,\"nome\":\"Constellation 32.380 6x4\",\"descricao\":\"Modelo Constellation 32.380 6x4 da família Volkswagen Constellation.\",\"motor\":\"Cummins / ISL\",\"potencia\":\"375 (276) @ 1.900\",\"torque\":\"1.700 @ 1.100 - 1.400\",\"transmissao\":\"ZF / 12TX 2624 TD\",\"pbt\":\"23.000 kg\",\"pbtc\":\"63.000 kg\",\"relacao_reducao\":\"4,55:1\",\"entre_eixos\":\"4.800 / 5.940\",\"especificacoes\":\"{\\\"entre_eixos\\\":\\\"4.800 / 5.940\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"configuracao\\\":\\\"6x4, chassi de ônibus\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-16 11:41:53\",\"familia_nome\":\"Constellation\",\"marca_nome\":\"Volkswagen Caminhões e Ônibus\",\"_score\":20}', '2026-07-16 11:41:53', '2026-07-30 12:05:29'),
(133, 81, 'modelo', NULL, 71, 'Volvo · FMX · FMX 420 6x4R', NULL, '{\"id\":71,\"nome\":\"FMX 420 6x4R\",\"descricao\":\"Versão FMX 420 6x4R cadastrada a partir das especificações técnicas oficiais do fabricante.\",\"motor\":\"Volvo D13K 12,8 l\",\"potencia\":\"420 cv @ 1.400–1.800 rpm\",\"torque\":\"2.100 Nm @ 905–1.400 rpm\",\"transmissao\":\"I-Shift automatizada\",\"pbt\":\"\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"6x4 rígido\\\",\\\"fonte_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial representativa da família; configuração visual pode variar\\\",\\\"fonte_imagem_oficial\\\":\\\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:03:44\",\"familia_nome\":\"FMX\",\"marca_nome\":\"Volvo\",\"_score\":18}', '2026-07-18 21:03:44', '2026-07-30 12:05:29'),
(134, 83, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-30 17:21:38'),
(135, 83, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-30 17:21:38'),
(136, 83, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-30 17:21:38'),
(137, 83, 'modelo', NULL, 119, 'Mercedes-Benz · eO500 · Mercedes-Benz eO500U', NULL, '{\"id\":119,\"nome\":\"Mercedes-Benz eO500U\",\"descricao\":\"Primeiro chassi de ônibus de propulsão elétrica produzido pela Mercedes-Benz do Brasil, com piso baixo e configuração modular de baterias.\",\"motor\":\"Dois motores assíncronos integrados ao eixo traseiro\",\"potencia\":\"250 kW / 340 cv (total)\",\"torque\":\"2 × 485 Nm\",\"transmissao\":\"Tração elétrica direta\",\"pbt\":\"21.200 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"\",\"entre_eixos\":\"\",\"especificacoes\":\"{\\\"bateria\\\":\\\"3 a 6 pacotes NMC de 98 kWh; até 588 kWh\\\",\\\"energia\\\":\\\"100% elétrico\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"autonomia\\\":\\\"Até 270 km\\\",\\\"comprimento\\\":\\\"Carroceria de até 13,2 m\\\",\\\"carregamento\\\":\\\"CCS2, até 150 kW; recarga completa em até 3 horas\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, piso baixo\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u\\\",\\\"fonte_imagem_oficial\\\":\\\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/content-block/main/img-8948-20250710-182437-925-FCE2-20250710-181407-792-85A6_eo500u-sobre.jpg.webp\\\",\\\"capacidade_passageiros\\\":\\\"Mais de 80 passageiros nas configurações de 3 a 5 baterias\\\",\\\"entre_eixos\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"emissoes\\\":\\\"Zero emissão local\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:22\",\"familia_nome\":\"eO500\",\"marca_nome\":\"Mercedes-Benz\",\"_score\":2}', '2026-07-18 21:04:22', '2026-07-30 17:21:38'),
(138, 102, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-31 01:20:15'),
(139, 102, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-31 01:20:15'),
(140, 102, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-31 01:20:15'),
(141, 102, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-31 01:20:15'),
(142, 102, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-31 01:20:15'),
(143, 102, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":41}', '2026-07-25 16:26:03', '2026-07-31 01:20:15'),
(144, 102, 'modelo', NULL, 143, 'IVECO · IVECO BUS · IVECO BUS 17-280', NULL, '{\"id\":143,\"nome\":\"IVECO BUS 17-280\",\"descricao\":\"Chassi 4x2 para ônibus de maior capacidade, com motor FPT NEF 6 Euro VI.\",\"motor\":\"FPT NEF 6 Euro VI HiSCR\",\"potencia\":\"280 cv (207 kW) @ 2.500 rpm\",\"torque\":\"950 Nm @ 1.250–1.970 rpm\",\"transmissao\":\"ZF 6S 1010 BO manual, 6 marchas\",\"pbt\":\"16.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"5,57:1 / 5,13:1 / 6,57:1\",\"entre_eixos\":\"5.950\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"5.950\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":41}', '2026-07-25 16:26:03', '2026-07-31 01:20:15'),
(145, 102, 'modelo', NULL, 120, 'IVECO · Daily · Daily 30-160', NULL, '{\"id\":120,\"nome\":\"Daily 30-160\",\"descricao\":\"Daily 30-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"160 cv @ 3.500 rpm\",\"torque\":\"380 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 6S 480 VO manual, 6 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":37}', '2026-07-18 21:04:47', '2026-07-31 01:20:15'),
(146, 102, 'modelo', NULL, 121, 'IVECO · Daily · Daily 35-160', NULL, '{\"id\":121,\"nome\":\"Daily 35-160\",\"descricao\":\"Daily 35-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"160 cv @ 3.500 rpm\",\"torque\":\"380 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 6S 480 VO manual, 6 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.520 / 3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.520 / 3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":37}', '2026-07-18 21:04:47', '2026-07-31 01:20:15'),
(147, 102, 'modelo', NULL, 122, 'IVECO · Daily · Daily 35-180 Hi-Matic', NULL, '{\"id\":122,\"nome\":\"Daily 35-180 Hi-Matic\",\"descricao\":\"Daily 35-180 Hi-Matic chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"180 cv @ 3.500 rpm\",\"torque\":\"430 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 8HP Hi-Matic automática, 8 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.520 / 3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.520 / 3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":37}', '2026-07-18 21:04:47', '2026-07-31 01:20:15'),
(148, 106, 'video', 5, NULL, 'FUNÇÃO V CONSTANTE', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', '2026-07-29 00:14:19', '2026-07-31 01:21:00'),
(149, 106, 'video', 8, NULL, 'RIO - DIAGNÓSTICO REMOTO', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', '2026-07-29 17:23:25', '2026-07-31 01:21:00'),
(150, 106, 'video', 3, NULL, 'DM & RM', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', '2026-07-29 00:28:29', '2026-07-31 01:21:00'),
(151, 106, 'video', 4, NULL, 'CONDUÇÃO NA PRÁTICA', NULL, 'Apresentação das funções do veículo na prática', '2026-07-16 18:26:23', '2026-07-31 01:21:00'),
(152, 106, 'video', 2, NULL, 'NOVO VOLKSBUS 17.260', NULL, 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', '2026-07-16 13:06:47', '2026-07-31 01:21:00'),
(153, 106, 'modelo', NULL, 142, 'IVECO · IVECO BUS · IVECO BUS 10-190', NULL, '{\"id\":142,\"nome\":\"IVECO BUS 10-190\",\"descricao\":\"Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.\",\"motor\":\"FPT NEF 4 ID\",\"potencia\":\"190 cv (138 kW) @ 2.500 rpm\",\"torque\":\"610 Nm @ 1.350–2.100 rpm\",\"transmissao\":\"Eaton 6206 B manual, 6 marchas\",\"pbt\":\"10.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"4,56:1\",\"entre_eixos\":\"4.500 / 4.800\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"4.500 / 4.800\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":41}', '2026-07-25 16:26:03', '2026-07-31 01:21:00'),
(154, 106, 'modelo', NULL, 143, 'IVECO · IVECO BUS · IVECO BUS 17-280', NULL, '{\"id\":143,\"nome\":\"IVECO BUS 17-280\",\"descricao\":\"Chassi 4x2 para ônibus de maior capacidade, com motor FPT NEF 6 Euro VI.\",\"motor\":\"FPT NEF 6 Euro VI HiSCR\",\"potencia\":\"280 cv (207 kW) @ 2.500 rpm\",\"torque\":\"950 Nm @ 1.250–1.970 rpm\",\"transmissao\":\"ZF 6S 1010 BO manual, 6 marchas\",\"pbt\":\"16.000 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"5,57:1 / 5,13:1 / 6,57:1\",\"entre_eixos\":\"5.950\",\"especificacoes\":\"{\\\"bateria\\\":\\\"\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"mercado\\\":\\\"Brasil\\\",\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"comprimento\\\":\\\"\\\",\\\"entre_eixos\\\":\\\"5.950\\\",\\\"conferido_em\\\":\\\"2026-07-25\\\",\\\"configuracao\\\":\\\"4x2, motor dianteiro\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\\\",\\\"tipo_veiculo\\\":\\\"Ônibus\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"tipo_carroceria\\\":\\\"Chassi de ônibus\\\",\\\"autonomia\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\"}\",\"atualizado_em\":\"2026-07-25 16:26:03\",\"familia_nome\":\"IVECO BUS\",\"marca_nome\":\"IVECO\",\"_score\":41}', '2026-07-25 16:26:03', '2026-07-31 01:21:00'),
(155, 106, 'modelo', NULL, 120, 'IVECO · Daily · Daily 30-160', NULL, '{\"id\":120,\"nome\":\"Daily 30-160\",\"descricao\":\"Daily 30-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"160 cv @ 3.500 rpm\",\"torque\":\"380 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 6S 480 VO manual, 6 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":37}', '2026-07-18 21:04:47', '2026-07-31 01:21:00'),
(156, 106, 'modelo', NULL, 121, 'IVECO · Daily · Daily 35-160', NULL, '{\"id\":121,\"nome\":\"Daily 35-160\",\"descricao\":\"Daily 35-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"160 cv @ 3.500 rpm\",\"torque\":\"380 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 6S 480 VO manual, 6 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.520 / 3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.520 / 3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":37}', '2026-07-18 21:04:47', '2026-07-31 01:21:00'),
(157, 106, 'modelo', NULL, 122, 'IVECO · Daily · Daily 35-180 Hi-Matic', NULL, '{\"id\":122,\"nome\":\"Daily 35-180 Hi-Matic\",\"descricao\":\"Daily 35-180 Hi-Matic chassi-cabine, revisada conforme ficha técnica oficial IVECO.\",\"motor\":\"FPT F1C Max 3,0 l\",\"potencia\":\"180 cv @ 3.500 rpm\",\"torque\":\"430 Nm @ 1.600–2.900 rpm\",\"transmissao\":\"ZF 8HP Hi-Matic automática, 8 marchas\",\"pbt\":\"3.500 kg\",\"pbtc\":\"\",\"relacao_reducao\":\"3,73:1\",\"entre_eixos\":\"3.520 / 3.750\",\"especificacoes\":\"{\\\"emissoes\\\":\\\"Proconve P8 / Euro 6\\\",\\\"entre_eixos\\\":\\\"3.520 / 3.750\\\",\\\"conferido_em\\\":\\\"2026-07-18\\\",\\\"configuracao\\\":\\\"4x2, chassi-cabine\\\",\\\"fonte_pagina\\\":\\\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\\\",\\\"fonte_oficial\\\":\\\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\\\",\\\"imagem_escopo\\\":\\\"Imagem oficial do modelo ou grupo de versões\\\",\\\"tipo_carroceria\\\":\\\"Chassi-cabine\\\",\\\"auditoria_status\\\":\\\"Conferido em ficha técnica oficial\\\",\\\"tipo_veiculo\\\":\\\"Caminhão\\\",\\\"energia\\\":\\\"Diesel\\\",\\\"bateria\\\":\\\"\\\",\\\"autonomia\\\":\\\"\\\",\\\"capacidade_passageiros\\\":\\\"\\\",\\\"comprimento\\\":\\\"\\\",\\\"carregamento\\\":\\\"\\\",\\\"mercado\\\":\\\"Brasil\\\"}\",\"atualizado_em\":\"2026-07-18 21:04:47\",\"familia_nome\":\"Daily\",\"marca_nome\":\"IVECO\",\"_score\":37}', '2026-07-18 21:04:47', '2026-07-31 01:21:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `assistente_interacoes`
--

CREATE TABLE `assistente_interacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `resposta_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pergunta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pergunta_normalizada` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` longtext COLLATE utf8mb4_unicode_ci,
  `entrada` enum('texto','voz') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'texto',
  `tipo_interacao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'consulta',
  `origem_resposta` enum('cache','local','ia','indisponivel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ia',
  `tokens_entrada` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tokens_saida` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `audio_segundos` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `custo_estimado_usd` decimal(12,6) NOT NULL DEFAULT '0.000000',
  `latencia_ms` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('sucesso','erro','bloqueada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sucesso',
  `erro` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acao_json` json DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assistente_interacoes`
--

INSERT INTO `assistente_interacoes` (`id`, `usuario_id`, `empresa_id`, `resposta_id`, `pergunta`, `pergunta_normalizada`, `resposta`, `entrada`, `tipo_interacao`, `origem_resposta`, `tokens_entrada`, `tokens_saida`, `audio_segundos`, `custo_estimado_usd`, `latencia_ms`, `status`, `erro`, `acao_json`, `criado_em`) VALUES
(1, 1, NULL, 1, 'preciso realizar uma comparação entre onibus eletricos da volkswagen, mercedes bens e byd', 'preciso realizar uma comparac ao entre onibus eletricos da volkswagen mercedes bens e byd', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• BYD BYD BC10LE — potência 2× 150 kW, torque 2× 600 Nm, PBT 19.500 kg, entre-eixos 5.420\n• Mercedes-Benz Mercedes-Benz eO500U — potência 250 kW / 340 cv (total), torque 2 × 485 Nm, PBT 21.200 kg\n• Volkswagen Caminhões e Ônibus Constellation 14.210 4x2 — potência 205 (150) @ 2.300, torque 750 @ 1.200 - 1.800, PBT 14.500 kg, entre-eixos 4.800 / 5.207\n• BYD BYD eBus B12.b — potência 2 × 150 kW (máxima), PBT 20.000 kg, entre-eixos 5.950\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 293, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados\", \"query\": {\"tipo\": \"onibus\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 116, \"pbt\": \"19.500 kg\", \"name\": \"BYD BYD BC10LE\", \"pbtc\": \"\", \"motor\": \"Motor síncrono de ímãs permanentes - BYD - TZ290XSE\", \"power\": \"2× 150 kW\", \"family\": \"Ônibus Elétricos Urbanos\", \"torque\": \"2× 600 Nm\", \"reduction\": \"\", \"wheelbase\": \"5.420\"}, {\"id\": 119, \"pbt\": \"21.200 kg\", \"name\": \"Mercedes-Benz Mercedes-Benz eO500U\", \"pbtc\": \"\", \"motor\": \"Dois motores assíncronos integrados ao eixo traseiro\", \"power\": \"250 kW / 340 cv (total)\", \"family\": \"eO500\", \"torque\": \"2 × 485 Nm\", \"reduction\": \"\", \"wheelbase\": \"\"}, {\"id\": 12, \"pbt\": \"14.500 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 14.210 4x2\", \"pbtc\": \"23.000 kg\", \"motor\": \"MAN / D0834LF08\", \"power\": \"205 (150) @ 2.300\", \"family\": \"Constellation\", \"torque\": \"750 @ 1.200 - 1.800\", \"reduction\": \"4,88:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1\", \"wheelbase\": \"4.800 / 5.207\"}, {\"id\": 117, \"pbt\": \"20.000 kg\", \"name\": \"BYD BYD eBus B12.b\", \"pbtc\": \"\", \"motor\": \"Dois motores elétricos Hairpin\", \"power\": \"2 × 150 kW (máxima)\", \"family\": \"Ônibus Elétricos Urbanos\", \"torque\": \"\", \"reduction\": \"\", \"wheelbase\": \"5.950\"}], \"compare\": [116, 119, 12, 117]}', '2026-07-29 02:55:49'),
(2, 1, NULL, 2, 'preciso verificar quais veiculos 6x4 tenho hoje das marcas iveco volks daf e comparar', 'preciso verificar quais veiculos 6x4 tenho hoje das marcas iveco volks daf e comparar', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• DAF XF FTT 6X4 530 cv — potência 530 cv - 390 kW (1.675 rpm), torque 2.500 / 2.600 Nm @1.000 - 1.425 rpm, PBT 23.000 kg, entre-eixos 3.200\n• IVECO S-Way 540 6x4 — potência 540 cv @ 1.500–1.900 rpm, torque 2.550 Nm @ 1.000–1.500 rpm, PBT 23.000 kg, entre-eixos 3.540\n• IVECO Tector 27-320 — potência 320 cv @ 2.200–2.500 rpm, torque 1.100 Nm @ 1.300–1.900 rpm, PBT 23.000 kg, entre-eixos 3.690 / 4.185 / 4.815\n• Volkswagen Caminhões e Ônibus Constellation 27.260 6x4 — potência 260 (191) @ 2.200, torque 950 @ 1.000 - 1.800, PBT 23.000 kg, entre-eixos 4.800 / 5.940\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 653, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados em 6x4\", \"query\": {\"q\": \"6x4\", \"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 131, \"pbt\": \"23.000 kg\", \"name\": \"DAF XF FTT 6X4 530 cv\", \"pbtc\": \"74.000 kg\", \"motor\": \"PACCAR MX 13\", \"power\": \"530 cv - 390 kW (1.675 rpm)\", \"family\": \"Linha XF\", \"torque\": \"2.500 / 2.600 Nm @1.000 - 1.425 rpm\", \"reduction\": \"2,80:1 / 3,07:1 / 3,42:1\", \"wheelbase\": \"3.200\"}, {\"id\": 65, \"pbt\": \"23.000 kg\", \"name\": \"IVECO S-Way 540 6x4\", \"pbtc\": \"74.000 kg\", \"motor\": \"FPT Cursor 13 12,9 l\", \"power\": \"540 cv @ 1.500–1.900 rpm\", \"family\": \"S-Way\", \"torque\": \"2.550 Nm @ 1.000–1.500 rpm\", \"reduction\": \"3,07:1\", \"wheelbase\": \"3.540\"}, {\"id\": 60, \"pbt\": \"23.000 kg\", \"name\": \"IVECO Tector 27-320\", \"pbtc\": \"44.000 kg\", \"motor\": \"FPT NEF6 6,7 l\", \"power\": \"320 cv @ 2.200–2.500 rpm\", \"family\": \"Tector\", \"torque\": \"1.100 Nm @ 1.300–1.900 rpm\", \"reduction\": \"4,88:1\", \"wheelbase\": \"3.690 / 4.185 / 4.815\"}, {\"id\": 19, \"pbt\": \"23.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 27.260 6x4\", \"pbtc\": \"36.000 kg\", \"motor\": \"MAN / D0836LF18\", \"power\": \"260 (191) @ 2.200\", \"family\": \"Constellation\", \"torque\": \"950 @ 1.000 - 1.800\", \"reduction\": \"5,29:1 / 4,88:1\", \"wheelbase\": \"4.800 / 5.940\"}], \"compare\": [131, 65, 60, 19]}', '2026-07-29 02:56:57'),
(3, 1, NULL, 3, 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4', 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• IVECO S-Way 540 6x4 — potência 540 cv @ 1.500–1.900 rpm, torque 2.550 Nm @ 1.000–1.500 rpm, PBT 23.000 kg, entre-eixos 3.540\n• Volvo FH 540 6x4T — potência 540 cv - 397 kW  (1460-1800 rpm), torque 2600 Nm (1000-1460 rpm), PBT 28.500 Kg, entre-eixos 3.000 / 3.200 / 3.600\n• Volvo FMX 540 6x4T — potência 540 cv @ 1.460–1.800 rpm, torque 2.600 Nm @ 1.000–1.460 rpm\n• Scania R 540 A 6x4 NZ (plus) 540 cv — potência 540 hp @ 1.800 rpm, torque 2.700 Nm @ 1.000 -1.300 rpm, PBT 23.000 kg, entre-eixos 3.550\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 285, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados em 6x4\", \"query\": {\"q\": \"6x4\", \"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 65, \"pbt\": \"23.000 kg\", \"name\": \"IVECO S-Way 540 6x4\", \"pbtc\": \"74.000 kg\", \"motor\": \"FPT Cursor 13 12,9 l\", \"power\": \"540 cv @ 1.500–1.900 rpm\", \"family\": \"S-Way\", \"torque\": \"2.550 Nm @ 1.000–1.500 rpm\", \"reduction\": \"3,07:1\", \"wheelbase\": \"3.540\"}, {\"id\": 145, \"pbt\": \"28.500 Kg\", \"name\": \"Volvo FH 540 6x4T\", \"pbtc\": \"74\", \"motor\": \"D13K540\", \"power\": \"540 cv - 397 kW  (1460-1800 rpm)\", \"family\": \"FH\", \"torque\": \"2600 Nm (1000-1460 rpm)\", \"reduction\": \"3.40:1 / 3.78:1 / 4.50:1\", \"wheelbase\": \"3.000 / 3.200 / 3.600\"}, {\"id\": 74, \"pbt\": \"\", \"name\": \"Volvo FMX 540 6x4T\", \"pbtc\": \"\", \"motor\": \"Volvo D13K 12,8 l\", \"power\": \"540 cv @ 1.460–1.800 rpm\", \"family\": \"FMX\", \"torque\": \"2.600 Nm @ 1.000–1.460 rpm\", \"reduction\": \"\", \"wheelbase\": \"\"}, {\"id\": 104, \"pbt\": \"23.000 kg\", \"name\": \"Scania R 540 A 6x4 NZ (plus) 540 cv\", \"pbtc\": \"\", \"motor\": \"DC13 166\", \"power\": \"540 hp @ 1.800 rpm\", \"family\": \"Linha R\", \"torque\": \"2.700 Nm @ 1.000 -1.300 rpm\", \"reduction\": \"\", \"wheelbase\": \"3.550\"}], \"compare\": [65, 145, 74, 104]}', '2026-07-29 02:58:35'),
(4, 1, NULL, 4, 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4 das marcas volkswagen, iveco, daf, scania e mercedes', 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4 das marcas volkswagen iveco daf scania e mercedes', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• DAF XF FTT 6X4 530 cv — potência 530 cv - 390 kW (1.675 rpm), torque 2.500 / 2.600 Nm @1.000 - 1.425 rpm, PBT 23.000 kg, entre-eixos 3.200\n• IVECO S-Way 540 6x4 — potência 540 cv @ 1.500–1.900 rpm, torque 2.550 Nm @ 1.000–1.500 rpm, PBT 23.000 kg, entre-eixos 3.540\n• Mercedes-Benz Arocs 3351 K 6x4 — potência 495 cv, torque 2.400 Nm, PBT 33.500 kg\n• Scania Scania R 500 6x4 Super — potência 500 hp (368 kW) @ 1.800 rpm, torque 2.650 Nm @ 900–1.320 rpm, PBT 23.000 Kg, entre-eixos 3.550\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 287, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados em 6x4\", \"query\": {\"q\": \"6x4\", \"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 131, \"pbt\": \"23.000 kg\", \"name\": \"DAF XF FTT 6X4 530 cv\", \"pbtc\": \"74.000 kg\", \"motor\": \"PACCAR MX 13\", \"power\": \"530 cv - 390 kW (1.675 rpm)\", \"family\": \"Linha XF\", \"torque\": \"2.500 / 2.600 Nm @1.000 - 1.425 rpm\", \"reduction\": \"2,80:1 / 3,07:1 / 3,42:1\", \"wheelbase\": \"3.200\"}, {\"id\": 65, \"pbt\": \"23.000 kg\", \"name\": \"IVECO S-Way 540 6x4\", \"pbtc\": \"74.000 kg\", \"motor\": \"FPT Cursor 13 12,9 l\", \"power\": \"540 cv @ 1.500–1.900 rpm\", \"family\": \"S-Way\", \"torque\": \"2.550 Nm @ 1.000–1.500 rpm\", \"reduction\": \"3,07:1\", \"wheelbase\": \"3.540\"}, {\"id\": 97, \"pbt\": \"33.500 kg\", \"name\": \"Mercedes-Benz Arocs 3351 K 6x4\", \"pbtc\": \"\", \"motor\": \"Mercedes-Benz OM 460 / OM 471\", \"power\": \"495 cv\", \"family\": \"Arocs\", \"torque\": \"2.400 Nm\", \"reduction\": \"\", \"wheelbase\": \"\"}, {\"id\": 103, \"pbt\": \"23.000 Kg\", \"name\": \"Scania Scania R 500 6x4 Super\", \"pbtc\": \"74.000 Kg\", \"motor\": \"DC13 174\", \"power\": \"500 hp (368 kW) @ 1.800 rpm\", \"family\": \"Linha R\", \"torque\": \"2.650 Nm @ 900–1.320 rpm\", \"reduction\": \"3,07:1 | 3,42:1\", \"wheelbase\": \"3.550\"}], \"compare\": [131, 65, 97, 103]}', '2026-07-29 02:59:49'),
(5, 1, NULL, 5, 'Baseando nos cliente que tenho em são paulo, gostaria de entender qual marca tem maior numero naquela regiao', 'baseando nos cliente que tenho em s ao paulo gostaria de entender qual marca tem maior numero naquela regiao', 'Dados cadastrados para IVECO · IVECO BUS · IVECO BUS 17-280:\n\n• Motor: FPT NEF 6 Euro VI HiSCR\n• Potência: 280 cv (207 kW) @ 2.500 rpm\n• Torque: 950 Nm @ 1.250–1.970 rpm\n• Transmissão: ZF 6S 1010 BO manual, 6 marchas\n• PBT: 16.000 kg\n• Entre-eixos: 5.950\n• Relação de redução: 5,57:1 / 5,13:1 / 6,57:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 252, 'sucesso', NULL, NULL, '2026-07-29 03:01:04'),
(6, 1, NULL, 6, 'Estou em um meteor agora, e gostaria de pra que serve esse botao de v constante', 'estou em um meteor agora e gostaria de pra que serve esse botao de v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nVamos iniciar o treinamento do Volkswagen Meteor. Hoje vamos conhecer a função V Constante. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida.\n\nPara confirmar o procedimento completo, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 276, 'sucesso', NULL, NULL, '2026-07-29 03:15:08'),
(7, 1, NULL, 7, 'como funciona a função V constante?', 'como funciona a func ao v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nHoje vamos conhecer a função V Constante. Para ativar a função, é bem simples. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.\n\nPara confirmar o procedimento completo, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 258, 'sucesso', NULL, NULL, '2026-07-29 03:18:21'),
(8, 1, NULL, NULL, 'Como funciona a função v constante no caminhão?', 'como funciona a func ao v constante no caminh ao', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• Volkswagen Caminhões e Ônibus Constellation 14.210 4x2 — potência 205 (150) @ 2.300, torque 750 @ 1.200 - 1.800, PBT 14.500 kg, entre-eixos 4.800 / 5.207\n• Volkswagen Caminhões e Ônibus Constellation 17.210 4x2 — potência 205 (150) @ 2.300, torque 750 @ 1.200 - 1.800, PBT 16.000 kg, entre-eixos 4.800 / 5.207\n• Volkswagen Caminhões e Ônibus Constellation 18.210 4x2 — potência 205 (150) @ 2.300, torque 750 @ 1.200 - 1.800, PBT 16.000 kg, entre-eixos 3.560 / 4.800 / 5.207\n• Volkswagen Caminhões e Ônibus Constellation 18.260 4x2 — potência 260 (191) @ 2.200, torque 950 @ 1.000 - 1.800, PBT 16.000 kg, entre-eixos 3.560 / 4.340 / 4.800 / 5.207\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', 'voz', 'consulta', 'local', 0, 0, 9, 0.000000, 315, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados\", \"query\": {\"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 12, \"pbt\": \"14.500 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 14.210 4x2\", \"pbtc\": \"23.000 kg\", \"motor\": \"MAN / D0834LF08\", \"power\": \"205 (150) @ 2.300\", \"family\": \"Constellation\", \"torque\": \"750 @ 1.200 - 1.800\", \"reduction\": \"4,88:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1\", \"wheelbase\": \"4.800 / 5.207\"}, {\"id\": 3, \"pbt\": \"16.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 17.210 4x2\", \"pbtc\": \"27.000 kg\", \"motor\": \"MAN / D0834LF08\", \"power\": \"205 (150) @ 2.300\", \"family\": \"Constellation\", \"torque\": \"750 @ 1.200 - 1.800\", \"reduction\": \"5,29:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1\", \"wheelbase\": \"4.800 / 5.207\"}, {\"id\": 13, \"pbt\": \"16.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 18.210 4x2\", \"pbtc\": \"27.000 kg\", \"motor\": \"MAN / D0834LF08\", \"power\": \"205 (150) @ 2.300\", \"family\": \"Constellation\", \"torque\": \"750 @ 1.200 - 1.800\", \"reduction\": \"5,29:1 / 5,86:1 / 4,56:1 / 6,36:1 / 4,10:1 / 5,72:1 / 6,57:1\", \"wheelbase\": \"3.560 / 4.800 / 5.207\"}, {\"id\": 14, \"pbt\": \"16.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 18.260 4x2\", \"pbtc\": \"35.000 kg\", \"motor\": \"MAN / D0836LF18\", \"power\": \"260 (191) @ 2.200\", \"family\": \"Constellation\", \"torque\": \"950 @ 1.000 - 1.800\", \"reduction\": \"4,88:1 / 6,65:1 / 3,73:1 / 3,42:1\", \"wheelbase\": \"3.560 / 4.340 / 4.800 / 5.207\"}], \"compare\": [12, 3, 13, 14]}', '2026-07-29 03:23:08'),
(9, 1, NULL, 9, 'Estou com uma dúvida quanto à função do meteor. Para que serve a função do v constante?', 'estou com uma d uvida quanto a func ao do meteor para que serve a func ao do v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 268, 'sucesso', NULL, NULL, '2026-07-29 03:24:09'),
(10, 1, NULL, NULL, 'E para que serve a função num metrô DN? IE.', 'e para que serve a func ao num metr o dn ie', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'voz', 'consulta', 'local', 0, 0, 19, 0.000000, 393, 'sucesso', NULL, NULL, '2026-07-29 03:24:46'),
(11, 1, NULL, NULL, 'E para que serve a função DM & RM?', 'e para que serve a func ao dm rm', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 262, 'sucesso', NULL, NULL, '2026-07-29 03:25:02'),
(12, 1, NULL, NULL, 'E para que serve a função DM & RM?', 'e para que serve a func ao dm rm', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'cache', 0, 0, 0, 0.000000, 239, 'sucesso', NULL, NULL, '2026-07-29 03:25:31'),
(13, 1, NULL, 12, 'Para que serve a função v constante?', 'para que serve a func ao v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 350, 'sucesso', NULL, NULL, '2026-07-29 03:33:18'),
(14, 1, NULL, 13, 'E como eu desativo a função?', 'e como eu desativo a func ao', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nAssim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 371, 'sucesso', NULL, NULL, '2026-07-29 03:33:33'),
(15, 1, NULL, 14, 'Poderia melhorar a sua resposta quanto a desativação?', 'poderia melhorar a sua resposta quanto a desativac ao', 'Dados cadastrados para IVECO · Tector · Tector 9-190:\n\n• Motor: FPT NEF4 4,5 l\n• Potência: 190 cv @ 2.200–2.500 rpm\n• Torque: 610 Nm @ 1.200–2.100 rpm\n• Transmissão: Eaton ESO6106B manual, 6 marchas\n• PBT: 8.600 kg\n• PBTC: 11.000 kg\n• Entre-eixos: 3.906 / 4.460\n• Relação de redução: 4,30:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 299, 'sucesso', NULL, NULL, '2026-07-29 03:33:51'),
(16, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 87, 'sucesso', NULL, NULL, '2026-07-29 06:00:32'),
(17, 1, NULL, NULL, 'Reportar uma falha', 'reportar uma falha', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 85, 'sucesso', NULL, NULL, '2026-07-29 06:00:36'),
(18, 1, NULL, NULL, 'Dificuldades com a eficiencia do ar condicionado do meteor', 'dificuldades com a eficiencia do ar condicionado do meteor', 'Identifiquei a família Meteor. Qual é o modelo exato do veículo?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 237, 'sucesso', NULL, NULL, '2026-07-29 06:01:04'),
(19, 1, NULL, NULL, '29-530', '29 530', 'Identifiquei a família Meteor. Qual é o modelo exato do veículo?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 242, 'sucesso', NULL, NULL, '2026-07-29 06:01:13'),
(20, 1, NULL, NULL, '28-530', '28 530', 'Identifiquei a família Meteor. Qual é o modelo exato do veículo?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 234, 'sucesso', NULL, NULL, '2026-07-29 06:01:18'),
(21, 1, NULL, NULL, 'Meteor 6x4 29.530', 'meteor 6x4 29 530', 'Confira antes de enviar:\n\nTipo: Falha\nVeículo: Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530\nCategoria: Climatização e ventilação\nRelato: Dificuldades com a eficiencia do ar condicionado do meteor\n\nVeículo informado: 29-530\n\nVeículo informado: 28-530\n\nVeículo informado: Meteor 6x4 29.530\n\nPosso reportar isso para nosso time de assistência e produto?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 193, 'sucesso', NULL, NULL, '2026-07-29 06:02:02'),
(22, 1, NULL, NULL, 'Cancelar', 'cancelar', 'Tudo bem, o relato foi cancelado e nada foi enviado. Posso ajudar em outra coisa?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 82, 'sucesso', NULL, NULL, '2026-07-29 06:02:12'),
(23, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 87, 'sucesso', NULL, NULL, '2026-07-29 06:02:55'),
(24, 1, NULL, NULL, '4 · Muito bom', '4 muito bom', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 118, 'sucesso', NULL, NULL, '2026-07-29 06:02:58'),
(25, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 87, 'sucesso', NULL, NULL, '2026-07-29 06:03:09'),
(26, 1, NULL, NULL, 'Reportar uma falha', 'reportar uma falha', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 86, 'sucesso', NULL, NULL, '2026-07-29 06:03:15'),
(27, 1, NULL, NULL, 'o limpador de parabrisa do Meteor 6x4 29.530 tem algumas falhas', 'o limpador de parabrisa do meteor 6x4 29 530 tem algumas falhas', 'Confira antes de enviar:\n\nTipo: Falha\nVeículo: Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530\nCategoria: Visibilidade e limpeza dos vidros\nRelato: o limpador de parabrisa do Meteor 6x4 29.530 tem algumas falhas\n\nPosso reportar isso para nosso time de assistência e produto?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 221, 'sucesso', NULL, NULL, '2026-07-29 06:03:44'),
(28, 1, NULL, NULL, 'Sim, pode enviar', 'sim pode enviar', 'Obrigado. O relato foi registrado com o protocolo DL-20260729-000001. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 317, 'sucesso', NULL, '{\"type\": \"service_report\", \"label\": \"Acompanhar o protocolo\", \"query\": {\"id\": 1}, \"route\": \"service-desk\"}', '2026-07-29 06:04:04'),
(29, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 81, 'sucesso', NULL, NULL, '2026-07-29 06:06:36'),
(30, 1, NULL, 15, 'preciso de uma comparação de 4 marcas  6x4 com potencia entre 500 e 530, sendo as marcas VWCO, Iveco, DAF, Scania', 'preciso de uma comparac ao de 4 marcas 6x4 com potencia entre 500 e 530 sendo as marcas vwco iveco daf scania', 'Não encontrei frota cadastrada para a região ou escopo informado.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 637, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados em 6x4\", \"query\": {\"q\": \"6x4\", \"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 131, \"pbt\": \"23.000 kg\", \"name\": \"DAF XF FTT 6X4 530 cv\", \"pbtc\": \"74.000 kg\", \"motor\": \"PACCAR MX 13\", \"power\": \"530 cv - 390 kW (1.675 rpm)\", \"family\": \"Linha XF\", \"torque\": \"2.500 / 2.600 Nm @1.000 - 1.425 rpm\", \"reduction\": \"2,80:1 / 3,07:1 / 3,42:1\", \"wheelbase\": \"3.200\"}, {\"id\": 65, \"pbt\": \"23.000 kg\", \"name\": \"IVECO S-Way 540 6x4\", \"pbtc\": \"74.000 kg\", \"motor\": \"FPT Cursor 13 12,9 l\", \"power\": \"540 cv @ 1.500–1.900 rpm\", \"family\": \"S-Way\", \"torque\": \"2.550 Nm @ 1.000–1.500 rpm\", \"reduction\": \"3,07:1\", \"wheelbase\": \"3.540\"}, {\"id\": 103, \"pbt\": \"23.000 Kg\", \"name\": \"Scania Scania R 500 6x4 Super\", \"pbtc\": \"74.000 Kg\", \"motor\": \"DC13 174\", \"power\": \"500 hp (368 kW) @ 1.800 rpm\", \"family\": \"Linha R\", \"torque\": \"2.650 Nm @ 900–1.320 rpm\", \"reduction\": \"3,07:1 | 3,42:1\", \"wheelbase\": \"3.550\"}, {\"id\": 60, \"pbt\": \"23.000 kg\", \"name\": \"IVECO Tector 27-320\", \"pbtc\": \"44.000 kg\", \"motor\": \"FPT NEF6 6,7 l\", \"power\": \"320 cv @ 2.200–2.500 rpm\", \"family\": \"Tector\", \"torque\": \"1.100 Nm @ 1.300–1.900 rpm\", \"reduction\": \"4,88:1\", \"wheelbase\": \"3.690 / 4.185 / 4.815\"}], \"compare\": [131, 65, 103, 60]}', '2026-07-29 06:07:35'),
(31, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 81, 'sucesso', NULL, NULL, '2026-07-29 06:20:58'),
(32, 1, NULL, NULL, 'Reportar uma falha', 'reportar uma falha', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 80, 'sucesso', NULL, NULL, '2026-07-29 06:21:00'),
(33, 1, NULL, NULL, 'problemas com a função do freio motro', 'problemas com a func ao do freio motro', 'Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 298, 'sucesso', NULL, NULL, '2026-07-29 06:21:29'),
(34, 1, NULL, NULL, 'Volkswagen Caminhões e Ônibus', 'volkswagen caminh oes e onibus', 'Certo, a marca é Volkswagen Caminhões e Ônibus. Qual é a família do veículo? Você pode falar, digitar ou selecionar uma das famílias dessa marca.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 135, 'sucesso', NULL, NULL, '2026-07-29 06:21:37'),
(35, 1, NULL, NULL, 'Meteor', 'meteor', 'Identifiquei a família Meteor. Qual é o modelo exato? Você pode falar, digitar ou selecionar um dos modelos dessa família.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 142, 'sucesso', NULL, NULL, '2026-07-29 06:21:44'),
(36, 1, NULL, NULL, 'Meteor 6x4 29.530', 'meteor 6x4 29 530', 'Confira antes de enviar:\n\nTipo: Falha\nVeículo: Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530\nCategoria: Freios, retarder e freio-motor\nRelato: problemas com a função do freio motro\n\nPosso reportar isso para nosso time de assistência e produto?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 111, 'sucesso', NULL, NULL, '2026-07-29 06:21:53'),
(37, 1, NULL, NULL, 'Sim, pode enviar', 'sim pode enviar', 'Obrigado. O relato foi registrado com o protocolo DL-20260729-000002. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 404, 'sucesso', NULL, '{\"type\": \"service_report\", \"label\": \"Acompanhar o protocolo\", \"query\": {\"id\": 2}, \"route\": \"service-desk\"}', '2026-07-29 06:22:04'),
(38, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 83, 'sucesso', NULL, NULL, '2026-07-29 06:22:10'),
(39, 1, NULL, NULL, '2 · Regular', '2 regular', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 108, 'sucesso', NULL, NULL, '2026-07-29 06:22:17'),
(40, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 5, 'sucesso', NULL, NULL, '2026-07-29 12:43:19'),
(41, 1, NULL, NULL, 'Reportar uma falha', 'reportar uma falha', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-29 12:43:24'),
(42, 1, NULL, NULL, 'Problema com o limpador de parabrisa', 'problema com o limpador de parabrisa', 'Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 10, 'sucesso', NULL, NULL, '2026-07-29 12:43:43'),
(43, 1, NULL, NULL, 'Volkswagen Caminhões e Ônibus', 'volkswagen caminhoes e onibus', 'Certo, a marca é Volkswagen Caminhões e Ônibus. Qual é a família do veículo? Você pode falar, digitar ou selecionar uma das famílias dessa marca.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-29 12:43:48'),
(44, 1, NULL, NULL, 'Meteor', 'meteor', 'Identifiquei a família Meteor. Qual é o modelo exato? Você pode falar, digitar ou selecionar um dos modelos dessa família.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 2, 'sucesso', NULL, NULL, '2026-07-29 12:43:51'),
(45, 1, NULL, NULL, 'Meteor 6x4 29.530', 'meteor 6x4 29 530', 'Confira antes de enviar:\n\nTipo: Falha\nVeículo: Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530\nCategoria: Visibilidade e limpeza dos vidros\nRelato: Problema com o limpador de parabrisa\n\nPosso reportar isso para nosso time de assistência e produto?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-29 12:43:54'),
(46, 1, NULL, NULL, 'Sim, pode enviar', 'sim pode enviar', 'Obrigado. O relato foi registrado com o protocolo DL-20260729-000003. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 17, 'sucesso', NULL, '{\"type\": \"service_report\", \"label\": \"Acompanhar o protocolo\", \"query\": {\"id\": 3}, \"route\": \"service-desk\"}', '2026-07-29 12:44:04'),
(47, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-29 12:44:08'),
(48, 1, NULL, NULL, '4 · Muito bom', '4 muito bom', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-29 12:44:11'),
(49, 1, NULL, NULL, 'Encerrar sem comentário', 'encerrar sem comentario', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 4, 'sucesso', NULL, NULL, '2026-07-29 12:44:14'),
(50, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 5, 'sucesso', NULL, NULL, '2026-07-29 20:25:49'),
(51, 1, NULL, 16, 'Gostaria de fazer uma busca? De veículos 6 por 4. Onde tem um potência aproximada de 500 cavalos.', 'gostaria de fazer uma busca de veiculos 6 por 4 onde tem um potencia aproximada de 500 cavalos', 'As marcas com maior presença no seu escopo são:\n\n1º Volvo — 77 veículo(s) em 1 cliente(s)\n2º Scania — 2 veículo(s) em 1 cliente(s)\n3º Volkswagen Caminhões e Ônibus — 1 veículo(s) em 1 cliente(s)', 'voz', 'consulta', 'local', 0, 0, 23, 0.000000, 15, 'sucesso', NULL, '{\"type\": \"fleet\", \"label\": \"Abrir Minha Frota\", \"query\": [], \"route\": \"frota\"}', '2026-07-29 20:26:25'),
(52, 1, NULL, NULL, 'Não, quero continuar', 'nao quero continuar', 'Sem problema. Continue me contando sua dúvida ou escolha outra jornada.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-29 20:26:32'),
(53, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-29 20:26:33'),
(54, 1, NULL, 17, 'Gostaria de analisar veiulos 6x4, scania, meteor, daf e ivevo', 'gostaria de analisar veiulos 6x4 scania meteor daf e ivevo', 'Dados cadastrados para Scania · Linha R · Scania R 500 6x4 Super:\n\n• Motor: DC13 174\n• Potência: 500 hp (368 kW) @ 1.800 rpm\n• Torque: 2.650 Nm @ 900–1.320 rpm\n• Transmissão: Scania Opticruise G25/G33\n• PBT: 23.000 Kg\n• PBTC: 74.000 Kg\n• Entre-eixos: 3.550\n• Relação de redução: 3,07:1 | 3,42:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 5, 'sucesso', NULL, NULL, '2026-07-29 20:27:02'),
(55, 1, NULL, NULL, 'Não, quero continuar', 'nao quero continuar', 'Sem problema. Continue me contando sua dúvida ou escolha outra jornada.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-29 20:27:19'),
(56, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-29 20:27:20'),
(57, 1, NULL, 18, 'Gostaria de comparar veiulos 6x4, scania, meteor, daf e ivevo.', 'gostaria de comparar veiulos 6x4 scania meteor daf e ivevo', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• DAF XF FTT 6X4 530 cv — potência 530 cv - 390 kW (1.675 rpm), torque 2.500 / 2.600 Nm @1.000 - 1.425 rpm, PBT 23.000 kg, entre-eixos 3.200\n• Scania Scania R 500 6x4 Super — potência 500 hp (368 kW) @ 1.800 rpm, torque 2.650 Nm @ 900–1.320 rpm, PBT 23.000 Kg, entre-eixos 3.550\n• Volkswagen Caminhões e Ônibus Meteor 6x4 29.530 — potência 525 (386) @ 1.800, torque 2.600 @ 930 - 1.350, PBT 23.000 kg, entre-eixos 4.600 / 4.800 / 5.000\n• Volkswagen Caminhões e Ônibus Meteor 6x4 28.480HD — potência 475 (350) @ 1.800, torque 2.400 @ 930 - 1.350, PBT 23.000 kg, entre-eixos 4.600\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 10, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados em 6x4\", \"query\": {\"q\": \"6x4\", \"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 131, \"pbt\": \"23.000 kg\", \"name\": \"DAF XF FTT 6X4 530 cv\", \"pbtc\": \"74.000 kg\", \"motor\": \"PACCAR MX 13\", \"power\": \"530 cv - 390 kW (1.675 rpm)\", \"family\": \"Linha XF\", \"torque\": \"2.500 / 2.600 Nm @1.000 - 1.425 rpm\", \"reduction\": \"2,80:1 / 3,07:1 / 3,42:1\", \"wheelbase\": \"3.200\"}, {\"id\": 103, \"pbt\": \"23.000 Kg\", \"name\": \"Scania Scania R 500 6x4 Super\", \"pbtc\": \"74.000 Kg\", \"motor\": \"DC13 174\", \"power\": \"500 hp (368 kW) @ 1.800 rpm\", \"family\": \"Linha R\", \"torque\": \"2.650 Nm @ 900–1.320 rpm\", \"reduction\": \"3,07:1 | 3,42:1\", \"wheelbase\": \"3.550\"}, {\"id\": 4, \"pbt\": \"23.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Meteor 6x4 29.530\", \"pbtc\": \"\", \"motor\": \"MAN / D2676LFAD\", \"power\": \"525 (386) @ 1.800\", \"family\": \"Meteor\", \"torque\": \"2.600 @ 930 - 1.350\", \"reduction\": \"3,08:1 / 3,36:1\", \"wheelbase\": \"4.600 / 4.800 / 5.000\"}, {\"id\": 29, \"pbt\": \"23.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Meteor 6x4 28.480HD\", \"pbtc\": \"58.500 kg\", \"motor\": \"MAN / D2676LFAG\", \"power\": \"475 (350) @ 1.800\", \"family\": \"Meteor\", \"torque\": \"2.400 @ 930 - 1.350\", \"reduction\": \"2,85:1 / 3,08:1 / 3,40:1\", \"wheelbase\": \"4.600\"}], \"compare\": [131, 103, 4, 29]}', '2026-07-29 20:27:40'),
(58, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-29 20:33:53'),
(59, 1, NULL, NULL, '4 · Muito bom', '4 muito bom', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-29 20:33:55'),
(60, 1, NULL, NULL, 'Poderia melhorar as buscas para serem mais precisas', 'poderia melhorar as buscas para serem mais precisas', 'Obrigado pela nota e pelo comentário. Seu retorno foi registrado e o atendimento foi encerrado.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 4, 'sucesso', NULL, NULL, '2026-07-29 20:34:17'),
(61, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 3, 'sucesso', NULL, NULL, '2026-07-30 11:39:48'),
(62, 1, NULL, 19, 'Gostaria de ver a ficha técnica do volksbus 17.230', 'gostaria de ver a ficha tecnica do volksbus 17 230', 'Dados cadastrados para Volkswagen Caminhões e Ônibus · Delivery · Delivery 6.170:\n\n• Motor: F1C 3.0l\n• Potência: 156 cv @ 3.300 rpm\n• Torque: 430 Nm @ 1.400 - 2.700 rpm\n• Transmissão: Manual - Eaton / ESO 4206\n• PBT: 5.850 kg\n• PBTC: 6.900 kg\n• Entre-eixos: 4.000\n• Relação de redução: 5,13:1 / 4,78:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 9, 'sucesso', NULL, NULL, '2026-07-30 11:40:14'),
(63, 1, NULL, NULL, 'Não, quero continuar', 'nao quero continuar', 'Sem problema. Continue me contando sua dúvida ou escolha outra jornada.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:40:36'),
(64, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:40:49'),
(65, 1, NULL, 20, 'busque a ficha técnica da marca volkswagen modelo volksbus 17.230', 'busque a ficha tecnica da marca volkswagen modelo volksbus 17 230', 'As marcas com maior presença no seu escopo são:\n\n1º Volvo — 77 veículo(s) em 1 cliente(s)\n2º Scania — 2 veículo(s) em 1 cliente(s)\n3º Volkswagen Caminhões e Ônibus — 1 veículo(s) em 1 cliente(s)', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 9, 'sucesso', NULL, '{\"type\": \"fleet\", \"label\": \"Abrir Minha Frota\", \"query\": [], \"route\": \"frota\"}', '2026-07-30 11:41:25'),
(66, 1, NULL, NULL, 'Não, quero continuar', 'nao quero continuar', 'Sem problema. Continue me contando sua dúvida ou escolha outra jornada.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-30 11:42:48'),
(67, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-30 11:42:51'),
(68, 1, NULL, 21, 'Gostaria de conhecer treinamentos sobre a plataforma RIO', 'gostaria de conhecer treinamentos sobre a plataforma rio', 'Com base no treinamento “RIO - DIAGNÓSTICO REMOTO”:\n\nHoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 4, 'sucesso', NULL, NULL, '2026-07-30 11:43:13'),
(69, 8, 1, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 3, 'sucesso', NULL, NULL, '2026-07-30 11:56:58'),
(70, 8, 1, NULL, 'Reportar uma falha', 'reportar uma falha', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:57:05'),
(71, 8, 1, NULL, 'Problema no limpador de para brisa', 'problema no limpador de para brisa', 'Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 9, 'sucesso', NULL, NULL, '2026-07-30 11:57:23'),
(72, 8, 1, NULL, 'Volkswagen Caminhões e Ônibus', 'volkswagen caminhoes e onibus', 'Certo, a marca é Volkswagen Caminhões e Ônibus. Qual é a família do veículo? Você pode falar, digitar ou selecionar uma das famílias dessa marca.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:57:35'),
(73, 8, 1, NULL, 'Delivery', 'delivery', 'Identifiquei a família Delivery. Qual é o modelo exato? Você pode falar, digitar ou selecionar um dos modelos dessa família.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:57:42'),
(74, 8, 1, NULL, 'Delivery 11.180', 'delivery 11 180', 'Confira antes de enviar:\n\nTipo: Falha\nVeículo: Volkswagen Caminhões e Ônibus · Delivery · Delivery 11.180\nCategoria: Visibilidade e limpeza dos vidros\nRelato: Problema no limpador de para brisa\n\nPosso reportar isso para nosso time de assistência e produto?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:57:46'),
(75, 8, 1, NULL, 'Sim, pode enviar', 'sim pode enviar', 'Obrigado. O relato foi registrado com o protocolo DL-20260730-000004. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 12, 'sucesso', NULL, '{\"type\": \"service_report\", \"label\": \"Acompanhar o protocolo\", \"query\": {\"id\": 4}, \"route\": \"service-desk\"}', '2026-07-30 11:57:53'),
(76, 8, 1, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-30 11:57:58'),
(77, 8, 1, NULL, '5 · Excelente', '5 excelente', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 11:58:01'),
(78, 8, 1, NULL, 'Encerrar sem comentário', 'encerrar sem comentario', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 6, 'sucesso', NULL, NULL, '2026-07-30 11:58:09'),
(79, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-30 12:03:59'),
(80, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 12:04:27'),
(81, 1, NULL, 22, 'Realize um comparativo entre veículos 6x4 contendo as marcas Volkswagen Caminhões e ônibus, Volvo, Scania,', 'realize um comparativo entre veiculos 6x4 contendo as marcas volkswagen caminhoes e onibus volvo scania', 'Não encontrei frota cadastrada para a região ou escopo informado.', 'voz', 'consulta', 'local', 0, 0, 60, 0.000000, 22, 'sucesso', NULL, '{\"type\": \"technical_catalog\", \"label\": \"4 veículos encontrados em 6x4\", \"query\": {\"q\": \"6x4\", \"tipo\": \"caminhao\"}, \"route\": \"catalogo-tecnico\", \"models\": [{\"id\": 103, \"pbt\": \"23.000 Kg\", \"name\": \"Scania Scania R 500 6x4 Super\", \"pbtc\": \"74.000 Kg\", \"motor\": \"DC13 174\", \"power\": \"500 hp (368 kW) @ 1.800 rpm\", \"family\": \"Linha R\", \"torque\": \"2.650 Nm @ 900–1.320 rpm\", \"reduction\": \"3,07:1 | 3,42:1\", \"wheelbase\": \"3.550\"}, {\"id\": 19, \"pbt\": \"23.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 27.260 6x4\", \"pbtc\": \"36.000 kg\", \"motor\": \"MAN / D0836LF18\", \"power\": \"260 (191) @ 2.200\", \"family\": \"Constellation\", \"torque\": \"950 @ 1.000 - 1.800\", \"reduction\": \"5,29:1 / 4,88:1\", \"wheelbase\": \"4.800 / 5.940\"}, {\"id\": 71, \"pbt\": \"\", \"name\": \"Volvo FMX 420 6x4R\", \"pbtc\": \"\", \"motor\": \"Volvo D13K 12,8 l\", \"power\": \"420 cv @ 1.400–1.800 rpm\", \"family\": \"FMX\", \"torque\": \"2.100 Nm @ 905–1.400 rpm\", \"reduction\": \"\", \"wheelbase\": \"\"}, {\"id\": 21, \"pbt\": \"23.000 kg\", \"name\": \"Volkswagen Caminhões e Ônibus Constellation 31.320 6x4\", \"pbtc\": \"42.000 kg\", \"motor\": \"MAN / D0836LF17\", \"power\": \"315 (231) @ 2.200\", \"family\": \"Constellation\", \"torque\": \"1.200 @ 1.200 - 1.700\", \"reduction\": \"4,89:1 / 4,56:1 / 5,38:1\", \"wheelbase\": \"4.800 / 5.940\"}], \"compare\": [103, 19, 71, 21]}', '2026-07-30 12:05:29'),
(82, 1, NULL, NULL, 'Consultar o Drive Learn', 'consultar o drive learn', 'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 5, 'sucesso', NULL, NULL, '2026-07-30 17:21:22'),
(83, 1, NULL, 23, 'Gostaria de saber mais sobre a função v constante', 'gostaria de saber mais sobre a funcao v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nEla é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 11, 'sucesso', NULL, NULL, '2026-07-30 17:21:38'),
(84, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 17:22:08'),
(85, 1, NULL, NULL, '4 · Muito bom', '4 muito bom', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 17:22:12'),
(86, 1, NULL, NULL, 'Encerrar sem comentário', 'encerrar sem comentario', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 4, 'sucesso', NULL, NULL, '2026-07-30 17:22:18'),
(87, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 17:22:27'),
(88, 1, NULL, NULL, 'Reportar uma falha', 'reportar uma falha', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 17:22:45'),
(89, 1, NULL, NULL, 'Veículo apresentando perda de potencia durante a subida', 'veiculo apresentando perda de potencia durante a subida', 'Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 13, 'sucesso', NULL, NULL, '2026-07-30 17:23:06'),
(90, 1, NULL, NULL, 'Volkswagen Caminhões e Ônibus', 'volkswagen caminhoes e onibus', 'Certo, a marca é Volkswagen Caminhões e Ônibus. Qual é a família do veículo? Você pode falar, digitar ou selecionar uma das famílias dessa marca.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 2, 'sucesso', NULL, NULL, '2026-07-30 17:23:14'),
(91, 1, NULL, NULL, 'Meteor', 'meteor', 'Identifiquei a família Meteor. Qual é o modelo exato? Você pode falar, digitar ou selecionar um dos modelos dessa família.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 17:23:17'),
(92, 1, NULL, NULL, 'Meteor 6x4 29.530', 'meteor 6x4 29 530', 'Confira antes de enviar:\n\nTipo: Falha\nVeículo: Volkswagen Caminhões e Ônibus · Meteor · Meteor 6x4 29.530\nCategoria: Powertrain e desempenho\nRelato: Veículo apresentando perda de potencia durante a subida\n\nPosso reportar isso para nosso time de assistência e produto?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 4, 'sucesso', NULL, NULL, '2026-07-30 17:23:20'),
(93, 1, NULL, NULL, 'Sim, pode enviar', 'sim pode enviar', 'Obrigado. O relato foi registrado com o protocolo DL-20260730-000005. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 117, 'sucesso', NULL, '{\"type\": \"service_report\", \"label\": \"Acompanhar o protocolo\", \"query\": {\"id\": 5}, \"route\": \"service-desk\"}', '2026-07-30 17:23:39'),
(94, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-30 17:29:11'),
(95, 1, NULL, NULL, '5 · Excelente', '5 excelente', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 0, 'sucesso', NULL, NULL, '2026-07-30 17:29:12'),
(96, 1, NULL, NULL, 'Encerrar sem comentário', 'encerrar sem comentario', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-30 17:29:14'),
(97, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-31 00:01:34'),
(98, 1, NULL, NULL, 'Enviar uma sugestão', 'enviar uma sugestao', 'Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 1, 'sucesso', NULL, NULL, '2026-07-31 00:02:31'),
(99, 1, NULL, NULL, 'Gostaria que o RIO tivesse uma IA para gerar análises de rodagens', 'gostaria que o rio tivesse uma ia para gerar analises de rodagens', 'Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 6, 'sucesso', NULL, NULL, '2026-07-31 00:02:53'),
(100, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 92, 'sucesso', NULL, NULL, '2026-07-31 01:20:09');
INSERT INTO `assistente_interacoes` (`id`, `usuario_id`, `empresa_id`, `resposta_id`, `pergunta`, `pergunta_normalizada`, `resposta`, `entrada`, `tipo_interacao`, `origem_resposta`, `tokens_entrada`, `tokens_saida`, `audio_segundos`, `custo_estimado_usd`, `latencia_ms`, `status`, `erro`, `acao_json`, `criado_em`) VALUES
(101, 1, NULL, NULL, 'Sugerir uma melhoria', 'sugerir uma melhoria', 'Isso aconteceu em um veículo ou no sistema Drive Learn?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 74, 'sucesso', NULL, NULL, '2026-07-31 01:20:11'),
(102, 1, NULL, 24, 'É em um veículo', 'e em um ve iculo', 'Dados cadastrados para IVECO · IVECO BUS · IVECO BUS 10-190:\n\n• Motor: FPT NEF 4 ID\n• Potência: 190 cv (138 kW) @ 2.500 rpm\n• Torque: 610 Nm @ 1.350–2.100 rpm\n• Transmissão: Eaton 6206 B manual, 6 marchas\n• PBT: 10.500 kg\n• Entre-eixos: 4.500 / 4.800\n• Relação de redução: 4,56:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', 'texto', 'consulta', 'local', 0, 0, 0, 0.000000, 282, 'sucesso', NULL, NULL, '2026-07-31 01:20:15'),
(103, 1, NULL, NULL, 'Não, quero continuar', 'n ao quero continuar', 'Sem problema. Continue me contando sua dúvida ou escolha outra jornada.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 72, 'sucesso', NULL, NULL, '2026-07-31 01:20:53'),
(104, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 78, 'sucesso', NULL, NULL, '2026-07-31 01:20:55'),
(105, 1, NULL, NULL, 'Reportar uma falha', 'reportar uma falha', 'Isso aconteceu em um veículo ou no sistema Drive Learn?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 75, 'sucesso', NULL, NULL, '2026-07-31 01:20:58'),
(106, 1, NULL, 24, 'É em um veículo', 'e em um ve iculo', 'Dados cadastrados para IVECO · IVECO BUS · IVECO BUS 10-190:\n\n• Motor: FPT NEF 4 ID\n• Potência: 190 cv (138 kW) @ 2.500 rpm\n• Torque: 610 Nm @ 1.350–2.100 rpm\n• Transmissão: Eaton 6206 B manual, 6 marchas\n• PBT: 10.500 kg\n• Entre-eixos: 4.500 / 4.800\n• Relação de redução: 4,56:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', 'texto', 'consulta', 'cache', 0, 0, 0, 0.000000, 238, 'sucesso', NULL, NULL, '2026-07-31 01:21:00'),
(107, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 75, 'sucesso', NULL, NULL, '2026-07-31 01:43:57'),
(108, 1, NULL, NULL, '5 · Excelente', '5 excelente', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 74, 'sucesso', NULL, NULL, '2026-07-31 01:43:59'),
(109, 1, NULL, NULL, 'Encerrar sem comentário', 'encerrar sem coment ario', 'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 101, 'sucesso', NULL, NULL, '2026-07-31 01:44:00'),
(110, 1, NULL, NULL, 'Reportar problema ou melhoria', 'reportar problema ou melhoria', 'O que você deseja registrar?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 79, 'sucesso', NULL, NULL, '2026-07-31 01:44:33'),
(111, 1, NULL, NULL, 'Sugerir uma melhoria', 'sugerir uma melhoria', 'Isso aconteceu em um veículo ou no sistema Drive Learn?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 74, 'sucesso', NULL, NULL, '2026-07-31 01:44:40'),
(112, 1, NULL, NULL, 'É no sistema', 'e no sistema', 'Descreva livremente a falha ou melhoria no sistema. O chamado será classificado como Sistemas · sistemas web.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 75, 'sucesso', NULL, NULL, '2026-07-31 01:44:43'),
(113, 1, NULL, NULL, 'Gostaria que o sistema RIO tivesse algum agente de IA para gerar relatórios internos mais facil', 'gostaria que o sistema rio tivesse algum agente de ia para gerar relat orios internos mais facil', 'Confira antes de enviar:\n\nTipo: Melhoria\nOrigem: Sistema\nCategoria: Sistemas\nRelato: Gostaria que o sistema RIO tivesse algum agente de IA para gerar relatórios internos mais facil\n\nPosso reportar isso para nosso time responsável?', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 101, 'sucesso', NULL, NULL, '2026-07-31 01:45:14'),
(114, 1, NULL, NULL, 'Sim, pode enviar', 'sim pode enviar', 'Obrigado. O relato foi registrado com o protocolo RQ-20260730-000006. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.', 'texto', 'service_desk', 'local', 0, 0, 0, 0.000000, 318, 'sucesso', NULL, '{\"type\": \"service_report\", \"label\": \"Acompanhar o protocolo\", \"query\": {\"id\": 6}, \"route\": \"service-desk\"}', '2026-07-31 01:45:25'),
(115, 1, NULL, NULL, 'Sim', 'sim', 'Antes de encerrar, como você avalia este atendimento?', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 74, 'sucesso', NULL, NULL, '2026-07-31 01:45:40'),
(116, 1, NULL, NULL, '4 · Muito bom', '4 muito bom', 'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 73, 'sucesso', NULL, NULL, '2026-07-31 01:45:42'),
(117, 1, NULL, NULL, 'Agradeço por receberem meu feddback', 'agradeco por receberem meu feddback', 'Obrigado pela nota e pelo comentário. Seu retorno foi registrado e o atendimento foi encerrado.', 'texto', 'controle', 'local', 0, 0, 0, 0.000000, 100, 'sucesso', NULL, NULL, '2026-07-31 01:46:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `assistente_limites`
--

CREATE TABLE `assistente_limites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `chave_escopo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limite_diario` smallint(5) UNSIGNED NOT NULL DEFAULT '40',
  `observacao` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assistente_limites`
--

INSERT INTO `assistente_limites` (`id`, `empresa_id`, `chave_escopo`, `limite_diario`, `observacao`, `ativo`, `criado_por`, `criado_em`, `atualizado_em`) VALUES
(1, NULL, 'global', 40, 'Limite padrão para empresas sem configuração específica.', 1, 1, '2026-07-29 04:56:52', '2026-07-31 01:10:29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `assistente_respostas`
--

CREATE TABLE `assistente_respostas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contexto_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pergunta_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pergunta_base` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pergunta_normalizada` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `resposta` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fontes` json DEFAULT NULL,
  `modelo_api` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validada` tinyint(1) NOT NULL DEFAULT '0',
  `reutilizavel` tinyint(1) NOT NULL DEFAULT '1',
  `usos` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `criada_por` bigint(20) UNSIGNED DEFAULT NULL,
  `criada_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizada_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assistente_respostas`
--

INSERT INTO `assistente_respostas` (`id`, `contexto_hash`, `pergunta_hash`, `pergunta_base`, `pergunta_normalizada`, `resposta`, `fontes`, `modelo_api`, `validada`, `reutilizavel`, `usos`, `criada_por`, `criada_em`, `atualizada_em`) VALUES
(1, '7ef9c905555e7048f06fdb78b562c3c4954746351540496f572c19b09cabd3c9', '2e7450841ac3fe17374861018fa867c3d860fd6b71c548daa56fc71911285112', 'preciso realizar uma comparação entre onibus eletricos da volkswagen, mercedes bens e byd', 'preciso realizar uma comparac ao entre onibus eletricos da volkswagen mercedes bens e byd', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• BYD BYD BC10LE — potência 2× 150 kW, torque 2× 600 Nm, PBT 19.500 kg, entre-eixos 5.420\n• Mercedes-Benz Mercedes-Benz eO500U — potência 250 kW / 340 cv (total), torque 2 × 485 Nm, PBT 21.200 kg\n• Volkswagen Caminhões e Ônibus Constellation 14.210 4x2 — potência 205 (150) @ 2.300, torque 750 @ 1.200 - 1.800, PBT 14.500 kg, entre-eixos 4.800 / 5.207\n• BYD BYD eBus B12.b — potência 2 × 150 kW (máxima), PBT 20.000 kg, entre-eixos 5.950\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', '{\"videos\": [], \"modelos\": [{\"id\": 116, \"nome\": \"BYD BC10LE\", \"marca\": \"BYD\"}, {\"id\": 117, \"nome\": \"BYD eBus B12.b\", \"marca\": \"BYD\"}, {\"id\": 118, \"nome\": \"BYD eBus B13\", \"marca\": \"BYD\"}, {\"id\": 119, \"nome\": \"Mercedes-Benz eO500U\", \"marca\": \"Mercedes-Benz\"}, {\"id\": 132, \"nome\": \"LO 916/48 ORE 2\", \"marca\": \"Mercedes-Benz\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 02:55:49', '2026-07-29 02:55:49'),
(2, '7aeb7378f9d04629f3baeb06cd9c95106688a3ee8e65efe6b4e92e7bd811d212', '2c8eebd936fb9710154fec3b1dc6e98b1349791810940fc0223f3b0f937ff9f9', 'preciso verificar quais veiculos 6x4 tenho hoje das marcas iveco volks daf e comparar', 'preciso verificar quais veiculos 6x4 tenho hoje das marcas iveco volks daf e comparar', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• DAF XF FTT 6X4 530 cv — potência 530 cv - 390 kW (1.675 rpm), torque 2.500 / 2.600 Nm @1.000 - 1.425 rpm, PBT 23.000 kg, entre-eixos 3.200\n• IVECO S-Way 540 6x4 — potência 540 cv @ 1.500–1.900 rpm, torque 2.550 Nm @ 1.000–1.500 rpm, PBT 23.000 kg, entre-eixos 3.540\n• IVECO Tector 27-320 — potência 320 cv @ 2.200–2.500 rpm, torque 1.100 Nm @ 1.300–1.900 rpm, PBT 23.000 kg, entre-eixos 3.690 / 4.185 / 4.815\n• Volkswagen Caminhões e Ônibus Constellation 27.260 6x4 — potência 260 (191) @ 2.200, torque 950 @ 1.000 - 1.800, PBT 23.000 kg, entre-eixos 4.800 / 5.940\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', '{\"videos\": [{\"id\": 2, \"titulo\": \"NOVO VOLKSBUS 17.260\"}], \"modelos\": [{\"id\": 142, \"nome\": \"IVECO BUS 10-190\", \"marca\": \"IVECO\"}, {\"id\": 143, \"nome\": \"IVECO BUS 17-280\", \"marca\": \"IVECO\"}, {\"id\": 65, \"nome\": \"S-Way 540 6x4\", \"marca\": \"IVECO\"}, {\"id\": 120, \"nome\": \"Daily 30-160\", \"marca\": \"IVECO\"}, {\"id\": 121, \"nome\": \"Daily 35-160\", \"marca\": \"IVECO\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 02:56:57', '2026-07-29 02:56:57'),
(3, '9f42407428f19c3b60e9e1f3df374888d8e88cb351e7134b82e4ac0bedcd4815', '27d2a71f8a681b95930cb0f02468150d47eb32aeaacc55435f344aa565e1b67e', 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4', 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• IVECO S-Way 540 6x4 — potência 540 cv @ 1.500–1.900 rpm, torque 2.550 Nm @ 1.000–1.500 rpm, PBT 23.000 kg, entre-eixos 3.540\n• Volvo FH 540 6x4T — potência 540 cv - 397 kW  (1460-1800 rpm), torque 2600 Nm (1000-1460 rpm), PBT 28.500 Kg, entre-eixos 3.000 / 3.200 / 3.600\n• Volvo FMX 540 6x4T — potência 540 cv @ 1.460–1.800 rpm, torque 2.600 Nm @ 1.000–1.460 rpm\n• Scania R 540 A 6x4 NZ (plus) 540 cv — potência 540 hp @ 1.800 rpm, torque 2.700 Nm @ 1.000 -1.300 rpm, PBT 23.000 kg, entre-eixos 3.550\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', '{\"videos\": [], \"modelos\": [{\"id\": 65, \"nome\": \"S-Way 540 6x4\", \"marca\": \"IVECO\"}, {\"id\": 145, \"nome\": \"FH 540 6x4T\", \"marca\": \"Volvo\"}, {\"id\": 142, \"nome\": \"IVECO BUS 10-190\", \"marca\": \"IVECO\"}, {\"id\": 68, \"nome\": \"FH 500 6x2T\", \"marca\": \"Volvo\"}, {\"id\": 74, \"nome\": \"FMX 540 6x4T\", \"marca\": \"Volvo\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 02:58:35', '2026-07-29 02:58:35'),
(4, '8e35355097521ec69bbee2fff713c4ef9c3f690a2ee269635b9516ce55cacfb0', '2eb6cef0eebc9812a08d2f62ef56659502ceab4e7b01d61c0c452e5bb084a3b6', 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4 das marcas volkswagen, iveco, daf, scania e mercedes', 'preciso verificar veiculos que tenham potencia entre 500 e 540 e sejam 6x4 das marcas volkswagen iveco daf scania e mercedes', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• DAF XF FTT 6X4 530 cv — potência 530 cv - 390 kW (1.675 rpm), torque 2.500 / 2.600 Nm @1.000 - 1.425 rpm, PBT 23.000 kg, entre-eixos 3.200\n• IVECO S-Way 540 6x4 — potência 540 cv @ 1.500–1.900 rpm, torque 2.550 Nm @ 1.000–1.500 rpm, PBT 23.000 kg, entre-eixos 3.540\n• Mercedes-Benz Arocs 3351 K 6x4 — potência 495 cv, torque 2.400 Nm, PBT 33.500 kg\n• Scania Scania R 500 6x4 Super — potência 500 hp (368 kW) @ 1.800 rpm, torque 2.650 Nm @ 900–1.320 rpm, PBT 23.000 Kg, entre-eixos 3.550\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', '{\"videos\": [], \"modelos\": [{\"id\": 65, \"nome\": \"S-Way 540 6x4\", \"marca\": \"IVECO\"}, {\"id\": 142, \"nome\": \"IVECO BUS 10-190\", \"marca\": \"IVECO\"}, {\"id\": 103, \"nome\": \"Scania R 500 6x4 Super\", \"marca\": \"Scania\"}, {\"id\": 107, \"nome\": \"Scania S 500 Super\", \"marca\": \"Scania\"}, {\"id\": 111, \"nome\": \"Scania P 500 Super\", \"marca\": \"Scania\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 02:59:49', '2026-07-29 02:59:49'),
(5, 'd615271c39d027234ad8b631f71dc6b946ee53077b94e69911adce4de54f6bf5', 'c04ddfac5a84a8d4d40cd87b8dfaa8b3c4c5b7e776b0ec6a7614398827e12208', 'Baseando nos cliente que tenho em são paulo, gostaria de entender qual marca tem maior numero naquela regiao', 'baseando nos cliente que tenho em s ao paulo gostaria de entender qual marca tem maior numero naquela regiao', 'Dados cadastrados para IVECO · IVECO BUS · IVECO BUS 17-280:\n\n• Motor: FPT NEF 6 Euro VI HiSCR\n• Potência: 280 cv (207 kW) @ 2.500 rpm\n• Torque: 950 Nm @ 1.250–1.970 rpm\n• Transmissão: ZF 6S 1010 BO manual, 6 marchas\n• PBT: 16.000 kg\n• Entre-eixos: 5.950\n• Relação de redução: 5,57:1 / 5,13:1 / 6,57:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', '{\"videos\": [], \"modelos\": [{\"id\": 143, \"nome\": \"IVECO BUS 17-280\", \"marca\": \"IVECO\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 03:01:04', '2026-07-29 03:01:04'),
(6, '96470a6ce25368a68ee04a3eec1d51db77f60765bc5a528cd39218db76d09bb7', '9260002fff393b26a6654920314600713c3be669a5393c89fd2b960c3c2d80ed', 'Estou em um meteor agora, e gostaria de pra que serve esse botao de v constante', 'estou em um meteor agora e gostaria de pra que serve esse botao de v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nVamos iniciar o treinamento do Volkswagen Meteor. Hoje vamos conhecer a função V Constante. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida.\n\nPara confirmar o procedimento completo, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 5, \"titulo\": \"FUNÇÃO V CONSTANTE\"}], \"modelos\": [{\"id\": 29, \"nome\": \"Meteor 6x4 28.480HD\", \"marca\": \"Volkswagen Caminhões e Ônibus\"}, {\"id\": 4, \"nome\": \"Meteor 6x4 29.530\", \"marca\": \"Volkswagen Caminhões e Ônibus\"}, {\"id\": 131, \"nome\": \"XF FTT 6X4 530 cv\", \"marca\": \"DAF\"}, {\"id\": 130, \"nome\": \"CF FAS PX-7 290 cv\", \"marca\": \"DAF\"}], \"analises\": []}', 'local-rules', 0, 1, 1, 1, '2026-07-29 03:15:08', '2026-07-29 03:15:08'),
(7, 'c376a55413460bcdbd6d8d02bac19d5504f3889fb011d7452543e0ecb9e98d0e', 'ded4b4b8f2e58f2cc7bd993b024d5aa896349cf70c535429a798e47bc7c0711f', 'como funciona a função V constante?', 'como funciona a func ao v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nHoje vamos conhecer a função V Constante. Para ativar a função, é bem simples. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.\n\nPara confirmar o procedimento completo, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 5, \"titulo\": \"FUNÇÃO V CONSTANTE\"}, {\"id\": 2, \"titulo\": \"NOVO VOLKSBUS 17.260\"}, {\"id\": 4, \"titulo\": \"CONDUÇÃO NA PRÁTICA\"}, {\"id\": 3, \"titulo\": \"DM & RM\"}], \"modelos\": [], \"analises\": []}', 'local-rules', 0, 1, 1, 1, '2026-07-29 03:18:21', '2026-07-29 03:18:21'),
(9, '08c374f39354ae006c68cffbc53a05f5185c706e9d88f866645d95472186f8d9', 'e8dc8067da3cefda003e120568bae8870f0f61e43c6fb6a998b9bb213f029c11', 'Estou com uma dúvida quanto à função do meteor. Para que serve a função do v constante?', 'estou com uma d uvida quanto a func ao do meteor para que serve a func ao do v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 5, \"titulo\": \"FUNÇÃO V CONSTANTE\"}, {\"id\": 4, \"titulo\": \"CONDUÇÃO NA PRÁTICA\"}, {\"id\": 2, \"titulo\": \"NOVO VOLKSBUS 17.260\"}, {\"id\": 3, \"titulo\": \"DM & RM\"}], \"modelos\": [{\"id\": 29, \"nome\": \"Meteor 6x4 28.480HD\", \"marca\": \"Volkswagen Caminhões e Ônibus\"}, {\"id\": 4, \"nome\": \"Meteor 6x4 29.530\", \"marca\": \"Volkswagen Caminhões e Ônibus\"}], \"analises\": []}', 'local-rules-v2', 0, 1, 1, 1, '2026-07-29 03:24:09', '2026-07-29 03:24:09'),
(12, '7eedfc694753bd11e980edaa0c8e6d83caa24886e638cc4db2137447bc41e224', 'ee46e115ece931a8e35feadbbd9c6df6d7e4ef19fe139a67370142635a806a23', 'Para que serve a função v constante?', 'para que serve a func ao v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nDireto ao ponto: A Função V Constante é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 5, \"titulo\": \"FUNÇÃO V CONSTANTE\"}], \"modelos\": [], \"analises\": []}', 'local-rules-v3', 0, 1, 1, 1, '2026-07-29 03:33:18', '2026-07-29 03:33:18'),
(13, '044c2b4b7668c1f2be33e126f586bb03c4f0a0fe8c5b588a8794ee1c06115944', 'bf28320fe026aebb9f27ac28a08d2d1f7cdc1304c8ae0b64ba7bbe60992090cd', 'E como eu desativo a função?', 'e como eu desativo a func ao', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nAssim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 5, \"titulo\": \"FUNÇÃO V CONSTANTE\"}], \"modelos\": [], \"analises\": []}', 'local-rules-v3', 0, 1, 1, 1, '2026-07-29 03:33:33', '2026-07-29 03:33:33'),
(14, '8feccbef44a6bfb71f74fbda723d55d58571744c33a299990526d4c0e5ae1b07', 'c214a104c99f6e160ddeea8dc43d01684183b0789b9c7f6f3e28b57bf9e0563c', 'Poderia melhorar a sua resposta quanto a desativação?', 'poderia melhorar a sua resposta quanto a desativac ao', 'Dados cadastrados para IVECO · Tector · Tector 9-190:\n\n• Motor: FPT NEF4 4,5 l\n• Potência: 190 cv @ 2.200–2.500 rpm\n• Torque: 610 Nm @ 1.200–2.100 rpm\n• Transmissão: Eaton ESO6106B manual, 6 marchas\n• PBT: 8.600 kg\n• PBTC: 11.000 kg\n• Entre-eixos: 3.906 / 4.460\n• Relação de redução: 4,30:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', '{\"videos\": [], \"modelos\": [{\"id\": 53, \"nome\": \"Tector 9-190\", \"marca\": \"IVECO\"}], \"analises\": []}', 'local-rules', 0, 1, 1, 1, '2026-07-29 03:33:51', '2026-07-29 03:33:51'),
(15, 'c39cb8b5e3f1d2d900c0528497518b881a948aa62ef96be8e982346032cff43d', '30281837f324e31737e6381741a179bc6a079d25bc5c24c9375594c7c70312d9', 'preciso de uma comparação de 4 marcas  6x4 com potencia entre 500 e 530, sendo as marcas VWCO, Iveco, DAF, Scania', 'preciso de uma comparac ao de 4 marcas 6x4 com potencia entre 500 e 530 sendo as marcas vwco iveco daf scania', 'Não encontrei frota cadastrada para a região ou escopo informado.', '{\"videos\": [], \"modelos\": [], \"analises\": [{\"titulo\": \"Presença de marcas\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 06:07:34', '2026-07-29 06:07:34'),
(16, '87735dcb87eb5711650f06c0885fc5025026fb6236bd102981d4912f8e99e88f', '65d81726809250e9f9a956d8ba63074938971d7d098020000ea43c1d6a83fc5c', 'Gostaria de fazer uma busca? De veículos 6 por 4. Onde tem um potência aproximada de 500 cavalos.', 'gostaria de fazer uma busca de veiculos 6 por 4 onde tem um potencia aproximada de 500 cavalos', 'As marcas com maior presença no seu escopo são:\n\n1º Volvo — 77 veículo(s) em 1 cliente(s)\n2º Scania — 2 veículo(s) em 1 cliente(s)\n3º Volkswagen Caminhões e Ônibus — 1 veículo(s) em 1 cliente(s)', '{\"videos\": [], \"modelos\": [], \"analises\": [{\"titulo\": \"Ranking de marcas por frota\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-29 20:26:25', '2026-07-29 20:26:25'),
(17, 'e9a501790810592e245521b40964c7ec2e90176545ebd3e2ffe2c59041d92eba', '9c883cd137aeee1fedd4bfe40ed4276bb20aa79a86073df279c1f72809ce242c', 'Gostaria de analisar veiulos 6x4, scania, meteor, daf e ivevo', 'gostaria de analisar veiulos 6x4 scania meteor daf e ivevo', 'Dados cadastrados para Scania · Linha R · Scania R 500 6x4 Super:\n\n• Motor: DC13 174\n• Potência: 500 hp (368 kW) @ 1.800 rpm\n• Torque: 2.650 Nm @ 900–1.320 rpm\n• Transmissão: Scania Opticruise G25/G33\n• PBT: 23.000 Kg\n• PBTC: 74.000 Kg\n• Entre-eixos: 3.550\n• Relação de redução: 3,07:1 | 3,42:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', '{\"videos\": [], \"modelos\": [{\"id\": 103, \"nome\": \"Scania R 500 6x4 Super\", \"marca\": \"Scania\"}], \"analises\": []}', 'local-rules', 0, 1, 1, 1, '2026-07-29 20:27:02', '2026-07-29 20:27:02'),
(18, 'ec109ffca5a611dac6175aa08d24442302bc108d9b0f0b12aeec11d8ab69f628', '163d7b6c67562425400e16df6afb6f3699fc39e9962b2875e1fa53594f1a27cc', 'Gostaria de comparar veiulos 6x4, scania, meteor, daf e ivevo.', 'gostaria de comparar veiulos 6x4 scania meteor daf e ivevo', 'Encontrei 4 veículos compatíveis no catálogo:\n\n• DAF XF FTT 6X4 530 cv — potência 530 cv - 390 kW (1.675 rpm), torque 2.500 / 2.600 Nm @1.000 - 1.425 rpm, PBT 23.000 kg, entre-eixos 3.200\n• Scania Scania R 500 6x4 Super — potência 500 hp (368 kW) @ 1.800 rpm, torque 2.650 Nm @ 900–1.320 rpm, PBT 23.000 Kg, entre-eixos 3.550\n• Volkswagen Caminhões e Ônibus Meteor 6x4 29.530 — potência 525 (386) @ 1.800, torque 2.600 @ 930 - 1.350, PBT 23.000 kg, entre-eixos 4.600 / 4.800 / 5.000\n• Volkswagen Caminhões e Ônibus Meteor 6x4 28.480HD — potência 475 (350) @ 1.800, torque 2.400 @ 930 - 1.350, PBT 23.000 kg, entre-eixos 4.600\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.', '{\"videos\": [], \"modelos\": [{\"id\": 131, \"nome\": \"DAF XF FTT 6X4 530 cv\", \"marca\": \"\"}, {\"id\": 103, \"nome\": \"Scania Scania R 500 6x4 Super\", \"marca\": \"\"}, {\"id\": 4, \"nome\": \"Volkswagen Caminhões e Ônibus Meteor 6x4 29.530\", \"marca\": \"\"}, {\"id\": 29, \"nome\": \"Volkswagen Caminhões e Ônibus Meteor 6x4 28.480HD\", \"marca\": \"\"}], \"analises\": []}', 'local-rules', 0, 1, 1, 1, '2026-07-29 20:27:40', '2026-07-29 20:27:40'),
(19, 'ab56fe4ec175b2542d724b51959231f1ebf145c01308d03179cf06767708f8db', '3bd90f6167a414bfb35f5c735a5060ce0e242a8103139445879472e0f41b6ff8', 'Gostaria de ver a ficha técnica do volksbus 17.230', 'gostaria de ver a ficha tecnica do volksbus 17 230', 'Dados cadastrados para Volkswagen Caminhões e Ônibus · Delivery · Delivery 6.170:\n\n• Motor: F1C 3.0l\n• Potência: 156 cv @ 3.300 rpm\n• Torque: 430 Nm @ 1.400 - 2.700 rpm\n• Transmissão: Manual - Eaton / ESO 4206\n• PBT: 5.850 kg\n• PBTC: 6.900 kg\n• Entre-eixos: 4.000\n• Relação de redução: 5,13:1 / 4,78:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', '{\"videos\": [], \"modelos\": [{\"id\": 6, \"nome\": \"Delivery 6.170\", \"marca\": \"Volkswagen Caminhões e Ônibus\"}], \"analises\": []}', 'local-rules', 0, 1, 1, 1, '2026-07-30 11:40:14', '2026-07-30 11:40:14'),
(20, '81df91e444cc4cd65ce6c7db46c30bb7ed3cef45b85b780f2ccc4f347fbe4702', '8272c851690a1b83db63f82b8c79208b6a43cd2572bb92ced76a1edeeef4fb78', 'busque a ficha técnica da marca volkswagen modelo volksbus 17.230', 'busque a ficha tecnica da marca volkswagen modelo volksbus 17 230', 'As marcas com maior presença no seu escopo são:\n\n1º Volvo — 77 veículo(s) em 1 cliente(s)\n2º Scania — 2 veículo(s) em 1 cliente(s)\n3º Volkswagen Caminhões e Ônibus — 1 veículo(s) em 1 cliente(s)', '{\"videos\": [], \"modelos\": [], \"analises\": [{\"titulo\": \"Ranking de marcas por frota\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-30 11:41:25', '2026-07-30 11:41:25'),
(21, 'ef9f0e5bde41613fbc928c06dd634411087f64be6cdac02a2e70a2f8c15f473a', '8f219b76a8a6190655fec76a951fb727b13d2a640ac5248c6ec082713ecfb69d', 'Gostaria de conhecer treinamentos sobre a plataforma RIO', 'gostaria de conhecer treinamentos sobre a plataforma rio', 'Com base no treinamento “RIO - DIAGNÓSTICO REMOTO”:\n\nHoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 8, \"titulo\": \"RIO - DIAGNÓSTICO REMOTO\"}], \"modelos\": [], \"analises\": []}', 'local-rules-v3', 0, 1, 1, 1, '2026-07-30 11:43:13', '2026-07-30 11:43:13'),
(22, '56979f78ce853bd35e01f5837a936c46623e3dc9c0ae5c8d23757e53c2df5150', '5db4bd13e8c7ae13f938d5fbb576c2d5a4a5bdc7f07c53bec93df83a1fd55557', 'Realize um comparativo entre veículos 6x4 contendo as marcas Volkswagen Caminhões e ônibus, Volvo, Scania,', 'realize um comparativo entre veiculos 6x4 contendo as marcas volkswagen caminhoes e onibus volvo scania', 'Não encontrei frota cadastrada para a região ou escopo informado.', '{\"videos\": [], \"modelos\": [], \"analises\": [{\"titulo\": \"Presença de marcas\"}]}', 'local-rules', 0, 1, 1, 1, '2026-07-30 12:05:29', '2026-07-30 12:05:29'),
(23, 'da724809b91e2182d7b9f9a70d6bfa55b700d2f21bf2ad376d9954140fe160a7', 'e188147438ea9d90fd07bad3c37315e7177b4cf84556dbcde9bcdbf0fc8bff22', 'Gostaria de saber mais sobre a função v constante', 'gostaria de saber mais sobre a funcao v constante', 'Com base no treinamento “FUNÇÃO V CONSTANTE”:\n\nEla é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem.\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.', '{\"videos\": [{\"id\": 5, \"titulo\": \"FUNÇÃO V CONSTANTE\"}], \"modelos\": [], \"analises\": []}', 'local-rules-v3', 0, 1, 1, 1, '2026-07-30 17:21:38', '2026-07-30 17:21:38'),
(24, 'ce71e3045a750cead77870e57d0b49c9c6cfd24a5304edefe14204973a44d0b2', '4f3144c358859fd819e0ed545abd1b201b47649d0ca3105ae1d46a2fe686925c', 'É em um veículo', 'e em um ve iculo', 'Dados cadastrados para IVECO · IVECO BUS · IVECO BUS 10-190:\n\n• Motor: FPT NEF 4 ID\n• Potência: 190 cv (138 kW) @ 2.500 rpm\n• Torque: 610 Nm @ 1.350–2.100 rpm\n• Transmissão: Eaton 6206 B manual, 6 marchas\n• PBT: 10.500 kg\n• Entre-eixos: 4.500 / 4.800\n• Relação de redução: 4,56:1\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.', '{\"videos\": [], \"modelos\": [{\"id\": 142, \"nome\": \"IVECO BUS 10-190\", \"marca\": \"IVECO\"}], \"analises\": []}', 'local-rules', 0, 1, 2, 1, '2026-07-31 01:20:15', '2026-07-31 01:21:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `assistente_satisfacoes`
--

CREATE TABLE `assistente_satisfacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interacao_id` bigint(20) UNSIGNED DEFAULT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `nota` tinyint(3) UNSIGNED NOT NULL,
  `comentario` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `assistente_satisfacoes`
--

INSERT INTO `assistente_satisfacoes` (`id`, `interacao_id`, `usuario_id`, `nota`, `comentario`, `criado_em`) VALUES
(1, 23, 1, 4, NULL, '2026-07-29 06:02:57'),
(2, 38, 1, 2, NULL, '2026-07-29 06:22:17'),
(3, 47, 1, 4, NULL, '2026-07-29 12:44:14'),
(4, 58, 1, 4, 'Poderia melhorar as buscas para serem mais precisas', '2026-07-29 20:34:17'),
(5, 76, 8, 5, NULL, '2026-07-30 11:58:09'),
(6, 84, 1, 4, NULL, '2026-07-30 17:22:18'),
(7, 94, 1, 5, NULL, '2026-07-30 17:29:14'),
(8, 107, 1, 5, NULL, '2026-07-31 01:44:00'),
(9, 115, 1, 4, 'Agradeço por receberem meu feddback', '2026-07-31 01:46:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(120) NOT NULL,
  `descricao` text,
  `icone` varchar(80) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `ordem` int(11) DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `descricao`, `icone`, `imagem`, `ordem`, `ativo`) VALUES
(1, 'Direção e volante', 'Ajustes da direção, comandos do volante e recursos de assistência à condução.', 'sign-turn-right', NULL, 1, 1),
(2, 'Freios e segurança', 'Sistemas de frenagem, segurança ativa e condução preventiva.', 'shield-check', NULL, 2, 1),
(3, 'Painel e comandos', 'Leitura do painel, indicadores e utilização dos comandos da cabine.', 'speedometer2', NULL, 3, 1),
(4, 'Motor e desempenho', 'Operação do motor, desempenho e uso correto do trem de força.', 'gear-wide-connected', NULL, 4, 1),
(5, 'Condução econômica', 'Recursos e práticas para reduzir o consumo e melhorar a eficiência.', 'leaf', NULL, 5, 1),
(6, 'Manutenção básica', 'Inspeções preventivas e cuidados essenciais com o veículo.', 'tools', NULL, 6, 1),
(7, 'Motor — Combustível', 'Abastecimento, alimentação, injeção e cuidados relacionados ao combustível.', 'fuel-pump', NULL, 7, 1),
(8, 'Motor — Arrefecimento', 'Controle de temperatura do motor, líquido de arrefecimento e verificações preventivas.', 'thermometer-half', NULL, 8, 1),
(9, 'Chassi', 'Componentes estruturais, inspeções e pontos de atenção do chassi.', 'truck-flatbed', NULL, 9, 1),
(10, 'Retarder', 'Funcionamento e uso correto do sistema auxiliar de frenagem retarder.', 'speedometer2', NULL, 10, 1),
(11, 'Carroceria', 'Operação, inspeção e cuidados com carrocerias e implementos.', 'box-seam', NULL, 11, 1),
(12, 'Ar-condicionado', 'Comandos, regulagens e utilização eficiente do sistema de climatização.', 'snow', NULL, 12, 1),
(13, 'Sistema de exaustão', 'Pós-tratamento, regeneração e indicadores do sistema de emissões.', 'wind', NULL, 13, 1),
(14, 'Suspensão', 'Operação e cuidados com suspensão mecânica ou pneumática.', 'arrows-expand', NULL, 14, 1),
(15, 'Painel do cluster', 'Leitura de indicadores, alertas, menus e informações do computador de bordo.', 'speedometer', NULL, 15, 1),
(16, 'Botões no painel', 'Funções e utilização dos comandos localizados no painel do veículo.', 'toggles', NULL, 16, 1),
(17, 'Botões no volante', 'Navegação, atalhos e funções disponíveis nos comandos do volante.', 'controller', NULL, 17, 1),
(18, 'Direção', 'Ajustes, assistência à condução e utilização correta do sistema de direção.', 'sign-turn-right', NULL, 18, 1),
(20, 'Veículo Completo', 'Um resumo geral do veículo e suas principais funções', 'gear', NULL, 0, 1),
(21, 'Software', 'Treinamentos sobre plataformas como RIO e Drive Learn', 'toggles', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_terms`
--

CREATE TABLE `category_terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `termo` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peso` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `category_terms`
--

INSERT INTO `category_terms` (`id`, `categoria_id`, `termo`, `peso`, `ativo`, `criado_em`) VALUES
(1, 1, 'motor', 1, 1, '2026-07-29 04:37:54'),
(2, 1, 'turbo', 1, 1, '2026-07-29 04:37:54'),
(3, 1, 'óleo', 1, 1, '2026-07-29 04:37:54'),
(4, 1, 'partida', 1, 1, '2026-07-29 04:37:54'),
(5, 1, 'potência', 1, 1, '2026-07-29 04:37:54'),
(6, 1, 'correia', 1, 1, '2026-07-29 04:37:54'),
(7, 2, 'marcha', 1, 1, '2026-07-29 04:37:54'),
(8, 2, 'câmbio', 9, 1, '2026-07-29 04:37:54'),
(9, 2, 'engate', 1, 1, '2026-07-29 04:37:54'),
(10, 2, 'embreagem', 10, 1, '2026-07-29 04:37:54'),
(11, 2, 'cardã', 1, 1, '2026-07-29 04:37:54'),
(12, 2, 'cardan', 1, 1, '2026-07-29 04:37:54'),
(13, 3, 'superaquecimento', 1, 1, '2026-07-29 04:37:54'),
(14, 3, 'temperatura', 1, 1, '2026-07-29 04:37:54'),
(15, 3, 'radiador', 9, 1, '2026-07-29 04:37:54'),
(16, 3, 'ventoinha', 8, 1, '2026-07-29 04:37:54'),
(17, 3, 'reservatório', 1, 1, '2026-07-29 04:37:54'),
(18, 4, 'combustível', 8, 1, '2026-07-29 04:37:54'),
(19, 4, 'diesel', 1, 1, '2026-07-29 04:37:54'),
(20, 4, 'bomba de combustível', 10, 1, '2026-07-29 04:37:54'),
(21, 4, 'filtro de combustível', 9, 1, '2026-07-29 04:37:54'),
(22, 5, 'escapamento', 8, 1, '2026-07-29 04:37:54'),
(23, 5, 'silencioso', 1, 1, '2026-07-29 04:37:54'),
(24, 5, 'abafador', 1, 1, '2026-07-29 04:37:54'),
(25, 5, 'catalisador', 1, 1, '2026-07-29 04:37:54'),
(26, 6, 'roda', 1, 1, '2026-07-29 04:37:54'),
(27, 6, 'lombada', 1, 1, '2026-07-29 04:37:54'),
(28, 6, 'amortecedor', 9, 1, '2026-07-29 04:37:54'),
(29, 6, 'mola', 1, 1, '2026-07-29 04:37:54'),
(30, 6, 'bucha', 1, 1, '2026-07-29 04:37:54'),
(31, 6, 'eixo', 1, 1, '2026-07-29 04:37:54'),
(32, 6, 'suspensão', 10, 1, '2026-07-29 04:37:54'),
(33, 7, 'direção', 1, 1, '2026-07-29 04:37:54'),
(34, 7, 'volante', 1, 1, '2026-07-29 04:37:54'),
(35, 7, 'esterçar', 1, 1, '2026-07-29 04:37:54'),
(36, 7, 'esterçando', 1, 1, '2026-07-29 04:37:54'),
(37, 7, 'shimmy', 1, 1, '2026-07-29 04:37:54'),
(38, 7, 'xime', 1, 1, '2026-07-29 04:37:54'),
(39, 7, 'puxando', 1, 1, '2026-07-29 04:37:54'),
(40, 8, 'freio', 1, 1, '2026-07-29 04:37:54'),
(41, 8, 'frear', 1, 1, '2026-07-29 04:37:54'),
(42, 8, 'abs', 8, 1, '2026-07-29 04:37:54'),
(43, 8, 'ebs', 8, 1, '2026-07-29 04:37:54'),
(44, 8, 'pastilha', 1, 1, '2026-07-29 04:37:54'),
(45, 8, 'disco', 1, 1, '2026-07-29 04:37:54'),
(46, 8, 'pedal', 1, 1, '2026-07-29 04:37:54'),
(47, 9, 'bateria', 1, 1, '2026-07-29 04:37:54'),
(48, 9, 'alternador', 10, 1, '2026-07-29 04:37:54'),
(49, 9, 'injeção', 1, 1, '2026-07-29 04:37:54'),
(50, 9, 'painel', 1, 1, '2026-07-29 04:37:54'),
(51, 9, 'farol', 1, 1, '2026-07-29 04:37:54'),
(52, 9, 'chicote', 1, 1, '2026-07-29 04:37:54'),
(53, 10, 'cabine', 1, 1, '2026-07-29 04:37:54'),
(54, 10, 'retrovisor', 1, 1, '2026-07-29 04:37:54'),
(55, 10, 'painel', 1, 1, '2026-07-29 04:37:54'),
(56, 10, 'banco', 1, 1, '2026-07-29 04:37:54'),
(57, 10, 'forro', 1, 1, '2026-07-29 04:37:54'),
(58, 10, 'vidro', 1, 1, '2026-07-29 04:37:54'),
(59, 11, 'ar-condicionado', 10, 1, '2026-07-29 04:37:54'),
(60, 11, 'compressor', 1, 1, '2026-07-29 04:37:54'),
(61, 11, 'ventilador interno', 9, 1, '2026-07-29 04:37:54'),
(62, 11, 'não gela', 9, 1, '2026-07-29 04:37:54'),
(63, 12, 'baú', 1, 1, '2026-07-29 04:37:54'),
(64, 12, 'porta traseira', 1, 1, '2026-07-29 04:37:54'),
(65, 12, 'grade', 1, 1, '2026-07-29 04:37:54'),
(66, 12, 'plataforma', 1, 1, '2026-07-29 04:37:54'),
(67, 12, 'implemento', 1, 1, '2026-07-29 04:37:54'),
(68, 13, 'adas', 1, 1, '2026-07-29 04:37:54'),
(69, 13, 'airbag', 1, 1, '2026-07-29 04:37:54'),
(70, 13, 'cinto', 1, 1, '2026-07-29 04:37:54'),
(71, 13, 'sensor de faixa', 1, 1, '2026-07-29 04:37:54'),
(72, 13, 'colisão', 1, 1, '2026-07-29 04:37:54'),
(73, 14, 'vibração', 9, 1, '2026-07-29 04:37:54'),
(74, 14, 'ruído', 1, 1, '2026-07-29 04:37:54'),
(75, 14, 'trepidação', 9, 1, '2026-07-29 04:37:54'),
(76, 15, 'vento', 1, 1, '2026-07-29 04:37:54'),
(77, 15, 'aerodinâmico', 1, 1, '2026-07-29 04:37:54'),
(78, 15, 'pneu', 1, 1, '2026-07-29 04:37:54'),
(79, 15, 'carga', 1, 1, '2026-07-29 04:37:54'),
(82, 117, 'ajoelhamento do ônibus', 10, 1, '2026-07-29 05:59:00'),
(83, 117, 'campainha', 8, 1, '2026-07-29 05:59:00'),
(84, 117, 'catraca', 9, 1, '2026-07-29 05:59:00'),
(85, 117, 'elevador para cadeirante', 10, 1, '2026-07-29 05:59:00'),
(86, 117, 'itinerário eletrônico', 8, 1, '2026-07-29 05:59:00'),
(87, 117, 'porta do ônibus', 9, 1, '2026-07-29 05:59:00'),
(88, 117, 'porta pneumática', 9, 1, '2026-07-29 05:59:00'),
(89, 117, 'rampa de acessibilidade', 10, 1, '2026-07-29 05:59:00'),
(90, 117, 'sistema de passageiros', 8, 1, '2026-07-29 05:59:00'),
(91, 117, 'solicitação de parada', 9, 1, '2026-07-29 05:59:00'),
(92, 5, 'admissão de ar', 9, 1, '2026-07-29 05:59:00'),
(93, 5, 'coletor de escape', 9, 1, '2026-07-29 05:59:00'),
(94, 5, 'filtro de ar', 8, 1, '2026-07-29 05:59:00'),
(95, 5, 'intercooler', 9, 1, '2026-07-29 05:59:00'),
(96, 5, 'mangueira do turbo', 9, 1, '2026-07-29 05:59:00'),
(97, 5, 'pressão do turbo', 10, 1, '2026-07-29 05:59:00'),
(98, 5, 'turbina', 9, 1, '2026-07-29 05:59:00'),
(99, 5, 'turbo', 8, 1, '2026-07-29 05:59:00'),
(100, 5, 'vazamento de escape', 9, 1, '2026-07-29 05:59:00'),
(101, 10, 'assoalho quente', 10, 1, '2026-07-29 05:59:00'),
(102, 10, 'banco do motorista', 9, 1, '2026-07-29 05:59:00'),
(103, 10, 'cabine balançando', 8, 1, '2026-07-29 05:59:00'),
(104, 10, 'cabine quente', 9, 1, '2026-07-29 05:59:00'),
(105, 10, 'calor nas pernas', 10, 1, '2026-07-29 05:59:00'),
(106, 10, 'cinto de segurança', 8, 1, '2026-07-29 05:59:00'),
(107, 10, 'desconforto', 7, 1, '2026-07-29 05:59:00'),
(108, 10, 'isolamento térmico', 9, 1, '2026-07-29 05:59:00'),
(109, 10, 'posição de dirigir', 8, 1, '2026-07-29 05:59:00'),
(110, 10, 'ruído na cabine', 9, 1, '2026-07-29 05:59:00'),
(111, 10, 'vibração na cabine', 9, 1, '2026-07-29 05:59:00'),
(112, 12, 'acabamento soltando', 9, 1, '2026-07-29 05:59:00'),
(113, 12, 'carroceria trincada', 10, 1, '2026-07-29 05:59:00'),
(114, 12, 'fechadura', 8, 1, '2026-07-29 05:59:00'),
(115, 12, 'infiltração de água', 10, 1, '2026-07-29 05:59:00'),
(116, 12, 'maçaneta', 8, 1, '2026-07-29 05:59:00'),
(117, 12, 'para-choque', 8, 1, '2026-07-29 05:59:00'),
(118, 12, 'porta não abre', 10, 1, '2026-07-29 05:59:00'),
(119, 12, 'porta não fecha', 10, 1, '2026-07-29 05:59:00'),
(120, 12, 'revestimento interno', 8, 1, '2026-07-29 05:59:00'),
(121, 12, 'tampa lateral', 8, 1, '2026-07-29 05:59:00'),
(122, 110, 'cardã', 10, 1, '2026-07-29 05:59:00'),
(123, 110, 'chassi trincado', 10, 1, '2026-07-29 05:59:00'),
(124, 110, 'cruzeta', 9, 1, '2026-07-29 05:59:00'),
(125, 110, 'diferencial', 10, 1, '2026-07-29 05:59:00'),
(126, 110, 'eixo dianteiro', 8, 1, '2026-07-29 05:59:00'),
(127, 110, 'eixo traseiro', 8, 1, '2026-07-29 05:59:00'),
(128, 110, 'longarina', 9, 1, '2026-07-29 05:59:00'),
(129, 110, 'redução do eixo', 9, 1, '2026-07-29 05:59:00'),
(130, 110, 'tração 4x4', 7, 1, '2026-07-29 05:59:00'),
(131, 110, 'tração 6x4', 7, 1, '2026-07-29 05:59:00'),
(132, 110, 'travessa do chassi', 9, 1, '2026-07-29 05:59:00'),
(133, 11, 'aquecedor da cabine', 9, 1, '2026-07-29 05:59:00'),
(134, 11, 'ar condicionado', 10, 1, '2026-07-29 05:59:00'),
(135, 11, 'climatizador', 9, 1, '2026-07-29 05:59:00'),
(136, 11, 'compressor do ar', 9, 1, '2026-07-29 05:59:00'),
(137, 11, 'não está gelando', 9, 1, '2026-07-29 05:59:00'),
(138, 11, 'saída de ar', 8, 1, '2026-07-29 05:59:00'),
(139, 11, 'ventilação da cabine', 9, 1, '2026-07-29 05:59:00'),
(140, 118, 'aplicativo do veículo', 9, 1, '2026-07-29 05:59:00'),
(141, 118, 'bluetooth', 8, 1, '2026-07-29 05:59:00'),
(142, 118, 'comunicação remota', 9, 1, '2026-07-29 05:59:00'),
(143, 118, 'conectividade', 9, 1, '2026-07-29 05:59:00'),
(144, 118, 'dados da frota', 8, 1, '2026-07-29 05:59:00'),
(145, 118, 'gps', 8, 1, '2026-07-29 05:59:00'),
(146, 118, 'multimídia', 8, 1, '2026-07-29 05:59:00'),
(147, 118, 'rastreamento', 9, 1, '2026-07-29 05:59:00'),
(148, 118, 'sem conexão', 8, 1, '2026-07-29 05:59:00'),
(149, 118, 'telemetria', 10, 1, '2026-07-29 05:59:00'),
(150, 7, 'bomba hidráulica da direção', 10, 1, '2026-07-29 05:59:00'),
(151, 7, 'caixa de direção', 10, 1, '2026-07-29 05:59:00'),
(152, 7, 'coluna de direção', 9, 1, '2026-07-29 05:59:00'),
(153, 7, 'direção elétrica', 9, 1, '2026-07-29 05:59:00'),
(154, 7, 'direção hidráulica', 9, 1, '2026-07-29 05:59:00'),
(155, 7, 'direção pesada', 10, 1, '2026-07-29 05:59:00'),
(156, 7, 'folga na direção', 10, 1, '2026-07-29 05:59:00'),
(157, 7, 'folga no volante', 10, 1, '2026-07-29 05:59:00'),
(158, 7, 'puxando para o lado', 9, 1, '2026-07-29 05:59:00'),
(159, 7, 'volante pesado', 10, 1, '2026-07-29 05:59:00'),
(160, 7, 'volante torto', 8, 1, '2026-07-29 05:59:00'),
(161, 112, 'atuador', 7, 1, '2026-07-29 05:59:00'),
(162, 112, 'avaria eletrônica', 9, 1, '2026-07-29 05:59:00'),
(163, 112, 'central eletrônica', 9, 1, '2026-07-29 05:59:00'),
(164, 112, 'código de falha', 8, 1, '2026-07-29 05:59:00'),
(165, 112, 'ecu', 8, 1, '2026-07-29 05:59:00'),
(166, 112, 'falha de comunicação', 9, 1, '2026-07-29 05:59:00'),
(167, 112, 'falha eletrônica', 9, 1, '2026-07-29 05:59:00'),
(168, 112, 'módulo eletrônico', 9, 1, '2026-07-29 05:59:00'),
(169, 112, 'rede can', 10, 1, '2026-07-29 05:59:00'),
(170, 112, 'sensor com defeito', 10, 1, '2026-07-29 05:59:00'),
(171, 8, 'barulho ao frear', 9, 1, '2026-07-29 05:59:00'),
(172, 8, 'freio de estacionamento', 9, 1, '2026-07-29 05:59:00'),
(173, 8, 'freio de serviço', 10, 1, '2026-07-29 05:59:00'),
(174, 8, 'freio motor', 9, 1, '2026-07-29 05:59:00'),
(175, 8, 'lona de freio', 9, 1, '2026-07-29 05:59:00'),
(176, 8, 'pastilha de freio', 9, 1, '2026-07-29 05:59:00'),
(177, 8, 'pedal de freio', 8, 1, '2026-07-29 05:59:00'),
(178, 8, 'perda de freio', 10, 1, '2026-07-29 05:59:00'),
(179, 8, 'retarder', 10, 1, '2026-07-29 05:59:00'),
(180, 8, 'sem freio', 10, 1, '2026-07-29 05:59:00'),
(181, 114, 'farol', 8, 1, '2026-07-29 05:59:00'),
(182, 114, 'farol alto', 9, 1, '2026-07-29 05:59:00'),
(183, 114, 'farol baixo', 9, 1, '2026-07-29 05:59:00'),
(184, 114, 'iluminação interna', 8, 1, '2026-07-29 05:59:00'),
(185, 114, 'lâmpada queimada', 9, 1, '2026-07-29 05:59:00'),
(186, 114, 'lanterna traseira', 9, 1, '2026-07-29 05:59:00'),
(187, 114, 'luz de freio', 10, 1, '2026-07-29 05:59:00'),
(188, 114, 'luz de ré', 9, 1, '2026-07-29 05:59:00'),
(189, 114, 'pisca alerta', 9, 1, '2026-07-29 05:59:00'),
(190, 114, 'seta não funciona', 10, 1, '2026-07-29 05:59:00'),
(191, 108, 'dificuldade na partida', 8, 1, '2026-07-29 05:59:00'),
(192, 108, 'falha no motor', 10, 1, '2026-07-29 05:59:00'),
(193, 108, 'fumaça azul', 9, 1, '2026-07-29 05:59:00'),
(194, 108, 'fumaça branca', 9, 1, '2026-07-29 05:59:00'),
(195, 108, 'fumaça preta', 8, 1, '2026-07-29 05:59:00'),
(196, 108, 'lubrificação', 8, 1, '2026-07-29 05:59:00'),
(197, 108, 'marcha lenta', 7, 1, '2026-07-29 05:59:00'),
(198, 108, 'motor batendo', 10, 1, '2026-07-29 05:59:00'),
(199, 108, 'motor falhando', 10, 1, '2026-07-29 05:59:00'),
(200, 108, 'não pega', 7, 1, '2026-07-29 05:59:00'),
(201, 108, 'óleo do motor', 8, 1, '2026-07-29 05:59:00'),
(202, 108, 'pressão do óleo', 10, 1, '2026-07-29 05:59:00'),
(203, 108, 'vazamento de óleo', 9, 1, '2026-07-29 05:59:00'),
(204, 14, 'aspereza', 7, 1, '2026-07-29 05:59:00'),
(205, 14, 'nvh', 10, 1, '2026-07-29 05:59:00'),
(206, 14, 'ressonância', 9, 1, '2026-07-29 05:59:00'),
(207, 14, 'ruído estrutural', 9, 1, '2026-07-29 05:59:00'),
(208, 14, 'vibra em velocidade', 9, 1, '2026-07-29 05:59:00'),
(209, 113, 'botão no painel', 9, 1, '2026-07-29 05:59:00'),
(210, 113, 'botões do volante', 9, 1, '2026-07-29 05:59:00'),
(211, 113, 'cluster', 10, 1, '2026-07-29 05:59:00'),
(212, 113, 'computador de bordo', 9, 1, '2026-07-29 05:59:00'),
(213, 113, 'conta giros', 8, 1, '2026-07-29 05:59:00'),
(214, 113, 'display apagado', 9, 1, '2026-07-29 05:59:00'),
(215, 113, 'indicador de combustível', 8, 1, '2026-07-29 05:59:00'),
(216, 113, 'luz no painel', 9, 1, '2026-07-29 05:59:00'),
(217, 113, 'mensagem no painel', 9, 1, '2026-07-29 05:59:00'),
(218, 113, 'painel de instrumentos', 10, 1, '2026-07-29 05:59:00'),
(219, 113, 'velocímetro', 9, 1, '2026-07-29 05:59:00'),
(220, 109, 'arla', 9, 1, '2026-07-29 05:59:00'),
(221, 109, 'arla 32', 10, 1, '2026-07-29 05:59:00'),
(222, 109, 'catalisador', 8, 1, '2026-07-29 05:59:00'),
(223, 109, 'dpf', 10, 1, '2026-07-29 05:59:00'),
(224, 109, 'falha de emissões', 10, 1, '2026-07-29 05:59:00'),
(225, 109, 'filtro de partículas', 10, 1, '2026-07-29 05:59:00'),
(226, 109, 'regeneração', 9, 1, '2026-07-29 05:59:00'),
(227, 109, 'scr', 9, 1, '2026-07-29 05:59:00'),
(228, 109, 'sensor de nox', 10, 1, '2026-07-29 05:59:00'),
(229, 109, 'ureia', 7, 1, '2026-07-29 05:59:00'),
(230, 1, 'baixo desempenho', 9, 1, '2026-07-29 05:59:00'),
(231, 1, 'consumindo muito', 8, 1, '2026-07-29 05:59:00'),
(232, 1, 'consumo elevado', 8, 1, '2026-07-29 05:59:00'),
(233, 1, 'modo de emergência', 9, 1, '2026-07-29 05:59:00'),
(234, 1, 'modo degradado', 9, 1, '2026-07-29 05:59:00'),
(235, 1, 'não desenvolve', 8, 1, '2026-07-29 05:59:00'),
(236, 1, 'perda de potência', 10, 1, '2026-07-29 05:59:00'),
(237, 1, 'perda de torque', 9, 1, '2026-07-29 05:59:00'),
(238, 1, 'powertrain', 10, 1, '2026-07-29 05:59:00'),
(239, 1, 'sem força', 9, 1, '2026-07-29 05:59:00'),
(240, 111, 'alinhamento', 7, 1, '2026-07-29 05:59:00'),
(241, 111, 'balanceamento', 8, 1, '2026-07-29 05:59:00'),
(242, 111, 'calibragem', 8, 1, '2026-07-29 05:59:00'),
(243, 111, 'desgaste do pneu', 10, 1, '2026-07-29 05:59:00'),
(244, 111, 'desgaste irregular', 9, 1, '2026-07-29 05:59:00'),
(245, 111, 'pneu estourou', 10, 1, '2026-07-29 05:59:00'),
(246, 111, 'pneu furado', 10, 1, '2026-07-29 05:59:00'),
(247, 111, 'porca da roda', 9, 1, '2026-07-29 05:59:00'),
(248, 111, 'pressão dos pneus', 9, 1, '2026-07-29 05:59:00'),
(249, 111, 'roda trincada', 10, 1, '2026-07-29 05:59:00'),
(250, 15, 'assobio externo', 9, 1, '2026-07-29 05:59:00'),
(251, 15, 'barulho de vento', 10, 1, '2026-07-29 05:59:00'),
(252, 15, 'barulho dos pneus', 9, 1, '2026-07-29 05:59:00'),
(253, 15, 'ruído aerodinâmico', 10, 1, '2026-07-29 05:59:00'),
(254, 15, 'ruído da carga', 9, 1, '2026-07-29 05:59:00'),
(255, 15, 'ruído de vento', 10, 1, '2026-07-29 05:59:00'),
(256, 15, 'vedação externa', 8, 1, '2026-07-29 05:59:00'),
(257, 13, 'acc', 9, 1, '2026-07-29 05:59:00'),
(258, 13, 'alerta de faixa', 10, 1, '2026-07-29 05:59:00'),
(259, 13, 'assistente de condução', 9, 1, '2026-07-29 05:59:00'),
(260, 13, 'câmera frontal', 9, 1, '2026-07-29 05:59:00'),
(261, 13, 'controle de cruzeiro adaptativo', 10, 1, '2026-07-29 05:59:00'),
(262, 13, 'controle de estabilidade', 9, 1, '2026-07-29 05:59:00'),
(263, 13, 'frenagem autônoma', 10, 1, '2026-07-29 05:59:00'),
(264, 13, 'radar frontal', 10, 1, '2026-07-29 05:59:00'),
(265, 13, 'saída de faixa', 9, 1, '2026-07-29 05:59:00'),
(266, 13, 'sensor de ponto cego', 10, 1, '2026-07-29 05:59:00'),
(267, 3, 'aditivo', 6, 1, '2026-07-29 05:59:00'),
(268, 3, 'arrefecimento', 10, 1, '2026-07-29 05:59:00'),
(269, 3, 'bomba d água', 9, 1, '2026-07-29 05:59:00'),
(270, 3, 'líquido de arrefecimento', 10, 1, '2026-07-29 05:59:00'),
(271, 3, 'mangueira do radiador', 9, 1, '2026-07-29 05:59:00'),
(272, 3, 'motor aquecendo', 9, 1, '2026-07-29 05:59:00'),
(273, 3, 'reservatório de expansão', 9, 1, '2026-07-29 05:59:00'),
(274, 3, 'superaquecimento do motor', 10, 1, '2026-07-29 05:59:00'),
(275, 3, 'temperatura do motor', 10, 1, '2026-07-29 05:59:00'),
(276, 3, 'vazamento de água', 8, 1, '2026-07-29 05:59:00'),
(277, 4, 'água no diesel', 9, 1, '2026-07-29 05:59:00'),
(278, 4, 'baixa pressão de combustível', 10, 1, '2026-07-29 05:59:00'),
(279, 4, 'bico injetor', 9, 1, '2026-07-29 05:59:00'),
(280, 4, 'diesel vazando', 10, 1, '2026-07-29 05:59:00'),
(281, 4, 'injeção de combustível', 10, 1, '2026-07-29 05:59:00'),
(282, 4, 'injetor', 7, 1, '2026-07-29 05:59:00'),
(283, 4, 'tanque de combustível', 9, 1, '2026-07-29 05:59:00'),
(284, 4, 'vazamento de diesel', 10, 1, '2026-07-29 05:59:00'),
(285, 9, 'bateria 24v', 9, 1, '2026-07-29 05:59:00'),
(286, 9, 'bateria descarregada', 10, 1, '2026-07-29 05:59:00'),
(287, 9, 'chicote elétrico', 9, 1, '2026-07-29 05:59:00'),
(288, 9, 'curto circuito', 10, 1, '2026-07-29 05:59:00'),
(289, 9, 'fusível', 8, 1, '2026-07-29 05:59:00'),
(290, 9, 'motor de partida', 10, 1, '2026-07-29 05:59:00'),
(291, 9, 'não dá partida', 8, 1, '2026-07-29 05:59:00'),
(292, 9, 'relé', 8, 1, '2026-07-29 05:59:00'),
(293, 9, 'sem energia', 8, 1, '2026-07-29 05:59:00'),
(294, 9, 'tensão baixa', 9, 1, '2026-07-29 05:59:00'),
(295, 119, 'gostaria que tivesse', 10, 1, '2026-07-29 05:59:00'),
(296, 119, 'melhoria no produto', 9, 1, '2026-07-29 05:59:00'),
(297, 119, 'nova função', 9, 1, '2026-07-29 05:59:00'),
(298, 119, 'poderia ter', 9, 1, '2026-07-29 05:59:00'),
(299, 119, 'sugestão', 8, 1, '2026-07-29 05:59:00'),
(300, 119, 'sugestão de melhoria', 10, 1, '2026-07-29 05:59:00'),
(301, 6, 'barra estabilizadora', 9, 1, '2026-07-29 05:59:00'),
(302, 6, 'bolsa de ar', 9, 1, '2026-07-29 05:59:00'),
(303, 6, 'feixe de molas', 9, 1, '2026-07-29 05:59:00'),
(304, 6, 'mola quebrada', 10, 1, '2026-07-29 05:59:00'),
(305, 6, 'não levanta', 7, 1, '2026-07-29 05:59:00'),
(306, 6, 'suspensão pneumática', 10, 1, '2026-07-29 05:59:00'),
(307, 6, 'válvula niveladora', 10, 1, '2026-07-29 05:59:00'),
(308, 6, 'veículo desnivelado', 9, 1, '2026-07-29 05:59:00'),
(309, 116, 'baixa autonomia', 10, 1, '2026-07-29 05:59:00'),
(310, 116, 'bateria de alta tensão', 10, 1, '2026-07-29 05:59:00'),
(311, 116, 'carregamento rápido', 8, 1, '2026-07-29 05:59:00'),
(312, 116, 'conector de recarga', 9, 1, '2026-07-29 05:59:00'),
(313, 116, 'frenagem regenerativa', 9, 1, '2026-07-29 05:59:00'),
(314, 116, 'inversor', 9, 1, '2026-07-29 05:59:00'),
(315, 116, 'isolamento de alta tensão', 10, 1, '2026-07-29 05:59:00'),
(316, 116, 'motor elétrico', 10, 1, '2026-07-29 05:59:00'),
(317, 116, 'não carrega', 9, 1, '2026-07-29 05:59:00'),
(318, 116, 'tração elétrica', 10, 1, '2026-07-29 05:59:00'),
(319, 2, 'caixa de câmbio', 10, 1, '2026-07-29 05:59:00'),
(320, 2, 'marcha não entra', 10, 1, '2026-07-29 05:59:00'),
(321, 2, 'não engata', 9, 1, '2026-07-29 05:59:00'),
(322, 2, 'patinando', 8, 1, '2026-07-29 05:59:00'),
(323, 2, 'pto', 8, 1, '2026-07-29 05:59:00'),
(324, 2, 'tomada de força', 9, 1, '2026-07-29 05:59:00'),
(325, 2, 'tranco na troca', 9, 1, '2026-07-29 05:59:00'),
(326, 2, 'transmissão', 9, 1, '2026-07-29 05:59:00'),
(327, 2, 'troca de marcha', 9, 1, '2026-07-29 05:59:00'),
(328, 115, 'desembaçador', 9, 1, '2026-07-29 05:59:00'),
(329, 115, 'esguicho do limpador', 10, 1, '2026-07-29 05:59:00'),
(330, 115, 'espelho externo', 8, 1, '2026-07-29 05:59:00'),
(331, 115, 'lavador do para-brisa', 10, 1, '2026-07-29 05:59:00'),
(332, 115, 'limpador', 8, 1, '2026-07-29 05:59:00'),
(333, 115, 'limpador de para-brisa', 10, 1, '2026-07-29 05:59:00'),
(334, 115, 'limpador de parabrisa', 10, 1, '2026-07-29 05:59:00'),
(335, 115, 'limpador do para-brisa', 10, 1, '2026-07-29 05:59:00'),
(336, 115, 'limpador do parabrisa', 10, 1, '2026-07-29 05:59:00'),
(337, 115, 'palheta', 9, 1, '2026-07-29 05:59:00'),
(338, 115, 'para-brisa', 8, 1, '2026-07-29 05:59:00'),
(339, 115, 'parabrisa', 8, 1, '2026-07-29 05:59:00'),
(340, 115, 'reservatório do limpador', 9, 1, '2026-07-29 05:59:00'),
(341, 115, 'retrovisor', 8, 1, '2026-07-29 05:59:00'),
(342, 115, 'vidro embaçado', 9, 1, '2026-07-29 05:59:00'),
(343, 120, 'sistemas web', 3, 1, '2026-07-31 00:11:33'),
(344, 120, 'sistema web', 10, 1, '2026-07-31 00:51:21'),
(345, 120, 'plataforma', 8, 1, '2026-07-31 00:51:21'),
(346, 120, 'portal', 7, 1, '2026-07-31 00:51:21'),
(347, 120, 'site', 6, 1, '2026-07-31 00:51:21'),
(348, 120, 'tela', 5, 1, '2026-07-31 00:51:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidades`
--

CREATE TABLE `cidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `estado_id` smallint(5) UNSIGNED NOT NULL,
  `codigo_ibge` int(10) UNSIGNED DEFAULT NULL,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cidades`
--

INSERT INTO `cidades` (`id`, `estado_id`, `codigo_ibge`, `nome`, `ativo`) VALUES
(1, 19, NULL, 'Resende', 1),
(2, 25, NULL, 'São Paulo', 1),
(8, 25, NULL, 'Araraquara', 1),
(14, 17, NULL, 'Abreu e Lima', 1),
(15, 24, NULL, 'Tubarão', 1),
(17, 25, NULL, 'Suzano', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unidade_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nome` varchar(160) NOT NULL,
  `nome_fantasia` varchar(160) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `email` varchar(160) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `empresa_id`, `unidade_id`, `nome`, `nome_fantasia`, `documento`, `email`, `telefone`, `ativo`, `criado_em`) VALUES
(1, 3, 1, 'Radial Transporte Coletivo', 'Radial', NULL, NULL, '', 1, '2026-07-16 13:45:25'),
(3, 12, NULL, 'G7 Log Transportes', 'G7', NULL, NULL, '', 1, '2026-07-16 17:38:32'),
(4, 8, NULL, 'Cutrale LTDA', 'Cutrale', NULL, 'cutrale_corp@gmail.com', '', 1, '2026-07-16 17:49:10'),
(5, 17, NULL, 'Itamaracá Transportes', 'Itamaracá', NULL, NULL, '(81) 3433.4576', 1, '2026-07-16 18:53:23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `convites_usuarios`
--

CREATE TABLE `convites_usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `token_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_em` datetime NOT NULL,
  `utilizado_em` datetime DEFAULT NULL,
  `criado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_pai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` enum('vwco','concessionaria','cliente') COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtipo` enum('fabrica','polo','matriz','filial','assistencia','outro') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'matriz',
  `razao_social` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_fantasia` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade_id` bigint(20) UNSIGNED DEFAULT NULL,
  `endereco` varchar(220) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origem_legacy` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origem_legacy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`id`, `empresa_pai_id`, `tipo`, `subtipo`, `razao_social`, `nome_fantasia`, `documento`, `email`, `telefone`, `cidade_id`, `endereco`, `cep`, `logo`, `origem_legacy`, `origem_legacy_id`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, NULL, 'vwco', 'fabrica', 'Fábrica Resende', 'Fábrica Resende', NULL, NULL, NULL, 1, NULL, NULL, 'public/assets/images/empresas/fe3b24ee8e9fc88a944eb95b97f208e3.webp', 'unidade', 1, 1, '2026-07-16 16:25:43', '2026-07-29 01:15:24'),
(2, NULL, 'vwco', 'matriz', 'VWCO JABAQUARA', 'Escritório Jabaquara', NULL, NULL, NULL, 2, 'Avenida Doutor Luis da Rocha Miranda, 341', '04344-010', 'public/assets/images/empresas/fae37a2ca1beb92e34cbab5ee8102b38.webp', 'unidade', 2, 1, '2026-07-16 16:25:43', '2026-07-29 01:15:30'),
(3, NULL, 'cliente', 'matriz', 'Radial Transporte Coletivo', 'Radial', NULL, NULL, NULL, 17, 'Av. Jorge Bei Maluf, 409 - Vila Theodoro', '08686-000', 'public/assets/images/empresas/2ec20a540a3340ef520ab42af3580d25.webp', 'cliente', 1, 1, '2026-07-16 16:25:43', '2026-07-19 00:35:30'),
(8, NULL, 'cliente', 'matriz', 'Cutrale LTDA', 'Cutrale', NULL, 'cutrale_corp@gmail.com', NULL, 8, NULL, NULL, 'public/assets/images/empresas/29e8bfd1856332811e51a7cbc3287944.jpg', NULL, NULL, 1, '2026-07-16 17:38:32', '2026-07-27 12:35:19'),
(12, NULL, 'cliente', 'matriz', 'G7 Log Transportes', 'G7', NULL, NULL, NULL, 15, 'Rua José Carlos Aguiar,  88703', '88703-102', 'public/assets/images/empresas/e0a24b7a18152d09d382523876e67610.webp', 'cliente', 3, 1, '2026-07-16 17:46:51', '2026-07-29 01:15:44'),
(17, NULL, 'cliente', 'matriz', 'Itamaracá Transportes', 'Itamaracá', NULL, NULL, '(81) 3433.4576', 14, 'BR 101 Norte Km 51 Centro', '53520-015', 'public/assets/images/empresas/d41e67208c637438716ad6476d47ef77.webp', NULL, NULL, 1, '2026-07-16 18:53:23', '2026-07-16 18:53:34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresa_clientes`
--

CREATE TABLE `empresa_clientes` (
  `empresa_vw_id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_relacao` enum('comercial','assistencia','pos_venda','treinamento','outro') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assistencia',
  `observacao` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `empresa_clientes`
--

INSERT INTO `empresa_clientes` (`empresa_vw_id`, `cliente_id`, `tipo_relacao`, `observacao`, `ativo`, `criado_por`, `criado_em`, `atualizado_em`) VALUES
(1, 3, 'assistencia', NULL, 1, 1, '2026-07-19 00:35:30', '2026-07-19 00:35:30'),
(1, 8, 'assistencia', NULL, 1, 1, '2026-07-27 12:35:19', '2026-07-27 12:35:19'),
(1, 12, 'assistencia', NULL, 1, 1, '2026-07-29 01:15:44', '2026-07-29 01:15:44'),
(1, 17, 'assistencia', NULL, 1, 5, '2026-07-16 18:53:23', '2026-07-16 18:53:23'),
(2, 3, 'assistencia', NULL, 1, 1, '2026-07-19 00:35:30', '2026-07-19 00:35:30'),
(2, 12, 'assistencia', NULL, 1, 1, '2026-07-29 01:15:44', '2026-07-29 01:15:44'),
(2, 17, 'assistencia', NULL, 1, 5, '2026-07-16 18:53:23', '2026-07-16 18:53:23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estados`
--

CREATE TABLE `estados` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `codigo_ibge` tinyint(3) UNSIGNED NOT NULL,
  `sigla` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `estados`
--

INSERT INTO `estados` (`id`, `codigo_ibge`, `sigla`, `nome`, `ativo`) VALUES
(1, 12, 'AC', 'Acre', 1),
(2, 27, 'AL', 'Alagoas', 1),
(3, 16, 'AP', 'Amapá', 1),
(4, 13, 'AM', 'Amazonas', 1),
(5, 29, 'BA', 'Bahia', 1),
(6, 23, 'CE', 'Ceará', 1),
(7, 53, 'DF', 'Distrito Federal', 1),
(8, 32, 'ES', 'Espírito Santo', 1),
(9, 52, 'GO', 'Goiás', 1),
(10, 21, 'MA', 'Maranhão', 1),
(11, 51, 'MT', 'Mato Grosso', 1),
(12, 50, 'MS', 'Mato Grosso do Sul', 1),
(13, 31, 'MG', 'Minas Gerais', 1),
(14, 15, 'PA', 'Pará', 1),
(15, 25, 'PB', 'Paraíba', 1),
(16, 41, 'PR', 'Paraná', 1),
(17, 26, 'PE', 'Pernambuco', 1),
(18, 22, 'PI', 'Piauí', 1),
(19, 33, 'RJ', 'Rio de Janeiro', 1),
(20, 24, 'RN', 'Rio Grande do Norte', 1),
(21, 43, 'RS', 'Rio Grande do Sul', 1),
(22, 11, 'RO', 'Rondônia', 1),
(23, 14, 'RR', 'Roraima', 1),
(24, 42, 'SC', 'Santa Catarina', 1),
(25, 35, 'SP', 'São Paulo', 1),
(26, 28, 'SE', 'Sergipe', 1),
(27, 17, 'TO', 'Tocantins', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `familias`
--

CREATE TABLE `familias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_veiculo` enum('caminhao','onibus') NOT NULL DEFAULT 'caminhao',
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `imagem` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `familias`
--

INSERT INTO `familias` (`id`, `marca_id`, `tipo_veiculo`, `nome`, `descricao`, `imagem`, `ativo`, `criado_em`) VALUES
(1, 1, 'caminhao', 'Delivery', 'Agilidade, economia e versatilidade para entregas urbanas e operações de distribuição.', 'public/assets/images/modelos/delivery-express.png', 1, '2026-07-16 13:45:26'),
(2, 1, 'caminhao', 'Constellation', 'Eficiência, conforto, tecnologia e segurança para aplicações urbanas, rodoviárias e fora de estrada.', 'public/assets/images/modelos/constellation-14-210-4x2.png', 1, '2026-07-16 13:45:26'),
(3, 1, 'caminhao', 'Meteor', 'Extrapesados fortes, confortáveis e conectados para operações rodoviárias de alta produtividade.', 'public/assets/images/modelos/novo-meteor-highline-28-480hd.png', 1, '2026-07-16 13:45:26'),
(4, 1, 'caminhao', 'e-Delivery', 'Caminhões elétricos desenvolvidos para operações urbanas mais silenciosas e sustentáveis.', 'public/assets/images/modelos/e-delivery-11.jpg', 1, '2026-07-16 13:45:26'),
(6, 1, 'onibus', 'Escolar', 'Ônibus escolares desenvolvidos para transportar estudantes com segurança, conforto e robustez em diferentes trajetos.', 'public/assets/images/modelos/escolar-volksbus-8-180-e-ore-1.jpg', 1, '2026-07-16 14:17:29'),
(7, 1, 'caminhao', 'Especiais', 'Betoneiras, caminhão de lixo, veículos  91t', 'public/assets/images/familias/cbb4b5404c07527020d879d197fbe419.png', 1, '2026-07-16 14:19:13'),
(8, 1, 'onibus', 'Rodoviário', 'Ônibus para fretamento e operações rodoviárias, com foco no conforto dos passageiros e na eficiência da operação.', 'public/assets/images/modelos/rodoviario-volksbus-9-180-s.jpg', 1, '2026-07-16 14:22:19'),
(17, 1, 'onibus', 'Urbano', 'Chassis Volksbus robustos, eficientes e preparados para os desafios diários do transporte coletivo urbano.', 'public/assets/images/modelos/urbano-e-volksbus-22l.jpg', 1, '2026-07-16 15:45:05'),
(18, 2, 'caminhao', 'Daily', 'Veículos comerciais leves em versões chassi-cabine.', 'public/assets/images/familias/088a207b810c069bbeb89df6d4b5248a.jpg', 1, '2026-07-19 00:03:44'),
(19, 2, 'caminhao', 'Tector', 'Caminhões médios e semipesados para distribuição, estrada e aplicações vocacionais.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 1, '2026-07-19 00:03:44'),
(20, 2, 'caminhao', 'S-Way', 'Caminhões pesados para transporte rodoviário, também disponíveis com motorização a gás.', 'public/assets/images/modelos/iveco-s-way-4x2-oficial.png', 1, '2026-07-19 00:03:44'),
(21, 3, 'caminhao', 'FH', 'Caminhões pesados para transporte de longa distância.', 'public/assets/images/modelos/volvo-fh-oficial.webp', 1, '2026-07-19 00:03:44'),
(22, 3, 'caminhao', 'FM', 'Caminhões versáteis para transporte rodoviário e distribuição.', 'public/assets/images/modelos/volvo-fm-oficial.webp', 1, '2026-07-19 00:03:44'),
(23, 3, 'caminhao', 'FMX', 'Caminhões para construção, mineração e operações severas.', 'public/assets/images/modelos/volvo-fmx-oficial.webp', 1, '2026-07-19 00:03:44'),
(24, 3, 'caminhao', 'VM', 'Caminhões médios e semipesados para distribuição e operações vocacionais.', 'public/assets/images/modelos/volvo-vm-oficial.webp', 1, '2026-07-19 00:03:44'),
(25, 4, 'caminhao', 'Novo Accelo', 'Caminhões leves para distribuição urbana e regional.', 'public/assets/images/modelos/mercedes-novo-accelo-oficial.webp', 1, '2026-07-19 00:03:44'),
(26, 4, 'caminhao', 'Atego', 'Caminhões médios e semipesados para distribuição e construção.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 1, '2026-07-19 00:03:44'),
(27, 4, 'caminhao', 'Axor', 'Cavalos mecânicos para transporte rodoviário.', 'public/assets/images/modelos/mercedes-axor-oficial.webp', 1, '2026-07-19 00:03:44'),
(28, 4, 'caminhao', 'Actros', 'Caminhões extrapesados para longa distância.', 'public/assets/images/familias/ca6eb3f32af55c15fcc444e2e299f920.webp', 1, '2026-07-19 00:03:44'),
(29, 4, 'caminhao', 'Arocs', 'Caminhões extrapesados para construção e operações severas.', 'public/assets/images/modelos/mercedes-arocs-oficial.webp', 1, '2026-07-19 00:03:44'),
(30, 5, 'caminhao', 'Linha P', 'Cabine baixa para operações urbanas, regionais e vocacionais.', 'public/assets/images/modelos/scania-linha-p-oficial.jpeg', 1, '2026-07-19 00:03:44'),
(31, 5, 'caminhao', 'Linha G', 'Cabine para operações regionais, rodoviárias e severas.', 'public/assets/images/modelos/scania-linha-g-oficial.jpeg', 1, '2026-07-19 00:03:44'),
(32, 5, 'caminhao', 'Linha R', 'Cabine premium para transporte de longa distância.', 'public/assets/images/modelos/scania-linha-r-oficial.jpeg', 1, '2026-07-19 00:03:44'),
(33, 5, 'caminhao', 'Linha S', 'Cabine de piso plano para transporte de longa distância.', 'public/assets/images/modelos/scania-linha-s-oficial.jpeg', 1, '2026-07-19 00:03:44'),
(34, 12, 'onibus', 'Ônibus Elétricos Urbanos', 'Ônibus urbanos 100% elétricos da BYD, com versões de piso baixo ou entrada baixa.', 'public/assets/images/familias/e2edf4c557b0e94dda5ac4aca9270e43.png', 1, '2026-07-19 00:04:22'),
(35, 4, 'onibus', 'eO500', 'Chassis de ônibus urbanos 100% elétricos Mercedes-Benz produzidos no Brasil.', 'public/assets/images/modelos/mercedes-eo500u-oficial.webp', 1, '2026-07-19 00:04:22'),
(36, 6, 'caminhao', 'Linha XF', 'O DAF CF é adequado para transporte regional ou de médias distâncias; estradas impecáveis ou terrenos acidentados.', 'public/assets/images/familias/8cb224263a778f71a2931b8ed0e31730.webp', 1, '2026-07-20 11:41:00'),
(37, 6, 'caminhao', 'Linha CF Rodoviário', 'O DAF CF com Motor PACCAR PX-9 faz parte da linha rodoviária DAF, disponível nas versões FTS 6x2 e FT 4x2.', 'public/assets/images/familias/fd703cb33b654c3a052675a6904e14c3.png', 1, '2026-07-20 11:45:25'),
(38, 6, 'caminhao', 'Linha CF Vocacional', 'A Linha DAF Vocacional traz toda a robustez dos caminhões DAF aplicada para operações severas', 'public/assets/images/familias/0ee0ee571a6514fb7d5933889c1a455c.png', 1, '2026-07-20 11:47:08'),
(39, 6, 'caminhao', 'Linha CF Semipesado Rígido', 'O Novo DAF CF rígido semipesado, disponível nas versões FAS 6x2 e FAC 8x2.', 'public/assets/images/familias/1d081754e5f38e1cb6556672674b184f.png', 1, '2026-07-20 11:50:37'),
(40, 4, 'onibus', 'LO Micro-Ônibus e Escolar', 'Chassis Mercedes-Benz LO para micro-ônibus, transporte escolar, urbano e fretamento.', NULL, 1, '2026-07-25 19:26:03'),
(41, 4, 'onibus', 'OF Urbanos e Fretamento', 'Chassis Mercedes-Benz OF com motor dianteiro para aplicações urbanas, fretamento e curtas distâncias.', NULL, 1, '2026-07-25 19:26:03'),
(42, 4, 'onibus', 'O 500 Urbanos', 'Chassis Mercedes-Benz O 500 urbanos com motor traseiro, incluindo versões articuladas.', NULL, 1, '2026-07-25 19:26:03'),
(43, 4, 'onibus', 'O 500 Rodoviários', 'Chassis Mercedes-Benz O 500 para fretamento e transporte rodoviário de média e longa distância.', NULL, 1, '2026-07-25 19:26:03'),
(44, 3, 'onibus', 'B13R Rodoviários', 'Chassis Volvo B13R Euro 6 para fretamento e transporte rodoviário.', NULL, 1, '2026-07-25 19:26:03'),
(45, 3, 'onibus', 'BZR Elétrico', 'Plataforma Volvo BZR 100% elétrica para ônibus urbanos e intermunicipais.', NULL, 1, '2026-07-25 19:26:03'),
(46, 5, 'onibus', 'Série K Rodoviários', 'Chassis Scania Série K Proconve P8 para ônibus rodoviários.', NULL, 1, '2026-07-25 19:26:03'),
(47, 2, 'onibus', 'IVECO BUS', 'Chassis IVECO BUS Proconve P8 para transporte urbano e fretamento.', NULL, 1, '2026-07-25 19:26:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visualizacao_id` bigint(20) UNSIGNED NOT NULL,
  `nota` tinyint(3) UNSIGNED NOT NULL,
  `comentario` text COLLATE utf8_unicode_ci,
  `melhorias` text COLLATE utf8_unicode_ci,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `visualizacao_id`, `nota`, `comentario`, `melhorias`, `criado_em`) VALUES
(1, 7, 5, 'Excelente, ajudou muito a conhecer as funções', 'Adicionar sempre mais vídeos', '2026-07-16 21:37:15'),
(2, 12, 5, 'Muito didático e fácil de entender.', 'Acrescentar mais treinamentos sobre as funcionalidades do cluster', '2026-07-19 17:47:06'),
(4, 14, 5, 'Vídeo excelente', NULL, '2026-07-19 17:49:15'),
(5, 23, 4, 'teste', NULL, '2026-07-30 17:18:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `frotas`
--

CREATE TABLE `frotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_veiculo` enum('caminhao','onibus') NOT NULL DEFAULT 'caminhao',
  `familia_id` bigint(20) UNSIGNED DEFAULT NULL,
  `modelo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `veiculo_nome` varchar(160) DEFAULT NULL,
  `familia_nome_livre` varchar(120) DEFAULT NULL,
  `quantidade` int(10) UNSIGNED DEFAULT '1',
  `ano` smallint(5) UNSIGNED DEFAULT NULL,
  `norma_emissao_id` smallint(5) UNSIGNED DEFAULT NULL,
  `observacao` text,
  `cadastrado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `frotas`
--

INSERT INTO `frotas` (`id`, `cliente_id`, `marca_id`, `tipo_veiculo`, `familia_id`, `modelo_id`, `veiculo_nome`, `familia_nome_livre`, `quantidade`, `ano`, `norma_emissao_id`, `observacao`, `cadastrado_por`, `criado_em`, `atualizado_em`) VALUES
(4, 4, 5, 'caminhao', 32, 103, NULL, NULL, 1, 2026, 3, NULL, 3, '2026-07-27 13:23:56', '2026-07-27 13:23:56'),
(5, 4, 5, 'caminhao', 32, 144, NULL, NULL, 1, 2026, 3, NULL, 3, '2026-07-27 13:24:10', '2026-07-27 13:24:10'),
(6, 4, 3, 'caminhao', 21, 68, NULL, NULL, 12, 2025, 3, 'Veículos com contrato de aluguel', 3, '2026-07-27 13:24:58', '2026-07-27 13:24:58'),
(7, 4, 3, 'caminhao', 21, 145, NULL, NULL, 65, 2025, 3, 'Veículos com contrato de aluguel', 3, '2026-07-27 13:38:17', '2026-07-27 13:38:24'),
(8, 4, 1, 'caminhao', 3, 4, NULL, NULL, 1, 2025, 3, 'Veículo em teste', 3, '2026-07-27 13:39:12', '2026-07-27 13:39:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs_auditoria`
--

CREATE TABLE `logs_auditoria` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `acao` varchar(60) NOT NULL,
  `entidade` varchar(80) NOT NULL,
  `entidade_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dados_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `dados_novos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ip_hash` char(64) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `pais_origem` varchar(80) DEFAULT NULL,
  `site_oficial` varchar(500) DEFAULT NULL,
  `descricao` text,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `marcas`
--

INSERT INTO `marcas` (`id`, `nome`, `slug`, `logo`, `pais_origem`, `site_oficial`, `descricao`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, 'Volkswagen Caminhões e Ônibus', 'volkswagen-caminhoes-e-onibus', 'public/assets/images/marcas/3531ff6ef73199a4bf262ccb7582d756.webp', 'Brasil', 'https://www.vwco.com.br/', 'Veículos comerciais Volkswagen para cargas e passageiros.', 1, '2026-07-19 00:03:32', '2026-07-29 01:22:47'),
(2, 'IVECO', 'iveco', 'public/assets/images/marcas/f53bbff3594ef7fad2abcdae92b12e0f.webp', 'Itália', 'https://www.iveco.com/brasil/', 'Fabricante de veículos comerciais e chassis para ônibus.', 1, '2026-07-19 00:03:32', '2026-07-29 01:21:12'),
(3, 'Volvo', 'volvo', 'public/assets/images/marcas/2c19e893db1b2e1356f993c5844533b1.webp', 'Suécia', 'https://www.volvobuses.com/br/', 'Fabricante de chassis de ônibus urbanos, rodoviários e elétricos.', 1, '2026-07-19 00:03:32', '2026-07-29 01:23:01'),
(4, 'Mercedes-Benz', 'mercedes-benz', 'public/assets/images/marcas/d550ad82ed62bb31335ae60023c0af56.webp', 'Alemanha', 'https://www.mercedes-benz-trucks.com.br/onibus/', 'Fabricante de chassis de ônibus urbanos, escolares, rodoviários e elétricos.', 1, '2026-07-19 00:03:32', '2026-07-29 01:22:04'),
(5, 'Scania', 'scania', 'public/assets/images/marcas/1f2e93b101f8fc1b5df89b5c68b1efce.webp', 'Suécia', 'https://www.scania.com/br/pt/home/products/onibus.html', 'Fabricante de chassis de ônibus urbanos e rodoviários.', 1, '2026-07-19 00:03:32', '2026-07-29 01:22:38'),
(6, 'DAF', 'daf', 'public/assets/images/marcas/3fe34cf3c907858ba703faab95e4d7aa.webp', 'Países Baixos', 'https://www.dafcaminhoes.com.br/', 'Caminhões rodoviários e vocacionais.', 1, '2026-07-19 00:03:32', '2026-07-29 01:19:10'),
(7, 'Agrale', 'agrale', 'public/assets/images/marcas/f1f3bf86c93ae29533dd1c5d31a0d5e1.jpg', 'Brasil', 'https://www.agrale.com.br/', 'Veículos comerciais e chassis.', 1, '2026-07-19 00:03:32', '2026-07-29 01:18:54'),
(8, 'Foton', 'foton', 'public/assets/images/marcas/312409f29bb84cdf7a587f6a2545db51.webp', 'China', 'https://www.fotonmotor.com.br/', 'Veículos comerciais leves, médios e pesados.', 1, '2026-07-19 00:03:32', '2026-07-29 01:21:04'),
(9, 'Ford', 'ford', 'public/assets/images/marcas/ef73fc2a73f54902a26c4ad279c69552.png', 'Estados Unidos', 'https://www.ford.com.br/', 'Marca disponível para o histórico de frotas.', 1, '2026-07-19 00:03:32', '2026-07-29 01:20:58'),
(10, 'MAN', 'man', 'public/assets/images/marcas/e03cf08ce518cff5d1bd9d6931d54819.webp', 'Alemanha', 'https://www.man.eu/', 'Caminhões e ônibus para cargas e passageiros.', 1, '2026-07-19 00:03:32', '2026-07-29 01:21:24'),
(11, 'Renault Trucks', 'renault-trucks', 'public/assets/images/marcas/2b63912ad45fdc1187ee7596d534de73.webp', 'França', 'https://www.renault-trucks.com/', 'Caminhões para distribuição, construção e longa distância.', 1, '2026-07-19 00:03:32', '2026-07-29 01:22:30'),
(12, 'BYD', 'byd', 'public/assets/images/marcas/9f4722ce3cc81211608c4b0806838b2b.webp', 'China', 'https://www.byd.com/br', 'Fabricante de veículos eletrificados, incluindo chassis e ônibus urbanos 100% elétricos.', 1, '2026-07-19 00:04:22', '2026-07-29 01:19:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `master_categories`
--

CREATE TABLE `master_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `setor_padrao_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prioridade_padrao_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'geral',
  `descricao` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sla_primeira_resposta_horas` smallint(5) UNSIGNED NOT NULL DEFAULT '8',
  `sla_resolucao_horas` smallint(5) UNSIGNED NOT NULL DEFAULT '72',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `master_categories`
--

INSERT INTO `master_categories` (`id`, `parent_id`, `setor_padrao_id`, `prioridade_padrao_id`, `nome`, `slug`, `tipo`, `descricao`, `sla_primeira_resposta_horas`, `sla_resolucao_horas`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, NULL, 8, 3, 'Powertrain e desempenho', 'powertrain-desempenho', 'geral', 'Desempenho geral do trem de força, perda de potência, torque, consumo e dirigibilidade.', 4, 48, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(2, NULL, 8, 3, 'Transmissão e embreagem', 'transmissao-embreagem', 'geral', 'Câmbio manual ou automatizado, seleção de marchas, embreagem e tomada de força.', 4, 48, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(3, NULL, 8, 3, 'Sistema de arrefecimento', 'sistema-arrefecimento', 'geral', 'Controle térmico do motor, radiador, reservatório, mangueiras, bomba e líquido de arrefecimento.', 2, 24, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(4, NULL, 8, 3, 'Sistema de combustível', 'sistema-combustivel', 'geral', 'Tanque, alimentação, injeção, bomba, filtros, vazamentos e qualidade do combustível.', 2, 24, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(5, NULL, 8, 3, 'Admissão, turbo e exaustão', 'admissao-turbo-exaustao', 'geral', 'Entrada de ar, turbocompressor, intercooler, coletor e sistema de escapamento.', 2, 36, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(6, NULL, 9, 3, 'Suspensão', 'suspensao', 'geral', 'Molas, bolsas pneumáticas, amortecedores, nivelamento, estabilidade e altura do veículo.', 4, 48, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(7, NULL, 9, 3, 'Direção', 'direcao', 'geral', 'Volante, coluna, caixa de direção, assistência hidráulica ou elétrica e alinhamento direcional.', 2, 24, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(8, NULL, 9, 2, 'Freios, retarder e freio-motor', 'freios-retarder-freio-motor', 'geral', 'Freio de serviço, estacionamento, ABS/EBS, retarder, freio-motor e perda de frenagem.', 1, 12, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(9, NULL, 10, 3, 'Sistema elétrico e alimentação', 'sistema-eletrico-alimentacao', 'geral', 'Bateria de 12/24 V, alternador, motor de partida, chicotes, fusíveis e alimentação elétrica.', 2, 36, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(10, NULL, 11, 3, 'Cabine, ergonomia e conforto térmico', 'cabine-ergonomia-conforto', 'geral', 'Bancos, posição de dirigir, isolamento, temperatura no assoalho, ruídos, vibração e conforto.', 4, 72, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(11, NULL, 11, 3, 'Climatização e ventilação', 'climatizacao-ventilacao', 'geral', 'Ar-condicionado, aquecimento, ventilação, refrigeração, fluxo e distribuição de ar.', 4, 48, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(12, NULL, 11, 3, 'Carroceria, portas e acabamento', 'carroceria-portas-acabamento', 'geral', 'Estrutura da cabine ou carroceria, portas, tampas, revestimentos, vedação e acabamento.', 4, 72, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(13, NULL, 10, 2, 'Segurança ativa e ADAS', 'seguranca-ativa-adas', 'geral', 'ACC, alerta de faixa, frenagem autônoma, câmeras, radares e assistência à condução.', 1, 24, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(14, NULL, 9, 3, 'NVH — ruídos e vibrações', 'nvh-ruidos-vibracoes', 'geral', 'Ruídos, vibrações, trepidações e aspereza percebidos durante a operação do veículo.', 4, 48, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(15, NULL, 11, 3, 'Ruídos externos e aerodinâmica', 'ruidos-externos-aerodinamica', 'geral', 'Ruído de vento, pneus, carga, vedação e efeitos aerodinâmicos externos.', 4, 72, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(16, NULL, 1, 3, 'Outros relatos', 'outros-relatos', 'geral', 'Relatos ainda sem categoria específica.', 8, 72, 1, '2026-07-29 04:37:54', '2026-07-31 00:51:21'),
(108, NULL, 8, 3, 'Motor', 'motor', 'geral', 'Funcionamento mecânico do motor, lubrificação, partida, ruídos, fumaça e falhas de combustão.', 2, 24, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(109, NULL, 8, 3, 'Pós-tratamento de emissões', 'pos-tratamento-emissoes', 'geral', 'ARLA 32, SCR, DPF, regeneração, catalisadores e alertas de emissões.', 2, 36, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(110, NULL, 9, 3, 'Chassi, eixos e diferencial', 'chassi-eixos-diferencial', 'geral', 'Longarinas, travessas, eixos, diferencial, cardã, redução e tração mecânica.', 4, 48, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(111, NULL, 9, 3, 'Rodas e pneus', 'rodas-pneus', 'geral', 'Pneus, rodas, calibragem, desgaste, balanceamento e fixação.', 2, 36, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(112, NULL, 10, 3, 'Eletrônica, sensores e redes', 'eletronica-sensores-redes', 'geral', 'Módulos, sensores, atuadores, rede CAN, comunicação e falhas eletrônicas.', 4, 48, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(113, NULL, 10, 3, 'Painel, cluster e comandos', 'painel-cluster-comandos', 'geral', 'Cluster, computador de bordo, botões, alavancas, indicadores, mensagens e alertas do painel.', 4, 36, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(114, NULL, 10, 3, 'Iluminação e sinalização', 'iluminacao-sinalizacao', 'geral', 'Faróis, lanternas, setas, luzes internas, sinalização e iluminação externa.', 4, 48, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(115, NULL, 11, 3, 'Visibilidade e limpeza dos vidros', 'visibilidade-limpeza-vidros', 'geral', 'Para-brisa, vidros, espelhos, limpadores, palhetas, lavador, desembaçamento e campo de visão.', 4, 48, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(116, NULL, 10, 3, 'Tração elétrica, bateria e recarga', 'tracao-eletrica-bateria-recarga', 'geral', 'Motor elétrico, bateria de alta tensão, inversor, autonomia, carregamento e regeneração.', 1, 24, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(117, NULL, 11, 3, 'Acessibilidade e sistemas de passageiros', 'acessibilidade-passageiros', 'geral', 'Elevador, rampa, ajoelhamento, catraca, campainha, portas e recursos para passageiros de ônibus.', 2, 36, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(118, NULL, 10, 3, 'Conectividade e telemática', 'conectividade-telematica', 'geral', 'Rastreamento, telemetria, conectividade, multimídia, GPS, aplicativos e comunicação remota.', 4, 48, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(119, NULL, 12, 5, 'Sugestão de produto', 'sugestao-produto', 'sugestao', 'Ideias de novas funções, equipamentos ou melhorias do produto.', 8, 120, 1, '2026-07-29 05:58:45', '2026-07-31 00:51:21'),
(120, NULL, NULL, 3, 'Sistemas', 'sistemas', 'geral', NULL, 8, 72, 1, '2026-07-31 00:08:19', '2026-07-31 00:51:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelos`
--

CREATE TABLE `modelos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `familia_id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(120) NOT NULL,
  `slug` varchar(140) NOT NULL,
  `descricao` text,
  `imagem` varchar(255) DEFAULT NULL,
  `motor` varchar(120) DEFAULT NULL,
  `potencia` varchar(100) DEFAULT NULL,
  `torque` varchar(100) DEFAULT NULL,
  `transmissao` varchar(140) DEFAULT NULL,
  `pbt` varchar(80) DEFAULT NULL,
  `pbtc` varchar(100) DEFAULT NULL,
  `relacao_reducao` varchar(160) DEFAULT NULL,
  `especificacoes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `modelos`
--

INSERT INTO `modelos` (`id`, `familia_id`, `nome`, `slug`, `descricao`, `imagem`, `motor`, `potencia`, `torque`, `transmissao`, `pbt`, `pbtc`, `relacao_reducao`, `especificacoes`, `ativo`, `criado_em`) VALUES
(1, 1, 'Delivery Express', 'delivery-express', 'Modelo Delivery Express da família Volkswagen Delivery.', 'public/assets/images/modelos/delivery-express.png', 'F1C 3.0l', '156 cv @ 3.300 rpm', '360 Nm @ 1.300 - 2.900 rpm', 'Eaton / ESO 4106A', '3.500 kg', '', '4,56:1', '{\"entre_eixos\":\"3.000 / 3.600\",\"conferido_em\":\"2026-07-18\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 13:45:26'),
(2, 1, 'Delivery 11.180', 'delivery-11-180', 'Modelo Delivery 11.180 da família Volkswagen Delivery.', 'public/assets/images/modelos/delivery-11-180.png', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual Eaton ESO 6106 / Automatizada EAO 6106', '10.800 kg', '13.200 kg', '', '{\"entre_eixos\":\"3.400 / 4.000 / 4.400 / 4.600\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 13:45:26'),
(3, 2, 'Constellation 17.210 4x2', 'constellation-17-210-4x2', 'Modelo Constellation 17.210 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-17-210-4x2.png', 'MAN / D0834LF08', '205 (150) @ 2.300', '750 @ 1.200 - 1.800', 'Manual - Eaton / FS 5406-A', '16.000 kg', '27.000 kg', '5,29:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1', '{\"entre_eixos\":\"4.800 / 5.207\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 13:45:26'),
(4, 3, 'Meteor 6x4 29.530', 'meteor-6x4-29-530', 'Modelo Novo Meteor Highline 29.530 da família Volkswagen Meteor.\nRelação  de redução 3,08:1 e  3,36:1', 'public/assets/images/modelos/novo-meteor-highline-29-530.jpg', 'MAN / D2676LFAD', '525 (386) @ 1.800', '2.600 @ 930 - 1.350', 'ZF / 12TX 2624 TD', '23.000 kg', '', '3,08:1 / 3,36:1', '{\"entre_eixos\":\"4.600 / 4.800 / 5.000\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x4\",\"tipo_carroceria\":\"Chassi-Cabine\",\"emissoes\":\"Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Rodoviário\"}', 1, '2026-07-16 13:45:26'),
(6, 1, 'Delivery 6.170', 'delivery-6-170', 'Modelo Delivery 6.170 da família Volkswagen Delivery.', 'public/assets/images/modelos/delivery-6-170.png', 'F1C 3.0l', '156 cv @ 3.300 rpm', '430 Nm @ 1.400 - 2.700 rpm', 'Manual - Eaton / ESO 4206', '5.850 kg', '6.900 kg', '5,13:1 / 4,78:1', '{\"entre_eixos\":\"4.000\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:51'),
(7, 1, 'Delivery 9.180', 'delivery-9-180', 'Modelo Delivery 9.180 da família Volkswagen Delivery.', 'public/assets/images/modelos/delivery-9-180.png', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual Eaton ESO 6106 / Automatizada EAO 6106', '9.200 kg', '11.500 kg', '4,10:1 / 4,30:1', '{\"entre_eixos\":\"3.400 / 4.000 / 4.400 / 4.600\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:51'),
(8, 1, 'Delivery 11.180 4x4', 'delivery-11-180-4x4', 'Modelo Delivery 11.180 4x4 da família Volkswagen Delivery.', 'public/assets/images/modelos/delivery-11-180-4x4.png', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Eaton / ESO 6106A', '10.800 kg', '13.200 kg', '4,56:1', '{\"entre_eixos\":\"4.000\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x4, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:51'),
(9, 1, 'Delivery 14.180', 'delivery-14-180', 'Modelo Delivery 14.180 da família Volkswagen Delivery.', 'public/assets/images/modelos/delivery-14-180.png', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Eaton / ESO 6206A', '14.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:52'),
(10, 4, 'e-Delivery 11', 'e-delivery-11', 'Modelo e-Delivery 11 da família Volkswagen e-Delivery.', 'public/assets/images/modelos/e-delivery-11.jpg', 'JJE / SD460', '280 @ 1.200 a 3.500', '2.300 @ 0 a 1.200', 'Tração elétrica', '11.400 kg', '15.000 kg', '5,86:1', '{\"entre_eixos\":\"3.300 / 4.400\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"100% elétrico\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:52'),
(11, 4, 'e-Delivery 14', 'e-delivery-14', 'Modelo e-Delivery 14 da família Volkswagen e-Delivery.', 'public/assets/images/modelos/e-delivery-14.jpg', 'WEG / VW 280', '300 @ 1.360 a 3.500', '2.150 @ 0 a 1.360', 'Tração elétrica', '14.300 kg', '', '6,14:1', '{\"entre_eixos\":\"4.400\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"100% elétrico\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:52'),
(12, 2, 'Constellation 14.210 4x2', 'constellation-14-210-4x2', 'Modelo Constellation 14.210 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-14-210-4x2.png', 'MAN / D0834LF08', '205 (150) @ 2.300', '750 @ 1.200 - 1.800', 'Manual - Eaton / FS 5406-A', '14.500 kg', '23.000 kg', '4,88:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1', '{\"entre_eixos\":\"4.800 / 5.207\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:52'),
(13, 2, 'Constellation 18.210 4x2', 'constellation-18-210-4x2', 'Modelo Constellation 18.210 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-18-210-4x2.png', 'MAN / D0834LF08', '205 (150) @ 2.300', '750 @ 1.200 - 1.800', 'Eaton FS 5406-A / ZF 8AP 900T', '16.000 kg', '27.000 kg', '5,29:1 / 5,86:1 / 4,56:1 / 6,36:1 / 4,10:1 / 5,72:1 / 6,57:1', '{\"entre_eixos\":\"3.560 / 4.800 / 5.207\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:52'),
(14, 2, 'Constellation 18.260 4x2', 'constellation-18-260-4x2', 'Modelo Constellation 18.260 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-18-260-4x2.png', 'MAN / D0836LF18', '260 (191) @ 2.200', '950 @ 1.000 - 1.800', 'Eaton / FSO 6406 A', '16.000 kg', '35.000 kg', '4,88:1 / 6,65:1 / 3,73:1 / 3,42:1', '{\"entre_eixos\":\"3.560 / 4.340 / 4.800 / 5.207\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:52'),
(15, 2, 'Constellation 18.320 4x2', 'constellation-18-320-4x2', 'Modelo Constellation 18.320 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-18-320-4x2.png', 'MAN / D0836LF17', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF 9S 1310 TD / ZF 12TX 2420 TD', '16.000 kg', '36.000 kg', '3,42:1 / 3,73:1', '{\"entre_eixos\":\"4.340 / 4.800 / 5.207\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(16, 2, 'Constellation 26.260 6x2', 'constellation-26-260-6x2', 'Modelo Constellation 26.260 6x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-26-260-6x2.jpg', 'MAN / D0836LF18', '260 (191) @ 2.200', '950 @ 1.000 - 1.800', 'Manual - Eaton / FS 6406-A', '23.000 kg', '35.000 kg', '4,88:1 / 6,65:1 / 3,73:1', '{\"entre_eixos\":\"4.784 / 6.024 / 6.431\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(17, 2, 'Constellation 26.320 6x2', 'constellation-26-320-6x2', 'Modelo Constellation 26.320 6x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-26-320-6x2.jpg', 'MAN / D0836LF17', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF 9S 1310 TD / ZF 12TX 2420 TD', '23.000 kg', '36.000 kg', '3,42:1 / 3,73:1', '{\"entre_eixos\":\"6.024 / 6.431\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(18, 2, 'Constellation 30.320 8x2', 'constellation-30-320-8x2', 'Modelo Constellation 30.320 8x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-30-320-8x2.jpg', 'MAN / D0836LF17', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF 9S 1310 TD / ZF 12TX 2420 TD', '29.000 kg', '36.000 kg', '3,42:1 / 3,73:1', '{\"entre_eixos\":\"7.324 / 7.724\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"8x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(19, 2, 'Constellation 27.260 6x4', 'constellation-27-260-6x4', 'Modelo Constellation 27.260 6x4 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-27-260-6x4.png', 'MAN / D0836LF18', '260 (191) @ 2.200', '950 @ 1.000 - 1.800', 'ZF / 9S 1310 TD', '23.000 kg', '36.000 kg', '5,29:1 / 4,88:1', '{\"entre_eixos\":\"4.800 / 5.940\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x4, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(20, 2, 'Novo Constellation 27.320 6x4', 'novo-constellation-27-320-6x4', 'Modelo Novo Constellation 27.320 6x4 da família Volkswagen Constellation.', 'public/assets/images/modelos/novo-constellation-27-320-6x4.jpg', 'MAN / D0836LF17', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF / 9S 1310 TD', '23.000 kg', '74.000 kg', '5,41:1 / 4,55:1', '{\"entre_eixos\":\"4.600\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x4, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(21, 2, 'Constellation 31.320 6x4', 'constellation-31-320-6x4', 'Modelo Constellation 31.320 6x4 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-31-320-6x4.jpg', 'MAN / D0836LF17', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'Automatizada - ZF / 12TX 2424 TD', '23.000 kg', '42.000 kg', '4,89:1 / 4,56:1 / 5,38:1', '{\"entre_eixos\":\"4.800 / 5.940\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x4, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(22, 2, 'Constellation 32.380 6x4', 'constellation-32-380-6x4', 'Modelo Constellation 32.380 6x4 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-32-380-6x4.png', 'Cummins / ISL', '375 (276) @ 1.900', '1.700 @ 1.100 - 1.400', 'ZF / 12TX 2624 TD', '23.000 kg', '63.000 kg', '4,55:1', '{\"entre_eixos\":\"4.800 / 5.940\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x4, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(23, 2, 'Constellation 33.260 8x4', 'constellation-33-260-8x4', 'Modelo Constellation 33.260 8x4 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-33-260-8x4.jpg', 'MAN / D0836LF18', '260 (191) @ 2.200', '950 @ 1.000 - 1.800', 'ZF / 9S 1310 TD', '29.000 kg', '36.000 kg', '5,29:1', '{\"entre_eixos\":\"5.750\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"8x4, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:53'),
(24, 2, 'Constellation 33.480 6x4', 'constellation-33-480-6x4', 'Modelo Constellation 33.480 6x4 da família Volkswagen Constellation.\n5,41:1 - 4,55:1', 'public/assets/images/modelos/constellation-33-480-6x4.jpg', 'MAN / D2676LFAG 13L', '475 (350) @ 1.800', '2.400 @ 930 - 1.350', 'ZF / 12TX 2824 TO', '23.000 kg', '74.000 kg', '4,55:1', '{\"entre_eixos\":\"3.200\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel Euro 6\",\"configuracao\":\"6x4\",\"tipo_carroceria\":\"Chassi-Cabine\",\"emissoes\":\"PROCONVE P-8\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Off-Road\"}', 1, '2026-07-16 14:41:54'),
(25, 2, 'Constellation 19.380 4x2', 'constellation-19-380-4x2', 'Modelo Constellation 19.380 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-19-380-4x2.png', 'Cummins / ISL', '375 (276) @ 1.900', '1.700 @ 1.100 - 1.400', 'ZF / 12TX 2624 TD', '16.000 kg', '', '3,21:1 / 3,42:1', '{\"entre_eixos\":\"3.560\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:54'),
(26, 2, 'Constellation 20.480 4x2', 'constellation-20-480-4x2', 'Modelo Constellation 20.480 4x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-20-480-4x2.png', 'MAN / D2676LFAG', '475 (350) @ 1.800', '2.400 @ 930 - 1.350', 'ZF / 12TX 2624 TD', '16.000 kg', '56.000 kg', '3,08:1 / 2,85:1', '{\"entre_eixos\":\"3.600\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:54'),
(27, 2, 'Constellation 25.380 6x2', 'constellation-25-380-6x2', 'Modelo Constellation 25.380 6x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-25-380-6x2.jpg', 'Cummins / ISL', '375 (276) @ 1.900', '1.700 @ 1.100 - 1.400', 'ZF / 12TX 2624 TD', '23.000 kg', '', '3,25:1 / 3,40:1', '{\"entre_eixos\":\"3.300\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:54'),
(28, 2, 'Constellation 25.480HD 6x2', 'constellation-25-480hd-6x2', 'Modelo Constellation 25.480HD 6x2 da família Volkswagen Constellation.', 'public/assets/images/modelos/constellation-25-480hd-6x2.jpg', 'MAN / D2676LFAG', '475 (350) @ 1.800', '2.400 @ 930 - 1.350', 'ZF / 12TX 2624 TD', '23.000 kg', '', '3,08:1 / 2,85:1', '{\"entre_eixos\":\"3.600\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:54'),
(29, 3, 'Meteor 6x4 28.480HD', 'meteor-6x4-28-480hd', 'Modelo Novo Meteor Highline 28.480HD da família Volkswagen Meteor.', 'public/assets/images/modelos/novo-meteor-highline-28-480hd.png', 'MAN / D2676LFAG', '475 (350) @ 1.800', '2.400 @ 930 - 1.350', 'ZF / 12TX 2624 TD', '23.000 kg', '58.500 kg', '2,85:1 / 3,08:1 / 3,40:1', '{\"entre_eixos\":\"4.600\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 14:41:54'),
(30, 17, 'e-Volksbus 22L', 'e-volksbus-22l', 'Modelo e-Volksbus 22L da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-e-volksbus-22l.jpg', 'VW / SD 460', '280 kW (380 cv)', '2.450 Nm', 'Tração elétrica — Zero Emission', '16.000 kg', '', '', '{\"entre_eixos\":\"6.000\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"100% elétrico\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\",\"bateria\":\"12 packs LFP, 385 kWh\",\"autonomia\":\"Até 250 km\",\"capacidade_passageiros\":\"Até 82 passageiros\",\"comprimento\":\"Até 13,2 m\",\"carregamento\":\"Até 160 kW; cerca de 3 horas\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:26'),
(31, 17, 'Volksbus 9.180 / S', 'urbano-volksbus-9-180-s', 'Modelo Volksbus 9.180 / S da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-9-180-s.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '9.600 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:27'),
(32, 17, 'Volksbus 11.180 / S', 'urbano-volksbus-11-180-s', 'Modelo Volksbus 11.180 / S da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-11-180-s.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '10.700 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:27'),
(33, 17, 'Volksbus 15.210 / S', 'urbano-volksbus-15-210-s', 'Modelo Volksbus 15.210 / S da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-15-210-s.jpg', 'MAN / D0834LF08', '205 (150) @ 2.300', '750 @ 1.200 - 1.800', 'ZF 8AP900B / ZF 6S1010BO', '15.500 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:28'),
(34, 17, 'Volksbus 17.230 / S', 'urbano-volksbus-17-230-s', 'Modelo Volksbus 17.230 / S da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-17-230-s.jpg', 'MAN / D0834', '225 (166) @ 2.300', '850 @ 1.300 - 1.800', 'ZF 8AP900B / ZF 6S1010BO', '16.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:29'),
(35, 17, 'Volksbus 17.260 / S', 'urbano-volksbus-17-260-s', 'Modelo Volksbus 17.260 / S da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-17-260-s.jpg', 'MAN / D0836LF18', '260 (191) @ 2.200', '950 @ 1.000 - 1.800', 'ZF 8AP900B / ZF 6S1010BO', '16.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:29'),
(36, 17, 'Volksbus 18.320 SL', 'volksbus-18-320-sl', 'Modelo Volksbus 18.320 SL da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-18-320-sl.jpg', 'MAN / D0836LOH12', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF / 6AP 1220 B', '16.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:30'),
(37, 17, 'Volksbus 22.260', 'volksbus-22-260', 'Modelo Volksbus 22.260 da família Volkswagen Urbano.', 'public/assets/images/modelos/urbano-volksbus-22-260.png', 'MAN / D0836LF17', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF / 6S 1010 BO', '21.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:30'),
(38, 8, 'Volksbus 9.180 / S', 'volksbus-9-180-s', 'Modelo Volksbus 9.180 / S da família Volkswagen Rodoviário.', 'public/assets/images/modelos/rodoviario-volksbus-9-180-s.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '9.600 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:31'),
(39, 8, 'Volksbus 11.180 / S', 'volksbus-11-180-s', 'Modelo Volksbus 11.180 / S da família Volkswagen Rodoviário.', 'public/assets/images/modelos/rodoviario-volksbus-11-180-s.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '10.700 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:31'),
(40, 8, 'Volksbus 15.210 / S', 'volksbus-15-210-s', 'Modelo Volksbus 15.210 / S da família Volkswagen Rodoviário.', 'public/assets/images/modelos/rodoviario-volksbus-15-210-s.jpg', 'MAN / D0834LF08', '205 (150) @ 2.300', '750 @ 1.200 - 1.800', 'ZF 8AP900B / ZF 6S1010BO', '15.500 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:32'),
(41, 8, 'Volksbus 17.230 / S', 'volksbus-17-230-s', 'Modelo Volksbus 17.230 / S da família Volkswagen Rodoviário.', 'public/assets/images/modelos/rodoviario-volksbus-17-230-s.jpg', 'MAN / D0834', '225 (166) @ 2.300', '850 @ 1.300 - 1.800', 'ZF 8AP900B / ZF 6S1010BO', '17.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:33'),
(42, 8, 'Volksbus 17.260 / S', 'volksbus-17-260-s', 'Modelo Volksbus 17.260 / S da família Volkswagen Rodoviário.', 'public/assets/images/modelos/rodoviario-volksbus-17-260-s.jpg', 'MAN / D0836LF18', '260 (191) @ 2.200', '950 @ 1.000 - 1.800', 'ZF 8AP900B / ZF 6S1010BO', '17.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:33'),
(43, 8, 'Volksbus 18.320 SH', 'volksbus-18-320-sh', 'Modelo Volksbus 18.320 SH da família Volkswagen Rodoviário.', 'public/assets/images/modelos/rodoviario-volksbus-18-320-sh.jpg', 'MAN / D0836LOH12', '315 (231) @ 2.200', '1.200 @ 1.200 - 1.700', 'ZF / 8AP 1200 B', '18.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:34'),
(44, 6, 'Volksbus 8.180 E (ORE 1)', 'volksbus-8-180-e-ore-1', 'Modelo Volksbus 8.180 E (ORE 1) da família Volkswagen Escolar.', 'public/assets/images/modelos/escolar-volksbus-8-180-e-ore-1.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '8.700 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:35'),
(45, 6, 'Volksbus 11.180 E (ORE 2)', 'volksbus-11-180-e-ore-2', 'Modelo Volksbus 11.180 E (ORE 2) da família Volkswagen Escolar.', 'public/assets/images/modelos/escolar-volksbus-11-180-e-ore-2.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '10.800 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:35'),
(46, 6, 'Volksbus 15.210 E (ORE 3)', 'volksbus-15-210-e-ore-3', 'Modelo Volksbus 15.210 E (ORE 3) da família Volkswagen Escolar.', 'public/assets/images/modelos/escolar-volksbus-15-210-e-ore-3.jpg', 'MAN / D0834LF08', '205 (150) @ 2.300', '750 @ 1.200 - 1.800', 'Eaton / FSB 5406-A', '15.000 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:35'),
(47, 6, 'Volksbus 8.180 (ONUREA)', 'volksbus-8-180-onurea', 'Modelo Volksbus 8.180 (ONUREA) da família Volkswagen Escolar.', 'public/assets/images/modelos/escolar-volksbus-8-180-onurea.jpg', 'Cummins / ISF 3.8l', '175 (129) @ 2.500', '600 @ 1.100 - 1.800', 'Manual - Eaton / ESO 6206-A', '8.700 kg', '', '', '{\"entre_eixos\":\"\",\"tipo_veiculo\":\"Ônibus\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, chassi de ônibus\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-16 15:56:36'),
(49, 18, 'Daily 35-180 Hi-Matic', 'iveco-daily-35-180-hi-matic', 'Versão Daily 35-180 Hi-Matic cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/668bfbed3a20d0be686eeae12a7cca19.webp', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 8HP Hi-Matic automática, 8 marchas', '3.500 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"entre_eixos\":\"3.520 / 3.750\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(50, 18, 'Daily 45-180 Hi-Matic', 'iveco-daily-45-180-hi-matic', 'Versão Daily 45-180 Hi-Matic cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/1ac78ce13646005b1090ca42b97ad9b9.webp', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 8HP Hi-Matic automática, 8 marchas', '4.400 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"entre_eixos\":\"3.520 / 3.750\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(51, 18, 'Daily 55-180', 'iveco-daily-55-180', 'Versão Daily 55-180 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/f76cfa4ef1f61bf9d60fb5783d800fa7.jpg', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 6S480 VO manual, 6 marchas', '5.300 kg', '', '4,10:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"entre_eixos\":\"3.520 / 3.750\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(52, 18, 'Daily 65-180', 'iveco-daily-65-180', 'Versão Daily 65-180 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/33b8b79c53fcc3562c82d1c01338f93f.jpg', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 6S480 VO manual, 6 marchas', '6.500 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"entre_eixos\":\"4.350\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(53, 19, 'Tector 9-190', 'tector-9-190', 'Versão Tector 9-190 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF4 4,5 l', '190 cv @ 2.200–2.500 rpm', '610 Nm @ 1.200–2.100 rpm', 'Eaton ESO6106B manual, 6 marchas', '8.600 kg', '11.000 kg', '4,30:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"3.906 / 4.460\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(54, 19, 'Tector 11-190', 'tector-11-190', 'Versão Tector 11-190 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF4 4,5 l', '190 cv @ 2.200–2.500 rpm', '610 Nm @ 1.200–2.100 rpm', 'Eaton ESO6106B manual, 6 marchas', '10.600 kg', '13.000 kg', '4,56:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"3.886 / 4.441\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(55, 19, 'Tector 15-210', 'tector-15-210', 'Versão Tector 15-210 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF4 4,5 l', '207 cv @ 2.100–2.500 rpm', '720 Nm @ 1.300–1.900 rpm', 'Eaton FS 5406A manual, 6 marchas', '15.400 kg', '27.000 kg', '4,10:1 / 5,72:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"4.104 / 4.735\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(56, 19, 'Tector 17-320', 'tector-17-320', 'Versão Tector 17-320 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '320 cv @ 2.200–2.500 rpm', '1.100 Nm @ 1.300–1.900 rpm', 'Eaton MHD EVO AutoShift, 10 marchas', '16.000 kg', '33.000 kg', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"4.188 / 4.818\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(57, 19, 'Tector 17-320T', 'tector-17-320t', 'Versão Tector 17-320T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '320 cv @ 2.200–2.500 rpm', '1.100 Nm @ 1.300–1.900 rpm', 'Eaton MHD EVO AutoShift, 10 marchas', '16.000 kg', '35.000 kg', '4,56:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"3.693\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(58, 19, 'Tector 24-280', 'tector-24-280', 'Versão Tector 24-280 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '280 cv @ 2.100–2.500 rpm', '950 Nm @ 1.250–1.950 rpm', 'Eaton 6406B manual, 6 marchas', '23.000 kg', '36.000 kg', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"4.189 / 4.819 / 5.668\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(59, 19, 'Tector 24-320', 'tector-24-320', 'Versão Tector 24-320 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '320 cv @ 2.200–2.500 rpm', '1.100 Nm @ 1.300–1.900 rpm', 'Eaton MHD EVO AutoShift, 10 marchas', '23.000 kg', '44.000 kg', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"4.189 / 4.819 / 5.668\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(60, 19, 'Tector 27-320', 'tector-27-320', 'Versão Tector 27-320 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '320 cv @ 2.200–2.500 rpm', '1.100 Nm @ 1.300–1.900 rpm', 'Eaton MHD EVO AutoShift, 10 marchas', '23.000 kg', '44.000 kg', '4,88:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"3.690 / 4.185 / 4.815\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(61, 19, 'Tector 31-280', 'tector-31-280', 'Versão Tector 31-280 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '280 cv @ 2.100–2.500 rpm', '950 Nm @ 1.250–1.950 rpm', 'Eaton 6406B manual, 6 marchas', '29.000 kg', '35.000 kg', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"8x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"5.175 / 5.950\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(62, 19, 'Tector 31-320', 'tector-31-320', 'Versão Tector 31-320 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-tector-oficial.jpg', 'FPT NEF6 6,7 l', '320 cv @ 2.200–2.500 rpm', '1.100 Nm @ 1.300–1.900 rpm', 'Eaton MHD EVO AutoShift, 10 marchas', '29.000 kg', '35.000 kg', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"8x2\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Tector/Semipesados\",\"entre_eixos\":\"5.175 / 5.950\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(63, 20, 'S-Way 480 4x2', 's-way-480-4x2', 'Versão S-Way 480 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-s-way-4x2-oficial.png', 'FPT Cursor 13 12,9 l', '480 cv @ 1.400–1.900 rpm', '2.450 Nm @ 1.000–1.400 rpm', 'ZF TraXon 12TX2620TD automatizada, 12 marchas', '16.000 kg', '46.000 kg', '2,85:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.498\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Pesados-S-Way\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 0, '2026-07-19 00:03:44'),
(64, 20, 'S-Way 480 6x2', 's-way-480-6x2', 'Versão S-Way 480 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.\nRelação: 3,08 : 1 (2,85:1 opcional)', 'public/assets/images/modelos/iveco-s-way-6x2-oficial.png', 'FPT Cursor 13 12,9 l', '480 cv @ 1.400–1.900 rpm', '2.450 Nm @ 1.000–1.400 rpm', 'ZF TraXon 12TX2624TD automatizada, 12 marchas', '23.000 kg', '58.500 kg', '3,08:1 / 2,85:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.173 / 3.451 / 3.489\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Pesados-S-Way\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(65, 20, 'S-Way 540 6x4', 's-way-540-6x4', 'Versão S-Way 540 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/iveco-s-way-6x4-oficial.png', 'FPT Cursor 13 12,9 l', '540 cv @ 1.500–1.900 rpm', '2.550 Nm @ 1.000–1.500 rpm', 'ZF TraXon 12TX2624TD automatizada, 12 marchas', '23.000 kg', '74.000 kg', '3,07:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.540\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4, cavalo mecânico\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf\",\"fonte_imagem_oficial\":\"https://www.iveco.com/brasil/Pesados-S-Way\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44');
INSERT INTO `modelos` (`id`, `familia_id`, `nome`, `slug`, `descricao`, `imagem`, `motor`, `potencia`, `torque`, `transmissao`, `pbt`, `pbtc`, `relacao_reducao`, `especificacoes`, `ativo`, `criado_em`) VALUES
(66, 21, 'FH 420 6x2T', 'fh-420-6x2t', 'Versão FH 420 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fh-oficial.webp', 'Volvo D13K 12,8 l', '420 cv @ 1.400–1.800 rpm', '2.100 Nm @ 905–1.400 rpm', 'I-Shift AT2612 G automatizada, 12 marchas', '28.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2T, suspensão pneumática\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(67, 21, 'FH 460 6x2T', 'fh-460-6x2t', 'Versão FH 460 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fh-oficial.webp', 'Volvo D13K 12,8 l', '460 cv @ 1.400–1.800 rpm', '2.300 Nm @ 945–1.400 rpm', 'I-Shift AT2612 G automatizada, 12 marchas', '28.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2T, suspensão pneumática\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(68, 21, 'FH 500 6x2T', 'fh-500-6x2t', 'Versão FH 500 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/f9b7708e7a0e862b250a19fb2fa65c61.png', 'Volvo D13K 12,8 l', '500 cv @ 1.400–1.800 rpm', '2.500 Nm @ 980–1.400 rpm', 'I-Shift AT2612 G automatizada, 12 marchas', '28.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2T, suspensão pneumática\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(69, 21, 'FH 540 6x2T', 'fh-540-6x2t', 'Versão FH 540 6x2T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fh-oficial.webp', 'Volvo D13K 12,8 l', '540 cv @ 1.460–1.800 rpm', '2.600 Nm @ 1.000–1.460 rpm', 'I-Shift AT2612 G automatizada, 12 marchas', '28.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2T, suspensão pneumática\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"3.000 / 3.200 / 3.500 / 3.700\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(70, 22, 'FM 380 6x2R', 'fm-380-6x2r', 'Versão FM 380 6x2R cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fm-oficial.webp', 'Volvo D13K 12,8 l', '380 cv', '', 'I-Shift de 7ª geração', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2 rígido\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(71, 23, 'FMX 420 6x4R', 'fmx-420-6x4r', 'Versão FMX 420 6x4R cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fmx-oficial.webp', 'Volvo D13K 12,8 l', '420 cv @ 1.400–1.800 rpm', '2.100 Nm @ 905–1.400 rpm', 'I-Shift automatizada', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4 rígido\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(72, 23, 'FMX 460 6x4T', 'fmx-460-6x4t', 'Versão FMX 460 6x4T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fmx-oficial.webp', 'Volvo D13K 12,8 l', '460 cv @ 1.400–1.800 rpm', '2.300 Nm @ 945–1.400 rpm', 'I-Shift automatizada', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4, cavalo mecânico\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(73, 23, 'FMX 500 8x4R', 'fmx-500-8x4r', 'Versão FMX 500 8x4R cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fmx-oficial.webp', 'Volvo D13K 12,8 l', '500 cv @ 1.400–1.800 rpm', '2.500 Nm @ 980–1.400 rpm', 'I-Shift automatizada', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"8x4 rígido\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(74, 23, 'FMX 540 6x4T', 'fmx-540-6x4t', 'Versão FMX 540 6x4T cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-fmx-oficial.webp', 'Volvo D13K 12,8 l', '540 cv @ 1.460–1.800 rpm', '2.600 Nm @ 1.000–1.460 rpm', 'I-Shift automatizada', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4, cavalo mecânico\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(75, 24, 'VM 290 4x2R', 'vm-290-4x2r', 'Versão VM 290 4x2R cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-vm-oficial.webp', 'Volvo D8K 7,7 l', '290 cv @ 1.900 rpm', '1.050 Nm @ 1.000–1.700 rpm', 'ZT1309 manual ou I-Shift AT2612 G', '17.500 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2 rígido\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-vm.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(76, 24, 'VM 360 4x2R', 'vm-360-4x2r', 'Versão VM 360 4x2R cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/volvo-vm-oficial.webp', 'Volvo D8K 7,7 l', '360 cv @ 2.200 rpm', '1.400 Nm @ 1.100–1.600 rpm', 'I-Shift AT2612 G automatizada, 12 marchas', '17.500 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2 rígido\",\"fonte_oficial\":\"https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-vm.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(77, 25, 'Accelo 917', 'accelo-917', 'Versão Accelo 917 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-novo-accelo-oficial.webp', 'Mercedes-Benz OM 924 4,8 l', '163 cv', '610 Nm', '', '9.600 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(78, 25, 'Accelo 1117', 'accelo-1117', 'Versão Accelo 1117 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-novo-accelo-oficial.webp', 'Mercedes-Benz OM 924 4,8 l', '163 cv', '610 Nm', '', '10.700 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(79, 25, 'Accelo 1317', 'accelo-1317', 'Versão Accelo 1317 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-novo-accelo-oficial.webp', 'Mercedes-Benz OM 924 4,8 l', '163 cv', '610 Nm', '', '13.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(80, 25, 'Accelo 1417', 'accelo-1417', 'Versão Accelo 1417 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-novo-accelo-oficial.webp', 'Mercedes-Benz OM 924 4,8 l', '163 cv', '610 Nm', '', '14.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(81, 26, 'Atego 1719 K 4x2', 'atego-1719-k-4x2', 'Versão Atego 1719 K 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 924', '185 cv', '', 'PowerShift 3 automatizada', '17.100 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2 basculante\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(82, 26, 'Atego 1726 P 4x2', 'atego-1726-p-4x2', 'Versão Atego 1726 P 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '260 cv', '900 Nm', 'PowerShift 3 automatizada', '17.100 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2 plataforma\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(83, 26, 'Atego 1733 K 4x2', 'atego-1733-k-4x2', 'Versão Atego 1733 K 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '321 cv', '1.250 Nm', 'PowerShift 3 automatizada', '17.100 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2 basculante\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(84, 26, 'Atego 1933 LS 4x2', 'atego-1933-ls-4x2', 'Versão Atego 1933 LS 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '321 cv', '1.250 Nm', 'PowerShift 3 automatizada', '19.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(85, 26, 'Atego 2429 P 6x2', 'atego-2429-p-6x2', 'Versão Atego 2429 P 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '286 cv', '1.100 Nm', 'PowerShift 3 automatizada', '24.100 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2 plataforma\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(86, 26, 'Atego 2433 P 6x2', 'atego-2433-p-6x2', 'Versão Atego 2433 P 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '321 cv', '1.250 Nm', 'PowerShift 3 automatizada', '24.100 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2 plataforma\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(87, 26, 'Atego 2730 P 6x4', 'atego-2730-p-6x4', 'Versão Atego 2730 P 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '286 cv', '1.100 Nm', 'PowerShift 3 automatizada', '26.600 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4 plataforma\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(88, 26, 'Atego 3033 P 8x2', 'atego-3033-p-8x2', 'Versão Atego 3033 P 8x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-atego-oficial.webp', 'Mercedes-Benz OM 926', '321 cv', '1.250 Nm', 'PowerShift 3 automatizada', '30.200 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"8x2 plataforma\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/atego\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(89, 27, 'Axor 2038 S 4x2', 'axor-2038-s-4x2', 'Versão Axor 2038 S 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-axor-oficial.webp', 'Mercedes-Benz OM 460 LA 12,8 l', '380 cv', '1.900 Nm', 'Automatizada', '20.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/axor\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(90, 27, 'Axor 2538 S 6x2', 'axor-2538-s-6x2', 'Versão Axor 2538 S 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-axor-oficial.webp', 'Mercedes-Benz OM 460 LA 12,8 l', '380 cv', '1.900 Nm', 'Automatizada', '25.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/axor\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(91, 27, 'Axor 2545 S 6x2', 'axor-2545-s-6x2', 'Versão Axor 2545 S 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-axor-oficial.webp', 'Mercedes-Benz OM 460 LA 12,8 l', '449 cv', '2.200 Nm', 'Automatizada', '25.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/axor\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(92, 28, 'Actros 2045 S 4x2', 'actros-2045-s-4x2', 'Versão Actros 2045 S 4x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/a14f1dad84c6578239b7700d56378098.png', 'Mercedes-Benz OM 460 / OM 471', '449 cv', '2.200 Nm', 'PowerShift automatizada', '20.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/actros\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(93, 28, 'Actros 2548 S 6x2', 'actros-2548-s-6x2', 'Versão Actros 2548 S 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/c17cf89b8ae7a7761b0b04128394df7d.png', 'Mercedes-Benz OM 460 / OM 471', '476 cv', '2.300 Nm', 'PowerShift automatizada', '25.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/actros\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(94, 28, 'Actros 2553 S 6x2', 'actros-2553-s-6x2', 'Versão Actros 2553 S 6x2 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/3d28434ea746c1d17e67bb0c137dbeb6.png', 'Mercedes-Benz OM 471', '530 cv', '2.600 Nm', 'PowerShift automatizada', '25.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x2, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/actros\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(95, 28, 'Actros 2651 S 6x4', 'actros-2651-s-6x4', 'Versão Actros 2651 S 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/d780524851901dd6b38bc66733d6dc93.png', 'Mercedes-Benz OM 460 / OM 471', '495 cv', '2.400 Nm', 'PowerShift automatizada', '26.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/actros\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(96, 28, 'Actros 2653 S 6x4', 'actros-2653-s-6x4', 'Versão Actros 2653 S 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/eb4884218385f2df650b69ebe717dff1.png', 'MB OM 471 LA • 12,8 L • 6 cil. - PROCONVE P-8', '530 cv (390 kW) @ 1600 rpm', '2600 Nm (265,1 mkgf) @ 1100 rpm', 'PowerShift automatizada', '26.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.250\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/actros\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(97, 29, 'Arocs 3351 K 6x4', 'arocs-3351-k-6x4', 'Versão Arocs 3351 K 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-arocs-oficial.webp', 'Mercedes-Benz OM 460 / OM 471', '495 cv', '2.400 Nm', 'PowerShift automatizada', '33.500 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4 basculante\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(98, 29, 'Arocs 3353 S 6x4', 'arocs-3353-s-6x4', 'Versão Arocs 3353 S 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-arocs-oficial.webp', 'Mercedes-Benz OM 471', '530 cv', '2.600 Nm', 'PowerShift automatizada', '33.500 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4, cavalo mecânico\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(99, 29, 'Arocs 4151 K 6x4', 'arocs-4151-k-6x4', 'Versão Arocs 4151 K 6x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-arocs-oficial.webp', 'Mercedes-Benz OM 460 / OM 471', '495 cv', '2.400 Nm', 'PowerShift automatizada', '41.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4 basculante\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(100, 29, 'Arocs 5851 K 8x4', 'arocs-5851-k-8x4', 'Versão Arocs 5851 K 8x4 cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/mercedes-arocs-oficial.webp', 'Mercedes-Benz OM 460 / OM 471', '495 cv', '2.400 Nm', 'PowerShift automatizada', '58.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"8x4 basculante\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/arocs\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.mercedes-benz-trucks.com.br/caminhoes/\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(101, 32, 'Scania R 420 Super', 'scania-r-420-super', 'Versão Scania R 420 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/393736548891c980ae324da46c5a380e.png', 'Scania Super 13 l', '420 hp (309 kW) @ 1.800 rpm', '2.300 Nm @ 900–1.280 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine R; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(102, 32, 'Scania R 460 Super', 'scania-r-460-super', 'Versão Scania R 460 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/9151958cc89233f6780712d5229b44c3.png', 'Scania Super 13 l', '460 hp (338 kW) @ 1.800 rpm', '2.500 Nm @ 900–1.290 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine R; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(103, 32, 'Scania R 500 6x4 Super', 'scania-r-500-6x4-super', 'Versão Scania R 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/58d866aed1c368e6dffb3edb0bead2f5.png', 'DC13 174', '500 hp (368 kW) @ 1.800 rpm', '2.650 Nm @ 900–1.320 rpm', 'Scania Opticruise G25/G33', '23.000 Kg', '74.000 Kg', '3,07:1 | 3,42:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"6x4\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\",\"entre_eixos\":\"3.550\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"7.110 mm\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(104, 32, 'R 540 A 6x4 NZ (plus) 540 cv', 'r-540-a-6x4-nz-plus-540-cv', 'Versão Scania R 540 Super cadastrada a partir das especificações técnicas oficiais do fabricante.\nRelação do eixo 3,07:1', 'public/assets/images/modelos/c24197e2e94a237ef4f3c1bbe34ba928.png', 'DC13 166', '540 hp @ 1.800 rpm', '2.700 Nm @ 1.000 -1.300 rpm', 'GRS905R', '23.000 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.550\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine R; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/r-series.html\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(105, 33, 'Scania S 420 Super', 'scania-s-420-super', 'Versão Scania S 420 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/scania-linha-s-oficial.jpeg', 'Scania Super 13 l', '420 hp (309 kW) @ 1.800 rpm', '2.300 Nm @ 900–1.280 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine S de piso plano\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/s-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(106, 33, 'Scania S 460 Super', 'scania-s-460-super', 'Versão Scania S 460 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/scania-linha-s-oficial.jpeg', 'Scania Super 13 l', '460 hp (338 kW) @ 1.800 rpm', '2.500 Nm @ 900–1.290 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine S de piso plano\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/s-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(107, 33, 'Scania S 500 Super', 'scania-s-500-super', 'Versão Scania S 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/scania-linha-s-oficial.jpeg', 'Scania Super 13 l', '500 hp (368 kW) @ 1.800 rpm', '2.650 Nm @ 900–1.320 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine S de piso plano\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/s-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(108, 33, 'Scania S 560 Super', 'scania-s-560-super', 'Versão Scania S 560 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/scania-linha-s-oficial.jpeg', 'Scania Super 13 l', '560 hp (412 kW) @ 1.800 rpm', '2.800 Nm @ 900–1.400 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine S de piso plano\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/s-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(109, 30, 'Scania P 420 Super', 'scania-p-420-super', 'Versão Scania P 420 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/fa274963ff69984ff4b416ce6ad7d5d5.jpg', 'Scania Super 13 l', '420 hp (309 kW) @ 1.800 rpm', '2.300 Nm @ 900–1.280 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine P; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/p-series.html\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(110, 30, 'Scania P 460 Super', 'scania-p-460-super', 'Versão Scania P 460 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/11f91acbbe0b9a25c8094d7830267fde.jpg', 'Scania Super 13 l', '460 hp (338 kW) @ 1.800 rpm', '2.500 Nm @ 900–1.290 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine P; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/p-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(111, 30, 'Scania P 500 Super', 'scania-p-500-super', 'Versão Scania P 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/7637ccb8bbcff42337c96d8a84d2e886.jpg', 'Scania Super 13 l', '500 hp (368 kW) @ 1.800 rpm', '2.650 Nm @ 900–1.320 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine P; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/p-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Chassi-cabine\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(112, 31, 'Scania G 420 Super', 'scania-g-420-super', 'Versão Scania G 420 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/53f5aeda3f04ff6d9c685b8c8a2be26b.png', 'Scania Super 13 l', '420 hp (309 kW) @ 1.800 rpm', '2.300 Nm @ 900–1.280 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine G; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/g-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(113, 31, 'Scania G 460 Super', 'scania-g-460-super', 'Versão Scania G 460 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/68fb91fb8f38f5e20d564f3f7306aa87.png', 'Scania Super 13 l', '460 hp (338 kW) @ 1.800 rpm', '2.500 Nm @ 900–1.290 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine G; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/g-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(114, 31, 'Scania G 500 Super', 'scania-g-500-super', 'Versão Scania G 500 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/96b9953db54e9a581f52600687f4c57f.png', 'Scania Super 13 l', '500 hp (368 kW) @ 1.800 rpm', '2.650 Nm @ 900–1.320 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine G; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/g-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(115, 31, 'Scania G 560 Super', 'scania-g-560-super', 'Versão Scania G 560 Super cadastrada a partir das especificações técnicas oficiais do fabricante.', 'public/assets/images/modelos/a82d720f375377697eaccef0476144b8.png', 'Scania Super 13 l', '560 hp (412 kW) @ 1.800 rpm', '2.800 Nm @ 900–1.400 rpm', 'Scania Opticruise G25/G33', '', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Cabine G; configuração conforme aplicação\",\"fonte_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html\",\"imagem_escopo\":\"Imagem oficial representativa da família; configuração visual pode variar\",\"fonte_imagem_oficial\":\"https://www.scania.com/br/pt/home/products/trucks/g-series.html\",\"entre_eixos\":\"\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"tipo_carroceria\":\"Cavalo mecânico\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:03:44'),
(116, 34, 'BYD BC10LE', 'byd-bc10le', 'Aplicação Urbana.\nGarantia 5 anos ou 500.000 km para motor', 'public/assets/images/modelos/921962b8c2e2be9e92b25243dd757273.png', 'Motor síncrono de ímãs permanentes - BYD - TZ290XSE', '2× 150 kW', '2× 600 Nm', 'Tração elétrica direta com frenagem regenerativa', '19.500 kg', '', '', '{\"bateria\":\"\",\"energia\":\"100% elétrico\",\"mercado\":\"Brasil\",\"autonomia\":\"Até 250 km\",\"comprimento\":\"\",\"entre_eixos\":\"5.420\",\"carregamento\":\"\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Padron urbano\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH\",\"fonte_imagem_oficial\":\"https://www.byd.com/material/byd-site/br/news-byd-brasil/onibus-BH.jpg\",\"capacidade_passageiros\":\"Até 78 passageiros\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\"}', 1, '2026-07-19 00:04:22');
INSERT INTO `modelos` (`id`, `familia_id`, `nome`, `slug`, `descricao`, `imagem`, `motor`, `potencia`, `torque`, `transmissao`, `pbt`, `pbtc`, `relacao_reducao`, `especificacoes`, `ativo`, `criado_em`) VALUES
(117, 34, 'BYD eBus B12.b', 'byd-ebus-b12-b', 'Ônibus elétrico urbano de piso baixo do catálogo internacional BYD, equipado com Blade Battery LFP e trem de força integrado.', 'public/assets/images/modelos/byd-ebus-b12b-oficial.png', 'Dois motores elétricos Hairpin', '2 × 150 kW (máxima)', '', 'Tração elétrica direta', '20.000 kg', '', '', '{\"bateria\":\"Blade Battery LFP, até 500 kWh\",\"energia\":\"100% elétrico\",\"mercado\":\"Catálogo internacional\",\"autonomia\":\"Até 600 km\",\"comprimento\":\"12.130 mm\",\"entre_eixos\":\"5.950\",\"carregamento\":\"CCS; pantógrafo opcional, até 500 kW\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Piso baixo, entre-eixos de 5.950 mm\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://bydeurope.com/byd-ebus-b12\",\"fonte_imagem_oficial\":\"https://bydeurope.com/img/bus/b12/banner.png\",\"capacidade_passageiros\":\"Até 105 passageiros\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\"}', 1, '2026-07-19 00:04:22'),
(118, 34, 'BYD eBus B13', 'byd-ebus-b13', 'Ônibus elétrico de entrada baixa do catálogo internacional BYD, destinado a operações urbanas e intermunicipais.', 'public/assets/images/modelos/byd-ebus-b13-oficial.png', 'Dois motores elétricos integrados às rodas', '2 × 150 kW (máxima)', '', 'Tração elétrica direta', '19.100 kg', '', '', '{\"bateria\":\"Bateria LFP, até 422 kWh\",\"energia\":\"100% elétrico\",\"mercado\":\"Catálogo internacional\",\"autonomia\":\"Até 400 km\",\"comprimento\":\"13.275 mm\",\"carregamento\":\"CCS ou pantógrafo\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"Entrada baixa, entre-eixos de 7.100 mm\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://bydeurope.com/pdp-bus-model-13\",\"fonte_imagem_oficial\":\"https://bydeurope.com/img/bus/pdp-bus-model-13-bus.png\",\"capacidade_passageiros\":\"Até 59 passageiros\",\"entre_eixos\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\"}', 1, '2026-07-19 00:04:22'),
(119, 35, 'Mercedes-Benz eO500U', 'mercedes-benz-eo500u', 'Primeiro chassi de ônibus de propulsão elétrica produzido pela Mercedes-Benz do Brasil, com piso baixo e configuração modular de baterias.', 'public/assets/images/modelos/mercedes-eo500u-oficial.webp', 'Dois motores assíncronos integrados ao eixo traseiro', '250 kW / 340 cv (total)', '2 × 485 Nm', 'Tração elétrica direta', '21.200 kg', '', '', '{\"bateria\":\"3 a 6 pacotes NMC de 98 kWh; até 588 kWh\",\"energia\":\"100% elétrico\",\"mercado\":\"Brasil\",\"autonomia\":\"Até 270 km\",\"comprimento\":\"Carroceria de até 13,2 m\",\"carregamento\":\"CCS2, até 150 kW; recarga completa em até 3 horas\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, piso baixo\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u\",\"fonte_imagem_oficial\":\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/content-block/main/img-8948-20250710-182437-925-FCE2-20250710-181407-792-85A6_eo500u-sobre.jpg.webp\",\"capacidade_passageiros\":\"Mais de 80 passageiros nas configurações de 3 a 5 baterias\",\"entre_eixos\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"emissoes\":\"Zero emissão local\"}', 1, '2026-07-19 00:04:22'),
(120, 18, 'Daily 30-160', 'daily-30-160', 'Daily 30-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-30-160-oficial.webp', 'FPT F1C Max 3,0 l', '160 cv @ 3.500 rpm', '380 Nm @ 1.600–2.900 rpm', 'ZF 6S 480 VO manual, 6 marchas', '3.500 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.750\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(121, 18, 'Daily 35-160', 'daily-35-160', 'Daily 35-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-35-160-35-180-oficial.webp', 'FPT F1C Max 3,0 l', '160 cv @ 3.500 rpm', '380 Nm @ 1.600–2.900 rpm', 'ZF 6S 480 VO manual, 6 marchas', '3.500 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.520 / 3.750\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(122, 18, 'Daily 35-180 Hi-Matic', 'daily-35-180-hi-matic', 'Daily 35-180 Hi-Matic chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-35-160-35-180-oficial.webp', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 8HP Hi-Matic automática, 8 marchas', '3.500 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.520 / 3.750\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(123, 18, 'Daily 45-160', 'daily-45-160', 'Daily 45-160 chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-45-160-45-180-oficial.webp', 'FPT F1C Max 3,0 l', '160 cv @ 3.500 rpm', '380 Nm @ 1.600–2.900 rpm', 'ZF 6S 480 VO manual, 6 marchas', '4.400 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.520 / 3.750\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(124, 18, 'Daily 45-180 Hi-Matic', 'daily-45-180-hi-matic', 'Daily 45-180 Hi-Matic chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-45-160-45-180-oficial.webp', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 8HP Hi-Matic automática, 8 marchas', '4.400 kg', '', '3,73:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.520 / 3.750\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(125, 18, 'Daily 55-180', 'daily-55-180', 'Daily 55-180 chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-55-180-oficial.webp', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 6S 480 VO manual ou ZF 8HP Hi-Matic automática', '5.300 kg', '', '4,10:1', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"3.520 / 3.750\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(126, 18, 'Daily 65-180', 'daily-65-180', 'Daily 65-180 chassi-cabine, revisada conforme ficha técnica oficial IVECO.', 'public/assets/images/modelos/iveco-daily-65-180-oficial.webp', 'FPT F1C Max 3,0 l', '180 cv @ 3.500 rpm', '430 Nm @ 1.600–2.900 rpm', 'ZF 6S 480 VO manual ou ZF 8HP Hi-Matic automática', '6.500 kg', '', '', '{\"emissoes\":\"Proconve P8 / Euro 6\",\"entre_eixos\":\"4.350\",\"conferido_em\":\"2026-07-18\",\"configuracao\":\"4x2, chassi-cabine\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f\",\"imagem_escopo\":\"Imagem oficial do modelo ou grupo de versões\",\"tipo_carroceria\":\"Chassi-cabine\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-19 00:04:47'),
(127, 37, 'CF FT 4X2 PX-9', 'cf-ft-4x2-px-9', 'Relação de diferencial 3,08 3,40', 'public/assets/images/modelos/f5884a586ba9ad5aa2819e4f971e3a97.png', 'MOTOR PACCAR PX-9', '380 cv - 275kW (1.900 rpm)', '1.700 Nm @1.100 - 1.400 rpm', 'ZF TRAXON Automatizada – Direct Drive 12 a frente + 2 à ré', '16.000 kg', '53.000 kg', '3,08:1 / 3,40:1', '{\"entre_eixos\":\"3.600\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"configuracao\":\"4x2, cavalo mecânico\",\"tipo_carroceria\":\"Cavalo mecânico\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 0, '2026-07-21 11:54:15'),
(128, 37, 'CF FTS 6X2 PX-9 380 cv', 'cf-fts-6x2-px-9-380-cv', 'Relação de diferencial 3,08 | 3,40', 'public/assets/images/modelos/3398f8e35410573796a0ebc2a5dc8788.png', 'PACCAR PX-9', '380 cv - 275kW (1.900 rpm)', '1.700 Nm @1.100 - 1.400 rpm', 'ZF TRAXON Automatizada – Direct Drive 12 a frente + 2 à ré', '23.000 kg', '56.000 kg', '3,08:1 / 3,40:1', '{\"entre_eixos\":\"3.100\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, cavalo mecânico\",\"tipo_carroceria\":\"Cavalo mecânico\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-21 11:57:02'),
(129, 39, 'CF FAS 6X2 PX-9 340 cv', 'cf-fas-6x2-px-9-340-cv', 'Relação de diferencial 3,08 - 3,40', 'public/assets/images/modelos/603b8b2f67cf3b17b0bf185683e5e8b8.png', 'PACCAR PX-9', '340 cv - 249 kW (1.900 rpm)', '1.500 Nm @1.000 - 1.500 rpm', 'ZF Automatizada – Direct Drive 12 a frente + 2 à ré', '23.000 kg', '', '3,08:1 / 3,40:1', '{\"entre_eixos\":\"4.900 / 5.300\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, chassi-cabine\",\"tipo_carroceria\":\"Chassi-cabine\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-21 12:12:11'),
(130, 39, 'CF FAS PX-7 290 cv', 'cf-fas-px-7-290-cv', 'Esse modelo apresenta três possíveis calibrações do motor, verificar na ficha técnica.\nRelação de diferencial 3,73 - 4,10', 'public/assets/images/modelos/23681b62099f7a754f22edba9568dd30.png', 'PACCAR PX-7', '290 cv - 213 kW (2.300 rpm)', '1.100 Nm @1.100 - 1.600 rpm', 'ZF Automatizada OU manual – Direct Drive 9 a frente + 1 à ré', '23.000 kg', '', '3,73:1 / 4,10:1', '{\"entre_eixos\":\"4.900 / 5.300\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"configuracao\":\"6x2, chassi-cabine\",\"tipo_carroceria\":\"Chassi-cabine\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-21 12:16:32'),
(131, 36, 'XF FTT 6X4 530 cv', 'xf-ftt-6x4-530-cv', 'Esse modelo apresenta diferentes formas de calibração, checar na ficha técnica\nRelação de diferencial 2,80 3,07 3,42', 'public/assets/images/modelos/2ba7d88146cf7219d072a7006becdf60.png', 'PACCAR MX 13', '530 cv - 390 kW (1.675 rpm)', '2.500 / 2.600 Nm @1.000 - 1.425 rpm', 'ZF TRAXON Automatizada – Direct Drive 12  a frente + 2 à ré', '23.000 kg', '74.000 kg', '2,80:1 / 3,07:1 / 3,42:1', '{\"entre_eixos\":\"3.200\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel\",\"configuracao\":\"6x4, cavalo mecânico\",\"tipo_carroceria\":\"Cavalo mecânico\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"\",\"carregamento\":\"\",\"mercado\":\"Brasil\"}', 1, '2026-07-21 12:24:39'),
(132, 40, 'LO 916/48 ORE 2', 'lo-916-48-ore-2', 'Chassi 4x2 de piso alto para transporte escolar rural, com carroceria de até 9,2 m.', NULL, 'MB OM 924 LA 4,8 l', '163 cv (120 kW) @ 2.200 rpm', '610 Nm @ 1.200–1.600 rpm', 'Eaton ESBO 6206 manual, 6 marchas', '9.400 kg', '', '4,30:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"Até 9,2 m\",\"entre_eixos\":\"4.800\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2, piso alto escolar\",\"fonte_pagina\":\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/escolar/lo-916\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"Até 45 pessoas, incluindo motorista\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(133, 41, 'OF 1721L/59', 'of-1721l-59', 'Chassi 4x2 de piso alto e suspensão pneumática para uso urbano, fretamento e rodoviário de curta distância.', NULL, 'MB OM 924 LA 4,8 l', '208 cv (153 kW) @ 2.200 rpm', '780 Nm @ 1.200–1.600 rpm', 'MB G 90-6 manual, 6 marchas', '17.000 kg', '', '5,875:1 / 5,222:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"11,3 m ou 12,7 a 13,2 m\",\"entre_eixos\":\"5.950\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2, piso alto\",\"fonte_pagina\":\"https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/of-1721l\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"70 a 80 passageiros\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(134, 42, 'O 500 UA 2938', 'o-500-ua-2938', 'Chassi articulado 6x2 de entrada baixa para operações urbanas de alta capacidade.', 'public/assets/images/modelos/da53c46f248720410aa4099505e8dbc7.png', 'MB OM 460 LA 12,8 l', '381 cv (280 kW) @ 1.600 rpm', '1.900 Nm @ 1.100 rpm', 'ZF EcoLife AP 2020 B, 6 marchas, ou Voith DIWA 6 D884.6', '29.000 kg', '', '7,73:1 / 6,00:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"Até 18,6 m\",\"entre_eixos\":\"\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"6x2 articulado, entrada baixa\",\"fonte_pagina\":\"https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"Até 135 passageiros\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(135, 43, 'O 500 RSDD 2745/30', 'o-500-rsdd-2745-30', 'Chassi rodoviário 8x2 para média e longa distância, com pacote de segurança ativa.', NULL, 'MB OM 460 LA 12,8 l', '449 cv (330 kW) @ 1.600 rpm', '2.200 Nm @ 1.100 rpm', 'ZF TraXon automatizada, 12 marchas', '27.000 kg', '', '2,533:1 / 2,846:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"15,0 m\",\"entre_eixos\":\"3.000\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"8x2 rodoviário\",\"fonte_pagina\":\"https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"Até 68 passageiros\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(136, 44, 'Volvo B420R 6x2', 'volvo-b420r-6x2', 'Chassi rodoviário Volvo B13R 6x2 com suspensão pneumática e freios a disco EBS.', NULL, 'Volvo D13K420 12,8 l', '420 cv (309 kW) @ 1.400–1.800 rpm', '2.100 Nm @ 860–1.400 rpm', 'Volvo I-Shift automatizada', '24.750 / 26.500 kg', '', '2,64:1 / 2,85:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"10,47 a 10,57 m de chassi\",\"entre_eixos\":\"4.000\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"6x2 rodoviário\",\"fonte_pagina\":\"https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(137, 44, 'Volvo B510R 8x2', 'volvo-b510r-8x2', 'Chassi rodoviário Volvo B13R 8x2 para aplicações de alta capacidade.', NULL, 'Volvo D13K500 12,8 l', '500 cv (368 kW) @ 1.530–1.800 rpm', '2.500 Nm @ 980–1.270 rpm', 'Volvo I-Shift automatizada', '29.250 kg', '', '2,64:1 / 2,85:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"10,47 m de chassi\",\"entre_eixos\":\"2.600\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"8x2 rodoviário\",\"fonte_pagina\":\"https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(138, 45, 'Volvo BZR Elétrico 4x2 Piso Médio', 'volvo-bzr-eletrico-4x2-piso-medio', 'Plataforma elétrica 4x2 de piso médio, com uma ou duas máquinas elétricas e baterias modulares.', NULL, 'Volvo EPT402 ou EPT802', '200 kW ou 400 kW (máxima)', '425 Nm ou 850 Nm', 'Volvo automatizada de 2 marchas', '20.800 kg', '', '', '{\"bateria\":\"NCA, 360 a 450 kWh úteis com 4 ou 5 baterias\",\"energia\":\"100% elétrico\",\"mercado\":\"Brasil\",\"emissoes\":\"Zero emissão local\",\"comprimento\":\"9,5 a 13,26 m\",\"entre_eixos\":\"6.000 / 6.300\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2, piso médio\",\"fonte_pagina\":\"https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"Conforme carroceria\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(139, 45, 'Volvo BZR Elétrico 4x2 Entrada Baixa', 'volvo-bzr-eletrico-4x2-entrada-baixa', 'Plataforma elétrica 4x2 de entrada baixa para aplicações urbanas e intermunicipais.', NULL, 'Volvo EPT402 ou EPT802', '200 kW ou 400 kW (máxima)', '425 Nm ou 850 Nm', 'Volvo automatizada de 2 marchas', '21.000 kg', '', '', '{\"bateria\":\"NCA, 360 a 450 kWh úteis com 4 ou 5 baterias\",\"energia\":\"100% elétrico\",\"mercado\":\"Brasil\",\"emissoes\":\"Zero emissão local\",\"comprimento\":\"9,85 a 13,13 m\",\"entre_eixos\":\"4.450 / 7.400\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2, entrada baixa\",\"fonte_pagina\":\"https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"Conforme carroceria\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(140, 46, 'Scania K 370 4x2NB', 'scania-k-370-4x2nb', 'Chassi Scania rodoviário 4x2 com trem de força de 13 litros e caixa automatizada de 12 marchas.', NULL, 'Scania 13 l, 6 cilindros', '370 hp (272 kW) @ 1.800 rpm', '1.900 Nm @ 900–1.340 rpm', 'Scania GRS895R ou GRSO895R automatizada, 12 marchas', '', '', '2,72:1 / 2,92:1 / 3,07:1 / 3,42:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8\",\"comprimento\":\"\",\"entre_eixos\":\"\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2 rodoviário\",\"fonte_pagina\":\"https://www.scania.com/br/pt/home/products/onibus.html\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(141, 46, 'Scania K 500 8x2NB', 'scania-k-500-8x2nb', 'Chassi Scania rodoviário 8x2 com motor de 13 litros, freios a disco e retarder.', NULL, 'Scania 13 l, 6 cilindros', '500 hp (368 kW) @ 1.800 rpm', '2.550 Nm @ 925–1.340 rpm', 'Scania GRSO895R automatizada, 12 marchas', '', '', '2,71:1 / 2,92:1 / 3,08:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8\",\"comprimento\":\"\",\"entre_eixos\":\"\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"8x2 rodoviário\",\"fonte_pagina\":\"https://www.scania.com/br/pt/home/products/onibus.html\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(142, 47, 'IVECO BUS 10-190', 'iveco-bus-10-190', 'Chassi 4x2 para ônibus urbano e fretamento, com duas opções de entre-eixos.', 'public/assets/images/modelos/1d5fe3c179e78dea13200b5a652f3a17.webp', 'FPT NEF 4 ID', '190 cv (138 kW) @ 2.500 rpm', '610 Nm @ 1.350–2.100 rpm', 'Eaton 6206 B manual, 6 marchas', '10.500 kg', '', '4,56:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"\",\"entre_eixos\":\"4.500 / 4.800\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2, motor dianteiro\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(143, 47, 'IVECO BUS 17-280', 'iveco-bus-17-280', 'Chassi 4x2 para ônibus de maior capacidade, com motor FPT NEF 6 Euro VI.', 'public/assets/images/modelos/492951ad437b6a60041fd4b58028a5b8.jpg', 'FPT NEF 6 Euro VI HiSCR', '280 cv (207 kW) @ 2.500 rpm', '950 Nm @ 1.250–1.970 rpm', 'ZF 6S 1010 BO manual, 6 marchas', '16.000 kg', '', '5,57:1 / 5,13:1 / 6,57:1', '{\"bateria\":\"\",\"energia\":\"Diesel\",\"mercado\":\"Brasil\",\"emissoes\":\"Proconve P8 / Euro 6\",\"comprimento\":\"\",\"entre_eixos\":\"5.950\",\"conferido_em\":\"2026-07-25\",\"configuracao\":\"4x2, motor dianteiro\",\"fonte_pagina\":\"https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas\",\"tipo_veiculo\":\"Ônibus\",\"fonte_oficial\":\"https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1\",\"auditoria_status\":\"Conferido em ficha técnica oficial\",\"capacidade_passageiros\":\"\",\"tipo_carroceria\":\"Chassi de ônibus\",\"autonomia\":\"\",\"carregamento\":\"\"}', 1, '2026-07-25 19:26:03'),
(144, 32, 'Scania R 560  6x4 Super', 'scania-r-560-6x4-super', '', 'public/assets/images/modelos/f3614103a86df0d1ae7ac7aebd41a851.png', 'DC13 173', '560 hp @ 1.800 rpm', '2.800 Nm @ 900-1.400 rpm', 'Scania Opticruise G25/G33', '28.100 Kg', '74.000 Kg', '', '{\"entre_eixos\":\"3.550\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel Euro 6\",\"configuracao\":\"6x4\",\"tipo_carroceria\":\"Cavalo mecânico\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"7.110 mm\",\"carregamento\":\"\",\"mercado\":\"Rodoviário\"}', 1, '2026-07-27 13:22:55'),
(145, 21, 'FH 540 6x4T', 'fh-540-6x4t', 'Opções de Relações de redução\r\n2.83:1 - 3.09:1 - 3.40:1 - 3.78:1 - 4.50:1', 'public/assets/images/modelos/1e4f0770aa775debbbc98ccc6542689c.png', 'D13K540', '540 cv - 397 kW  (1460-1800 rpm)', '2600 Nm (1000-1460 rpm)', 'ATO2612 G + ASO-C (Super reduzida) 13 (12 + 1 super-reduzida', '28.500 Kg', '74', '3.40:1 / 3.78:1 / 4.50:1', '{\"entre_eixos\":\"3.000 / 3.200 / 3.600\",\"tipo_veiculo\":\"Caminhão\",\"energia\":\"Diesel Euro 6\",\"configuracao\":\"6x4\",\"tipo_carroceria\":\"Cavalo mecânico\",\"emissoes\":\"Proconve P8 / Euro 6\",\"bateria\":\"\",\"autonomia\":\"\",\"capacidade_passageiros\":\"\",\"comprimento\":\"7.140 mm\",\"carregamento\":\"\",\"mercado\":\"Rodoviário\"}', 1, '2026-07-27 13:35:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo_documentos`
--

CREATE TABLE `modelo_documentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modelo_id` bigint(20) UNSIGNED NOT NULL,
  `tipo` enum('ficha_tecnica','diretriz_implementacao','manual','outro') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ficha_tecnica',
  `titulo` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arquivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_origem` varchar(700) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fonte_pagina` varchar(700) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `modelo_documentos`
--

INSERT INTO `modelo_documentos` (`id`, `modelo_id`, `tipo`, `titulo`, `arquivo`, `url_origem`, `fonte_pagina`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, 1, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-180b0e0c4f1c30e492d67786.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', 'https://www.vwco.com.br/caminhoes/Delivery/Deliveryexpress?id=1&productid=197', 1, '2026-07-16 22:49:03', '2026-07-16 22:49:03'),
(3, 6, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-647ff6523b8c5341c7b7be89.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', 'https://www.vwco.com.br/caminhoes/Delivery/Delivery6.170-euro?id=1&productid=198', 1, '2026-07-16 22:49:10', '2026-07-16 22:49:10'),
(5, 7, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-834125306616c6b47df7d30f.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', 'https://www.vwco.com.br/caminhoes/Delivery/Delivery9.180-euro?id=1&productid=199', 1, '2026-07-16 22:49:11', '2026-07-16 22:49:11'),
(7, 2, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-b9eba0d5a169769c5c3c0330.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', 'https://www.vwco.com.br/caminhoes/Delivery/Delivery11.180-euro?id=1&productid=200', 1, '2026-07-16 22:49:12', '2026-07-16 22:49:12'),
(9, 8, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-d344043a3cc4311b467625bd.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', 'https://www.vwco.com.br/caminhoes/Delivery/Delivery11.1804x4-euro?id=1&productid=201', 1, '2026-07-16 22:49:14', '2026-07-16 22:49:14'),
(11, 9, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-e6a671f9ab76291d7c63f5f1.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', 'https://www.vwco.com.br/caminhoes/Delivery/Delivery14.180-euro?id=1&productid=202', 1, '2026-07-16 22:49:16', '2026-07-16 22:49:16'),
(13, 10, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-b260a9b57c722b8ac19e351b.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', 'https://www.vwco.com.br/caminhoes/e-Delivery/edelivery11?id=27&productid=184', 1, '2026-07-16 22:49:16', '2026-07-16 22:49:16'),
(14, 11, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-d2568296c496d653fb5fe9c0.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', 'https://www.vwco.com.br/caminhoes/e-Delivery/e-Delivery%2014?id=27&productid=185', 1, '2026-07-16 22:49:18', '2026-07-16 22:49:18'),
(15, 12, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-fa8590826d330f1ea80a13dd.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/14.210?id=2&productid=203', 1, '2026-07-16 22:49:19', '2026-07-16 22:49:19'),
(25, 3, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-1f8bafaa56f6c304764ee87f.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/17.210?id=2&productid=204', 1, '2026-07-16 22:50:45', '2026-07-16 22:50:45'),
(26, 13, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-3d0f96bba1ec972ebe31b840.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/18.210?id=2&productid=205', 1, '2026-07-16 22:50:46', '2026-07-16 22:50:46'),
(27, 14, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-09817bc03f22d5ed811017d9.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/18.260?id=2&productid=206', 1, '2026-07-16 22:50:47', '2026-07-16 22:50:47'),
(28, 15, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-68c90ba4367b2f68a791683d.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/18.320?id=2&productid=207', 1, '2026-07-16 22:50:49', '2026-07-16 22:50:49'),
(29, 16, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-b52b9d1bde897ae3a7a2218c.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/26.260?id=2&productid=208', 1, '2026-07-16 22:50:50', '2026-07-16 22:50:50'),
(30, 17, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-82b6bc318326eaf3efc06b28.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/26.320?id=2&productid=209', 1, '2026-07-16 22:50:52', '2026-07-16 22:50:52'),
(31, 18, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-bb3d08cf7052862b5fbf3b2f.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/30.320?id=2&productid=210', 1, '2026-07-16 22:50:53', '2026-07-16 22:50:53'),
(32, 19, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-95a6e0016154ffca1658e752.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/27.260?id=2&productid=211', 1, '2026-07-16 22:50:55', '2026-07-16 22:50:55'),
(33, 20, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-1495e61eebf898f3ea52fab6.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation27.320-euro?id=2&productid=214', 1, '2026-07-16 22:50:58', '2026-07-16 22:53:29'),
(34, 22, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-7a9d69e8c9840bd11b5bd60b.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation32.380-euro?id=2&productid=215', 1, '2026-07-16 22:50:59', '2026-07-16 22:53:29'),
(35, 23, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-1e5cd1c9ece96f751d44bb25.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation33.260?id=2&productid=253', 1, '2026-07-16 22:51:01', '2026-07-16 22:53:30'),
(36, 25, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-a1d1895788dbfff9b4e309b5.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation19.380-euro?id=2&productid=216', 1, '2026-07-16 22:51:03', '2026-07-16 22:51:03'),
(37, 27, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-ef4ec295a3bf55450553e157.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation25.380-euro?id=2&productid=217', 1, '2026-07-16 22:51:04', '2026-07-16 22:51:04'),
(38, 28, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-25795b8d14c9a501fa45700d.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation25.480-euro?id=2&productid=218', 1, '2026-07-16 22:51:06', '2026-07-16 22:51:06'),
(39, 26, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-2b2c4810b3b6e7a5e6683d91.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation20.480?id=2&productid=256', 1, '2026-07-16 22:51:07', '2026-07-16 22:51:07'),
(40, 29, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-403dfe017230167bfde9e146.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', 'https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219', 1, '2026-07-16 22:51:09', '2026-07-16 22:51:09'),
(41, 4, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-427626ddc432c67d13a7c15c.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', 'https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220', 1, '2026-07-16 22:51:10', '2026-07-16 22:51:10'),
(42, 31, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-28b6889e582650bcf902ddf9.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', 'https://www.vwco.com.br/onibus/Urbano/Volksbus9.180?id=5&productid=221', 1, '2026-07-16 22:51:12', '2026-07-16 22:51:12'),
(43, 38, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-28b6889e582650bcf902ddf9.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', 'https://www.vwco.com.br/onibus/Urbano/Volksbus9.180?id=5&productid=221', 1, '2026-07-16 22:51:12', '2026-07-16 22:51:12'),
(44, 32, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-ae74f3926842d527fc6ce87c.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo11.180S?id=5&productid=223', 1, '2026-07-16 22:51:14', '2026-07-16 22:51:14'),
(45, 39, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-ae74f3926842d527fc6ce87c.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo11.180S?id=5&productid=223', 1, '2026-07-16 22:51:14', '2026-07-16 22:51:14'),
(46, 33, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-9dd09a611ef0bc3dd6559df3.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo15.210?id=5&productid=224', 1, '2026-07-16 22:51:15', '2026-07-16 22:51:15'),
(47, 40, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-9dd09a611ef0bc3dd6559df3.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo15.210?id=5&productid=224', 1, '2026-07-16 22:51:15', '2026-07-16 22:51:15'),
(48, 34, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-a67d6fe365ab60f53e9ac377.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo17.230S?id=5&productid=228', 1, '2026-07-16 22:51:17', '2026-07-16 22:51:17'),
(49, 41, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-a67d6fe365ab60f53e9ac377.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo17.230S?id=5&productid=228', 1, '2026-07-16 22:51:17', '2026-07-16 22:51:17'),
(50, 35, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-9e1a97f32f2b3ff253a43887.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', 'https://www.vwco.com.br/onibus/Urbano/novo17.260?id=5&productid=226', 1, '2026-07-16 22:51:18', '2026-07-16 22:51:18'),
(51, 42, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-9e1a97f32f2b3ff253a43887.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', 'https://www.vwco.com.br/onibus/Urbano/novo17.260?id=5&productid=226', 1, '2026-07-16 22:51:18', '2026-07-16 22:51:18'),
(52, 36, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-6f5ea2bcbdffc4cc66c4e5c8.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', 'https://www.vwco.com.br/onibus/Urbano/novo18.320SL?id=5&productid=227', 1, '2026-07-16 22:51:20', '2026-07-16 22:51:20'),
(53, 37, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-e04868caf882a2e95129b8e4.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', 'https://www.vwco.com.br/onibus/Urbano/Novo22.260?id=5&productid=225', 1, '2026-07-16 22:51:22', '2026-07-16 22:51:22'),
(54, 43, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-42c40d7f6a788581911ff58d.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', 'https://www.vwco.com.br/onibus/FretamentoeRodoviario/Novo18.320SH?id=16&productid=222', 1, '2026-07-16 22:51:23', '2026-07-16 22:51:23'),
(55, 47, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-bb07f3652401d94e3b27fee6.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', 'https://www.vwco.com.br/onibus/Escolar/8.180onurea?id=28&productid=235', 1, '2026-07-16 22:51:25', '2026-07-16 22:51:25'),
(56, 44, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-eab3db4336b6164143c4c705.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', 'https://www.vwco.com.br/onibus/Escolar/8.180R?id=28&productid=236', 1, '2026-07-16 22:51:26', '2026-07-16 22:51:26'),
(75, 21, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/vwco-1229026f3aac443995afbbbe.pdf', 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', 'https://www.vwco.com.br/caminhoes/Constellation/Constellation31.320-euro?id=2&productid=212', 1, '2026-07-16 22:53:29', '2026-07-16 22:53:29'),
(77, 49, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 35-180 Hi-Matic', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(78, 50, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 45-180 Hi-Matic', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(79, 51, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 55-180', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(80, 52, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 65-180', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(81, 53, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 9-190', NULL, 'https://new.iveco.com/brasil/Tector/Medios', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(82, 54, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 11-190', NULL, 'https://new.iveco.com/brasil/Tector/Medios', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(83, 55, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 15-210', NULL, 'https://new.iveco.com/brasil/Tector/Medios', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_medio_MY24-v8.pdf?rev=f6846a22333e4af3879b7f7edf9b1794', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(84, 56, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 17-320', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(85, 57, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 17-320T', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(86, 58, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 24-280', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(87, 59, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 24-320', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(88, 60, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 27-320', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(89, 61, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 31-280', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(90, 62, 'ficha_tecnica', 'Especificações técnicas oficiais — Tector 31-320', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-v12.pdf?rev=8fee15f7982a4004aa534cf87d7150ed', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(91, 63, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://new.iveco.com/brasil/S-Way', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(92, 64, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://new.iveco.com/brasil/S-Way', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(93, 65, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/064b9b2d44974d9d4b45bc77a4a04fa9.pdf', 'https://new.iveco.com/brasil/S-Way', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/iveco-sway-modelos.pdf', 1, '2026-07-19 00:03:44', '2026-07-25 23:08:02'),
(94, 66, 'ficha_tecnica', 'Especificações técnicas oficiais — FH 420 6x2T', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(95, 67, 'ficha_tecnica', 'Especificações técnicas oficiais — FH 460 6x2T', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(96, 68, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 1, '2026-07-19 00:03:44', '2026-07-27 13:50:45'),
(97, 69, 'ficha_tecnica', 'Especificações técnicas oficiais — FH 540 6x2T', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(98, 70, 'ficha_tecnica', 'Especificações técnicas oficiais — FM 380 6x2R', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(99, 71, 'ficha_tecnica', 'Especificações técnicas oficiais — FMX 420 6x4R', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(100, 72, 'ficha_tecnica', 'Especificações técnicas oficiais — FMX 460 6x4T', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(101, 73, 'ficha_tecnica', 'Especificações técnicas oficiais — FMX 500 8x4R', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(102, 74, 'ficha_tecnica', 'Especificações técnicas oficiais — FMX 540 6x4T', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(103, 75, 'ficha_tecnica', 'Especificações técnicas oficiais — VM 290 4x2R', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(104, 76, 'ficha_tecnica', 'Especificações técnicas oficiais — VM 360 4x2R', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(105, 77, 'ficha_tecnica', 'Especificações técnicas oficiais — Accelo 917', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(106, 78, 'ficha_tecnica', 'Especificações técnicas oficiais — Accelo 1117', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(107, 79, 'ficha_tecnica', 'Especificações técnicas oficiais — Accelo 1317', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(108, 80, 'ficha_tecnica', 'Especificações técnicas oficiais — Accelo 1417', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(109, 81, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 1719 K 4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(110, 82, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 1726 P 4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(111, 83, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 1733 K 4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(112, 84, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 1933 LS 4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(113, 85, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 2429 P 6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(114, 86, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 2433 P 6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(115, 87, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 2730 P 6x4', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(116, 88, 'ficha_tecnica', 'Especificações técnicas oficiais — Atego 3033 P 8x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(117, 89, 'ficha_tecnica', 'Especificações técnicas oficiais — Axor 2038 S 4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(118, 90, 'ficha_tecnica', 'Especificações técnicas oficiais — Axor 2538 S 6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(119, 91, 'ficha_tecnica', 'Especificações técnicas oficiais — Axor 2545 S 6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(120, 92, 'ficha_tecnica', 'Especificações técnicas oficiais — Actros 2045 S 4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(121, 93, 'ficha_tecnica', 'Especificações técnicas oficiais — Actros 2548 S 6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(122, 94, 'ficha_tecnica', 'Especificações técnicas oficiais — Actros 2553 S 6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(123, 95, 'ficha_tecnica', 'Especificações técnicas oficiais — Actros 2651 S 6x4', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(124, 96, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/fce38b75a7cf7fa703721b658e099710.pdf', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', 1, '2026-07-19 00:03:44', '2026-07-21 12:38:28'),
(125, 97, 'ficha_tecnica', 'Especificações técnicas oficiais — Arocs 3351 K 6x4', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(126, 98, 'ficha_tecnica', 'Especificações técnicas oficiais — Arocs 3353 S 6x4', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(127, 99, 'ficha_tecnica', 'Especificações técnicas oficiais — Arocs 4151 K 6x4', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(128, 100, 'ficha_tecnica', 'Especificações técnicas oficiais — Arocs 5851 K 8x4', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(129, 101, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania R 420 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(130, 102, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania R 460 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(131, 103, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/f1d8d9804cd5f362e26d189196d6cbbe.pdf', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-27 13:18:08'),
(132, 104, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/50883e96f62c7697284a8ff3e65decc3.pdf', 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-21 13:41:45'),
(133, 105, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania S 420 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(134, 106, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania S 460 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(135, 107, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania S 500 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(136, 108, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania S 560 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(137, 109, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-21 11:42:54'),
(138, 110, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania P 460 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(139, 111, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania P 500 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(140, 112, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania G 420 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(141, 113, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania G 460 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(142, 114, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania G 500 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(143, 115, 'ficha_tecnica', 'Especificações técnicas oficiais — Scania G 560 Super', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', 1, '2026-07-19 00:03:44', '2026-07-19 00:03:44'),
(144, 116, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/ff17e3373499a9169aac1471c6633df9.pdf', 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', 'https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH', 1, '2026-07-19 00:04:22', '2026-07-20 11:25:31'),
(145, 117, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/ce3617a08345d50e78a189b99341e15d.pdf', 'https://bydeurope.com/byd-ebus-b12', 'https://bydeurope.com/byd-ebus-b12', 1, '2026-07-19 00:04:22', '2026-07-20 11:34:38'),
(146, 118, 'ficha_tecnica', 'Especificações técnicas oficiais — BYD eBus B13', NULL, 'https://bydeurope.com/pdp-bus-model-13', 'https://bydeurope.com/pdp-bus-model-13', 1, '2026-07-19 00:04:22', '2026-07-19 00:04:22'),
(147, 119, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://www.mercedes-benz-trucks.com.br/onibus/urbano', 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', 1, '2026-07-19 00:04:22', '2026-07-27 14:51:43'),
(148, 120, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 30-160', 'public/assets/documents/modelos/iveco-daily-30-160-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(149, 121, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 35-160', 'public/assets/documents/modelos/iveco-daily-35-160-35-180-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(150, 122, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 35-180 Hi-Matic', 'public/assets/documents/modelos/iveco-daily-35-160-35-180-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(151, 123, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 45-160', 'public/assets/documents/modelos/iveco-daily-45-160-45-180-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(152, 124, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 45-180 Hi-Matic', 'public/assets/documents/modelos/iveco-daily-45-160-45-180-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(153, 125, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 55-180', 'public/assets/documents/modelos/iveco-daily-55-180-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(154, 126, 'ficha_tecnica', 'Especificações técnicas oficiais — Daily 65-180', 'public/assets/documents/modelos/iveco-daily-65-180-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', 'https://www.iveco.com/brasil/Daily/Daily-Cabine-chassi', 1, '2026-07-19 00:04:47', '2026-07-19 00:04:47'),
(159, 64, 'diretriz_implementacao', 'Diretrizes de implementação', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY_480_6X2-20-05-2025.pdf?rev=ed312e835a364237aac32d8610f7ca89', NULL, 1, '2026-07-20 11:03:20', '2026-07-20 11:03:20'),
(167, 116, 'diretriz_implementacao', 'Diretrizes de implementação', NULL, 'https://bydbrasil.com.br/onibus/', NULL, 1, '2026-07-20 11:25:31', '2026-07-20 11:25:31'),
(169, 117, 'diretriz_implementacao', 'Diretrizes de implementação', NULL, 'https://bydeurope.com/pdp-chassis', NULL, 1, '2026-07-20 11:34:38', '2026-07-20 11:34:38'),
(171, 127, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/586d2b674b46f0de10a0384d89f435f5.pdf', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', NULL, 1, '2026-07-21 11:54:15', '2026-07-25 23:08:02'),
(172, 128, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/4cc5d18b2b7f2d51290f68dd3e617c94.pdf', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', NULL, 1, '2026-07-21 11:57:02', '2026-07-25 23:08:02'),
(173, 128, 'diretriz_implementacao', 'Diretrizes de implementação', NULL, 'https://www.dafcaminhoes.com.br/pt-br/linha-daf/daf-cf/linha-daf-cf-trator-rodoviario', NULL, 1, '2026-07-21 11:57:02', '2026-07-21 11:57:02'),
(177, 129, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/1c7c85782d6c4c31e789247b636d4dff.pdf', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', NULL, 1, '2026-07-21 12:12:11', '2026-07-25 23:08:02'),
(178, 130, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/3a28081a885962e5b3df976d844c5703.pdf', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', NULL, 1, '2026-07-21 12:16:32', '2026-07-25 23:08:02'),
(181, 96, 'diretriz_implementacao', 'Diretrizes de implementação', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros/2653-ls-6x4', NULL, 1, '2026-07-21 12:38:28', '2026-07-21 12:38:28'),
(182, 131, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/81a91e0487c159406836a8e71cad2d38.pdf', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', NULL, 1, '2026-07-21 12:39:54', '2026-07-25 23:08:02'),
(184, 24, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/7b72cc722577bd6d644e2491f1c42b2f.pdf', 'https://www.vwco.com.br/onibus', NULL, 1, '2026-07-24 13:36:52', '2026-07-25 23:08:02'),
(185, 132, 'ficha_tecnica', 'Ficha técnica oficial — LO 916/48 ORE 2', 'public/assets/documents/modelos/mercedes-lo-916-ore2-ficha-tecnica.pdf', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/escolar/lo-916', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(186, 133, 'ficha_tecnica', 'Ficha técnica oficial — OF 1721L/59', 'public/assets/documents/modelos/mercedes-of-1721l-59-ficha-tecnica.pdf', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/of-1721l', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(187, 134, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/mercedes-o500-ua-2938-ficha-tecnica.pdf', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', 'https://www.mercedes-benz-trucks.com.br/onibus/urbano/o500ua', 1, '2026-07-25 19:26:03', '2026-07-25 20:19:26'),
(188, 135, 'ficha_tecnica', 'Ficha técnica oficial — O 500 RSDD 2745/30', 'public/assets/documents/modelos/mercedes-o500-rsdd-2745-30-ficha-tecnica.pdf', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', 'https://www.mercedes-benz-trucks.com.br/onibus/rodoviario-fretamento/o-500-rsdd', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(189, 136, 'ficha_tecnica', 'Ficha técnica oficial — Volvo B420R 6x2', 'public/assets/documents/modelos/volvo-b420r-6x2-ficha-tecnica.pdf', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', 'https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(190, 137, 'ficha_tecnica', 'Ficha técnica oficial — Volvo B510R 8x2', 'public/assets/documents/modelos/volvo-b510r-8x2-ficha-tecnica.pdf', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', 'https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(191, 138, 'ficha_tecnica', 'Ficha técnica oficial — Volvo BZR Elétrico 4x2 Piso Médio', 'public/assets/documents/modelos/volvo-bzr-eletrico-4x2-piso-medio-ficha-tecnica.pdf', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', 'https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(192, 139, 'ficha_tecnica', 'Ficha técnica oficial — Volvo BZR Elétrico 4x2 Entrada Baixa', 'public/assets/documents/modelos/volvo-bzr-eletrico-4x2-entrada-baixa-ficha-tecnica.pdf', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', 'https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(193, 140, 'ficha_tecnica', 'Ficha técnica oficial — Scania K 370 4x2NB', 'public/assets/documents/modelos/scania-k370-4x2-ficha-tecnica.pdf', 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', 'https://www.scania.com/br/pt/home/products/onibus.html', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(194, 141, 'ficha_tecnica', 'Ficha técnica oficial — Scania K 500 8x2NB', 'public/assets/documents/modelos/scania-k500-8x2-ficha-tecnica.pdf', 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', 'https://www.scania.com/br/pt/home/products/onibus.html', 1, '2026-07-25 19:26:03', '2026-07-25 19:26:03'),
(195, 142, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/iveco-bus-10-190-17-280-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', 'https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas', 1, '2026-07-25 19:26:03', '2026-07-27 14:45:16'),
(196, 143, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/iveco-bus-10-190-17-280-ficha-tecnica.pdf', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', 'https://www.iveco.com/brasil/Conheca-a-IVECO/Entre-em-contato/Prospecto-Ofertas', 1, '2026-07-25 19:26:03', '2026-07-27 14:48:10'),
(314, 45, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://www.vwco.com.br/onibus', NULL, 1, '2026-07-25 23:08:02', '2026-07-25 23:08:02'),
(315, 46, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://www.vwco.com.br/onibus', NULL, 1, '2026-07-25 23:08:02', '2026-07-25 23:08:02'),
(326, 30, 'ficha_tecnica', 'Ficha técnica completa', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', NULL, 1, '2026-07-25 23:08:02', '2026-07-25 23:08:02'),
(350, 144, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/e21bb1dc811efe89c88eb85d3e27b1f3.pdf', NULL, NULL, 1, '2026-07-27 13:22:55', '2026-07-27 13:22:55'),
(352, 145, 'ficha_tecnica', 'Ficha técnica completa', 'public/assets/documents/modelos/fac7a02371c6d0e161bea6a5544a8688.pdf', NULL, NULL, 1, '2026-07-27 13:35:15', '2026-07-27 13:35:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo_especificacoes_tecnicas`
--

CREATE TABLE `modelo_especificacoes_tecnicas` (
  `modelo_id` bigint(20) UNSIGNED NOT NULL,
  `chave` varchar(80) NOT NULL,
  `rotulo` varchar(120) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `unidade` varchar(30) DEFAULT NULL,
  `fonte_url` varchar(700) DEFAULT NULL,
  `conferido_em` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `modelo_especificacoes_tecnicas`
--

INSERT INTO `modelo_especificacoes_tecnicas` (`modelo_id`, `chave`, `rotulo`, `valor`, `unidade`, `fonte_url`, `conferido_em`) VALUES
(1, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'entre_eixos', 'Entre-eixos', '3.000 / 3.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'motor', 'Motor', 'F1C 3.0l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'pbt', 'PBT', '3.500 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'potencia', 'Potência', '156 cv @ 3.300 rpm', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'relacao_reducao', 'Relação de redução', '4,56:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'torque', 'Torque', '360 Nm @ 1.300 - 2.900 rpm', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(1, 'transmissao', 'Transmissão', 'Eaton / ESO 4106A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9eb595ff-e8cf-4823-b046-8e24258d8492.pdf', '2026-07-25'),
(2, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'entre_eixos', 'Entre-eixos', '3.400 / 4.000 / 4.400 / 4.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'pbt', 'PBT', '10.800 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'pbtc', 'PBTC', '13.200 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(2, 'transmissao', 'Transmissão', 'Manual Eaton ESO 6106 / Automatizada EAO 6106', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/351eccd8-cff2-4923-bef2-c0be04ad0b03.pdf', '2026-07-25'),
(3, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'entre_eixos', 'Entre-eixos', '4.800 / 5.207', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'motor', 'Motor', 'MAN / D0834LF08', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'pbtc', 'PBTC', '27.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'potencia', 'Potência', '205 (150) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'relacao_reducao', 'Relação de redução', '5,29:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'torque', 'Torque', '750 @ 1.200 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(3, 'transmissao', 'Transmissão', 'Manual - Eaton / FS 5406-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/d7697992-bf48-42bc-8d11-2cb747bed1d3.pdf', '2026-07-25'),
(4, 'configuracao', 'Configuração / tração', '6x4', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'emissoes', 'Norma de emissões', 'Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'entre_eixos', 'Entre-eixos', '4.600 / 4.800 / 5.000', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'mercado', 'Mercado / aplicação', 'Rodoviário', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'motor', 'Motor', 'MAN / D2676LFAD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'potencia', 'Potência', '525 (386) @ 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'relacao_reducao', 'Relação de redução', '3,08:1 / 3,36:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-Cabine', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'torque', 'Torque', '2.600 @ 930 - 1.350', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(4, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/5fdf8a7d-ddf0-4552-a0f5-7eb6c439f7a2.pdf', '2026-07-25'),
(6, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'entre_eixos', 'Entre-eixos', '4.000', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'motor', 'Motor', 'F1C 3.0l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'pbt', 'PBT', '5.850 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'pbtc', 'PBTC', '6.900 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'potencia', 'Potência', '156 cv @ 3.300 rpm', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'relacao_reducao', 'Relação de redução', '5,13:1 / 4,78:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'torque', 'Torque', '430 Nm @ 1.400 - 2.700 rpm', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(6, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 4206', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e13dafea-84b3-4484-837d-7fc8a3da1581.pdf', '2026-07-25'),
(7, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'entre_eixos', 'Entre-eixos', '3.400 / 4.000 / 4.400 / 4.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'pbt', 'PBT', '9.200 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'pbtc', 'PBTC', '11.500 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'relacao_reducao', 'Relação de redução', '4,10:1 / 4,30:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(7, 'transmissao', 'Transmissão', 'Manual Eaton ESO 6106 / Automatizada EAO 6106', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/13fcea25-ff1c-4f5e-a6c4-1189a0633f75.pdf', '2026-07-25'),
(8, 'configuracao', 'Configuração / tração', '4x4, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'entre_eixos', 'Entre-eixos', '4.000', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'pbt', 'PBT', '10.800 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'pbtc', 'PBTC', '13.200 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'relacao_reducao', 'Relação de redução', '4,56:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(8, 'transmissao', 'Transmissão', 'Eaton / ESO 6106A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/f3b5eaa6-6fc8-4c27-a376-ea83f80f51b8.pdf', '2026-07-25'),
(9, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'pbt', 'PBT', '14.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(9, 'transmissao', 'Transmissão', 'Eaton / ESO 6206A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/cde0a153-d859-421a-beea-2b2b556728fe.pdf', '2026-07-25'),
(10, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'entre_eixos', 'Entre-eixos', '3.300 / 4.400', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'motor', 'Motor', 'JJE / SD460', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'pbt', 'PBT', '11.400 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'pbtc', 'PBTC', '15.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'potencia', 'Potência', '280 @ 1.200 a 3.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'relacao_reducao', 'Relação de redução', '5,86:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'torque', 'Torque', '2.300 @ 0 a 1.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(10, 'transmissao', 'Transmissão', 'Tração elétrica', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e-Delivery-184-PT.pdf', '2026-07-25'),
(11, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'entre_eixos', 'Entre-eixos', '4.400', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'motor', 'Motor', 'WEG / VW 280', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'pbt', 'PBT', '14.300 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'potencia', 'Potência', '300 @ 1.360 a 3.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'relacao_reducao', 'Relação de redução', '6,14:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'torque', 'Torque', '2.150 @ 0 a 1.360', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(11, 'transmissao', 'Transmissão', 'Tração elétrica', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b2877a3d-53d7-4484-ab2d-116dd91fb72b.pdf', '2026-07-25'),
(12, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'entre_eixos', 'Entre-eixos', '4.800 / 5.207', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'motor', 'Motor', 'MAN / D0834LF08', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'pbt', 'PBT', '14.500 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'pbtc', 'PBTC', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'potencia', 'Potência', '205 (150) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'relacao_reducao', 'Relação de redução', '4,88:1 / 4,10:1 / 5,72:1 / 4,56:1 / 6,36:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'torque', 'Torque', '750 @ 1.200 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(12, 'transmissao', 'Transmissão', 'Manual - Eaton / FS 5406-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/1700b775-9215-4788-9467-e7b2f811c990.pdf', '2026-07-25'),
(13, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'entre_eixos', 'Entre-eixos', '3.560 / 4.800 / 5.207', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'motor', 'Motor', 'MAN / D0834LF08', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'pbtc', 'PBTC', '27.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'potencia', 'Potência', '205 (150) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'relacao_reducao', 'Relação de redução', '5,29:1 / 5,86:1 / 4,56:1 / 6,36:1 / 4,10:1 / 5,72:1 / 6,57:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'torque', 'Torque', '750 @ 1.200 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(13, 'transmissao', 'Transmissão', 'Eaton FS 5406-A / ZF 8AP 900T', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/70ebe2db-8651-4917-a145-45e568eb6d58.pdf', '2026-07-25'),
(14, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'entre_eixos', 'Entre-eixos', '3.560 / 4.340 / 4.800 / 5.207', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'motor', 'Motor', 'MAN / D0836LF18', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'pbtc', 'PBTC', '35.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'potencia', 'Potência', '260 (191) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'relacao_reducao', 'Relação de redução', '4,88:1 / 6,65:1 / 3,73:1 / 3,42:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'torque', 'Torque', '950 @ 1.000 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(14, 'transmissao', 'Transmissão', 'Eaton / FSO 6406 A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/926afab9-85a2-4ac1-90c7-0978cb47a2cd.pdf', '2026-07-25'),
(15, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'entre_eixos', 'Entre-eixos', '4.340 / 4.800 / 5.207', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'motor', 'Motor', 'MAN / D0836LF17', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'pbtc', 'PBTC', '36.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'relacao_reducao', 'Relação de redução', '3,42:1 / 3,73:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(15, 'transmissao', 'Transmissão', 'ZF 9S 1310 TD / ZF 12TX 2420 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ee1a0304-3724-44f6-836b-cc975e62e49f.pdf', '2026-07-25'),
(16, 'configuracao', 'Configuração / tração', '6x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'entre_eixos', 'Entre-eixos', '4.784 / 6.024 / 6.431', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'motor', 'Motor', 'MAN / D0836LF18', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'pbtc', 'PBTC', '35.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'potencia', 'Potência', '260 (191) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'relacao_reducao', 'Relação de redução', '4,88:1 / 6,65:1 / 3,73:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'torque', 'Torque', '950 @ 1.000 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(16, 'transmissao', 'Transmissão', 'Manual - Eaton / FS 6406-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/9dddb6d6-025b-4e8b-8179-d658fbc6257a.pdf', '2026-07-25'),
(17, 'configuracao', 'Configuração / tração', '6x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'entre_eixos', 'Entre-eixos', '6.024 / 6.431', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'motor', 'Motor', 'MAN / D0836LF17', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'pbtc', 'PBTC', '36.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'relacao_reducao', 'Relação de redução', '3,42:1 / 3,73:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(17, 'transmissao', 'Transmissão', 'ZF 9S 1310 TD / ZF 12TX 2420 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a2911c47-5632-4703-b158-e5d1f461c175.pdf', '2026-07-25'),
(18, 'configuracao', 'Configuração / tração', '8x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'entre_eixos', 'Entre-eixos', '7.324 / 7.724', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'motor', 'Motor', 'MAN / D0836LF17', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'pbt', 'PBT', '29.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'pbtc', 'PBTC', '36.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'relacao_reducao', 'Relação de redução', '3,42:1 / 3,73:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(18, 'transmissao', 'Transmissão', 'ZF 9S 1310 TD / ZF 12TX 2420 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/695d59d2-fb48-473b-8e6b-e2b490db5df8.pdf', '2026-07-25'),
(19, 'configuracao', 'Configuração / tração', '6x4, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'entre_eixos', 'Entre-eixos', '4.800 / 5.940', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'motor', 'Motor', 'MAN / D0836LF18', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'pbtc', 'PBTC', '36.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'potencia', 'Potência', '260 (191) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'relacao_reducao', 'Relação de redução', '5,29:1 / 4,88:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'torque', 'Torque', '950 @ 1.000 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(19, 'transmissao', 'Transmissão', 'ZF / 9S 1310 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e892c996-1f7b-406b-b32c-ff426ae02b96.pdf', '2026-07-25'),
(20, 'configuracao', 'Configuração / tração', '6x4, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'entre_eixos', 'Entre-eixos', '4.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'motor', 'Motor', 'MAN / D0836LF17', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'pbtc', 'PBTC', '74.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'relacao_reducao', 'Relação de redução', '5,41:1 / 4,55:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(20, 'transmissao', 'Transmissão', 'ZF / 9S 1310 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/390e78a1-f473-40b0-bc6c-5becf8944808.pdf', '2026-07-25'),
(21, 'configuracao', 'Configuração / tração', '6x4, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'entre_eixos', 'Entre-eixos', '4.800 / 5.940', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'motor', 'Motor', 'MAN / D0836LF17', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'pbtc', 'PBTC', '42.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'relacao_reducao', 'Relação de redução', '4,89:1 / 4,56:1 / 5,38:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(21, 'transmissao', 'Transmissão', 'Automatizada - ZF / 12TX 2424 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ae56cbe5-00c6-4619-87e1-dd0b5da85d15.pdf', '2026-07-25'),
(22, 'configuracao', 'Configuração / tração', '6x4, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'entre_eixos', 'Entre-eixos', '4.800 / 5.940', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'motor', 'Motor', 'Cummins / ISL', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'pbtc', 'PBTC', '63.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'potencia', 'Potência', '375 (276) @ 1.900', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'relacao_reducao', 'Relação de redução', '4,55:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'torque', 'Torque', '1.700 @ 1.100 - 1.400', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(22, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/923b8c54-dd59-4b44-85c2-4df1d3ced2ed.pdf', '2026-07-25'),
(23, 'configuracao', 'Configuração / tração', '8x4, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'entre_eixos', 'Entre-eixos', '5.750', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'motor', 'Motor', 'MAN / D0836LF18', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'pbt', 'PBT', '29.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'pbtc', 'PBTC', '36.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'potencia', 'Potência', '260 (191) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'relacao_reducao', 'Relação de redução', '5,29:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'torque', 'Torque', '950 @ 1.000 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(23, 'transmissao', 'Transmissão', 'ZF / 9S 1310 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/8586bca2-1adb-4d63-8aba-112150ecc264.pdf', '2026-07-25'),
(24, 'configuracao', 'Configuração / tração', '6x4', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'emissoes', 'Norma de emissões', 'PROCONVE P-8', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'energia', 'Energia / propulsão', 'Diesel Euro 6', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'entre_eixos', 'Entre-eixos', '3.200', 'mm', 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'mercado', 'Mercado / aplicação', 'Off-Road', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'motor', 'Motor', 'MAN / D2676LFAG 13L', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'pbtc', 'PBTC', '74.000 kg', 'kg', 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'potencia', 'Potência', '475 (350) @ 1.800', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'relacao_reducao', 'Relação de redução', '4,55:1', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-Cabine', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'torque', 'Torque', '2.400 @ 930 - 1.350', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(24, 'transmissao', 'Transmissão', 'ZF / 12TX 2824 TO', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(25, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'entre_eixos', 'Entre-eixos', '3.560', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'motor', 'Motor', 'Cummins / ISL', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'potencia', 'Potência', '375 (276) @ 1.900', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'relacao_reducao', 'Relação de redução', '3,21:1 / 3,42:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'torque', 'Torque', '1.700 @ 1.100 - 1.400', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(25, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a680066e-3a64-4d5d-aa44-db68aedf3141.pdf', '2026-07-25'),
(26, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25');
INSERT INTO `modelo_especificacoes_tecnicas` (`modelo_id`, `chave`, `rotulo`, `valor`, `unidade`, `fonte_url`, `conferido_em`) VALUES
(26, 'entre_eixos', 'Entre-eixos', '3.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'motor', 'Motor', 'MAN / D2676LFAG', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'pbtc', 'PBTC', '56.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'potencia', 'Potência', '475 (350) @ 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'relacao_reducao', 'Relação de redução', '3,08:1 / 2,85:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'torque', 'Torque', '2.400 @ 930 - 1.350', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(26, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/fbd27233-365a-4fdb-a29e-97bff75c8881.pdf', '2026-07-25'),
(27, 'configuracao', 'Configuração / tração', '6x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'entre_eixos', 'Entre-eixos', '3.300', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'motor', 'Motor', 'Cummins / ISL', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'potencia', 'Potência', '375 (276) @ 1.900', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'relacao_reducao', 'Relação de redução', '3,25:1 / 3,40:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'torque', 'Torque', '1.700 @ 1.100 - 1.400', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(27, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/ad306316-6daf-4278-b836-2e6325840e3e.pdf', '2026-07-25'),
(28, 'configuracao', 'Configuração / tração', '6x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'entre_eixos', 'Entre-eixos', '3.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'motor', 'Motor', 'MAN / D2676LFAG', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'potencia', 'Potência', '475 (350) @ 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'relacao_reducao', 'Relação de redução', '3,08:1 / 2,85:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'torque', 'Torque', '2.400 @ 930 - 1.350', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(28, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/c2f95c97-4850-40fa-a256-662f652cd613.pdf', '2026-07-25'),
(29, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'entre_eixos', 'Entre-eixos', '4.600', 'mm', 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'motor', 'Motor', 'MAN / D2676LFAG', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'pbtc', 'PBTC', '58.500 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'potencia', 'Potência', '475 (350) @ 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'relacao_reducao', 'Relação de redução', '2,85:1 / 3,08:1 / 3,40:1', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'torque', 'Torque', '2.400 @ 930 - 1.350', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(29, 'transmissao', 'Transmissão', 'ZF / 12TX 2624 TD', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/26fceca3-7c1d-4553-b0a9-72430bea120a.pdf', '2026-07-25'),
(30, 'autonomia', 'Autonomia', 'Até 250 km', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'bateria', 'Bateria', '12 packs LFP, 385 kWh', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 82 passageiros', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'carregamento', 'Carregamento', 'Até 160 kW; cerca de 3 horas', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'comprimento', 'Comprimento', 'Até 13,2 m', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'entre_eixos', 'Entre-eixos', '6.000', 'mm', 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'motor', 'Motor', 'VW / SD 460', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'potencia', 'Potência', '280 kW (380 cv)', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'torque', 'Torque', '2.450 Nm', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(30, 'transmissao', 'Transmissão', 'Tração elétrica — Zero Emission', NULL, 'https://www.vwco.com.br/onibus/Urbano?id=5', '2026-07-25'),
(31, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'pbt', 'PBT', '9.600 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(31, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(32, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'pbt', 'PBT', '10.700 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(32, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(33, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'motor', 'Motor', 'MAN / D0834LF08', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'pbt', 'PBT', '15.500 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'potencia', 'Potência', '205 (150) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'torque', 'Torque', '750 @ 1.200 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(33, 'transmissao', 'Transmissão', 'ZF 8AP900B / ZF 6S1010BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(34, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'motor', 'Motor', 'MAN / D0834', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'potencia', 'Potência', '225 (166) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'torque', 'Torque', '850 @ 1.300 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(34, 'transmissao', 'Transmissão', 'ZF 8AP900B / ZF 6S1010BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(35, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'motor', 'Motor', 'MAN / D0836LF18', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'potencia', 'Potência', '260 (191) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'torque', 'Torque', '950 @ 1.000 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(35, 'transmissao', 'Transmissão', 'ZF 8AP900B / ZF 6S1010BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(36, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'motor', 'Motor', 'MAN / D0836LOH12', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(36, 'transmissao', 'Transmissão', 'ZF / 6AP 1220 B', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/eefd05e7-0b1f-48a6-a415-4ec46c2554d1.pdf', '2026-07-25'),
(37, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'motor', 'Motor', 'MAN / D0836LF17', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'pbt', 'PBT', '21.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(37, 'transmissao', 'Transmissão', 'ZF / 6S 1010 BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/b18ea707-192a-477e-bcb4-2fe811383de2.pdf', '2026-07-25'),
(38, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'pbt', 'PBT', '9.600 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(38, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/6d600998-477a-4a97-a837-afbe14810ed1.pdf', '2026-07-25'),
(39, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'pbt', 'PBT', '10.700 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(39, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/59fb5b2b-70f7-4b9b-9dc2-6cb3bf267480.pdf', '2026-07-25'),
(40, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'motor', 'Motor', 'MAN / D0834LF08', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'pbt', 'PBT', '15.500 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'potencia', 'Potência', '205 (150) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'torque', 'Torque', '750 @ 1.200 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(40, 'transmissao', 'Transmissão', 'ZF 8AP900B / ZF 6S1010BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/840a368f-3a27-439d-b4ff-ce8b2da7055c.pdf', '2026-07-25'),
(41, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'motor', 'Motor', 'MAN / D0834', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'pbt', 'PBT', '17.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'potencia', 'Potência', '225 (166) @ 2.300', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'torque', 'Torque', '850 @ 1.300 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(41, 'transmissao', 'Transmissão', 'ZF 8AP900B / ZF 6S1010BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/e9241fef-257f-4ce2-881a-c24a5b936bda.pdf', '2026-07-25'),
(42, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'motor', 'Motor', 'MAN / D0836LF18', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'pbt', 'PBT', '17.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'potencia', 'Potência', '260 (191) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'torque', 'Torque', '950 @ 1.000 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(42, 'transmissao', 'Transmissão', 'ZF 8AP900B / ZF 6S1010BO', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/4ef24b5f-058d-4a8c-acbe-a9fb10d6f694.pdf', '2026-07-25'),
(43, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'motor', 'Motor', 'MAN / D0836LOH12', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'pbt', 'PBT', '18.000 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'potencia', 'Potência', '315 (231) @ 2.200', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'torque', 'Torque', '1.200 @ 1.200 - 1.700', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(43, 'transmissao', 'Transmissão', 'ZF / 8AP 1200 B', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/382313c9-fcc1-44e0-80aa-876590c88a26.pdf', '2026-07-25'),
(44, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'pbt', 'PBT', '8.700 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(44, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/2081fd26-e918-429a-a9a3-7a459d430e2e.pdf', '2026-07-25'),
(45, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'pbt', 'PBT', '10.800 kg', 'kg', 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(45, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'motor', 'Motor', 'MAN / D0834LF08', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'pbt', 'PBT', '15.000 kg', 'kg', 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'potencia', 'Potência', '205 (150) @ 2.300', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'torque', 'Torque', '750 @ 1.200 - 1.800', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(46, 'transmissao', 'Transmissão', 'Eaton / FSB 5406-A', NULL, 'https://www.vwco.com.br/onibus', '2026-07-25'),
(47, 'configuracao', 'Configuração / tração', '4x2, chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'motor', 'Motor', 'Cummins / ISF 3.8l', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'pbt', 'PBT', '8.700 kg', 'kg', 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'potencia', 'Potência', '175 (129) @ 2.500', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'torque', 'Torque', '600 @ 1.100 - 1.800', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(47, 'transmissao', 'Transmissão', 'Manual - Eaton / ESO 6206-A', NULL, 'https://d1qeqf1yyyqyq8.cloudfront.net/a43ea184-2757-4c96-b067-9a6b4be284c8.pdf', '2026-07-25'),
(49, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'pbt', 'PBT', '3.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(49, 'transmissao', 'Transmissão', 'ZF 8HP Hi-Matic automática, 8 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'pbt', 'PBT', '4.400 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(50, 'transmissao', 'Transmissão', 'ZF 8HP Hi-Matic automática, 8 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'pbt', 'PBT', '5.300 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'relacao_reducao', 'Relação de redução', '4,10:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(51, 'transmissao', 'Transmissão', 'ZF 6S480 VO manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'entre_eixos', 'Entre-eixos', '4.350', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'pbt', 'PBT', '6.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(52, 'transmissao', 'Transmissão', 'ZF 6S480 VO manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(53, 'configuracao', 'Configuração / tração', '4x2', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'entre_eixos', 'Entre-eixos', '3.906 / 4.460', 'mm', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'motor', 'Motor', 'FPT NEF4 4,5 l', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'pbt', 'PBT', '8.600 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'pbtc', 'PBTC', '11.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'potencia', 'Potência', '190 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'relacao_reducao', 'Relação de redução', '4,30:1', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'torque', 'Torque', '610 Nm @ 1.200–2.100 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(53, 'transmissao', 'Transmissão', 'Eaton ESO6106B manual, 6 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25');
INSERT INTO `modelo_especificacoes_tecnicas` (`modelo_id`, `chave`, `rotulo`, `valor`, `unidade`, `fonte_url`, `conferido_em`) VALUES
(54, 'configuracao', 'Configuração / tração', '4x2', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'entre_eixos', 'Entre-eixos', '3.886 / 4.441', 'mm', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'motor', 'Motor', 'FPT NEF4 4,5 l', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'pbt', 'PBT', '10.600 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'pbtc', 'PBTC', '13.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'potencia', 'Potência', '190 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'relacao_reducao', 'Relação de redução', '4,56:1', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'torque', 'Torque', '610 Nm @ 1.200–2.100 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(54, 'transmissao', 'Transmissão', 'Eaton ESO6106B manual, 6 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'configuracao', 'Configuração / tração', '4x2', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'entre_eixos', 'Entre-eixos', '4.104 / 4.735', 'mm', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'motor', 'Motor', 'FPT NEF4 4,5 l', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'pbt', 'PBT', '15.400 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'pbtc', 'PBTC', '27.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'potencia', 'Potência', '207 cv @ 2.100–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'relacao_reducao', 'Relação de redução', '4,10:1 / 5,72:1', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'torque', 'Torque', '720 Nm @ 1.300–1.900 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(55, 'transmissao', 'Transmissão', 'Eaton FS 5406A manual, 6 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Medios', '2026-07-25'),
(56, 'configuracao', 'Configuração / tração', '4x2', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'entre_eixos', 'Entre-eixos', '4.188 / 4.818', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'pbtc', 'PBTC', '33.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'potencia', 'Potência', '320 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'torque', 'Torque', '1.100 Nm @ 1.300–1.900 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(56, 'transmissao', 'Transmissão', 'Eaton MHD EVO AutoShift, 10 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'configuracao', 'Configuração / tração', '4x2, cavalo mecânico', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'entre_eixos', 'Entre-eixos', '3.693', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'pbtc', 'PBTC', '35.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'potencia', 'Potência', '320 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'relacao_reducao', 'Relação de redução', '4,56:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'torque', 'Torque', '1.100 Nm @ 1.300–1.900 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(57, 'transmissao', 'Transmissão', 'Eaton MHD EVO AutoShift, 10 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'configuracao', 'Configuração / tração', '6x2', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'entre_eixos', 'Entre-eixos', '4.189 / 4.819 / 5.668', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'pbtc', 'PBTC', '36.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'potencia', 'Potência', '280 cv @ 2.100–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'torque', 'Torque', '950 Nm @ 1.250–1.950 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(58, 'transmissao', 'Transmissão', 'Eaton 6406B manual, 6 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'configuracao', 'Configuração / tração', '6x2', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'entre_eixos', 'Entre-eixos', '4.189 / 4.819 / 5.668', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'pbtc', 'PBTC', '44.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'potencia', 'Potência', '320 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'torque', 'Torque', '1.100 Nm @ 1.300–1.900 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(59, 'transmissao', 'Transmissão', 'Eaton MHD EVO AutoShift, 10 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'configuracao', 'Configuração / tração', '6x4', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'entre_eixos', 'Entre-eixos', '3.690 / 4.185 / 4.815', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'pbtc', 'PBTC', '44.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'potencia', 'Potência', '320 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'relacao_reducao', 'Relação de redução', '4,88:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'torque', 'Torque', '1.100 Nm @ 1.300–1.900 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(60, 'transmissao', 'Transmissão', 'Eaton MHD EVO AutoShift, 10 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'configuracao', 'Configuração / tração', '8x2', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'entre_eixos', 'Entre-eixos', '5.175 / 5.950', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'pbt', 'PBT', '29.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'pbtc', 'PBTC', '35.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'potencia', 'Potência', '280 cv @ 2.100–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'torque', 'Torque', '950 Nm @ 1.250–1.950 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(61, 'transmissao', 'Transmissão', 'Eaton 6406B manual, 6 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'configuracao', 'Configuração / tração', '8x2', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'entre_eixos', 'Entre-eixos', '5.175 / 5.950', 'mm', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'motor', 'Motor', 'FPT NEF6 6,7 l', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'pbt', 'PBT', '29.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'pbtc', 'PBTC', '35.000 kg', 'kg', 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'potencia', 'Potência', '320 cv @ 2.200–2.500 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'torque', 'Torque', '1.100 Nm @ 1.300–1.900 rpm', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(62, 'transmissao', 'Transmissão', 'Eaton MHD EVO AutoShift, 10 marchas', NULL, 'https://new.iveco.com/brasil/Tector/Semipesados', '2026-07-25'),
(63, 'configuracao', 'Configuração / tração', '4x2, cavalo mecânico', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'entre_eixos', 'Entre-eixos', '3.498', 'mm', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'motor', 'Motor', 'FPT Cursor 13 12,9 l', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'pbtc', 'PBTC', '46.000 kg', 'kg', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'potencia', 'Potência', '480 cv @ 1.400–1.900 rpm', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'relacao_reducao', 'Relação de redução', '2,85:1', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'torque', 'Torque', '2.450 Nm @ 1.000–1.400 rpm', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(63, 'transmissao', 'Transmissão', 'ZF TraXon 12TX2620TD automatizada, 12 marchas', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'configuracao', 'Configuração / tração', '6x2, cavalo mecânico', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'entre_eixos', 'Entre-eixos', '3.173 / 3.451 / 3.489', 'mm', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'motor', 'Motor', 'FPT Cursor 13 12,9 l', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'pbtc', 'PBTC', '58.500 kg', 'kg', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'potencia', 'Potência', '480 cv @ 1.400–1.900 rpm', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'relacao_reducao', 'Relação de redução', '3,08:1 / 2,85:1', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'torque', 'Torque', '2.450 Nm @ 1.000–1.400 rpm', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(64, 'transmissao', 'Transmissão', 'ZF TraXon 12TX2624TD automatizada, 12 marchas', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'entre_eixos', 'Entre-eixos', '3.540', 'mm', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'motor', 'Motor', 'FPT Cursor 13 12,9 l', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'pbtc', 'PBTC', '74.000 kg', 'kg', 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'potencia', 'Potência', '540 cv @ 1.500–1.900 rpm', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'relacao_reducao', 'Relação de redução', '3,07:1', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'torque', 'Torque', '2.550 Nm @ 1.000–1.500 rpm', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(65, 'transmissao', 'Transmissão', 'ZF TraXon 12TX2624TD automatizada, 12 marchas', NULL, 'https://new.iveco.com/brasil/S-Way', '2026-07-25'),
(66, 'configuracao', 'Configuração / tração', '6x2T, suspensão pneumática', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'entre_eixos', 'Entre-eixos', '3.000 / 3.200 / 3.500 / 3.700', 'mm', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'pbt', 'PBT', '28.000 kg', 'kg', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'potencia', 'Potência', '420 cv @ 1.400–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'torque', 'Torque', '2.100 Nm @ 905–1.400 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(66, 'transmissao', 'Transmissão', 'I-Shift AT2612 G automatizada, 12 marchas', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'configuracao', 'Configuração / tração', '6x2T, suspensão pneumática', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'entre_eixos', 'Entre-eixos', '3.000 / 3.200 / 3.500 / 3.700', 'mm', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'pbt', 'PBT', '28.000 kg', 'kg', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'potencia', 'Potência', '460 cv @ 1.400–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'torque', 'Torque', '2.300 Nm @ 945–1.400 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(67, 'transmissao', 'Transmissão', 'I-Shift AT2612 G automatizada, 12 marchas', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'configuracao', 'Configuração / tração', '6x2T, suspensão pneumática', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'entre_eixos', 'Entre-eixos', '3.000 / 3.200 / 3.500 / 3.700', 'mm', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'pbt', 'PBT', '28.000 kg', 'kg', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'potencia', 'Potência', '500 cv @ 1.400–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'torque', 'Torque', '2.500 Nm @ 980–1.400 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(68, 'transmissao', 'Transmissão', 'I-Shift AT2612 G automatizada, 12 marchas', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'configuracao', 'Configuração / tração', '6x2T, suspensão pneumática', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'entre_eixos', 'Entre-eixos', '3.000 / 3.200 / 3.500 / 3.700', 'mm', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'pbt', 'PBT', '28.000 kg', 'kg', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'potencia', 'Potência', '540 cv @ 1.460–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'torque', 'Torque', '2.600 Nm @ 1.000–1.460 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(69, 'transmissao', 'Transmissão', 'I-Shift AT2612 G automatizada, 12 marchas', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/euro-6-fh-2022/FH-6x2T-RADT-G3.pdf', '2026-07-25'),
(70, 'configuracao', 'Configuração / tração', '6x2 rígido', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'potencia', 'Potência', '380 cv', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(70, 'transmissao', 'Transmissão', 'I-Shift de 7ª geração', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html', '2026-07-25'),
(71, 'configuracao', 'Configuração / tração', '6x4 rígido', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'potencia', 'Potência', '420 cv @ 1.400–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'torque', 'Torque', '2.100 Nm @ 905–1.400 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(71, 'transmissao', 'Transmissão', 'I-Shift automatizada', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'potencia', 'Potência', '460 cv @ 1.400–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'torque', 'Torque', '2.300 Nm @ 945–1.400 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(72, 'transmissao', 'Transmissão', 'I-Shift automatizada', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'configuracao', 'Configuração / tração', '8x4 rígido', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'potencia', 'Potência', '500 cv @ 1.400–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'torque', 'Torque', '2.500 Nm @ 980–1.400 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(73, 'transmissao', 'Transmissão', 'I-Shift automatizada', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'motor', 'Motor', 'Volvo D13K 12,8 l', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'potencia', 'Potência', '540 cv @ 1.460–1.800 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'torque', 'Torque', '2.600 Nm @ 1.000–1.460 rpm', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(74, 'transmissao', 'Transmissão', 'I-Shift automatizada', NULL, 'https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fmx/data-sheets.html', '2026-07-25'),
(75, 'configuracao', 'Configuração / tração', '4x2 rígido', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'motor', 'Motor', 'Volvo D8K 7,7 l', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'pbt', 'PBT', '17.500 kg', 'kg', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'potencia', 'Potência', '290 cv @ 1.900 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'torque', 'Torque', '1.050 Nm @ 1.000–1.700 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(75, 'transmissao', 'Transmissão', 'ZT1309 manual ou I-Shift AT2612 G', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'configuracao', 'Configuração / tração', '4x2 rígido', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'motor', 'Motor', 'Volvo D8K 7,7 l', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'pbt', 'PBT', '17.500 kg', 'kg', 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'potencia', 'Potência', '360 cv @ 2.200 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'torque', 'Torque', '1.400 Nm @ 1.100–1.600 rpm', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(76, 'transmissao', 'Transmissão', 'I-Shift AT2612 G automatizada, 12 marchas', NULL, 'https://www.volvotrucks.com.br/content/dam/volvo-trucks/markets/brazil/truck/fichas-t%C3%A9cnicas-2022-euro6/1-9-2-2025-vm/ficha-tecnica-vm-4x2R.pdf', '2026-07-25'),
(77, 'configuracao', 'Configuração / tração', '4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'motor', 'Motor', 'Mercedes-Benz OM 924 4,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'pbt', 'PBT', '9.600 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'potencia', 'Potência', '163 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(77, 'torque', 'Torque', '610 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'configuracao', 'Configuração / tração', '4x2', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'motor', 'Motor', 'Mercedes-Benz OM 924 4,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'pbt', 'PBT', '10.700 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'potencia', 'Potência', '163 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(78, 'torque', 'Torque', '610 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'configuracao', 'Configuração / tração', '6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'motor', 'Motor', 'Mercedes-Benz OM 924 4,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'pbt', 'PBT', '13.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'potencia', 'Potência', '163 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(79, 'torque', 'Torque', '610 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'configuracao', 'Configuração / tração', '6x2', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'motor', 'Motor', 'Mercedes-Benz OM 924 4,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'pbt', 'PBT', '14.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'potencia', 'Potência', '163 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(80, 'torque', 'Torque', '610 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/caminhoes/novo-accelo', '2026-07-25'),
(81, 'configuracao', 'Configuração / tração', '4x2 basculante', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'motor', 'Motor', 'Mercedes-Benz OM 924', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'pbt', 'PBT', '17.100 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'potencia', 'Potência', '185 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25');
INSERT INTO `modelo_especificacoes_tecnicas` (`modelo_id`, `chave`, `rotulo`, `valor`, `unidade`, `fonte_url`, `conferido_em`) VALUES
(81, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(81, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'configuracao', 'Configuração / tração', '4x2 plataforma', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'pbt', 'PBT', '17.100 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'potencia', 'Potência', '260 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'torque', 'Torque', '900 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(82, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'configuracao', 'Configuração / tração', '4x2 basculante', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'pbt', 'PBT', '17.100 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'potencia', 'Potência', '321 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'torque', 'Torque', '1.250 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(83, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'configuracao', 'Configuração / tração', '4x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'pbt', 'PBT', '19.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'potencia', 'Potência', '321 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'torque', 'Torque', '1.250 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(84, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'configuracao', 'Configuração / tração', '6x2 plataforma', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'pbt', 'PBT', '24.100 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'potencia', 'Potência', '286 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'torque', 'Torque', '1.100 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(85, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'configuracao', 'Configuração / tração', '6x2 plataforma', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'pbt', 'PBT', '24.100 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'potencia', 'Potência', '321 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'torque', 'Torque', '1.250 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(86, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'configuracao', 'Configuração / tração', '6x4 plataforma', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'pbt', 'PBT', '26.600 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'potencia', 'Potência', '286 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'torque', 'Torque', '1.100 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(87, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'configuracao', 'Configuração / tração', '8x2 plataforma', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'motor', 'Motor', 'Mercedes-Benz OM 926', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'pbt', 'PBT', '30.200 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'potencia', 'Potência', '321 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'torque', 'Torque', '1.250 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(88, 'transmissao', 'Transmissão', 'PowerShift 3 automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/atego', '2026-07-25'),
(89, 'configuracao', 'Configuração / tração', '4x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'motor', 'Motor', 'Mercedes-Benz OM 460 LA 12,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'pbt', 'PBT', '20.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'potencia', 'Potência', '380 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'torque', 'Torque', '1.900 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(89, 'transmissao', 'Transmissão', 'Automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'configuracao', 'Configuração / tração', '6x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'motor', 'Motor', 'Mercedes-Benz OM 460 LA 12,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'pbt', 'PBT', '25.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'potencia', 'Potência', '380 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'torque', 'Torque', '1.900 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(90, 'transmissao', 'Transmissão', 'Automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'configuracao', 'Configuração / tração', '6x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'motor', 'Motor', 'Mercedes-Benz OM 460 LA 12,8 l', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'pbt', 'PBT', '25.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'potencia', 'Potência', '449 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'torque', 'Torque', '2.200 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(91, 'transmissao', 'Transmissão', 'Automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/axor', '2026-07-25'),
(92, 'configuracao', 'Configuração / tração', '4x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'motor', 'Motor', 'Mercedes-Benz OM 460 / OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'pbt', 'PBT', '20.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'potencia', 'Potência', '449 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'torque', 'Torque', '2.200 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(92, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'configuracao', 'Configuração / tração', '6x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'motor', 'Motor', 'Mercedes-Benz OM 460 / OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'pbt', 'PBT', '25.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'potencia', 'Potência', '476 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'torque', 'Torque', '2.300 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(93, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'configuracao', 'Configuração / tração', '6x2, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'motor', 'Motor', 'Mercedes-Benz OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'pbt', 'PBT', '25.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'potencia', 'Potência', '530 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'torque', 'Torque', '2.600 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(94, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'motor', 'Motor', 'Mercedes-Benz OM 460 / OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'pbt', 'PBT', '26.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'potencia', 'Potência', '495 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'torque', 'Torque', '2.400 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(95, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'entre_eixos', 'Entre-eixos', '3.250', 'mm', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'motor', 'Motor', 'MB OM 471 LA • 12,8 L • 6 cil. - PROCONVE P-8', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'pbt', 'PBT', '26.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'potencia', 'Potência', '530 cv (390 kW) @ 1600 rpm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'torque', 'Torque', '2600 Nm (265,1 mkgf) @ 1100 rpm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(96, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/actros', '2026-07-25'),
(97, 'configuracao', 'Configuração / tração', '6x4 basculante', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'motor', 'Motor', 'Mercedes-Benz OM 460 / OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'pbt', 'PBT', '33.500 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'potencia', 'Potência', '495 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'torque', 'Torque', '2.400 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(97, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'motor', 'Motor', 'Mercedes-Benz OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'pbt', 'PBT', '33.500 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'potencia', 'Potência', '530 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'torque', 'Torque', '2.600 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(98, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'configuracao', 'Configuração / tração', '6x4 basculante', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'motor', 'Motor', 'Mercedes-Benz OM 460 / OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'pbt', 'PBT', '41.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'potencia', 'Potência', '495 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'torque', 'Torque', '2.400 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(99, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'configuracao', 'Configuração / tração', '8x4 basculante', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'motor', 'Motor', 'Mercedes-Benz OM 460 / OM 471', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'pbt', 'PBT', '58.000 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'potencia', 'Potência', '495 cv', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'torque', 'Torque', '2.400 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(100, 'transmissao', 'Transmissão', 'PowerShift automatizada', NULL, 'https://www.mercedes-benz-trucks.com.br/caminhoes/arocs', '2026-07-25'),
(101, 'configuracao', 'Configuração / tração', 'Cabine R; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'potencia', 'Potência', '420 hp (309 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'torque', 'Torque', '2.300 Nm @ 900–1.280 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(101, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'configuracao', 'Configuração / tração', 'Cabine R; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'potencia', 'Potência', '460 hp (338 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'torque', 'Torque', '2.500 Nm @ 900–1.290 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(102, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'configuracao', 'Configuração / tração', 'Cabine R; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'potencia', 'Potência', '500 hp (368 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'torque', 'Torque', '2.650 Nm @ 900–1.320 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(103, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(104, 'configuracao', 'Configuração / tração', 'Cabine R; configuração conforme aplicação', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'entre_eixos', 'Entre-eixos', '3.550', 'mm', 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'motor', 'Motor', 'DC13 166', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'potencia', 'Potência', '540 hp @ 1.800 rpm', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'torque', 'Torque', '2.700 Nm @ 1.000 -1.300 rpm', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(104, 'transmissao', 'Transmissão', 'GRS905R', NULL, 'https://solucoesscania.com.br/wp-content/uploads/2024/10/Plus-R540-6x4-1.pdf', '2026-07-25'),
(105, 'configuracao', 'Configuração / tração', 'Cabine S de piso plano', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'potencia', 'Potência', '420 hp (309 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'torque', 'Torque', '2.300 Nm @ 900–1.280 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(105, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'configuracao', 'Configuração / tração', 'Cabine S de piso plano', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'potencia', 'Potência', '460 hp (338 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'torque', 'Torque', '2.500 Nm @ 900–1.290 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(106, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'configuracao', 'Configuração / tração', 'Cabine S de piso plano', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'potencia', 'Potência', '500 hp (368 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'torque', 'Torque', '2.650 Nm @ 900–1.320 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(107, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'configuracao', 'Configuração / tração', 'Cabine S de piso plano', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'potencia', 'Potência', '560 hp (412 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'torque', 'Torque', '2.800 Nm @ 900–1.400 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(108, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'configuracao', 'Configuração / tração', 'Cabine P; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'potencia', 'Potência', '420 hp (309 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'torque', 'Torque', '2.300 Nm @ 900–1.280 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(109, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'configuracao', 'Configuração / tração', 'Cabine P; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'potencia', 'Potência', '460 hp (338 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'torque', 'Torque', '2.500 Nm @ 900–1.290 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(110, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'configuracao', 'Configuração / tração', 'Cabine P; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'potencia', 'Potência', '500 hp (368 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'torque', 'Torque', '2.650 Nm @ 900–1.320 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(111, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'configuracao', 'Configuração / tração', 'Cabine G; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'potencia', 'Potência', '420 hp (309 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'torque', 'Torque', '2.300 Nm @ 900–1.280 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(112, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'configuracao', 'Configuração / tração', 'Cabine G; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'potencia', 'Potência', '460 hp (338 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'torque', 'Torque', '2.500 Nm @ 900–1.290 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(113, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'configuracao', 'Configuração / tração', 'Cabine G; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'potencia', 'Potência', '500 hp (368 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'torque', 'Torque', '2.650 Nm @ 900–1.320 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(114, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'configuracao', 'Configuração / tração', 'Cabine G; configuração conforme aplicação', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'motor', 'Motor', 'Scania Super 13 l', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'potencia', 'Potência', '560 hp (412 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25');
INSERT INTO `modelo_especificacoes_tecnicas` (`modelo_id`, `chave`, `rotulo`, `valor`, `unidade`, `fonte_url`, `conferido_em`) VALUES
(115, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'torque', 'Torque', '2.800 Nm @ 900–1.400 rpm', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(115, 'transmissao', 'Transmissão', 'Scania Opticruise G25/G33', NULL, 'https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html', '2026-07-25'),
(116, 'autonomia', 'Autonomia', 'Até 250 km', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 78 passageiros', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'configuracao', 'Configuração / tração', 'Padron urbano', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'entre_eixos', 'Entre-eixos', '5.420', 'mm', 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'motor', 'Motor', 'Motor síncrono de ímãs permanentes - BYD - TZ290XSE', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'pbt', 'PBT', '19.500 kg', 'kg', 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'potencia', 'Potência', '2× 150 kW', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'torque', 'Torque', '2× 600 Nm', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(116, 'transmissao', 'Transmissão', 'Tração elétrica direta com frenagem regenerativa', NULL, 'https://bydbrasil.com.br/wp-content/uploads/2026/07/Datasheet_BC10LE_byd_2026_v2.pdf', '2026-07-25'),
(117, 'autonomia', 'Autonomia', 'Até 600 km', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'bateria', 'Bateria', 'Blade Battery LFP, até 500 kWh', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 105 passageiros', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'carregamento', 'Carregamento', 'CCS; pantógrafo opcional, até 500 kW', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'comprimento', 'Comprimento', '12.130 mm', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'configuracao', 'Configuração / tração', 'Piso baixo, entre-eixos de 5.950 mm', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'entre_eixos', 'Entre-eixos', '5.950', 'mm', 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'mercado', 'Mercado / aplicação', 'Catálogo internacional', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'motor', 'Motor', 'Dois motores elétricos Hairpin', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'pbt', 'PBT', '20.000 kg', 'kg', 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'potencia', 'Potência', '2 × 150 kW (máxima)', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(117, 'transmissao', 'Transmissão', 'Tração elétrica direta', NULL, 'https://bydeurope.com/byd-ebus-b12', '2026-07-25'),
(118, 'autonomia', 'Autonomia', 'Até 400 km', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'bateria', 'Bateria', 'Bateria LFP, até 422 kWh', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 59 passageiros', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'carregamento', 'Carregamento', 'CCS ou pantógrafo', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'comprimento', 'Comprimento', '13.275 mm', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'configuracao', 'Configuração / tração', 'Entrada baixa, entre-eixos de 7.100 mm', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'mercado', 'Mercado / aplicação', 'Catálogo internacional', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'motor', 'Motor', 'Dois motores elétricos integrados às rodas', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'pbt', 'PBT', '19.100 kg', 'kg', 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'potencia', 'Potência', '2 × 150 kW (máxima)', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(118, 'transmissao', 'Transmissão', 'Tração elétrica direta', NULL, 'https://bydeurope.com/pdp-bus-model-13', '2026-07-25'),
(119, 'autonomia', 'Autonomia', 'Até 270 km', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'bateria', 'Bateria', '3 a 6 pacotes NMC de 98 kWh; até 588 kWh', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'capacidade_passageiros', 'Capacidade de passageiros', 'Mais de 80 passageiros nas configurações de 3 a 5 baterias', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'carregamento', 'Carregamento', 'CCS2, até 150 kW; recarga completa em até 3 horas', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'comprimento', 'Comprimento', 'Carroceria de até 13,2 m', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'configuracao', 'Configuração / tração', '4x2, piso baixo', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'motor', 'Motor', 'Dois motores assíncronos integrados ao eixo traseiro', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'pbt', 'PBT', '21.200 kg', 'kg', 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'potencia', 'Potência', '250 kW / 340 cv (total)', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'torque', 'Torque', '2 × 485 Nm', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(119, 'transmissao', 'Transmissão', 'Tração elétrica direta', NULL, 'https://www.mercedes-benz-trucks.com.br/showroom/onibus/urbano/eo500u', '2026-07-25'),
(120, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'entre_eixos', 'Entre-eixos', '3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'pbt', 'PBT', '3.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'potencia', 'Potência', '160 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'torque', 'Torque', '380 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(120, 'transmissao', 'Transmissão', 'ZF 6S 480 VO manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'pbt', 'PBT', '3.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'potencia', 'Potência', '160 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'torque', 'Torque', '380 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(121, 'transmissao', 'Transmissão', 'ZF 6S 480 VO manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'pbt', 'PBT', '3.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(122, 'transmissao', 'Transmissão', 'ZF 8HP Hi-Matic automática, 8 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'pbt', 'PBT', '4.400 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'potencia', 'Potência', '160 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'torque', 'Torque', '380 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(123, 'transmissao', 'Transmissão', 'ZF 6S 480 VO manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'pbt', 'PBT', '4.400 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'relacao_reducao', 'Relação de redução', '3,73:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(124, 'transmissao', 'Transmissão', 'ZF 8HP Hi-Matic automática, 8 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'entre_eixos', 'Entre-eixos', '3.520 / 3.750', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'pbt', 'PBT', '5.300 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'relacao_reducao', 'Relação de redução', '4,10:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(125, 'transmissao', 'Transmissão', 'ZF 6S 480 VO manual ou ZF 8HP Hi-Matic automática', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'configuracao', 'Configuração / tração', '4x2, chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'entre_eixos', 'Entre-eixos', '4.350', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'motor', 'Motor', 'FPT F1C Max 3,0 l', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'pbt', 'PBT', '6.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'potencia', 'Potência', '180 cv @ 3.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'torque', 'Torque', '430 Nm @ 1.600–2.900 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(126, 'transmissao', 'Transmissão', 'ZF 6S 480 VO manual ou ZF 8HP Hi-Matic automática', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_daily-chassi.pdf?rev=3dc7ab3602464fc189782e8c3c7af55f', '2026-07-25'),
(127, 'configuracao', 'Configuração / tração', '4x2, cavalo mecânico', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'entre_eixos', 'Entre-eixos', '3.600', 'mm', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'motor', 'Motor', 'MOTOR PACCAR PX-9', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'pbtc', 'PBTC', '53.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'potencia', 'Potência', '380 cv - 275kW (1.900 rpm)', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'relacao_reducao', 'Relação de redução', '3,08:1 / 3,40:1', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'torque', 'Torque', '1.700 Nm @1.100 - 1.400 rpm', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(127, 'transmissao', 'Transmissão', 'ZF TRAXON Automatizada – Direct Drive 12 a frente + 2 à ré', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/cf/cf_ft_4x2_px-9.pdf?h=400&hash=F98E233CDE2765DE8117FA10AB1CA6EF&rev=ebe2ac4d5f484a8eb21a3ac4d42a8cc8&w=1600', '2026-07-25'),
(128, 'configuracao', 'Configuração / tração', '6x2, cavalo mecânico', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'entre_eixos', 'Entre-eixos', '3.100', 'mm', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'motor', 'Motor', 'PACCAR PX-9', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'pbtc', 'PBTC', '56.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'potencia', 'Potência', '380 cv - 275kW (1.900 rpm)', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'relacao_reducao', 'Relação de redução', '3,08:1 / 3,40:1', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'torque', 'Torque', '1.700 Nm @1.100 - 1.400 rpm', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(128, 'transmissao', 'Transmissão', 'ZF TRAXON Automatizada – Direct Drive 12 a frente + 2 à ré', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fts-6x2-px-9.pdf?h=4233&hash=7650BA6D123C64C9223681DB9739701E&rev=57baa8bd563d4756a18c24c8ebd2c5bf&w=3065', '2026-07-25'),
(129, 'configuracao', 'Configuração / tração', '6x2, chassi-cabine', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'entre_eixos', 'Entre-eixos', '4.900 / 5.300', 'mm', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'motor', 'Motor', 'PACCAR PX-9', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'potencia', 'Potência', '340 cv - 249 kW (1.900 rpm)', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'relacao_reducao', 'Relação de redução', '3,08:1 / 3,40:1', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'torque', 'Torque', '1.500 Nm @1.000 - 1.500 rpm', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(129, 'transmissao', 'Transmissão', 'ZF Automatizada – Direct Drive 12 a frente + 2 à ré', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/fev-2026-fichas-tecnicas/cf/cf-fas-6x2-px-9.pdf?h=3486&hash=DEA3B14111C32E32C291E8B9085AB27C&rev=6d74ef74088f4b169bfde7354a6cbeb5&w=2610', '2026-07-25'),
(130, 'configuracao', 'Configuração / tração', '6x2, chassi-cabine', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'entre_eixos', 'Entre-eixos', '4.900 / 5.300', 'mm', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'motor', 'Motor', 'PACCAR PX-7', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'potencia', 'Potência', '290 cv - 213 kW (2.300 rpm)', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'relacao_reducao', 'Relação de redução', '3,73:1 / 4,10:1', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi-cabine', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'torque', 'Torque', '1.100 Nm @1.100 - 1.600 rpm', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(130, 'transmissao', 'Transmissão', 'ZF Automatizada OU manual – Direct Drive 9 a frente + 1 à ré', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/november-2022/daf-cf-fas-6x2-px-7-euro-6.pdf?h=793&hash=4E3E6159349AACE44F4D79FA9C7482CE&rev=14cef35b8025494fb58c2e1474807672&w=600', '2026-07-25'),
(131, 'configuracao', 'Configuração / tração', '6x4, cavalo mecânico', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'entre_eixos', 'Entre-eixos', '3.200', 'mm', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'motor', 'Motor', 'PACCAR MX 13', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'pbt', 'PBT', '23.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'pbtc', 'PBTC', '74.000 kg', 'kg', 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'potencia', 'Potência', '530 cv - 390 kW (1.675 rpm)', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'relacao_reducao', 'Relação de redução', '2,80:1 / 3,07:1 / 3,42:1', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'tipo_carroceria', 'Tipo de carroceria', 'Cavalo mecânico', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'tipo_veiculo', 'Tipo de veículo', 'Caminhão', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'torque', 'Torque', '2.500 / 2.600 Nm @1.000 - 1.425 rpm', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(131, 'transmissao', 'Transmissão', 'ZF TRAXON Automatizada – Direct Drive 12  a frente + 2 à ré', NULL, 'https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/outubro-2024-folhetos-tecnicos/xf/xf_ftt_6x4.pdf?h=3416&hash=B54A4E71117213A4535C34F3E6D9CF96&rev=9b99b993752244c28bd3562ae3b4a69b&w=2539', '2026-07-25'),
(132, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 45 pessoas, incluindo motorista', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'comprimento', 'Comprimento', 'Até 9,2 m', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'configuracao', 'Configuração / tração', '4x2, piso alto escolar', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'entre_eixos', 'Entre-eixos', '4.800', 'mm', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'motor', 'Motor', 'MB OM 924 LA 4,8 l', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'pbt', 'PBT', '9.400 kg', 'kg', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'potencia', 'Potência', '163 cv (120 kW) @ 2.200 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'relacao_reducao', 'Relação de redução', '4,30:1', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25');
INSERT INTO `modelo_especificacoes_tecnicas` (`modelo_id`, `chave`, `rotulo`, `valor`, `unidade`, `fonte_url`, `conferido_em`) VALUES
(132, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'torque', 'Torque', '610 Nm @ 1.200–1.600 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(132, 'transmissao', 'Transmissão', 'Eaton ESBO 6206 manual, 6 marchas', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/lo-91648-ore2.pdf', '2026-07-25'),
(133, 'capacidade_passageiros', 'Capacidade de passageiros', '70 a 80 passageiros', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'comprimento', 'Comprimento', '11,3 m ou 12,7 a 13,2 m', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'configuracao', 'Configuração / tração', '4x2, piso alto', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'entre_eixos', 'Entre-eixos', '5.950', 'mm', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'motor', 'Motor', 'MB OM 924 LA 4,8 l', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'pbt', 'PBT', '17.000 kg', 'kg', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'potencia', 'Potência', '208 cv (153 kW) @ 2.200 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'relacao_reducao', 'Relação de redução', '5,875:1 / 5,222:1', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'torque', 'Torque', '780 Nm @ 1.200–1.600 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(133, 'transmissao', 'Transmissão', 'MB G 90-6 manual, 6 marchas', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/of-1721l-59.pdf', '2026-07-25'),
(134, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 135 passageiros', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'comprimento', 'Comprimento', 'Até 18,6 m', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'configuracao', 'Configuração / tração', '6x2 articulado, entrada baixa', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'motor', 'Motor', 'MB OM 460 LA 12,8 l', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'pbt', 'PBT', '29.000 kg', 'kg', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'potencia', 'Potência', '381 cv (280 kW) @ 1.600 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'relacao_reducao', 'Relação de redução', '7,73:1 / 6,00:1', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'torque', 'Torque', '1.900 Nm @ 1.100 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(134, 'transmissao', 'Transmissão', 'ZF EcoLife AP 2020 B, 6 marchas, ou Voith DIWA 6 D884.6', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-ua-2938-a.pdf', '2026-07-25'),
(135, 'capacidade_passageiros', 'Capacidade de passageiros', 'Até 68 passageiros', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'comprimento', 'Comprimento', '15,0 m', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'configuracao', 'Configuração / tração', '8x2 rodoviário', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'entre_eixos', 'Entre-eixos', '3.000', 'mm', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'motor', 'Motor', 'MB OM 460 LA 12,8 l', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'pbt', 'PBT', '27.000 kg', 'kg', 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'potencia', 'Potência', '449 cv (330 kW) @ 1.600 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'relacao_reducao', 'Relação de redução', '2,533:1 / 2,846:1', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'torque', 'Torque', '2.200 Nm @ 1.100 rpm', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(135, 'transmissao', 'Transmissão', 'ZF TraXon automatizada, 12 marchas', NULL, 'https://salandingpagespaasprod.blob.core.windows.net/institutional-public/storage/assets/gallery/docs/o500-rsdd-2745-30-a.pdf', '2026-07-25'),
(136, 'comprimento', 'Comprimento', '10,47 a 10,57 m de chassi', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'configuracao', 'Configuração / tração', '6x2 rodoviário', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'entre_eixos', 'Entre-eixos', '4.000', 'mm', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'motor', 'Motor', 'Volvo D13K420 12,8 l', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'pbt', 'PBT', '24.750 / 26.500 kg', 'kg', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'potencia', 'Potência', '420 cv (309 kW) @ 1.400–1.800 rpm', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'relacao_reducao', 'Relação de redução', '2,64:1 / 2,85:1', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'torque', 'Torque', '2.100 Nm @ 860–1.400 rpm', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(136, 'transmissao', 'Transmissão', 'Volvo I-Shift automatizada', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B420R-6x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'comprimento', 'Comprimento', '10,47 m de chassi', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'configuracao', 'Configuração / tração', '8x2 rodoviário', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'entre_eixos', 'Entre-eixos', '2.600', 'mm', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'motor', 'Motor', 'Volvo D13K500 12,8 l', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'pbt', 'PBT', '29.250 kg', 'kg', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'potencia', 'Potência', '500 cv (368 kW) @ 1.530–1.800 rpm', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'relacao_reducao', 'Relação de redução', '2,64:1 / 2,85:1', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'torque', 'Torque', '2.500 Nm @ 980–1.270 rpm', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(137, 'transmissao', 'Transmissão', 'Volvo I-Shift automatizada', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/brazil/specification/Data-sheet-B510R-8x2-Euro-6-PT-BR-2022.pdf', '2026-07-25'),
(138, 'bateria', 'Bateria', 'NCA, 360 a 450 kWh úteis com 4 ou 5 baterias', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'capacidade_passageiros', 'Capacidade de passageiros', 'Conforme carroceria', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'comprimento', 'Comprimento', '9,5 a 13,26 m', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'configuracao', 'Configuração / tração', '4x2, piso médio', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'entre_eixos', 'Entre-eixos', '6.000 / 6.300', 'mm', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'motor', 'Motor', 'Volvo EPT402 ou EPT802', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'pbt', 'PBT', '20.800 kg', 'kg', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'potencia', 'Potência', '200 kW ou 400 kW (máxima)', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'torque', 'Torque', '425 Nm ou 850 Nm', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(138, 'transmissao', 'Transmissão', 'Volvo automatizada de 2 marchas', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/city-and-intercity/chassis/volvo-bzr-electric/specifications/volvo-bzr-electric-4x2-medium-floor-data-sheet.pdf', '2026-07-25'),
(139, 'bateria', 'Bateria', 'NCA, 360 a 450 kWh úteis com 4 ou 5 baterias', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'capacidade_passageiros', 'Capacidade de passageiros', 'Conforme carroceria', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'comprimento', 'Comprimento', '9,85 a 13,13 m', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'configuracao', 'Configuração / tração', '4x2, entrada baixa', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'emissoes', 'Norma de emissões', 'Zero emissão local', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'energia', 'Energia / propulsão', '100% elétrico', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'entre_eixos', 'Entre-eixos', '4.450 / 7.400', 'mm', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'motor', 'Motor', 'Volvo EPT402 ou EPT802', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'pbt', 'PBT', '21.000 kg', 'kg', 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'potencia', 'Potência', '200 kW ou 400 kW (máxima)', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'torque', 'Torque', '425 Nm ou 850 Nm', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(139, 'transmissao', 'Transmissão', 'Volvo automatizada de 2 marchas', NULL, 'https://www.volvobuses.com/content/dam/volvo-buses/markets/master/home/city-and-intercity/chassis/volvo-bzr-electric-le/specifications/data-sheet-volvo-bzr-low-entry-electric-4x2-pt-volvobuses-2025.pdf', '2026-07-25'),
(140, 'configuracao', 'Configuração / tração', '4x2 rodoviário', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'emissoes', 'Norma de emissões', 'Proconve P8', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'motor', 'Motor', 'Scania 13 l, 6 cilindros', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'potencia', 'Potência', '370 hp (272 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'relacao_reducao', 'Relação de redução', '2,72:1 / 2,92:1 / 3,07:1 / 3,42:1', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'torque', 'Torque', '1.900 Nm @ 900–1.340 rpm', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(140, 'transmissao', 'Transmissão', 'Scania GRS895R ou GRSO895R automatizada, 12 marchas', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K3704x2NB.pdf', '2026-07-25'),
(141, 'configuracao', 'Configuração / tração', '8x2 rodoviário', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'emissoes', 'Norma de emissões', 'Proconve P8', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'motor', 'Motor', 'Scania 13 l, 6 cilindros', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'potencia', 'Potência', '500 hp (368 kW) @ 1.800 rpm', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'relacao_reducao', 'Relação de redução', '2,71:1 / 2,92:1 / 3,08:1', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'torque', 'Torque', '2.550 Nm @ 925–1.340 rpm', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(141, 'transmissao', 'Transmissão', 'Scania GRSO895R automatizada, 12 marchas', NULL, 'https://www.scania.com/content/dam/www/market/br/pdfs1/especificacoes/onibus/2023/K5008x2NB.pdf', '2026-07-25'),
(142, 'configuracao', 'Configuração / tração', '4x2, motor dianteiro', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'entre_eixos', 'Entre-eixos', '4.500 / 4.800', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'motor', 'Motor', 'FPT NEF 4 ID', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'pbt', 'PBT', '10.500 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'potencia', 'Potência', '190 cv (138 kW) @ 2.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'relacao_reducao', 'Relação de redução', '4,56:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'torque', 'Torque', '610 Nm @ 1.350–2.100 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(142, 'transmissao', 'Transmissão', 'Eaton 6206 B manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'configuracao', 'Configuração / tração', '4x2, motor dianteiro', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'emissoes', 'Norma de emissões', 'Proconve P8 / Euro 6', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'energia', 'Energia / propulsão', 'Diesel', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'entre_eixos', 'Entre-eixos', '5.950', 'mm', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'mercado', 'Mercado / aplicação', 'Brasil', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'motor', 'Motor', 'FPT NEF 6 Euro VI HiSCR', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'pbt', 'PBT', '16.000 kg', 'kg', 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'potencia', 'Potência', '280 cv (207 kW) @ 2.500 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'relacao_reducao', 'Relação de redução', '5,57:1 / 5,13:1 / 6,57:1', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'tipo_carroceria', 'Tipo de carroceria', 'Chassi de ônibus', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'tipo_veiculo', 'Tipo de veículo', 'Ônibus', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'torque', 'Torque', '950 Nm @ 1.250–1.970 rpm', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25'),
(143, 'transmissao', 'Transmissão', 'ZF 6S 1010 BO manual, 6 marchas', NULL, 'https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_Bus.pdf?rev=4a486a07dc6b4fec8f9feb9c19ba74b1', '2026-07-25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `normas_emissoes`
--

CREATE TABLE `normas_emissoes` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `codigo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordem` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `normas_emissoes`
--

INSERT INTO `normas_emissoes` (`id`, `codigo`, `nome`, `descricao`, `ordem`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, 'EURO-3', 'Euro 3', 'Norma de emissões utilizada em veículos de gerações anteriores.', 30, 1, '2026-07-16 18:01:50', '2026-07-16 18:01:50'),
(2, 'EURO-5', 'Euro 5', 'Norma de emissões com controle eletrônico e pós-tratamento mais avançado.', 50, 1, '2026-07-16 18:01:50', '2026-07-16 18:01:50'),
(3, 'EURO-6', 'Euro 6', 'Norma atual com limites mais rigorosos de emissões.', 60, 1, '2026-07-16 18:01:50', '2026-07-16 18:01:50'),
(4, 'ELETRICO', 'Elétrico / zero emissão local', 'Veículo com propulsão elétrica e sem emissão local de escapamento.', 100, 1, '2026-07-16 18:01:50', '2026-07-16 18:01:50');

-- --------------------------------------------------------

--
-- Estrutura para tabela `notificacoes_lidas`
--

CREATE TABLE `notificacoes_lidas` (
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `notification_key` varchar(190) NOT NULL,
  `lida_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `notificacoes_lidas`
--

INSERT INTO `notificacoes_lidas` (`usuario_id`, `notification_key`, `lida_em`) VALUES
(1, 'models_without_sheet_4', '2026-07-20 11:53:02'),
(1, 'recent_feedbacks_3', '2026-07-21 13:58:56'),
(5, 'models_without_sheet_4', '2026-07-21 16:48:03'),
(5, 'recent_feedbacks_3', '2026-07-21 16:48:03'),
(1, 'recent_feedbacks_2', '2026-07-24 13:38:46'),
(1, 'models_without_image_11', '2026-07-25 21:55:02'),
(5, 'models_without_image_9', '2026-07-30 15:52:12'),
(1, 'recent_feedbacks_1', '2026-07-30 22:55:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfil_permissoes`
--

CREATE TABLE `perfil_permissoes` (
  `perfil_id` bigint(20) UNSIGNED NOT NULL,
  `permissao_id` bigint(20) UNSIGNED NOT NULL,
  `permitido` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `perfil_permissoes`
--

INSERT INTO `perfil_permissoes` (`perfil_id`, `permissao_id`, `permitido`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(1, 8, 1),
(1, 9, 1),
(1, 10, 1),
(1, 11, 1),
(1, 12, 1),
(1, 13, 1),
(1, 14, 1),
(1, 15, 1),
(1, 16, 1),
(1, 17, 1),
(1, 18, 1),
(1, 19, 1),
(1, 20, 1),
(1, 21, 1),
(1, 22, 1),
(1, 23, 1),
(1, 24, 1),
(1, 25, 1),
(1, 26, 1),
(1, 27, 1),
(1, 28, 1),
(1, 29, 1),
(1, 30, 1),
(1, 31, 1),
(1, 32, 1),
(1, 33, 1),
(1, 34, 1),
(1, 35, 1),
(1, 36, 1),
(1, 37, 1),
(1, 38, 1),
(1, 39, 1),
(1, 40, 1),
(1, 41, 1),
(1, 42, 1),
(1, 43, 1),
(1, 44, 1),
(1, 45, 1),
(1, 46, 1),
(1, 47, 1),
(1, 48, 1),
(1, 64, 1),
(1, 65, 1),
(1, 66, 1),
(1, 67, 1),
(1, 108, 1),
(1, 109, 1),
(1, 110, 1),
(1, 111, 1),
(1, 116, 1),
(1, 117, 1),
(1, 118, 1),
(1, 119, 1),
(1, 136, 1),
(1, 137, 1),
(1, 138, 1),
(1, 139, 1),
(1, 332, 1),
(1, 333, 1),
(1, 334, 1),
(1, 335, 1),
(1, 336, 1),
(1, 337, 1),
(1, 338, 1),
(1, 339, 1),
(1, 340, 1),
(1, 341, 1),
(1, 342, 1),
(1, 343, 1),
(1, 344, 1),
(1, 345, 1),
(1, 346, 1),
(1, 347, 1),
(1, 348, 1),
(1, 349, 1),
(1, 350, 1),
(1, 351, 1),
(1, 352, 1),
(1, 357, 1),
(1, 358, 1),
(1, 359, 1),
(1, 360, 1),
(1, 361, 1),
(1, 362, 1),
(1, 363, 1),
(1, 364, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 7, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(2, 25, 1),
(2, 29, 1),
(2, 30, 1),
(2, 31, 1),
(2, 33, 1),
(2, 34, 1),
(2, 35, 1),
(2, 41, 1),
(2, 42, 1),
(2, 43, 1),
(2, 45, 1),
(2, 46, 1),
(2, 47, 1),
(2, 116, 1),
(2, 117, 1),
(2, 118, 1),
(2, 340, 1),
(2, 341, 1),
(2, 342, 1),
(2, 343, 1),
(2, 345, 1),
(2, 346, 1),
(2, 347, 1),
(2, 349, 1),
(2, 350, 1),
(2, 351, 1),
(3, 1, 1),
(3, 5, 1),
(3, 9, 1),
(3, 10, 1),
(3, 11, 1),
(3, 12, 1),
(3, 33, 1),
(3, 34, 1),
(3, 35, 1),
(3, 41, 1),
(3, 46, 1),
(3, 47, 1),
(3, 341, 1),
(3, 342, 1),
(5, 1, 1),
(5, 5, 1),
(5, 9, 1),
(5, 13, 1),
(5, 17, 1),
(5, 21, 1),
(5, 29, 1),
(5, 30, 1),
(5, 31, 1),
(5, 33, 1),
(5, 34, 1),
(5, 35, 1),
(5, 41, 1),
(5, 42, 1),
(5, 43, 1),
(5, 45, 1),
(5, 46, 1),
(5, 64, 1),
(5, 108, 1),
(5, 109, 1),
(5, 110, 1),
(5, 116, 1),
(5, 117, 1),
(5, 118, 1),
(5, 136, 1),
(5, 332, 1),
(5, 336, 1),
(5, 337, 1),
(5, 338, 1),
(5, 340, 1),
(5, 341, 1),
(5, 342, 1),
(5, 343, 1),
(5, 345, 1),
(5, 346, 1),
(5, 347, 1),
(5, 348, 1),
(5, 349, 1),
(5, 350, 1),
(5, 351, 1),
(5, 352, 1),
(5, 357, 1),
(5, 358, 1),
(5, 359, 1),
(5, 360, 1),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 5, 1),
(7, 6, 1),
(7, 7, 1),
(7, 9, 1),
(7, 10, 1),
(7, 11, 1),
(7, 29, 1),
(7, 30, 1),
(7, 31, 1),
(7, 33, 1),
(7, 34, 1),
(7, 35, 1),
(7, 41, 1),
(7, 42, 1),
(7, 43, 1),
(7, 45, 1),
(7, 46, 1),
(7, 47, 1),
(7, 116, 1),
(7, 117, 1),
(7, 118, 1),
(7, 340, 1),
(7, 341, 1),
(7, 342, 1),
(7, 343, 1),
(9, 1, 1),
(9, 5, 1),
(9, 9, 1),
(9, 46, 1),
(9, 341, 1),
(9, 342, 1),
(10, 1, 1),
(10, 5, 1),
(10, 9, 1),
(10, 29, 1),
(10, 41, 1),
(10, 340, 1),
(10, 341, 1),
(10, 342, 1),
(11, 1, 1),
(11, 5, 1),
(11, 33, 1),
(11, 35, 1),
(11, 41, 1),
(11, 340, 1),
(11, 341, 1),
(11, 342, 1),
(12, 341, 1),
(12, 342, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfis`
--

CREATE TABLE `perfis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `escopo` enum('global','unidade','cliente','empresa') NOT NULL DEFAULT 'empresa',
  `nivel` tinyint(3) UNSIGNED NOT NULL DEFAULT '50',
  `sistema` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_empresa` enum('qualquer','vwco','concessionaria','cliente') NOT NULL DEFAULT 'qualquer',
  `pode_gerenciar_usuarios` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `perfis`
--

INSERT INTO `perfis` (`id`, `empresa_id`, `nome`, `slug`, `escopo`, `nivel`, `sistema`, `tipo_empresa`, `pode_gerenciar_usuarios`, `ativo`) VALUES
(1, NULL, 'Administrador Master', 'administrador', 'global', 100, 1, 'qualquer', 1, 1),
(2, NULL, 'Assistência Técnica', 'assistencia', 'empresa', 65, 1, 'concessionaria', 0, 1),
(3, NULL, 'Gestor do Cliente', 'cliente', 'cliente', 60, 1, 'cliente', 1, 1),
(5, NULL, 'Administrador da Empresa', 'admin-empresa', 'empresa', 80, 1, 'qualquer', 1, 1),
(7, NULL, 'Comercial VWCO', 'comercial-vwco', 'empresa', 60, 1, 'qualquer', 0, 1),
(9, NULL, 'Colaborador do Cliente', 'colaborador-cliente', 'cliente', 30, 1, 'cliente', 0, 1),
(10, 1, 'Coordenação', 'empresa-1-coordenacao', 'empresa', 80, 0, 'vwco', 1, 1),
(11, NULL, 'Colaborador VWCO', 'colaborador-vwco', 'empresa', 30, 1, 'vwco', 0, 1),
(12, NULL, 'Coordenação', 'coordenacao', 'global', 70, 1, 'qualquer', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissoes`
--

CREATE TABLE `permissoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recurso` varchar(80) NOT NULL,
  `acao` enum('view','create','update','delete') NOT NULL,
  `descricao` varchar(180) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `permissoes`
--

INSERT INTO `permissoes` (`id`, `recurso`, `acao`, `descricao`) VALUES
(1, 'dashboard', 'view', 'Visualizar: Visão geral'),
(2, 'dashboard', 'create', 'Cadastrar: Visão geral'),
(3, 'dashboard', 'update', 'Editar: Visão geral'),
(4, 'dashboard', 'delete', 'Excluir: Visão geral'),
(5, 'library', 'view', 'Visualizar: Biblioteca'),
(6, 'library', 'create', 'Cadastrar: Biblioteca'),
(7, 'library', 'update', 'Editar: Biblioteca'),
(8, 'library', 'delete', 'Excluir: Biblioteca'),
(9, 'fleet', 'view', 'Visualizar: Frotas'),
(10, 'fleet', 'create', 'Cadastrar: Frotas'),
(11, 'fleet', 'update', 'Editar: Frotas'),
(12, 'fleet', 'delete', 'Excluir: Frotas'),
(13, 'families', 'view', 'Visualizar: Famílias'),
(14, 'families', 'create', 'Cadastrar: Famílias'),
(15, 'families', 'update', 'Editar: Famílias'),
(16, 'families', 'delete', 'Excluir: Famílias'),
(17, 'models', 'view', 'Visualizar: Modelos'),
(18, 'models', 'create', 'Cadastrar: Modelos'),
(19, 'models', 'update', 'Editar: Modelos'),
(20, 'models', 'delete', 'Excluir: Modelos'),
(21, 'categories', 'view', 'Visualizar: Categorias'),
(22, 'categories', 'create', 'Cadastrar: Categorias'),
(23, 'categories', 'update', 'Editar: Categorias'),
(24, 'categories', 'delete', 'Excluir: Categorias'),
(25, 'videos', 'view', 'Visualizar: Vídeos'),
(26, 'videos', 'create', 'Cadastrar: Vídeos'),
(27, 'videos', 'update', 'Editar: Vídeos'),
(28, 'videos', 'delete', 'Excluir: Vídeos'),
(29, 'clients', 'view', 'Visualizar: Clientes'),
(30, 'clients', 'create', 'Cadastrar: Clientes'),
(31, 'clients', 'update', 'Editar: Clientes'),
(32, 'clients', 'delete', 'Excluir: Clientes'),
(33, 'users', 'view', 'Visualizar: Usuários'),
(34, 'users', 'create', 'Cadastrar: Usuários'),
(35, 'users', 'update', 'Editar: Usuários'),
(36, 'users', 'delete', 'Excluir: Usuários'),
(37, 'permissions', 'view', 'Visualizar: Perfis e permissões'),
(38, 'permissions', 'create', 'Cadastrar: Perfis e permissões'),
(39, 'permissions', 'update', 'Editar: Perfis e permissões'),
(40, 'permissions', 'delete', 'Excluir: Perfis e permissões'),
(41, 'reports', 'view', 'Visualizar: Relatórios'),
(42, 'reports', 'create', 'Cadastrar: Relatórios'),
(43, 'reports', 'update', 'Editar: Relatórios'),
(44, 'reports', 'delete', 'Excluir: Relatórios'),
(45, 'feedback', 'view', 'Visualizar: Feedbacks'),
(46, 'feedback', 'create', 'Cadastrar: Feedbacks'),
(47, 'feedback', 'update', 'Editar: Feedbacks'),
(48, 'feedback', 'delete', 'Excluir: Feedbacks'),
(64, 'subcategories', 'view', 'Visualizar: Subcategorias'),
(65, 'subcategories', 'create', 'Cadastrar: Subcategorias'),
(66, 'subcategories', 'update', 'Editar: Subcategorias'),
(67, 'subcategories', 'delete', 'Excluir: Subcategorias'),
(108, 'organizations', 'view', 'Visualizar: Empresas VWCO'),
(109, 'organizations', 'create', 'Cadastrar: Empresas VWCO'),
(110, 'organizations', 'update', 'Editar: Empresas VWCO'),
(111, 'organizations', 'delete', 'Excluir: Empresas VWCO'),
(116, 'client_links', 'view', 'Visualizar: Vínculos de atendimento'),
(117, 'client_links', 'create', 'Cadastrar: Vínculos de atendimento'),
(118, 'client_links', 'update', 'Editar: Vínculos de atendimento'),
(119, 'client_links', 'delete', 'Excluir: Vínculos de atendimento'),
(136, 'locations', 'view', 'Visualizar: Estados e cidades'),
(137, 'locations', 'create', 'Cadastrar: Estados e cidades'),
(138, 'locations', 'update', 'Editar: Estados e cidades'),
(139, 'locations', 'delete', 'Excluir: Estados e cidades'),
(332, 'emission_standards', 'view', 'Visualizar: Normas de emissões'),
(333, 'emission_standards', 'create', 'Cadastrar: Normas de emissões'),
(334, 'emission_standards', 'update', 'Editar: Normas de emissões'),
(335, 'emission_standards', 'delete', 'Excluir: Normas de emissões'),
(336, 'brands', 'view', 'Visualizar marcas'),
(337, 'brands', 'create', 'Cadastrar marcas'),
(338, 'brands', 'update', 'Editar marcas'),
(339, 'brands', 'delete', 'Excluir marcas'),
(340, 'technical_catalog', 'view', 'Visualizar: Catálogo técnico e comparador de veículos'),
(341, 'service_desk', 'view', 'Visualizar chamados conforme a hierarquia do perfil'),
(342, 'service_desk', 'create', 'Criar chamados e salvar rascunhos'),
(343, 'service_desk', 'update', 'Tratar, transferir, recategorizar e solucionar chamados'),
(344, 'service_desk', 'delete', 'Excluir chamados e seus anexos'),
(345, 'report_categories', 'view', 'Visualizar categorias mestre de relatos'),
(346, 'report_categories', 'create', 'Cadastrar categorias mestre de relatos'),
(347, 'report_categories', 'update', 'Editar categorias mestre de relatos'),
(348, 'report_categories', 'delete', 'Excluir categorias mestre de relatos'),
(349, 'report_terms', 'view', 'Visualizar termos de classificação'),
(350, 'report_terms', 'create', 'Cadastrar termos de classificação'),
(351, 'report_terms', 'update', 'Editar termos de classificação'),
(352, 'report_terms', 'delete', 'Excluir termos de classificação'),
(357, 'sectors', 'view', 'Visualizar setores e equipes'),
(358, 'sectors', 'create', 'Cadastrar setores'),
(359, 'sectors', 'update', 'Editar setores e gerenciar integrantes'),
(360, 'sectors', 'delete', 'Inativar setores'),
(361, 'service_priorities', 'view', 'Visualizar prioridades e SLAs do Service Desk'),
(362, 'service_priorities', 'create', 'Cadastrar prioridades e SLAs do Service Desk'),
(363, 'service_priorities', 'update', 'Editar prioridades e SLAs do Service Desk'),
(364, 'service_priorities', 'delete', 'Excluir prioridades sem vínculos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `versao` varchar(80) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `aplicado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `schema_migrations`
--

INSERT INTO `schema_migrations` (`versao`, `descricao`, `aplicado_em`) VALUES
('20260718_001', 'Marcas e frota multimarcas', '2026-07-19 00:03:32'),
('20260718_002', 'Catálogo e especificações técnicas oficiais de IVECO, Volvo, Mercedes-Benz e Scania', '2026-07-19 00:03:44'),
('20260718_003', 'Imagens oficiais para famílias e modelos IVECO, Volvo, Mercedes-Benz e Scania', '2026-07-19 00:04:01'),
('20260718_004', 'Ônibus elétricos BYD e Mercedes-Benz com imagens e especificações técnicas oficiais', '2026-07-19 00:04:22'),
('20260718_005', 'Catálogo técnico e comparador para perfis internos autorizados', '2026-07-19 00:04:31'),
('20260718_006', 'Revisão técnica geral, Daily chassi-cabine, imagens auditadas e entre-eixos', '2026-07-19 00:04:47'),
('20260718_007', 'Central de notificações e suporte às ações em massa de modelos', '2026-07-19 00:04:59'),
('20260725_008', 'Importação e exportação de modelos, PBT/PBTC e relação de redução', '2026-07-25 19:19:10'),
('20260725_009', 'Catálogo de ônibus multimarcas com fichas técnicas oficiais', '2026-07-25 19:26:03'),
('20260725_010_tipo_veiculo_familias_frotas', '', '2026-07-25 20:22:21'),
('20260725_011_lembrar_login', '', '2026-07-25 21:11:00'),
('20260725_012_recuperacao_senha_email', '', '2026-07-25 21:51:27'),
('20260728_013_vinculos_marcas_videos_usuarios', '', '2026-07-29 01:34:50'),
('20260728_014_assistente_voz_conhecimento', '', '2026-07-29 02:44:07'),
('20260729_015_assistente_fontes_acoes_catalogo', '', '2026-07-29 02:44:23'),
('20260729_016_assistente_consultas_sistema', '', '2026-07-29 03:09:31'),
('20260729_017_service_desk_relato_setores_sla', '', '2026-07-29 04:37:54'),
('20260729_018_taxonomia_relato_limites_assistente', '', '2026-07-29 04:56:52'),
('20260729_019_master_categories_automotivas', '', '2026-07-29 05:58:45'),
('20260729_020_category_terms_automotivos', '', '2026-07-29 05:59:00'),
('20260729_021_gestao_setores_equipes', '', '2026-07-29 05:48:17'),
('20260729_022_corrige_taxonomia_legada', '', '2026-07-29 05:58:05'),
('20260730_023_service_desk_prioridades_workflow', '', '2026-07-31 00:51:21'),
('20260730_024_service_desk_abertura_anexos_hierarquia', '', '2026-07-31 02:54:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_priorities`
--

CREATE TABLE `service_priorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#64748b',
  `ordem` tinyint(3) UNSIGNED NOT NULL DEFAULT '3',
  `sla_primeira_interacao_minutos` int(10) UNSIGNED NOT NULL,
  `sla_resolucao_minutos` int(10) UNSIGNED NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `service_priorities`
--

INSERT INTO `service_priorities` (`id`, `codigo`, `nome`, `descricao`, `cor`, `ordem`, `sla_primeira_interacao_minutos`, `sla_resolucao_minutos`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, 'P1', 'Crítica', 'Risco à segurança, indisponibilidade total ou impacto operacional crítico.', '#c81e3a', 1, 720, 2880, 1, '2026-07-31 00:51:20', '2026-07-31 01:02:53'),
(2, 'P2', 'Alta', 'Falha relevante, operação comprometida ou impacto em vários usuários.', '#e4572e', 2, 1020, 4320, 1, '2026-07-31 00:51:20', '2026-07-31 01:02:38'),
(3, 'P3', 'Moderada', 'Impacto controlado, com alternativa operacional disponível.', '#e59b15', 3, 1440, 7200, 1, '2026-07-31 00:51:20', '2026-07-31 01:03:18'),
(4, 'P4', 'Baixa', 'Impacto limitado, dúvida, ajuste ou ocorrência sem bloqueio.', '#1683b5', 4, 5760, 12960, 1, '2026-07-31 00:51:20', '2026-07-31 01:05:24'),
(5, 'P5', 'Planejada', 'Sugestão ou melhoria para análise de produto e planejamento.', '#64748b', 5, 8640, 21600, 1, '2026-07-31 00:51:20', '2026-07-31 01:07:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_reports`
--

CREATE TABLE `service_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `protocolo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_cliente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `marca_id` bigint(20) UNSIGNED DEFAULT NULL,
  `familia_id` bigint(20) UNSIGNED DEFAULT NULL,
  `modelo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `setor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `responsavel_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prioridade_id` bigint(20) UNSIGNED DEFAULT NULL,
  `grupo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'incidente',
  `origem_item` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'veiculo',
  `recorrente` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_pai_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` enum('falha','erro','melhoria','sugestao') COLLATE utf8mb4_unicode_ci NOT NULL,
  `canal` enum('texto','voz') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'texto',
  `titulo` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relato_original` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `relato_normalizado` longtext COLLATE utf8mb4_unicode_ci,
  `resumo_triagem` text COLLATE utf8mb4_unicode_ci,
  `criticidade` enum('baixa','media','alta','critica') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'media',
  `status` enum('rascunho','novo','transferido','em_tratamento','possivel_solucao','finalizado','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'novo',
  `solucao_proposta` text COLLATE utf8mb4_unicode_ci,
  `solucao_final` text COLLATE utf8mb4_unicode_ci,
  `sla_primeira_resposta_em` datetime DEFAULT NULL,
  `primeira_resposta_em` datetime DEFAULT NULL,
  `sla_resolucao_em` datetime DEFAULT NULL,
  `finalizado_em` datetime DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_report_attachments`
--

CREATE TABLE `service_report_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contexto` enum('abertura','interacao','assistente') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'abertura',
  `tipo` enum('imagem','video','audio','documento') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'documento',
  `nome_original` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caminho` varchar(700) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamanho` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_report_history`
--

CREATE TABLE `service_report_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `evento` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_anterior` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_novo` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setor_anterior_id` bigint(20) UNSIGNED DEFAULT NULL,
  `setor_novo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `responsavel_anterior_id` bigint(20) UNSIGNED DEFAULT NULL,
  `responsavel_novo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `observacao` text COLLATE utf8mb4_unicode_ci,
  `dados_json` longtext COLLATE utf8mb4_unicode_ci,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_report_messages`
--

CREATE TABLE `service_report_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `origem` enum('usuario','assistente','interno','sistema') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mensagem` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `audio_segundos` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_report_satisfaction`
--

CREATE TABLE `service_report_satisfaction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `nota` tinyint(3) UNSIGNED NOT NULL,
  `resolvido` tinyint(1) NOT NULL DEFAULT '1',
  `comentario` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `service_report_solutions`
--

CREATE TABLE `service_report_solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo` enum('proposta','aplicada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proposta',
  `descricao` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `setores`
--

CREATE TABLE `setores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nome` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(140) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `setores`
--

INSERT INTO `setores` (`id`, `empresa_id`, `nome`, `slug`, `descricao`, `email`, `ativo`, `criado_em`, `atualizado_em`) VALUES
(1, NULL, 'Triagem Service Desk', 'triagem-service-desk', 'Primeiro atendimento e direcionamento dos relatos recebidos pela plataforma.', NULL, 1, '2026-07-29 04:32:43', '2026-07-29 04:32:43'),
(3, 1, 'Engenharia de Powertrain', 'engenharia-de-powertrain', 'Motor, transmissão, arrefecimento, combustível, emissões e desempenho do trem de força.', NULL, 1, '2026-07-29 05:26:07', '2026-07-29 05:50:42'),
(4, 1, 'Engenharia de Chassi e Dinâmica Veicular', 'engenharia-de-chassi-e-din-amica-veicular', 'Freios, direção, suspensão, eixos, pneus e comportamento dinâmico.', NULL, 1, '2026-07-29 05:26:07', '2026-07-29 05:50:38'),
(5, 1, 'Elétrica, Eletrônica e Software', 'el-etrica-eletr-onica-e-software', 'Sistemas elétricos, eletrônicos, sensores, redes, painel, ADAS e conectividade.', NULL, 1, '2026-07-29 05:26:07', '2026-07-29 05:50:33'),
(6, 1, 'Cabine, Carroceria e Ônibus', 'cabine-carroceria-e-onibus', 'Cabine, climatização, ergonomia, carroceria, portas, visibilidade e sistemas de passageiros.', NULL, 1, '2026-07-29 05:26:07', '2026-07-29 05:50:25'),
(7, NULL, 'Engenharia do Cliente', 'engenharia-do-cliente', 'Triagem técnica, recorrência de campo, oportunidades e sugestões de melhoria do produto.', NULL, 1, '2026-07-29 05:26:07', '2026-07-29 05:50:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(140) NOT NULL,
  `descricao` text,
  `imagem` varchar(255) DEFAULT NULL,
  `ordem` int(11) DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `categoria_id`, `nome`, `descricao`, `imagem`, `ordem`, `ativo`) VALUES
(1, 16, 'Velocidade constante', '', NULL, 1, 1),
(2, 1, 'Cruise Control', '', NULL, 2, 1),
(3, 5, 'Modos ECO, POWER e NORMAL', '', NULL, 1, 1),
(4, 3, 'Luzes e indicadores', '', NULL, 1, 1),
(5, 16, 'Modos ECO, NORMAL e POWER', 'Acionamento e diferenças entre os modos de condução.', NULL, 1, 1),
(6, 10, 'Freio-motor e retarder', 'Seleção dos níveis e uso correto dos sistemas auxiliares de frenagem.', NULL, 1, 1),
(8, 17, 'Consultar consumo', 'Como visualizar o consumo atual e médio no computador de bordo.', NULL, 1, 1),
(10, 15, 'Verificar portas e alertas', 'Identificação dos avisos de portas e demais alertas do veículo.', NULL, 1, 1),
(12, 20, 'Principais Funções', 'Resumo geral do veículo', NULL, 0, 1),
(13, 16, 'Drive Manobra & Ré Manobra', '', NULL, 1, 1),
(14, 21, 'RIO', 'Treinamentos para a plataforma RIO', 'public/assets/images/subcategorias/d4df2afeb43eeef632b7a2c2f0ed5fb4.png', 0, 1),
(15, 21, 'DRIVE LEARN', 'Treinamentos para a plataforma', 'public/assets/images/subcategorias/5dd5a1fb478cacbb7af2b18e0023ab56.png', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades`
--

CREATE TABLE `unidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(120) NOT NULL,
  `tipo` enum('fabrica','assistencia','cliente') NOT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `unidades`
--

INSERT INTO `unidades` (`id`, `nome`, `tipo`, `cidade`, `uf`, `ativo`, `criado_em`) VALUES
(1, 'Fábrica Resende', 'fabrica', 'Resende', 'RJ', 1, '2026-07-16 13:45:24'),
(2, 'Assistência Técnica', 'assistencia', 'São Paulo', 'SP', 1, '2026-07-16 13:45:24');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `perfil_id` bigint(20) UNSIGNED NOT NULL,
  `unidade_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cliente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nome` varchar(140) NOT NULL,
  `email` varchar(180) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `ultimo_acesso` datetime DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `perfil_id`, `unidade_id`, `cliente_id`, `nome`, `email`, `foto`, `senha_hash`, `ativo`, `ultimo_acesso`, `criado_em`) VALUES
(1, 1, 1, NULL, 'Lucas Paiva', 'lucastpaiva99@gmail.com', 'public/assets/images/usuarios/3261129994d67d36aa4565f7c255a090.webp', '$2y$10$OEaq.hE7kKDYRci/.IoghuVUSk/93EPo/P0DslxeWVJ0zo8cemhe2', 1, '2026-07-31 00:08:36', '2026-07-16 13:45:26'),
(3, 3, NULL, NULL, 'cliente_adm', 'clienteadm@cutrale.com.br', 'public/assets/images/usuarios/d0ec35108f4c5fec488be1afcbe9158f.webp', '$2y$10$1ml.pw9gfHY6FVRr6YrCB.vBOYulVGCiZXGIwGuNeVZp2NIHnh7YK', 1, '2026-07-27 10:42:46', '2026-07-16 17:50:07'),
(4, 7, NULL, NULL, 'Caio Melis', 'caio.melis@volkswagen.com.br', 'public/assets/images/usuarios/2742a48f2fc298002dc7687fd402277c.png', '$2y$10$P2PFusaRhzruk/X/1dJWAO3L30Vq0OXK4yyglC2LfhtNCHTTdoGSm', 1, NULL, '2026-07-16 17:51:55'),
(5, 10, NULL, NULL, 'Ricardo Sassa', 'ricardo.sassa@volkswagen.com.br', 'public/assets/images/usuarios/f4a774c6167c41052ba148f981ec0140.webp', '$2y$10$5Hq5VlG5ExEqeg5um39AMe3nBk7F4vKw45Pv3WqoH6ZDNrvuvGeky', 1, '2026-07-30 08:36:01', '2026-07-16 18:40:04'),
(6, 5, NULL, NULL, 'Rogerio Dias', 'rogerio.dias@volkswagen.com.br', 'public/assets/images/usuarios/cd61faddb2cfb5326c43034176adeef2.webp', '$2y$10$TfOt5vc6dYkEyBF6INLbuuW0T0YooBaoDJ5O9UuwpU3jzbMhgumyS', 1, NULL, '2026-07-17 12:09:52'),
(7, 9, NULL, NULL, 'Vitoria Lexa', 'vitoria.silva@volkswagen.com.br', 'public/assets/images/usuarios/b268ca7355559152e5ef95f351ca70f6.webp', '$2y$10$KyKUK6GaEkPyFaNeuZKqMO2R.qw26duOe1D9VIOrLtDsJ7Z16XFqG', 1, '2026-07-31 00:03:53', '2026-07-27 13:08:10'),
(8, 10, NULL, NULL, 'Wesley Agostinho', 'wesley.agostinho@volkswagen.com.br', NULL, '$2y$10$jE1K.8z6tHBMcuFDgdtBveX34eqcAtMgyh7MywI.f.1Id/s6a.OkG', 1, '2026-07-30 09:01:29', '2026-07-30 11:48:29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_codigos_senha`
--

CREATE TABLE `usuario_codigos_senha` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `codigo_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_em` datetime NOT NULL,
  `tentativas` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `usado_em` datetime DEFAULT NULL,
  `ip_hash` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario_codigos_senha`
--

INSERT INTO `usuario_codigos_senha` (`id`, `usuario_id`, `codigo_hash`, `expira_em`, `tentativas`, `usado_em`, `ip_hash`, `criado_em`) VALUES
(1, 1, '$2y$10$fijAHtTzPEpVVqE78OMgv.hlC.078BvgRY6kUerhDiiPYGd7sdql6', '2026-07-25 18:55:32', 0, '2026-07-25 18:54:13', 'bce3d03706cb51550b70774a8a939b5e93543049d17fd3e375f4beac33a7acd5', '2026-07-25 21:53:32'),
(2, 1, '$2y$10$yzFRwEktAMOw8/OCWuzLK.glFge9NofJpMMm5xB/cThd3N7bCYxXS', '2026-07-27 09:35:30', 0, '2026-07-27 09:33:57', '94afce16a2d247026bb966f3a5d1b150ab3b85088ccf52fe70a0893ba4e8f78a', '2026-07-27 12:33:30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_empresas`
--

CREATE TABLE `usuario_empresas` (
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `empresa_id` bigint(20) UNSIGNED NOT NULL,
  `perfil_id` bigint(20) UNSIGNED NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `administrador` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `cadastrado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario_empresas`
--

INSERT INTO `usuario_empresas` (`usuario_id`, `empresa_id`, `perfil_id`, `principal`, `administrador`, `ativo`, `cadastrado_por`, `criado_em`, `atualizado_em`) VALUES
(1, 1, 1, 0, 1, 1, 1, '2026-07-31 00:52:06', '2026-07-31 00:52:06'),
(1, 2, 1, 1, 1, 1, 1, '2026-07-31 00:52:06', '2026-07-31 00:52:06'),
(3, 8, 3, 1, 0, 1, 1, '2026-07-29 01:43:51', '2026-07-29 01:43:51'),
(4, 1, 7, 0, 0, 1, 1, '2026-07-16 17:51:55', '2026-07-16 17:51:55'),
(4, 2, 7, 1, 0, 1, 1, '2026-07-16 17:51:55', '2026-07-16 17:51:55'),
(5, 1, 10, 0, 0, 1, 1, '2026-07-30 11:50:12', '2026-07-30 11:50:12'),
(5, 2, 10, 1, 0, 1, 1, '2026-07-30 11:50:12', '2026-07-30 11:50:12'),
(6, 1, 5, 0, 1, 1, 1, '2026-07-29 01:44:28', '2026-07-29 01:44:28'),
(6, 2, 5, 1, 1, 1, 1, '2026-07-29 01:44:28', '2026-07-29 01:44:28'),
(7, 8, 9, 1, 0, 1, 1, '2026-07-30 17:43:09', '2026-07-30 17:43:09'),
(8, 1, 10, 1, 0, 1, 1, '2026-07-30 11:48:29', '2026-07-30 11:48:29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_marcas`
--

CREATE TABLE `usuario_marcas` (
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario_marcas`
--

INSERT INTO `usuario_marcas` (`usuario_id`, `marca_id`, `criado_em`) VALUES
(1, 1, '2026-07-29 01:34:50'),
(1, 2, '2026-07-29 01:34:50'),
(1, 3, '2026-07-29 01:34:50'),
(1, 4, '2026-07-29 01:34:50'),
(1, 5, '2026-07-29 01:34:50'),
(1, 6, '2026-07-29 01:34:50'),
(1, 7, '2026-07-29 01:34:50'),
(1, 8, '2026-07-29 01:34:50'),
(1, 9, '2026-07-29 01:34:50'),
(1, 10, '2026-07-29 01:34:50'),
(1, 11, '2026-07-29 01:34:50'),
(1, 12, '2026-07-29 01:34:50'),
(3, 1, '2026-07-29 01:34:50'),
(3, 2, '2026-07-29 01:34:50'),
(3, 3, '2026-07-29 01:34:50'),
(3, 4, '2026-07-29 01:34:50'),
(3, 5, '2026-07-29 01:34:50'),
(3, 6, '2026-07-29 01:34:50'),
(3, 7, '2026-07-29 01:34:50'),
(3, 8, '2026-07-29 01:34:50'),
(3, 9, '2026-07-29 01:34:50'),
(3, 10, '2026-07-29 01:34:50'),
(3, 11, '2026-07-29 01:34:50'),
(3, 12, '2026-07-29 01:34:50'),
(4, 1, '2026-07-29 01:34:50'),
(4, 2, '2026-07-29 01:34:50'),
(4, 3, '2026-07-29 01:34:50'),
(4, 4, '2026-07-29 01:34:50'),
(4, 5, '2026-07-29 01:34:50'),
(4, 6, '2026-07-29 01:34:50'),
(4, 7, '2026-07-29 01:34:50'),
(4, 8, '2026-07-29 01:34:50'),
(4, 9, '2026-07-29 01:34:50'),
(4, 10, '2026-07-29 01:34:50'),
(4, 11, '2026-07-29 01:34:50'),
(4, 12, '2026-07-29 01:34:50'),
(5, 1, '2026-07-30 11:50:12'),
(5, 2, '2026-07-30 11:50:12'),
(5, 3, '2026-07-30 11:50:12'),
(5, 4, '2026-07-30 11:50:12'),
(5, 5, '2026-07-30 11:50:12'),
(5, 6, '2026-07-30 11:50:12'),
(5, 7, '2026-07-30 11:50:12'),
(5, 8, '2026-07-30 11:50:12'),
(5, 9, '2026-07-30 11:50:12'),
(5, 10, '2026-07-30 11:50:12'),
(5, 11, '2026-07-30 11:50:12'),
(5, 12, '2026-07-30 11:50:12'),
(6, 1, '2026-07-29 01:34:50'),
(6, 2, '2026-07-29 01:34:50'),
(6, 3, '2026-07-29 01:34:50'),
(6, 4, '2026-07-29 01:34:50'),
(6, 5, '2026-07-29 01:34:50'),
(6, 6, '2026-07-29 01:34:50'),
(6, 7, '2026-07-29 01:34:50'),
(6, 8, '2026-07-29 01:34:50'),
(6, 9, '2026-07-29 01:34:50'),
(6, 10, '2026-07-29 01:34:50'),
(6, 11, '2026-07-29 01:34:50'),
(6, 12, '2026-07-29 01:34:50'),
(7, 1, '2026-07-30 17:43:09'),
(7, 2, '2026-07-30 17:43:09'),
(7, 3, '2026-07-30 17:43:09'),
(7, 4, '2026-07-30 17:43:09'),
(7, 5, '2026-07-30 17:43:09'),
(7, 6, '2026-07-30 17:43:09'),
(7, 7, '2026-07-30 17:43:09'),
(7, 8, '2026-07-30 17:43:09'),
(7, 9, '2026-07-30 17:43:09'),
(7, 10, '2026-07-30 17:43:09'),
(7, 11, '2026-07-30 17:43:09'),
(7, 12, '2026-07-30 17:43:09'),
(8, 1, '2026-07-30 11:48:29'),
(8, 2, '2026-07-30 11:48:29'),
(8, 3, '2026-07-30 11:48:29'),
(8, 4, '2026-07-30 11:48:29'),
(8, 5, '2026-07-30 11:48:29'),
(8, 6, '2026-07-30 11:48:29'),
(8, 7, '2026-07-30 11:48:29'),
(8, 8, '2026-07-30 11:48:29'),
(8, 9, '2026-07-30 11:48:29'),
(8, 10, '2026-07-30 11:48:29'),
(8, 11, '2026-07-30 11:48:29'),
(8, 12, '2026-07-30 11:48:29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_setores`
--

CREATE TABLE `usuario_setores` (
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `setor_id` bigint(20) UNSIGNED NOT NULL,
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario_setores`
--

INSERT INTO `usuario_setores` (`usuario_id`, `setor_id`, `principal`, `ativo`, `criado_em`) VALUES
(1, 1, 0, 1, '2026-07-29 05:49:44'),
(1, 6, 0, 0, '2026-07-29 05:48:56'),
(1, 7, 1, 1, '2026-07-29 05:49:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_tokens_lembrar`
--

CREATE TABLE `usuario_tokens_lembrar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `seletor` char(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expira_em` datetime NOT NULL,
  `user_agent_hash` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultimo_uso_em` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario_tokens_lembrar`
--

INSERT INTO `usuario_tokens_lembrar` (`id`, `usuario_id`, `seletor`, `token_hash`, `expira_em`, `user_agent_hash`, `criado_em`, `ultimo_uso_em`) VALUES
(1, 5, '9ccee96db1b9c6d0888d1b34', '36b8dad38ba8d0c40dd8598dd0198b26b8f789b449ed9ac753105d18bed83db1', '2026-08-29 08:36:01', 'e625a3d42ef01c764e5960f048f430f34b7862e7aa3264338186d02f75d0cb9c', '2026-07-30 11:36:01', NULL),
(3, 8, 'def6b15c31933c62e0ff01b9', '581934701154466b93585bac6dcc537845ea8b8ad2870bbc7cef83f99aaddfee', '2026-08-29 09:01:29', '6496d9cad0591f5bd26b29376420933ee01b35ae191ed400bd5e90272fc52472', '2026-07-30 12:01:29', '2026-07-30 12:11:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categoria_id` bigint(20) UNSIGNED NOT NULL,
  `subcategoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `titulo` varchar(180) NOT NULL,
  `descricao` text,
  `transcricao` longtext,
  `resumo_ia` text,
  `transcricao_status` enum('pendente','processando','concluida','erro') NOT NULL DEFAULT 'pendente',
  `transcricao_idioma` varchar(10) DEFAULT NULL,
  `transcricao_atualizada_em` datetime DEFAULT NULL,
  `tipo` enum('upload','youtube','vimeo','url') DEFAULT 'upload',
  `arquivo_url` varchar(500) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `duracao_segundos` int(11) DEFAULT NULL,
  `status` enum('rascunho','publicado','arquivado') DEFAULT 'rascunho',
  `criado_por` bigint(20) UNSIGNED DEFAULT NULL,
  `publicado_em` datetime DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `videos`
--

INSERT INTO `videos` (`id`, `categoria_id`, `subcategoria_id`, `titulo`, `descricao`, `transcricao`, `resumo_ia`, `transcricao_status`, `transcricao_idioma`, `transcricao_atualizada_em`, `tipo`, `arquivo_url`, `thumbnail`, `duracao_segundos`, `status`, `criado_por`, `publicado_em`, `criado_em`, `atualizado_em`) VALUES
(2, 20, 12, 'NOVO VOLKSBUS 17.260', 'Transmissão automática, volante multifuncional, alavanca de troca de marchas.', NULL, NULL, 'pendente', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=5VEC8RSkGJc', 'public/assets/images/videos/a1ead1711a9a92b6626f45dae69c40bf.png', 300, 'publicado', 1, '2026-07-16 13:06:47', '2026-07-16 15:43:42', '2026-07-16 16:06:47'),
(3, 16, 13, 'DM & RM', 'Função para ajudar a manobrar o veículo', 'A função DM e RM servem para auxiliar o condutor para manobras, tendo assim uma maior tranquilidade quanto arrancada do veículo em momentos que deveria ter uma condução mais leve.', NULL, 'concluida', 'pt-BR', '2026-07-29 00:28:29', 'youtube', 'https://www.youtube.com/watch?v=fgh03rZAOmA', 'public/assets/images/videos/3c4590eb40b13ad5253a9d711a7f3b9d.png', 60, 'publicado', 5, '2026-07-16 15:46:45', '2026-07-16 18:45:23', '2026-07-29 03:28:29'),
(4, 20, 12, 'CONDUÇÃO NA PRÁTICA', 'Apresentação das funções do veículo na prática', NULL, NULL, 'pendente', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=gyfSc2edm2g', 'public/assets/images/videos/ad6e4ee4af0a1da39da70055d983c5ee.png', 480, 'publicado', 5, '2026-07-16 18:26:23', '2026-07-16 18:50:33', '2026-07-16 21:26:23'),
(5, 16, 1, 'FUNÇÃO V CONSTANTE', 'Como funciona a função, como utilizar...', 'Vamos iniciar o treinamento do Volkswagen Meteor. Preparados? Então, vamos lá. Hoje vamos conhecer a função V Constante. Ela é utilizada em descidas e é diferente do Cruise Control, pois mantém a velocidade de forma controlada durante o percurso descendente. Para ativar a função, é bem simples. Primeiro, verifique se o botão Auto Engine Brake está com a luz apagada, conforme na imagem. Depois, tire o pé do acelerador. Em seguida, acione o freio até atingir a velocidade desejada. Nesse momento, o sistema registra automaticamente essa velocidade. Agora, é só tirar o pé do freio e o veículo manterá a velocidade constante durante a descida. Para desativar, basta acelerar novamente o veículo. Assim, a velocidade registrada é apagada, permitindo um novo ajuste quando necessário. Durante esse processo, o cluster mostrará algumas etapas da função em funcionamento.', NULL, 'concluida', 'pt-BR', '2026-07-29 00:14:18', 'upload', 'public/assets/videos/b5321d8e4f3f70ee7695ee2b215d2899.mp4', 'public/assets/images/videos/b7d38fb13cdecda95dab76d9a38eb478.png', 60, 'publicado', 1, '2026-07-17 09:06:42', '2026-07-17 12:05:42', '2026-07-29 03:14:19'),
(6, 21, 14, 'RIO - MONITOR DE FROTAS', 'Aprendendo a área de monitor de frotas do RIO', NULL, NULL, 'pendente', NULL, NULL, 'upload', 'public/assets/videos/7f0f3f75d6886d1eb8e37d4d68752ea5.mp4', 'public/assets/images/videos/69b2745f76a77b70a8a429ab2a1b6105.jpg', 60, 'publicado', 1, '2026-07-29 17:06:03', '2026-07-29 20:05:44', '2026-07-29 20:33:37'),
(7, 21, 14, 'RIO - PLATAFORMA VISÃO GERAL', 'Tendo seu primeiro contato com o serviço RIO e sua plataforma.', NULL, NULL, 'pendente', NULL, NULL, 'youtube', 'https://www.youtube.com/watch?v=xBMHMo8h4qw', 'public/assets/images/videos/60005c782eb984ffaa85e27c63fd4bd2.jpg', 60, 'publicado', 1, '2026-07-29 17:09:36', '2026-07-29 20:09:36', '2026-07-29 20:23:47'),
(8, 21, 14, 'RIO - DIAGNÓSTICO REMOTO', 'Aprendendo como analisar as falhas, alertas que seu veículo possuí ativa e como tratá-la.', 'Vamos falar um pouco sobre diagnóstico remoto. Hoje você já tem a sua frota cadastrada e com isso você consegue verificar falhas elétricas internas ali naquele veículo através do chassi e a nomenclatura que você cadastrou ele. Aqui em cima você consegue visualizar dashboards, relatório, notificações, disponibilidade e recorrência de alguns problemas. colocar um filtro de início e fim, verificar se a gente quer todos os alertas ou somente críticos e buscar aqui um veículo e com isso a gente vai ter um retorno de quais alertas de atenção ou de crítico ou todos os alertas. Nessa forma você consegue buscar, por exemplo, uma falha e a gente tem o Lydia, que é um serviço também para ajudar relacionado a literatura técnica. Eu pego aquele código de falha que eles me exportaram aqui e posso conferir esse código de falha dentro do Lydia, que é um assistente de IA e um repositório de todo o documento ali que as concessionárias têm acesso para poder sanar esses tipos de problemas. Então eu estou vendo que a falha ela é relacionada a esse EBS de trailer com defeito. A partir disso eu consigo passar ali junto com o concessionário, o que é preciso fazer, ou até mesmo em casos, a própria empresa, dependendo da questão de garantias ou não.', NULL, 'concluida', 'pt-BR', '2026-07-29 17:23:25', 'upload', 'public/assets/videos/4fa65c67bfe743da93e26330d72d9fd9.mp4', 'public/assets/images/videos/5c5532c989e2341426a177dcdf0c7514.jpg', 120, 'publicado', 1, '2026-07-29 17:23:16', '2026-07-29 20:23:04', '2026-07-29 20:23:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `video_familias`
--

CREATE TABLE `video_familias` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `familia_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `video_familias`
--

INSERT INTO `video_familias` (`video_id`, `familia_id`) VALUES
(6, 1),
(7, 1),
(8, 1),
(6, 2),
(7, 2),
(8, 2),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(6, 4),
(7, 4),
(8, 4),
(6, 6),
(7, 6),
(8, 6),
(6, 7),
(7, 7),
(8, 7),
(6, 8),
(7, 8),
(8, 8),
(2, 17),
(6, 17),
(7, 17),
(8, 17);

-- --------------------------------------------------------

--
-- Estrutura para tabela `video_marcas`
--

CREATE TABLE `video_marcas` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `video_marcas`
--

INSERT INTO `video_marcas` (`video_id`, `marca_id`, `criado_em`) VALUES
(2, 1, '2026-07-29 01:34:50'),
(3, 1, '2026-07-29 03:28:29'),
(4, 1, '2026-07-29 01:34:50'),
(5, 1, '2026-07-29 03:14:19'),
(6, 1, '2026-07-29 20:33:37'),
(7, 1, '2026-07-29 20:23:48'),
(8, 1, '2026-07-29 20:23:25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `video_modelos`
--

CREATE TABLE `video_modelos` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `modelo_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `video_modelos`
--

INSERT INTO `video_modelos` (`video_id`, `modelo_id`) VALUES
(6, 1),
(7, 1),
(8, 1),
(6, 2),
(7, 2),
(8, 2),
(6, 3),
(7, 3),
(8, 3),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(6, 6),
(7, 6),
(8, 6),
(6, 7),
(7, 7),
(8, 7),
(6, 8),
(7, 8),
(8, 8),
(6, 9),
(7, 9),
(8, 9),
(6, 10),
(7, 10),
(8, 10),
(6, 11),
(7, 11),
(8, 11),
(6, 12),
(7, 12),
(8, 12),
(6, 13),
(7, 13),
(8, 13),
(6, 14),
(7, 14),
(8, 14),
(6, 15),
(7, 15),
(8, 15),
(6, 16),
(7, 16),
(8, 16),
(6, 17),
(7, 17),
(8, 17),
(6, 18),
(7, 18),
(8, 18),
(6, 19),
(7, 19),
(8, 19),
(6, 20),
(7, 20),
(8, 20),
(6, 21),
(7, 21),
(8, 21),
(6, 22),
(7, 22),
(8, 22),
(6, 23),
(7, 23),
(8, 23),
(6, 24),
(7, 24),
(8, 24),
(6, 25),
(7, 25),
(8, 25),
(6, 26),
(7, 26),
(8, 26),
(6, 27),
(7, 27),
(8, 27),
(6, 28),
(7, 28),
(8, 28),
(3, 29),
(4, 29),
(5, 29),
(6, 29),
(7, 29),
(8, 29),
(6, 30),
(7, 30),
(8, 30),
(6, 31),
(7, 31),
(8, 31),
(6, 32),
(7, 32),
(8, 32),
(6, 33),
(7, 33),
(8, 33),
(6, 34),
(7, 34),
(8, 34),
(2, 35),
(6, 35),
(7, 35),
(8, 35),
(6, 36),
(7, 36),
(8, 36),
(6, 37),
(7, 37),
(8, 37),
(6, 38),
(7, 38),
(8, 38),
(6, 39),
(7, 39),
(8, 39),
(6, 40),
(7, 40),
(8, 40),
(6, 41),
(7, 41),
(8, 41),
(6, 42),
(7, 42),
(8, 42),
(6, 43),
(7, 43),
(8, 43),
(6, 44),
(7, 44),
(8, 44),
(6, 45),
(7, 45),
(8, 45),
(6, 46),
(7, 46),
(8, 46),
(6, 47),
(7, 47),
(8, 47);

-- --------------------------------------------------------

--
-- Estrutura para tabela `video_visualizacoes`
--

CREATE TABLE `video_visualizacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `iniciado_em` datetime NOT NULL,
  `concluido_em` datetime DEFAULT NULL,
  `progresso_segundos` int(10) UNSIGNED DEFAULT '0',
  `percentual` decimal(5,2) DEFAULT '0.00',
  `ip_hash` char(64) DEFAULT NULL,
  `dispositivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `video_visualizacoes`
--

INSERT INTO `video_visualizacoes` (`id`, `video_id`, `usuario_id`, `iniciado_em`, `concluido_em`, `progresso_segundos`, `percentual`, `ip_hash`, `dispositivo`) VALUES
(1, 3, 3, '2026-07-16 18:23:06', NULL, 8, 13.79, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(2, 3, 3, '2026-07-16 18:23:17', NULL, 0, 0.00, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(3, 3, 3, '2026-07-16 18:23:20', NULL, 21, 36.21, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(4, 3, 3, '2026-07-16 18:23:28', NULL, 2, 3.45, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(5, 3, 3, '2026-07-16 18:23:31', NULL, 0, 0.00, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(6, 4, 3, '2026-07-16 18:27:31', NULL, 2, 0.40, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(7, 4, 3, '2026-07-16 18:36:22', '2026-07-16 18:36:28', 496, 99.00, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(8, 4, 3, '2026-07-16 18:36:36', NULL, 48, 9.59, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(9, 4, 3, '2026-07-16 18:37:34', NULL, 1, 0.20, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(10, 4, 5, '2026-07-17 08:49:39', NULL, 8, 1.60, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(11, 4, 5, '2026-07-17 08:52:55', '2026-07-17 08:53:01', 500, 100.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(12, 5, 1, '2026-07-19 14:44:00', '2026-07-19 14:45:05', 69, 98.83, 'ea788e78520c310a88cf59f754b1386a6e6ff31d7c074f26725d51e460201524', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5.2 Mobile/15E148 Safari/604.1'),
(13, 5, 1, '2026-07-19 14:45:20', NULL, 31, 44.40, 'ea788e78520c310a88cf59f754b1386a6e6ff31d7c074f26725d51e460201524', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5.2 Mobile/15E148 Safari/604.1'),
(14, 5, 1, '2026-07-19 14:48:31', '2026-07-19 14:48:48', 69, 100.00, 'ea788e78520c310a88cf59f754b1386a6e6ff31d7c074f26725d51e460201524', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5.2 Mobile/15E148 Safari/604.1'),
(15, 4, 1, '2026-07-20 09:53:01', NULL, 3, 0.60, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(16, 5, 1, '2026-07-20 09:53:13', NULL, 2, 2.86, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(17, 5, 1, '2026-07-20 10:03:20', NULL, 10, 14.32, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36'),
(18, 2, 1, '2026-07-24 11:47:38', NULL, 0, 0.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(19, 5, 1, '2026-07-24 11:47:47', '2026-07-24 11:47:57', 69, 100.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(20, 3, 3, '2026-07-27 10:40:16', '2026-07-27 10:40:21', 57, 100.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(21, 5, 1, '2026-07-28 09:55:54', '2026-07-28 09:56:20', 69, 100.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0'),
(22, 8, 1, '2026-07-30 09:02:38', '2026-07-30 09:02:46', 99, 100.00, 'a54fdf20deed068215bb8639a83fc2633717be681ff33363668d31287f51a9af', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.5.2 Mobile/15E148 Safari/604.1'),
(23, 7, 1, '2026-07-30 14:18:09', '2026-07-30 14:18:14', 46, 100.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),
(24, 5, 1, '2026-07-30 14:22:02', NULL, 0, 0.00, '23e20b172a9e17b8c0095da19171f373c360c581cf5f163b1e4bad15a37b457e', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'),
(25, 4, 1, '2026-07-30 22:16:26', NULL, 4, 0.80, 'cfd2c4fe471b7d9e93e820e4a6c3e9d7f36163f6cbdf746c16345aa9540b68e8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `assistente_interacao_fontes`
--
ALTER TABLE `assistente_interacao_fontes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_assistente_fonte_interacao` (`interacao_id`),
  ADD KEY `idx_assistente_fonte_video` (`video_id`),
  ADD KEY `idx_assistente_fonte_modelo` (`modelo_id`);

--
-- Índices de tabela `assistente_interacoes`
--
ALTER TABLE `assistente_interacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_assistente_usuario_data` (`usuario_id`,`criado_em`),
  ADD KEY `idx_assistente_empresa_data` (`empresa_id`,`criado_em`),
  ADD KEY `idx_assistente_resposta` (`resposta_id`);

--
-- Índices de tabela `assistente_limites`
--
ALTER TABLE `assistente_limites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chave_escopo` (`chave_escopo`),
  ADD KEY `idx_assistente_limite_empresa` (`empresa_id`,`ativo`),
  ADD KEY `fk_assistente_limite_usuario` (`criado_por`);

--
-- Índices de tabela `assistente_respostas`
--
ALTER TABLE `assistente_respostas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_assistente_contexto_hash` (`contexto_hash`),
  ADD KEY `idx_assistente_pergunta_hash` (`pergunta_hash`),
  ADD KEY `idx_assistente_reutilizacao` (`reutilizavel`,`validada`),
  ADD KEY `fk_assistente_resposta_usuario` (`criada_por`);

--
-- Índices de tabela `assistente_satisfacoes`
--
ALTER TABLE `assistente_satisfacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_assistente_satisfacao_usuario` (`usuario_id`,`criado_em`),
  ADD KEY `fk_assistente_satisfacao_interacao` (`interacao_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_categoria_nome` (`nome`);

--
-- Índices de tabela `category_terms`
--
ALTER TABLE `category_terms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_category_term` (`categoria_id`,`termo`);

--
-- Índices de tabela `cidades`
--
ALTER TABLE `cidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cidade_estado_nome` (`estado_id`,`nome`),
  ADD UNIQUE KEY `codigo_ibge` (`codigo_ibge`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `uk_cliente_empresa` (`empresa_id`),
  ADD KEY `unidade_id` (`unidade_id`);

--
-- Índices de tabela `convites_usuarios`
--
ALTER TABLE `convites_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_hash` (`token_hash`),
  ADD KEY `fk_convite_empresa` (`empresa_id`),
  ADD KEY `fk_convite_criador` (`criado_por`),
  ADD KEY `idx_convite_validade` (`usuario_id`,`expira_em`,`utilizado_em`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `uk_empresa_legacy` (`origem_legacy`,`origem_legacy_id`),
  ADD KEY `fk_empresa_pai` (`empresa_pai_id`),
  ADD KEY `fk_empresa_cidade` (`cidade_id`),
  ADD KEY `idx_empresa_tipo_ativo` (`tipo`,`ativo`);

--
-- Índices de tabela `empresa_clientes`
--
ALTER TABLE `empresa_clientes`
  ADD PRIMARY KEY (`empresa_vw_id`,`cliente_id`),
  ADD KEY `fk_empresa_cliente_criador` (`criado_por`),
  ADD KEY `idx_empresa_cliente_cliente` (`cliente_id`,`ativo`);

--
-- Índices de tabela `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_ibge` (`codigo_ibge`),
  ADD UNIQUE KEY `sigla` (`sigla`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_familia_marca_nome` (`marca_id`,`nome`),
  ADD KEY `idx_familias_tipo_veiculo` (`tipo_veiculo`,`ativo`);

--
-- Índices de tabela `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_feedback_visualizacao` (`visualizacao_id`);

--
-- Índices de tabela `frotas`
--
ALTER TABLE `frotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelo_id` (`modelo_id`),
  ADD KEY `idx_frota_cliente` (`cliente_id`),
  ADD KEY `idx_frota_norma` (`norma_emissao_id`),
  ADD KEY `idx_frota_usuario` (`cadastrado_por`),
  ADD KEY `idx_frota_marca` (`marca_id`),
  ADD KEY `idx_frota_familia` (`familia_id`),
  ADD KEY `idx_frotas_tipo_veiculo` (`tipo_veiculo`,`cliente_id`);

--
-- Índices de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_auditoria` (`entidade`,`entidade_id`,`criado_em`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_marca_nome` (`nome`),
  ADD UNIQUE KEY `uk_marca_slug` (`slug`);

--
-- Índices de tabela `master_categories`
--
ALTER TABLE `master_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_master_category_slug` (`slug`),
  ADD KEY `fk_master_category_priority` (`prioridade_padrao_id`);

--
-- Índices de tabela `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `familia_id` (`familia_id`);

--
-- Índices de tabela `modelo_documentos`
--
ALTER TABLE `modelo_documentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_modelo_documento_tipo` (`modelo_id`,`tipo`),
  ADD KEY `idx_modelo_documento_ativo` (`modelo_id`,`ativo`);

--
-- Índices de tabela `modelo_especificacoes_tecnicas`
--
ALTER TABLE `modelo_especificacoes_tecnicas`
  ADD PRIMARY KEY (`modelo_id`,`chave`),
  ADD KEY `idx_modelo_especificacao_chave` (`chave`);

--
-- Índices de tabela `normas_emissoes`
--
ALTER TABLE `normas_emissoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Índices de tabela `notificacoes_lidas`
--
ALTER TABLE `notificacoes_lidas`
  ADD PRIMARY KEY (`usuario_id`,`notification_key`),
  ADD KEY `idx_notificacao_lida_data` (`lida_em`);

--
-- Índices de tabela `perfil_permissoes`
--
ALTER TABLE `perfil_permissoes`
  ADD PRIMARY KEY (`perfil_id`,`permissao_id`),
  ADD KEY `permissao_id` (`permissao_id`);

--
-- Índices de tabela `perfis`
--
ALTER TABLE `perfis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_perfil_empresa` (`empresa_id`);

--
-- Índices de tabela `permissoes`
--
ALTER TABLE `permissoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_permissao` (`recurso`,`acao`);

--
-- Índices de tabela `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`versao`);

--
-- Índices de tabela `service_priorities`
--
ALTER TABLE `service_priorities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_service_priority_codigo` (`codigo`),
  ADD KEY `idx_service_priority_ativo_ordem` (`ativo`,`ordem`);

--
-- Índices de tabela `service_reports`
--
ALTER TABLE `service_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `protocolo` (`protocolo`),
  ADD KEY `idx_service_report_empresa_status` (`empresa_cliente_id`,`status`),
  ADD KEY `idx_service_report_setor_status` (`setor_id`,`status`),
  ADD KEY `idx_service_report_responsavel_status` (`responsavel_id`,`status`),
  ADD KEY `idx_service_report_categoria` (`categoria_id`,`criado_em`),
  ADD KEY `idx_service_report_usuario` (`usuario_id`,`criado_em`),
  ADD KEY `fk_service_report_marca` (`marca_id`),
  ADD KEY `fk_service_report_familia` (`familia_id`),
  ADD KEY `fk_service_report_modelo` (`modelo_id`),
  ADD KEY `idx_service_report_priority_status` (`prioridade_id`,`status`),
  ADD KEY `idx_service_report_parent` (`ticket_pai_id`);

--
-- Índices de tabela `service_report_attachments`
--
ALTER TABLE `service_report_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_service_attachment_report` (`report_id`,`criado_em`),
  ADD KEY `idx_service_attachment_message` (`message_id`),
  ADD KEY `fk_service_attachment_user` (`usuario_id`);

--
-- Índices de tabela `service_report_history`
--
ALTER TABLE `service_report_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_service_history_report` (`report_id`,`criado_em`),
  ADD KEY `fk_service_history_usuario` (`usuario_id`),
  ADD KEY `fk_service_history_setor_anterior` (`setor_anterior_id`),
  ADD KEY `fk_service_history_setor_novo` (`setor_novo_id`),
  ADD KEY `fk_service_history_responsavel_anterior` (`responsavel_anterior_id`),
  ADD KEY `fk_service_history_responsavel_novo` (`responsavel_novo_id`);

--
-- Índices de tabela `service_report_messages`
--
ALTER TABLE `service_report_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_service_message_report` (`report_id`,`criado_em`),
  ADD KEY `fk_service_message_usuario` (`usuario_id`);

--
-- Índices de tabela `service_report_satisfaction`
--
ALTER TABLE `service_report_satisfaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_id` (`report_id`),
  ADD KEY `fk_service_satisfaction_usuario` (`usuario_id`);

--
-- Índices de tabela `service_report_solutions`
--
ALTER TABLE `service_report_solutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_service_solution_report` (`report_id`,`criado_em`),
  ADD KEY `fk_service_solution_user` (`usuario_id`);

--
-- Índices de tabela `setores`
--
ALTER TABLE `setores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_setor_empresa_slug` (`empresa_id`,`slug`),
  ADD KEY `idx_setor_empresa_ativo` (`empresa_id`,`ativo`);

--
-- Índices de tabela `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_subcategoria_categoria_nome` (`categoria_id`,`nome`);

--
-- Índices de tabela `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `perfil_id` (`perfil_id`),
  ADD KEY `unidade_id` (`unidade_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `usuario_codigos_senha`
--
ALTER TABLE `usuario_codigos_senha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_codigo_senha_usuario` (`usuario_id`,`usado_em`,`expira_em`),
  ADD KEY `idx_codigo_senha_expiracao` (`expira_em`),
  ADD KEY `idx_codigo_senha_ip` (`ip_hash`,`criado_em`);

--
-- Índices de tabela `usuario_empresas`
--
ALTER TABLE `usuario_empresas`
  ADD PRIMARY KEY (`usuario_id`,`empresa_id`),
  ADD KEY `fk_usuario_empresa_perfil` (`perfil_id`),
  ADD KEY `fk_usuario_empresa_cadastrado_por` (`cadastrado_por`),
  ADD KEY `idx_usuario_empresa_contexto` (`empresa_id`,`ativo`,`perfil_id`);

--
-- Índices de tabela `usuario_marcas`
--
ALTER TABLE `usuario_marcas`
  ADD PRIMARY KEY (`usuario_id`,`marca_id`),
  ADD KEY `idx_usuario_marcas_marca` (`marca_id`,`usuario_id`);

--
-- Índices de tabela `usuario_setores`
--
ALTER TABLE `usuario_setores`
  ADD PRIMARY KEY (`usuario_id`,`setor_id`),
  ADD KEY `idx_usuario_setor_ativo` (`setor_id`,`ativo`);

--
-- Índices de tabela `usuario_tokens_lembrar`
--
ALTER TABLE `usuario_tokens_lembrar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_usuario_token_lembrar_seletor` (`seletor`),
  ADD KEY `idx_usuario_token_lembrar_usuario` (`usuario_id`),
  ADD KEY `idx_usuario_token_lembrar_expiracao` (`expira_em`);

--
-- Índices de tabela `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `subcategoria_id` (`subcategoria_id`),
  ADD KEY `criado_por` (`criado_por`);

--
-- Índices de tabela `video_familias`
--
ALTER TABLE `video_familias`
  ADD PRIMARY KEY (`video_id`,`familia_id`),
  ADD KEY `familia_id` (`familia_id`);

--
-- Índices de tabela `video_marcas`
--
ALTER TABLE `video_marcas`
  ADD PRIMARY KEY (`video_id`,`marca_id`),
  ADD KEY `idx_video_marcas_marca` (`marca_id`,`video_id`);

--
-- Índices de tabela `video_modelos`
--
ALTER TABLE `video_modelos`
  ADD PRIMARY KEY (`video_id`,`modelo_id`),
  ADD KEY `modelo_id` (`modelo_id`);

--
-- Índices de tabela `video_visualizacoes`
--
ALTER TABLE `video_visualizacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_visualizacao` (`video_id`,`usuario_id`,`concluido_em`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `assistente_interacao_fontes`
--
ALTER TABLE `assistente_interacao_fontes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT de tabela `assistente_interacoes`
--
ALTER TABLE `assistente_interacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de tabela `assistente_limites`
--
ALTER TABLE `assistente_limites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `assistente_respostas`
--
ALTER TABLE `assistente_respostas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `assistente_satisfacoes`
--
ALTER TABLE `assistente_satisfacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `category_terms`
--
ALTER TABLE `category_terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT de tabela `cidades`
--
ALTER TABLE `cidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `convites_usuarios`
--
ALTER TABLE `convites_usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `estados`
--
ALTER TABLE `estados`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `familias`
--
ALTER TABLE `familias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `frotas`
--
ALTER TABLE `frotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `master_categories`
--
ALTER TABLE `master_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de tabela `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de tabela `modelo_documentos`
--
ALTER TABLE `modelo_documentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT de tabela `normas_emissoes`
--
ALTER TABLE `normas_emissoes`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `perfis`
--
ALTER TABLE `perfis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `permissoes`
--
ALTER TABLE `permissoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT de tabela `service_priorities`
--
ALTER TABLE `service_priorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `service_reports`
--
ALTER TABLE `service_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `service_report_attachments`
--
ALTER TABLE `service_report_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `service_report_history`
--
ALTER TABLE `service_report_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `service_report_messages`
--
ALTER TABLE `service_report_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `service_report_satisfaction`
--
ALTER TABLE `service_report_satisfaction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `service_report_solutions`
--
ALTER TABLE `service_report_solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `setores`
--
ALTER TABLE `setores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuario_codigos_senha`
--
ALTER TABLE `usuario_codigos_senha`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario_tokens_lembrar`
--
ALTER TABLE `usuario_tokens_lembrar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `video_visualizacoes`
--
ALTER TABLE `video_visualizacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `assistente_interacao_fontes`
--
ALTER TABLE `assistente_interacao_fontes`
  ADD CONSTRAINT `fk_assistente_fonte_interacao` FOREIGN KEY (`interacao_id`) REFERENCES `assistente_interacoes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assistente_fonte_modelo` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assistente_fonte_video` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `assistente_interacoes`
--
ALTER TABLE `assistente_interacoes`
  ADD CONSTRAINT `fk_assistente_interacao_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assistente_interacao_resposta` FOREIGN KEY (`resposta_id`) REFERENCES `assistente_respostas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assistente_interacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `assistente_limites`
--
ALTER TABLE `assistente_limites`
  ADD CONSTRAINT `fk_assistente_limite_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_assistente_limite_usuario` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `assistente_respostas`
--
ALTER TABLE `assistente_respostas`
  ADD CONSTRAINT `fk_assistente_resposta_usuario` FOREIGN KEY (`criada_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `assistente_satisfacoes`
--
ALTER TABLE `assistente_satisfacoes`
  ADD CONSTRAINT `fk_assistente_satisfacao_interacao` FOREIGN KEY (`interacao_id`) REFERENCES `assistente_interacoes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_assistente_satisfacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `category_terms`
--
ALTER TABLE `category_terms`
  ADD CONSTRAINT `fk_category_term_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `master_categories` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `cidades`
--
ALTER TABLE `cidades`
  ADD CONSTRAINT `fk_cidade_estado` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`);

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_cliente_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `convites_usuarios`
--
ALTER TABLE `convites_usuarios`
  ADD CONSTRAINT `fk_convite_criador` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_convite_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_convite_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `fk_empresa_cidade` FOREIGN KEY (`cidade_id`) REFERENCES `cidades` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_empresa_pai` FOREIGN KEY (`empresa_pai_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `empresa_clientes`
--
ALTER TABLE `empresa_clientes`
  ADD CONSTRAINT `fk_empresa_cliente_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_empresa_cliente_criador` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_empresa_cliente_vw` FOREIGN KEY (`empresa_vw_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `familias`
--
ALTER TABLE `familias`
  ADD CONSTRAINT `fk_familia_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`);

--
-- Restrições para tabelas `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`visualizacao_id`) REFERENCES `video_visualizacoes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `frotas`
--
ALTER TABLE `frotas`
  ADD CONSTRAINT `fk_frota_cadastrado_por` FOREIGN KEY (`cadastrado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_frota_familia` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`),
  ADD CONSTRAINT `fk_frota_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `fk_frota_norma_emissao` FOREIGN KEY (`norma_emissao_id`) REFERENCES `normas_emissoes` (`id`),
  ADD CONSTRAINT `frotas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `frotas_ibfk_2` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`);

--
-- Restrições para tabelas `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  ADD CONSTRAINT `logs_auditoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `master_categories`
--
ALTER TABLE `master_categories`
  ADD CONSTRAINT `fk_master_category_priority` FOREIGN KEY (`prioridade_padrao_id`) REFERENCES `service_priorities` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelos_ibfk_1` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`);

--
-- Restrições para tabelas `modelo_documentos`
--
ALTER TABLE `modelo_documentos`
  ADD CONSTRAINT `fk_modelo_documento_modelo` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `modelo_especificacoes_tecnicas`
--
ALTER TABLE `modelo_especificacoes_tecnicas`
  ADD CONSTRAINT `fk_modelo_especificacao_modelo` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `notificacoes_lidas`
--
ALTER TABLE `notificacoes_lidas`
  ADD CONSTRAINT `fk_notificacao_lida_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `perfil_permissoes`
--
ALTER TABLE `perfil_permissoes`
  ADD CONSTRAINT `perfil_permissoes_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `perfil_permissoes_ibfk_2` FOREIGN KEY (`permissao_id`) REFERENCES `permissoes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `perfis`
--
ALTER TABLE `perfis`
  ADD CONSTRAINT `fk_perfil_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `service_reports`
--
ALTER TABLE `service_reports`
  ADD CONSTRAINT `fk_service_report_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `master_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_empresa` FOREIGN KEY (`empresa_cliente_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_familia` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_modelo` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_parent` FOREIGN KEY (`ticket_pai_id`) REFERENCES `service_reports` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_priority` FOREIGN KEY (`prioridade_id`) REFERENCES `service_priorities` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_responsavel` FOREIGN KEY (`responsavel_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_setor` FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_report_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `service_report_attachments`
--
ALTER TABLE `service_report_attachments`
  ADD CONSTRAINT `fk_service_attachment_message` FOREIGN KEY (`message_id`) REFERENCES `service_report_messages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_attachment_report` FOREIGN KEY (`report_id`) REFERENCES `service_reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_service_attachment_user` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `service_report_history`
--
ALTER TABLE `service_report_history`
  ADD CONSTRAINT `fk_service_history_report` FOREIGN KEY (`report_id`) REFERENCES `service_reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_service_history_responsavel_anterior` FOREIGN KEY (`responsavel_anterior_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_history_responsavel_novo` FOREIGN KEY (`responsavel_novo_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_history_setor_anterior` FOREIGN KEY (`setor_anterior_id`) REFERENCES `setores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_history_setor_novo` FOREIGN KEY (`setor_novo_id`) REFERENCES `setores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_service_history_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `service_report_messages`
--
ALTER TABLE `service_report_messages`
  ADD CONSTRAINT `fk_service_message_report` FOREIGN KEY (`report_id`) REFERENCES `service_reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_service_message_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `service_report_satisfaction`
--
ALTER TABLE `service_report_satisfaction`
  ADD CONSTRAINT `fk_service_satisfaction_report` FOREIGN KEY (`report_id`) REFERENCES `service_reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_service_satisfaction_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `service_report_solutions`
--
ALTER TABLE `service_report_solutions`
  ADD CONSTRAINT `fk_service_solution_report` FOREIGN KEY (`report_id`) REFERENCES `service_reports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_service_solution_user` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `setores`
--
ALTER TABLE `setores`
  ADD CONSTRAINT `fk_setor_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfis` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`unidade_id`) REFERENCES `unidades` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `usuario_codigos_senha`
--
ALTER TABLE `usuario_codigos_senha`
  ADD CONSTRAINT `fk_codigo_senha_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_empresas`
--
ALTER TABLE `usuario_empresas`
  ADD CONSTRAINT `fk_usuario_empresa_cadastrado_por` FOREIGN KEY (`cadastrado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_usuario_empresa_empresa` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_empresa_perfil` FOREIGN KEY (`perfil_id`) REFERENCES `perfis` (`id`),
  ADD CONSTRAINT `fk_usuario_empresa_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_marcas`
--
ALTER TABLE `usuario_marcas`
  ADD CONSTRAINT `fk_usuario_marcas_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_marcas_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_setores`
--
ALTER TABLE `usuario_setores`
  ADD CONSTRAINT `fk_usuario_setor_setor` FOREIGN KEY (`setor_id`) REFERENCES `setores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_usuario_setor_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `usuario_tokens_lembrar`
--
ALTER TABLE `usuario_tokens_lembrar`
  ADD CONSTRAINT `fk_usuario_token_lembrar_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `videos_ibfk_3` FOREIGN KEY (`criado_por`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `video_familias`
--
ALTER TABLE `video_familias`
  ADD CONSTRAINT `video_familias_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_familias_ibfk_2` FOREIGN KEY (`familia_id`) REFERENCES `familias` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `video_marcas`
--
ALTER TABLE `video_marcas`
  ADD CONSTRAINT `fk_video_marcas_marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_video_marcas_video` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `video_modelos`
--
ALTER TABLE `video_modelos`
  ADD CONSTRAINT `video_modelos_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_modelos_ibfk_2` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `video_visualizacoes`
--
ALTER TABLE `video_visualizacoes`
  ADD CONSTRAINT `video_visualizacoes_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `videos` (`id`),
  ADD CONSTRAINT `video_visualizacoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
