# Revisão do catálogo técnico — 18/07/2026

## Critérios adotados

- Especificações corrigidas somente quando havia ficha técnica ou página oficial do fabricante.
- Documentos são fichas de especificações técnicas, não manuais de operação.
- Imagens repetidas entre versões foram classificadas como representativas da família.
- Cadastros genéricos redundantes foram desativados somente quando não possuíam vínculos com frotas ou vídeos.
- Dados ainda sem ficha específica foram mantidos e sinalizados como pendentes, em vez de apresentados como conferidos.

## Correções IVECO Daily

| Modelo | PBT | Entre-eixos | Documento local |
|---|---:|---:|---|
| Daily 30-160 | 3.500 kg | 3.750 mm | páginas específicas 1–2 |
| Daily 35-160 | 3.500 kg | 3.520 ou 3.750 mm | páginas específicas 3–4 |
| Daily 35-180 Hi-Matic | 3.500 kg | 3.520 ou 3.750 mm | páginas específicas 3–4 |
| Daily 45-160 | 4.400 kg | 3.520 ou 3.750 mm | páginas específicas 5–6 |
| Daily 45-180 Hi-Matic | 4.400 kg | 3.520 ou 3.750 mm | páginas específicas 5–6 |
| Daily 55-180 | 5.300 kg | 3.520 ou 3.750 mm | páginas específicas 7–8 |
| Daily 65-180 | 6.500 kg | 4.350 mm | páginas específicas 11–12 |

Todas as versões acima foram classificadas como **chassi-cabine**. As imagens foram extraídas da própria ficha técnica oficial correspondente ao modelo ou grupo de versões.

## VW Delivery Express

- Entre-eixos: **3.000 ou 3.600 mm**.
- PBT homologado: **3.500 kg**.
- Fonte: ficha técnica oficial VWCO, edição 04/2026, já armazenada no projeto.

## Integridade e transparência das imagens

As imagens oficiais compartilhadas por várias configurações de Tector, Accelo, Atego, Arocs, Axor, Scania G/R/S e Volvo FH/FM/FMX/VM receberam a indicação “Imagem oficial representativa da família; configuração visual pode variar”. Isso evita afirmar que uma foto de família representa exatamente distância entre-eixos, tração, cabine ou implemento de cada versão.

## Cadastros genéricos retirados do catálogo

Foram desativados 13 registros redundantes e sem vínculos: cinco Tector genéricos, Volvo FH/FMX/VM genéricos, Mercedes-Benz Atego/Arocs genéricos e Scania G/R/S genéricos. As versões técnicas específicas permanecem ativas.

## Pendências explícitas

S-Way Natural 460 6x2, Scania XT e Scania Gás continuam cadastrados, porém marcados como “Pendente de ficha técnica específica”. Não devem ser utilizados como referência conclusiva até uma ficha oficial da configuração ser vinculada.

## Base para lookup inteligente

A migração `20260718_006` cria `modelo_especificacoes_tecnicas`, com valor, unidade, fonte e data de conferência. A estrutura permite que uma futura busca inteligente responda perguntas objetivas sem depender de texto livre ou inferência do modelo de IA.
