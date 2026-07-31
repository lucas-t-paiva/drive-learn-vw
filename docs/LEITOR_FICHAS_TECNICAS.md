# Leitor de fichas técnicas

O cadastro de modelos possui a ação **Ler e preencher ficha**. Ela compara o
conteúdo de um PDF com os campos do formulário e apresenta uma revisão antes de
aplicar qualquer valor.

## Funcionamento padrão, sem custo

1. Abra **Modelos** e escolha **Novo modelo** ou **Editar**.
2. Em **Documentos técnicos**, selecione a ficha no campo **Ficha técnica
   completa**.
3. Clique em **Ler e preencher ficha**.
4. Revise os campos reconhecidos, a confiança e o trecho usado como evidência.
5. Marque somente o que deseja aplicar e clique em **Aplicar campos
   selecionados**.
6. Revise o formulário e salve o modelo.

No modo `local`, o PDF é lido no navegador por meio do PDF.js e as regras da
aplicação reconhecem motor, potência, torque, transmissão, PBT, PBTC, redução,
entre-eixos e demais especificações. Nenhum dado é enviado para uma API paga.
Valores já existentes permanecem protegidos, salvo quando o usuário marca
**Permitir substituir valores atuais**.

O leitor não grava o modelo automaticamente. A decisão final é sempre do
usuário que está cadastrando.

## Limites do modo local

- A ficha precisa possuir texto selecionável.
- Tabelas complexas podem exigir revisão manual.
- Medidas presentes somente em desenhos ou imagens não são inferidas.
- PDFs digitalizados sem camada de texto precisam do modo híbrido/OpenAI ou de
  um OCR externo.

Essa limitação é intencional: quando não há evidência textual segura, o sistema
deixa o campo em branco em vez de inventar um valor.

## Modo híbrido ou OpenAI

As configurações ficam em `.env.ai`:

```env
OPENAI_API_KEY=chave_do_projeto
MODEL_SHEET_READER_MODE=hybrid
MODEL_SHEET_READER_MODEL=gpt-5.6-luna
MODEL_SHEET_READER_MAX_CHARS=80000
MODEL_SHEET_READER_PDF_DETAIL=auto
```

Modos disponíveis:

- `local`: sempre gratuito e baseado nas regras locais.
- `hybrid`: usa as regras locais e chama a API somente quando o PDF tem pouco
  texto ou poucos campos são reconhecidos.
- `openai`: analisa a ficha pela API em todas as leituras.

Nos modos pagos, o servidor usa a Responses API. Quando necessário, envia o
PDF como `input_file`, permitindo que o modelo examine tanto o texto quanto as
imagens das páginas. A chave permanece somente no servidor e nunca é exposta
ao JavaScript do navegador.

`MODEL_SHEET_READER_PDF_DETAIL` aceita `low`, `auto` ou `high`. Use `low` para
reduzir tokens; use `high` para tabelas densas e desenhos pequenos. O modo
`auto` é o equilíbrio recomendado.

Mesmo com IA, todos os valores passam pela mesma tela de revisão e não são
salvos automaticamente.

## Implantação

Além dos arquivos PHP, JavaScript e CSS, publique:

- `public/assets/vendor/pdfjs/pdf.min.mjs`
- `public/assets/vendor/pdfjs/pdf.worker.min.mjs`
- `public/assets/vendor/pdfjs/LICENSE`

O `.htaccess` inclui o tipo MIME necessário para módulos `.mjs`.

