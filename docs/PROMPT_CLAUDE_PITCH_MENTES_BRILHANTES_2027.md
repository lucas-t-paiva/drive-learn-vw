# Prompt para apresentação — Mentes Brilhantes 2027

Crie uma apresentação executiva e comercial, em português do Brasil, com exatamente 8 slides, para uma banca avaliadora do programa Mentes Brilhantes 2027. O projeto se chama **Drive Learn** e já está desenvolvido, em produção e sendo utilizado por concessionária, fábrica e um cliente piloto em Belo Horizonte. A apresentação deve convencer a banca de que a solução gera valor real para a Volkswagen Caminhões e Ônibus, aproxima fábrica, rede, clientes e motoristas e transforma conhecimento disperso e relatos de campo em decisões mais rápidas.

## Tese central

O Drive Learn cria uma camada inteligente sobre o ciclo de vida dos caminhões e ônibus. Ele organiza o catálogo técnico multimarcas, entrega treinamentos associados ao contexto exato do veículo, responde dúvidas em linguagem natural e transforma falhas ou sugestões relatadas no campo em chamados estruturados para engenharia e pós-venda. Cada interação pode gerar conhecimento reutilizável, reduzir retrabalho e acelerar a resposta ao cliente.

O projeto está alinhado à direção atual da VWCO e do Grupo TRATON: conectividade, uso de dados, inteligência artificial, disponibilidade operacional, manutenção preditiva, capacitação contínua, segurança e serviços digitais. A proposta deve ser apresentada como uma extensão complementar ao ecossistema RIO e VolksCare, e não como substituição dessas plataformas.

## Problemas que motivaram o projeto

- Informações técnicas ficam espalhadas em fichas, portais, vídeos e conhecimento informal.
- O motorista precisa de uma resposta simples no momento da dúvida, sem procurar em vários documentos.
- Treinamentos genéricos não consideram família, modelo, versão, sistema ou função específica.
- Relatos de falhas e melhorias chegam incompletos, sem categoria, contexto do veículo ou encaminhamento claro.
- A recorrência de problemas de campo demora a se transformar em padrão visível para engenharia e pós-venda.
- Comparações entre veículos e marcas exigem pesquisa manual e podem usar dados desatualizados.

## Escopo da solução

### Catálogo técnico

Base estruturada de caminhões, ônibus e vans com famílias, modelos, versões, motor, potência, torque, transmissão, PBT, PBTC, entre-eixos, redução de eixo, energia, bateria, autonomia, imagens, preços oficiais quando publicados e fichas técnicas. Permite filtros dinâmicos, pesquisa em qualquer parte do texto e comparação de até cinco veículos de diferentes marcas.

Uma automação verifica, a cada 10 dias, os portfólios públicos oficiais das fabricantes. Ela procura novos modelos, versões, documentos, imagens, preços e especificações antes ausentes. As mudanças verificadas geram atualizações controladas e migrations SQL, preservando fonte e data da consulta.

### Treinamentos contextualizados

Cada treinamento pode ser vinculado a uma marca, família, modelo, sistema ou função do veículo. A produção pode combinar roteiro assistido por IA, voz, vídeo e câmeras adequadas ao procedimento. Um exemplo é a inspeção de valeta, na qual o conteúdo acompanha cada ponto do caminhão ou ônibus e transforma um procedimento técnico em aprendizado visual e aplicável.

### Assistente inteligente e Service Desk

O usuário pode perguntar por voz ou texto, buscar treinamentos, consultar especificações e comparar veículos. O assistente usa a base aprovada antes de recorrer a processamento externo. Também conduz o relato de falhas e sugestões, pergunta o contexto necessário, identifica marca, família e modelo quando aplicável, transcreve áudio, categoriza o relato e encaminha ao setor responsável.

O Service Desk registra protocolo, prioridade, SLA, responsável, histórico, transferências, comentários, anexos, soluções propostas e solução aplicada. O ciclo continua até a conclusão e pode retornar ao usuário com notificação e pesquisa de satisfação.

## Público envolvido

- Motoristas e clientes obtêm respostas rápidas, treinamento no contexto correto e acompanhamento dos relatos.
- Concessionárias recebem chamados mais completos e acesso organizado ao conhecimento técnico.
- Pós-venda acompanha recorrência, SLA, solução e impacto na disponibilidade.
- Engenharia recebe evidências categorizadas do uso real do produto.
- Fábrica identifica padrões, oportunidades de melhoria e necessidades de capacitação.
- Gestores visualizam dados consolidados respeitando empresa, perfil e permissão.

## Benefícios para a VWCO

- Menor tempo para localizar informação técnica confiável.
- Capacitação contínua vinculada ao veículo e à necessidade do usuário.
- Relatos de campo estruturados desde a origem.
- Histórico rastreável entre cliente, concessionária, pós-venda e engenharia.
- Reutilização de respostas aprovadas e conhecimento já produzido.
- Identificação de recorrências que podem orientar melhorias de produto e processo.
- Maior proximidade com o motorista e percepção de acompanhamento da marca.
- Base preparada para integração futura com RIO, telemetria, SSO e modelos preditivos.

Não invente percentuais de economia, redução de falhas ou retorno financeiro. Trate esses indicadores como metas a medir na expansão do piloto.

## Estrutura obrigatória dos 8 slides

1. **Capa** — Drive Learn, inteligência aplicada ao ciclo real do veículo. Mentes Brilhantes 2027. Subtítulo: conhecimento técnico, capacitação e voz do campo em uma plataforma.
2. **Por que o projeto existe** — Mostre as dores atuais e o efeito operacional de informação dispersa, treinamento genérico e relatos sem estrutura.
3. **Ecossistema conectado** — Mostre cliente, motorista, concessionária, pós-venda, engenharia e fábrica conectados pelo Drive Learn. A plataforma deve aparecer como ponte e memória comum.
4. **Três módulos principais** — Catálogo técnico, treinamentos contextualizados e assistente inteligente com Service Desk. Explique o papel de cada módulo sem excesso de texto.
5. **Como a inteligência funciona** — Ciclo visual: fontes oficiais e fichas técnicas; validação e base estruturada; busca, comparação e treinamento; relato inteligente; análise de recorrência; melhoria que retorna ao usuário.
6. **Valor para a VWCO** — Relacione disponibilidade, eficiência, segurança, aprendizagem, proximidade com o cliente e inteligência de produto. Posicione o Drive Learn como complemento ao RIO e VolksCare.
7. **Produto em funcionamento** — Reserve espaço para três imagens reais do sistema: Catálogo Técnico, Assistente e Service Desk. Informe que a solução está em produção e possui uso por concessionária, fábrica e cliente piloto em Belo Horizonte.
8. **Próximo passo** — Proponha a expansão controlada do piloto, definição de indicadores, governança de dados e avaliação de integrações com o ecossistema VWCO. Feche com uma decisão clara: patrocinar a evolução do piloto para uma solução escalável.

## Direção visual

- Formato 16:9, visual corporativo, tecnológico e sóbrio.
- Use azul-marinho `#001E50`, azul `#0068A9`, azul-claro `#E7F5FB`, branco e cinza claro.
- Tipografia sem serifa, títulos grandes e pouco texto por slide.
- Utilize fotografias de caminhões e ônibus apenas quando ajudarem a narrativa.
- Evite excesso de cartões, slogans genéricos e ilustrações futuristas sem relação com o produto.
- O slide 7 deve funcionar como uma área de evidência visual, com três capturas grandes e legendas curtas.
- Use notas do apresentador para aprofundar o argumento sem poluir os slides.

## Referências estratégicas oficiais

- Plataforma RIO: https://www.vwco.com.br/servicos/Solu%C3%A7%C3%B5es%20de%20Servi%C3%A7o%20ao%20Cliente/Plataforma%20RIO?id=15&productid=113
- Relatório de Sustentabilidade VWCO 2025: https://sustentabilidade.vwco.com.br/
- VolksCare e Volks|Uptime: https://www.vwco.com.br/news/604
- RIO Remote Diagnosis: https://www.vwco.com.br/news/735
- Volks|Care School com IA e telemetria: https://www.vwco.com.br/news/814
- Ecossistema de veículos conectados TRATON: https://traton.com/en/newsroom/stories/standardizing-connected-vehicle-data-for-future-innovation.html
- Digitalização e manutenção preditiva TRATON: https://traton.com/en/topics/digitalization.html

Entregue um arquivo PowerPoint editável. Não apresente o projeto como uma ideia inicial. Ele já possui produto funcional e piloto real, mas ainda precisa medir os resultados da expansão com indicadores definidos em conjunto com a VWCO.
