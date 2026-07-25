# Atualizações do banco para a HostGator

Faça um backup antes de importar. No phpMyAdmin, selecione o banco correto e importe os arquivos em ordem crescente:

1. `20260718_001_multimarcas.sql` — estrutura e permissões de marcas/frota multimarcas.
2. `20260718_002_catalogo_tecnico_concorrentes.sql` — famílias, versões e especificações técnicas oficiais de IVECO, Volvo, Mercedes-Benz e Scania.
3. `20260718_003_imagens_oficiais_modelos.sql` — caminhos e fontes das imagens oficiais das famílias e modelos concorrentes.
4. `20260718_004_onibus_eletricos_byd_mercedes.sql` — marca BYD, ônibus elétricos BYD e Mercedes-Benz, imagens e especificações técnicas oficiais.
5. `20260718_005_catalogo_tecnico_comparador.sql` — acesso ao catálogo técnico e comparador para Administrador Master, Administrador da Empresa, Assistência Técnica e Comercial VWCO.
6. `20260718_006_revisao_catalogo_tecnico_entreeixos.sql` — revisão técnica, fichas IVECO Daily separadas, entre-eixos e base normalizada para consultas inteligentes.
7. `20260718_007_notificacoes_acoes_massa.sql` — registro de leitura da central de notificações; as ações em massa de modelos utilizam as tabelas existentes.
8. `20260725_008_modelos_importacao_pesos_reducao.sql` — separa PBT e PBTC, adiciona relação de redução e prepara o cadastro de modelos para importação e exportação.
9. `20260725_009_catalogo_onibus_multimarcas.sql` — adiciona famílias e modelos de ônibus Mercedes-Benz, Volvo, Scania e IVECO BUS, com dados auditados e fichas técnicas oficiais locais.
10. `20260725_010_tipo_veiculo_familias_frotas.sql` — classifica famílias e composições de frota como caminhão ou ônibus e cria os índices usados pelos novos filtros.
11. `20260725_011_lembrar_login.sql` — cria os tokens seguros e revogáveis utilizados pela opção “Lembrar de mim”.
12. `20260725_012_recuperacao_senha_email.sql` — cria os códigos de recuperação de senha com expiração, limite de tentativas e uso único.

Cada arquivo registra sua versão em `schema_migrations`. Os arquivos foram preparados para uma única importação; não edite nem pule a ordem.

O catálogo técnico grava exclusivamente fontes classificadas como `ficha_tecnica`. Nenhum manual de proprietário ou de operação é cadastrado por essas migrações.

Nas atualizações 003 e 004, envie também os arquivos novos de `public/assets/images/modelos` para o mesmo caminho na hospedagem antes de abrir o catálogo.

Na atualização 009, envie também os novos arquivos PDF de `public/assets/documents/modelos` para o mesmo caminho na hospedagem. Os PDFs são fichas técnicas oficiais dos fabricantes; não são manuais.

A atualização 004 diferencia no campo `mercado` o BYD D9A e o Mercedes-Benz eO500U disponíveis no Brasil dos BYD B12.b e B13 cadastrados como referências do catálogo internacional.
