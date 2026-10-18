# Auditoria multimarcas do catalogo - 16/10/2026

A varredura comparou o catalogo local com paginas, releases e fichas publicas oficiais. A migracao e idempotente e nao altera a HostGator automaticamente.

- Modelos incluidos ou complementados: **19**.
- Produtos comerciais ativos: **10**.
- Anuncios futuros/prototipos mantidos inativos: **8**.
- Novas fichas locais: **3**.
- Novas imagens oficiais locais: **10**.

## Resultado por marca

- **VWCO:** e-Delivery 12/17, Constellation 26.280 Biometano e 33.540; familia Ultra registrada como anuncio futuro.
- **Mercedes-Benz:** eO500UA comercial e eCity previsto para 2027.
- **IVECO:** eDaily 3,5/4,25/7,2 t, Tector NG e S-Way NG.
- **BYD:** T35 registrado inativo ate confirmacao de venda/homologacao brasileira.
- **Volvo:** BZR 6x2 complementado com capacidade, autonomia, bateria e recarga divulgadas no Brasil.
- **Scania:** linha Super, eletricos 4x2/6x2 e gas ja cobertos pela migracao 029; nenhum modelo adicional comprovado.
- **DAF:** linha brasileira atual continua CF/XF/Vocacional ja coberta; nenhum modelo comercial novo comprovado.

## Arquivo a importar

`database/migrations/20261016_031_atualizacao_catalogo_multimarcas.sql`

Envie junto as novas imagens em `public/assets/images/modelos/` e fichas em `public/assets/documents/modelos/`.

## Regras de confiabilidade

- Nao foi convertido CMT em PBTC e nenhum peso foi deduzido pela soma de eixos.
- Campos ausentes na fonte permaneceram vazios e receberam observacao explicita.
- A ficha internacional do BYD T35 foi marcada como referencia, nao como homologacao brasileira.
- Imagens foram baixadas de paginas oficiais e armazenadas sem dependencia de hotlink.
