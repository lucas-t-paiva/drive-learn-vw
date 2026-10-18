# Auditoria do catálogo de ônibus - 16/09/2026

Pesquisa baseada prioritariamente em páginas e documentos públicos oficiais das fabricantes. As migrações são idempotentes, preenchem lacunas e preservam valores válidos existentes.

| Marca | Famílias | Modelos | Comerciais | Futuro/conceito | Documentos vinculados |
|---|---:|---:|---:|---:|---:|
| Volvo | 5 | 18 | 18 | 0 | 16 |
| Scania | 4 | 21 | 21 | 0 | 17 |
| IVECO | 3 | 8 | 5 | 3 | 6 |

## Regras técnicas aplicadas

- Peso/tara do chassi não foi convertido em PBT.
- A soma da capacidade dos eixos não foi usada para inventar PBT ou PBTC.
- Torque no motor e torque nas rodas permanecem identificados separadamente.
- O Volvo B510R mantém a denominação comercial, mas a ficha oficial declara motor D13K500 com 500 hp.
- Modelos anunciados para 2027, em validação ou conceituais são criados inativos.
- Quando a página oficial não publicou a ficha completa, somente os dados expressamente divulgados foram cadastrados.

## Ordem de importação

1. `20260916_028_catalogo_onibus_volvo.sql`
2. `20260916_029_catalogo_onibus_scania.sql`
3. `20260916_030_catalogo_onibus_iveco.sql`

Envie também os PDFs novos de `public/assets/documents/modelos/`. Não é necessário executar novamente as migrações Mercedes-Benz 026 ou 027 para esta atualização.

## Fontes principais

- Volvo B13R: https://www.volvobuses.com/br/fretamento-e-rodoviario/volvo-b13r/specifications.html
- Volvo BZR/BZRT/BZL: https://www.volvobuses.com/br/Rodoviario/volvo-bzr-electric/specifications.html
- Volvo B320R B100: https://www.volvogroup.com/br/news-and-media/news/2026/jul/chassi-b320r-6x2-b100-flex-amplia-a-oferta-volvo-para-a-descarbo.html
- Scania rodoviários/Super: https://www.scania.com/br/pt/home/products/onibus/chassi-rodoviario/especificacoetecnicas.html
- Scania urbanos: https://www.scania.com/br/pt/home/products/onibus/chassi-urbano.html
- IVECO chassis atuais: https://www.ivecobus.com/latam-pt/chassi-onibus
- IVECO lançamentos 2026: https://www.ivecogroup.com/media/brand_press_releases/2026/SOUTH-AMERICA-(BR-PORTUG)/Iveco-Bus/iveco_bus_anuncia_investimento_de_r_150_milhes_e_amplia_portflio_paraacelerar_crescimento_na_amrica_latina_20260811T151057T911_krk3a2jwbotf1semw3w5wujl
