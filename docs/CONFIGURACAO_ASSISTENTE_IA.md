# Configuração do Assistente Drive Learn

## 1. Atualize o banco da HostGator

Execute, uma única vez:

`database/migrations/20260728_014_assistente_voz_conhecimento.sql`

Depois execute:

`database/migrations/20260729_015_assistente_fontes_acoes_catalogo.sql`

As migrations adicionam a transcrição aos vídeos, criam o histórico/cache e preservam uma cópia das transcrições e especificações utilizadas em cada resposta.

## 2. Configure a OpenAI no servidor

Copie `.env.ai.example` para `.env.ai` na raiz do projeto e preencha:

```env
OPENAI_API_KEY=sua_chave
ASSISTANT_MODE=local
OPENAI_TEXT_MODEL=gpt-5.6-luna
OPENAI_TRANSCRIBE_MODEL=gpt-realtime-whisper
OPENAI_TIMEOUT=45
ASSISTANT_DAILY_LIMIT=40
ASSISTANT_MAX_INPUT_TOKENS=4000
ASSISTANT_MAX_OUTPUT_TOKENS=800
```

Não envie `.env.ai` ao GitHub e não exponha a chave no navegador. A chamada à API é feita somente pelo PHP no servidor.

### Modos disponíveis

- `ASSISTANT_MODE=local`: não gera respostas com a OpenAI. Usa banco, transcrições, regras, filtros e cache.
- `ASSISTANT_MODE=hybrid`: usa consultas locais para filtros e comparações; chama a IA somente quando a interpretação for necessária. Sem uma chave configurada, utiliza automaticamente a resposta local.
- `ASSISTANT_MODE=openai`: utiliza a IA para toda resposta inédita, mantendo cache e rastreabilidade.

No Chrome e em navegadores compatíveis, a fala pode ser convertida em texto pelo reconhecimento do próprio navegador. Quando esse recurso não existir, o sistema utiliza a API de transcrição configurada.

## 3. Prepare os vídeos

No cadastro ou na edição de um vídeo, preencha **Legenda ou transcrição para o assistente**:

- YouTube: copie a legenda, revise e cole no campo.
- Arquivo próprio: transcreva o conteúdo, revise e cole no campo.
- Confirme nomes de funções, versões, botões, avisos e procedimentos.

Somente vídeos publicados e acessíveis ao usuário são usados como fonte.

No modo local, a resposta seleciona os trechos mais relacionados da transcrição sem criar informações novas. Quanto melhor estiver a transcrição, melhor será a consulta gratuita.

## Consultas do sistema

O assistente também consulta dados agregados da frota, sempre respeitando o escopo do usuário. Exemplos:

- `Qual marca possui mais veículos cadastrados em São Paulo?`
- `Quais são os três clientes que mais possuem veículos Volkswagen?`
- `Mostre as marcas com maior presença na frota do meu escopo.`

No modo local ou híbrido, os rankings são calculados diretamente pelo SQL. No modo OpenAI, os mesmos dados agregados são enviados como contexto para uma explicação em linguagem natural.

Clientes visualizam somente a própria empresa. Usuários VWCO, concessionárias, assistência técnica e administradores visualizam apenas os clientes retornados pelas regras de acesso já existentes.

O termo “em alta” é interpretado como **maior quantidade atualmente cadastrada na frota**. Para analisar crescimento ao longo do tempo será necessário criar snapshots históricos da frota.

## 4. Teste

1. Entre com um usuário que possua acesso à biblioteca.
2. Clique em **Fale comigo :)**.
3. Faça uma pergunta por texto.
4. Autorize o microfone e teste uma pergunta de até 1 minuto.
5. Confirme a leitura em voz alta no navegador/celular.
6. Verifique os registros em `assistente_interacoes` e `assistente_respostas`.
7. Confira as fontes e transcrições preservadas em `assistente_interacao_fontes`.

Para segurança, o assistente orienta o uso com o veículo parado e não deve inventar instruções quando a fonte for insuficiente.
