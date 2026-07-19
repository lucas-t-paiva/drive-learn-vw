# Atualizações do banco para a HostGator

Faça um backup antes de importar. No phpMyAdmin, selecione o banco correto e importe os arquivos em ordem crescente:

1. `20260718_001_multimarcas.sql` — estrutura e permissões de marcas/frota multimarcas.
2. `20260718_002_catalogo_tecnico_concorrentes.sql` — famílias, versões e especificações técnicas oficiais de IVECO, Volvo, Mercedes-Benz e Scania.
3. `20260718_003_imagens_oficiais_modelos.sql` — caminhos e fontes das imagens oficiais das famílias e modelos concorrentes.
4. `20260718_004_onibus_eletricos_byd_mercedes.sql` — marca BYD, ônibus elétricos BYD e Mercedes-Benz, imagens e especificações técnicas oficiais.
5. `20260718_005_catalogo_tecnico_comparador.sql` — acesso ao catálogo técnico e comparador para Administrador Master, Administrador da Empresa, Assistência Técnica e Comercial VWCO.
6. `20260718_006_revisao_catalogo_tecnico_entreeixos.sql` — revisão técnica, fichas IVECO Daily separadas, entre-eixos e base normalizada para consultas inteligentes.
7. `20260718_007_notificacoes_acoes_massa.sql` — registro de leitura da central de notificações; as ações em massa de modelos utilizam as tabelas existentes.

Cada arquivo registra sua versão em `schema_migrations`. Os arquivos foram preparados para uma única importação; não edite nem pule a ordem.

O catálogo técnico grava exclusivamente fontes classificadas como `ficha_tecnica`. Nenhum manual de proprietário ou de operação é cadastrado por essas migrações.

Nas atualizações 003 e 004, envie também os arquivos novos de `public/assets/images/modelos` para o mesmo caminho na hospedagem antes de abrir o catálogo.

A atualização 004 diferencia no campo `mercado` o BYD D9A e o Mercedes-Benz eO500U disponíveis no Brasil dos BYD B12.b e B13 cadastrados como referências do catálogo internacional.
