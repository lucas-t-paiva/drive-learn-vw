# Sincronização técnica Mercedes-Benz

O Drive Learn possui um coletor para localizar chassis de caminhões e ônibus nas páginas públicas da Mercedes-Benz, baixar suas fichas técnicas oficiais e gerar uma migração SQL auditável.

## Como funciona

1. O coletor abre as páginas públicas das linhas Mercedes-Benz.
2. Descobre somente páginas de produtos dos domínios permitidos.
3. Lê o endereço da ficha técnica que já está presente no HTML público.
4. Baixa somente arquivos PDF de domínios oficiais previamente autorizados no código.
5. Valida a assinatura `%PDF`, calcula SHA-256 e evita arquivos duplicados.
6. Extrai campos técnicos do documento e gera um manifesto JSON para revisão.
7. Gera uma migração idempotente para a HostGator.

O processo **não preenche nem envia o formulário comercial**, não aceita termos em nome de terceiros e não cria leads fictícios. O formulário apenas controla a exibição visual de links que já constam no HTML público.

## Executar

Na raiz do projeto:

```powershell
python scripts/sync_mercedes_technical_catalog.py
```

Para inventariar sem baixar PDFs:

```powershell
python scripts/sync_mercedes_technical_catalog.py --no-download
```

## Arquivos gerados

- PDFs: `public/assets/documents/modelos/`
- Manifesto de auditoria: `output/mercedes-sync/mercedes-technical-catalog-AAAAMMDD.json`
- Migração: `database/migrations/AAAAMMDD_027_sincronizacao_mercedes_chassis.sql`

## Aplicação na HostGator

1. Faça backup do banco publicado.
2. Abra o manifesto e revise os registros com `error` ou campos vazios.
3. Suba a pasta `public/assets/documents/modelos/`, preservando os nomes dos arquivos.
4. Importe a migração pelo phpMyAdmin.
5. Confira alguns modelos de cada família no cadastro e no Catálogo Técnico.

A migração completa campos vazios, mantém valores já revisados manualmente e usa `ON DUPLICATE KEY UPDATE` nos vínculos normalizados. Ela não apaga modelos nem documentos existentes.

## Limitações esperadas

- A Mercedes pode alterar ou remover um endereço de PDF sem aviso.
- Alguns folhetos usam fontes cuja extração de texto troca acentos por separadores. O coletor normaliza os valores salvos.
- Campos que não aparecem de forma inequívoca na ficha ficam vazios; o coletor não inventa especificações.
- Antes de publicar em produção, os dados devem passar pela revisão técnica indicada no manifesto.
