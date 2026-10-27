# Auditoria oficial do catálogo — 27/10/2026

## Critério

A auditoria comparou migrations e dump de referência do Drive Learn com páginas públicas oficiais dos fabricantes. Um veículo só foi tratado como linha brasileira quando a fonte oficial informou comercialização, homologação, operação ou apresentação no Brasil. Modelos apenas estrangeiros não foram promovidos para o catálogo brasileiro.

## Resultado por marca e segmento

| Marca | Caminhões | Ônibus | Vans | Resultado |
|---|---|---|---|---|
| VWCO | Linha existente conciliada; incluídos os Constellation 25.380 rígidos 6x2 e 8x2 | Incluídos e-Volksbus 18H e 22H; 22L já existia | Não auditado por decisão anterior do projeto | Novidades na migration 038 |
| Mercedes-Benz | Catálogo amplo já coberto pelas migrations 026/027 | Catálogo diesel e elétrico já coberto; nenhum novo chassi inequívoco encontrado | Sprinter/eSprinter já cobertas pela 032 | Sem duplicação |
| Volvo | FH, FM, FMX e VM já representados | B13R, BZR, BZL e BZRT já cobertos pela 028 | Sem linha brasileira oficial de vans | Sem mudança material |
| Scania | Linhas P/G/R/S já representadas | Série K Super, gás e elétrica já cobertas pela 029 | Sem linha brasileira oficial de vans | Sem mudança material |
| IVECO | Daily, Tector e S-Way cobertos | Linha IVECO BUS coberta pela 030 | Daily Furgão coberta pela 032 | Sem mudança material |
| DAF | Linhas XF e CF já cadastradas, inclusive CF PX-9 380 cv | Não possui linha brasileira de ônibus | Não possui linha brasileira de vans | Sem mudança material |
| BYD | T35 permanece como modelo anunciado; sem ficha brasileira completa para ativação técnica plena | D9A já existia; incluídos D9W, D9F e D11B brasileiros | Sem van comercial oficial no escopo brasileiro auditado | Novidades na migration 038 |
| Agrale | Incluída a linha A atual: A 8.700, A 10.000, A 10.000 4x4, A 11.000 Gás, A 15.000 e A 18.000 | Incluídos MA 9.2, MA 10.0, MA 11.0 Gás e MA 17.0 | Sem van convencional no portfólio auditado | Grande gap corrigido |
| Foton | Incluídos Aumark S 315/715/916/1217, Auman D 1722/1830/2632, eAumark 6T/9T/12T e eWonder | Nenhuma linha brasileira de ônibus publicada no catálogo oficial consultado | Incluídas eView Connect, eView Grand e eToano Pro | Grande gap corrigido |
| Ford | Sem caminhão pesado brasileiro atual | Sem chassi de ônibus atual | Transit e E-Transit já cobertas pelas 032/036 | Sem mudança material |
| Renault | Renault Trucks não foi tratado como linha comercial brasileira atual | Sem linha brasileira de ônibus | Kangoo e Master já cobertas pela 032 | Sem mudança material |
| Fiat | Sem caminhão no escopo | Ducato Minibus tratado como van | Ducato já coberta pelas 032/036 | Sem mudança material |
| Peugeot | Sem caminhão no escopo | Boxer Minibus tratado como van | Boxer já coberta pela 032 | Sem mudança material |
| Citroën | Sem caminhão no escopo | Jumper Minibus tratado como van | Jumper já coberta pela 032 | Sem mudança material |

## Registros deliberadamente não ativados

- Agrale A 26.000: a página oficial o classifica como **pré-venda**. Deve ser acompanhado, mas não foi cadastrado como linha homologada atual nesta migration.
- BYD eBus B12.b e B13: são referências internacionais existentes na base. Devem continuar claramente marcadas como catálogo internacional, sem confusão com homologação brasileira.
- MAN e Renault Trucks globais: não foram importados para o catálogo brasileiro sem evidência oficial de oferta nacional atual.

## Fontes oficiais principais

- [VWCO — novos Constellation 25.380](https://www.vwco.com.br/news/776)
- [VWCO — linha urbana/e-Volksbus](https://www.vwco.com.br/onibus/Urbano?id=5)
- [VWCO — início de venda do e-Volksbus 18H e 22H](https://www.vwco.com.br/news/814)
- [BYD Brasil — D9A](https://www.byd.com/br/noticias-byd-brasil/onibus-BYD-entra-em-teste-em-BH)
- [Marcopolo — BYD D9F](https://viajante.marcopolo.com.br/noticias/marcopolo-fornece-viaggio-1050-100-eletrico-para-fretamento-no-parana/)
- [Marcopolo — BYD D11B](https://www.marcopolo.com.br/sala-de-imprensa/byd-e-marcopolo-testarao-onibus-articulado-100-eletrico-em-curitiba)
- [Agrale — caminhões](https://www.agrale.com.br/pt/produtos/caminhoes)
- [Agrale — chassis para ônibus](https://www.agrale.com.br/pt/produtos/chassis-para-onibus)
- [Foton — catálogo brasileiro](https://fotondobrasil.com.br/veiculos)

## Arquivo para a HostGator

Execute somente depois da migration 037:

`database/migrations/20261027_038_auditoria_catalogo_segmentos.sql`

A migration não abre conexão externa, não grava diretamente na HostGator e pode ser executada novamente com segurança.
