# Auditoria técnica do catálogo de modelos

Data da conferência: 31/07/2026  
Base analisada: `luc66510_drive-learn-vw (3).sql`, exportada da HostGator em 31/07/2026 às 00:24.

## Escopo

A auditoria cobriu todos os registros existentes na base:

- 143 modelos;
- 36 famílias;
- 7 marcas com modelos cadastrados: BYD, DAF, IVECO, Mercedes-Benz, Scania, Volkswagen Caminhões e Ônibus e Volvo;
- 1.734 linhas existentes em `modelo_especificacoes_tecnicas`.

Foram revisados os campos principais de `modelos`, o JSON `especificacoes`, a tabela normalizada `modelo_especificacoes_tecnicas` e os vínculos de `modelo_documentos`.

## Critério técnico adotado

Os dados foram confrontados com páginas de produto, folhetos e fichas técnicas publicados pelos fabricantes. Não foram usados manuais de proprietário como fonte de especificação.

As grandezas abaixo foram mantidas separadas:

- PBT: peso bruto total do veículo;
- PBTC: peso bruto total combinado homologado;
- CMT: capacidade máxima de tração.

CMT não foi copiada para PBTC. Quando a fabricante divulga CMT, mas não declara PBTC, o catálogo registra, por exemplo, `Não publicado (CMT 60.000 kg)`.

Também não foi criado um número artificial para modelos configuráveis. Nesses casos foi usado um dos estados técnicos:

- `Não se aplica`: a grandeza não se aplica ao tipo de veículo ou propulsão;
- `Não publicado na ficha oficial`: a fonte consultada não declara o dado;
- `Conforme configuração do chassi`: o resultado depende de eixos, cabine, implementação ou homologação;
- `Conforme homologação da carroceria`: aplicável principalmente a chassis de ônibus.

Esses estados eliminam campos vazios sem transformar ausência de informação em uma especificação falsa.

## Resultado

Após a aplicação da migration, nenhum dos 143 modelos fica com os campos técnicos auditados em branco:

- PBT, PBTC e CMT;
- motor, potência, torque e transmissão já existentes, com complementação dos vazios de torque/transmissão;
- relação de redução;
- entre-eixos e comprimento;
- energia/propulsão, bateria, autonomia e carregamento;
- capacidade de passageiros;
- configuração/tração e tipo de carroceria;
- tipo de veículo e norma de emissões;
- mercado/aplicação;
- fonte oficial e data da conferência.

Os mesmos valores são sincronizados em:

1. colunas principais de `modelos`;
2. JSON `modelos.especificacoes`;
3. `modelo_especificacoes_tecnicas`.

Isso evita diferenças entre cadastro, tabela, catálogo técnico, comparador e consultas do assistente.

## Correções relevantes

- `Novo Constellation 27.320 6x4`: removida a associação indevida com a ficha do Constellation 33.480; conferidos PBT de 23.000 kg, PBTC/CMT de 36.000 kg, reduções 4,88:1 e 5,29:1 e entre-eixos 4.800/5.940 mm.
- `Constellation 33.480 6x4`: preservada a ficha específica do modelo e registrado CMT de 125.000 kg.
- `Meteor 6x4 28.480HD`: nome e configuração corrigidos para `Novo Meteor Highline 28.480HD 6x2`.
- Caminhões Volkswagen anteriormente classificados no JSON como ônibus foram corrigidos para caminhão e chassi-cabine.
- IVECO Daily: CMT permaneceu separada de PBTC.
- IVECO S-Way 480 4x2: PBT 16.000 kg, PBTC 46.000 kg, CMT 60.000 kg e redução 2,85:1.
- IVECO S-Way 480 6x2: PBT 23.000 kg, PBTC 58.500 kg, CMT 60.000 kg e redução 3,08:1, com 2,85:1 opcional.
- IVECO S-Way 540 6x4: PBT 23.000 kg, PBTC 74.000 kg, CMT 80.000 kg e redução 3,07:1.
- Mercedes-Benz Accelo: transmissões e entre-eixos complementados por versão.
- Mercedes-Benz Atego 1719: torque complementado em 700 Nm.
- Volvo FM 380 6x2R: torque complementado em 1.815 Nm a 830–1.400 rpm, além de PBT, CMT, redução e entre-eixos.
- Linhas Scania P/G/R/S sem configuração completa de eixos permaneceram identificadas como configuráveis, evitando atribuir PBT ou PBTC de outra versão.

## Fichas técnicas locais

Foram incluídas ou atualizadas fichas oficiais na pasta:

`public/assets/documents/modelos`

Entre os novos vínculos estão:

- Volkswagen Constellation 27.320 e 33.480;
- BYD BC10LE;
- DAF CF FTS/FAS;
- IVECO Daily, Tector Semipesados e S-Way 480/540;
- Scania R 540;
- Volvo FH, FM, FMX e VM.

Algumas linhas configuráveis são apresentadas oficialmente apenas em páginas de produto ou em fichas por configuração, não por cada combinação comercial do nome. Nesses casos a URL oficial permanece registrada e não foi criado um PDF fictício.

## Arquivos gerados

- Migration: `database/migrations/20260731_025_auditoria_tecnica_modelos.sql`
- Planilha de conferência: `database/audits/20260731_modelos_especificacoes_conferidas.csv`
- Gerador reproduzível: `scripts/generate_model_completion_migration.py`
- Auditor do dump: `scripts/audit_model_dump.py`

## Aplicação na HostGator

1. Faça backup do banco.
2. Envie a pasta `public/assets/documents/modelos` para o mesmo caminho da hospedagem.
3. Importe `database/migrations/20260731_025_auditoria_tecnica_modelos.sql` no banco correto.
4. Confirme que a consulta exibida ao final da importação retorna `0` em `modelos_com_campos_principais_vazios`.
5. Confira no catálogo, no comparador e na edição de modelos pelo menos um caminhão, um ônibus e um veículo elétrico.

A migration usa transação, tabelas temporárias, `JSON_SET` e `INSERT ... ON DUPLICATE KEY UPDATE`, compatíveis com MySQL 5.7+ e MariaDB 10.2+. Ela também registra `20260731_025_auditoria_tecnica_modelos` em `schema_migrations`.

## Observação sobre imagens

Esta entrega é uma auditoria de dados e fichas técnicas. O dump contém nove modelos sem imagem cadastrada; esses registros foram mantidos para uma revisão visual separada, porque imagem aproximada ou de versão diferente não atende ao mesmo nível de confiabilidade exigido para as especificações.
