# Prompt para o Codex — Módulo Benchmark do Drive Learn

Implemente neste repositório um módulo completo de Benchmark e Inteligência de Produto integrado ao Drive Learn existente. Execute o desenvolvimento; não se limite a sugerir arquitetura ou entregar telas estáticas.

## 1. Contexto e objetivo

Já existem cadastros de marcas, famílias, modelos e outros módulos. Reaproveite esses registros, seus IDs, componentes, layouts, navegação, autenticação, permissões, APIs, armazenamento e padrões de código. Não recrie uma base paralela de veículos.

O novo módulo compara equipamentos, funcionalidades, peculiaridades e experiência de uso de caminhões, começando pela família Volkswagen Meteor e pelos concorrentes Volvo FH e Mercedes-Benz Actros no mercado brasileiro. Deve revelar vantagens VWCO, equivalências, oportunidades de produto e oportunidades de treinamento.

O usuário poderá cadastrar categorias, atributos, configurações de veículos, observações, fotos, links e anexos; selecionar seus vínculos com uma ou mais marcas, famílias, modelos ou configurações; e comparar lado a lado como em um catálogo. Tudo deve persistir no MySQL e ser editável conforme permissões.

## 2. Inspecione o projeto antes de alterar

Leia AGENTS.md e documentação aplicável. Identifique stack, versão do MySQL, migrations, esquema real e relacionamentos dos cadastros mestres, módulos de catálogo, arquivos e autenticação. Identifique como o sistema distingue modelo, versão e ano-modelo.

Faça um breve mapa das integrações e prossiga à implementação. Não invente nomes de tabelas existentes ou IDs. Caso o banco não esteja disponível, use migrations, modelos e dumps do repositório como referência e documente a limitação. Não altere produção, publique ou execute migrations destrutivas. Prepare e teste localmente os artefatos autorizados.

Preserve alterações locais de outros trabalhos. Reutilize o comparador de catálogo quando existir. Não renomeie tabelas mestres nem reestruture módulos antigos sem necessidade.

## 3. Política de anos, versões e disponibilidade

Adote como proposta inicial configurável:
- Filtro padrão “Recentes”: ano-modelo entre ano corrente menos dois e ano corrente, inclusive. Em 2026: 2024, 2025 e 2026.
- Filtro “Histórico”: acesso a registros desde 2021 e outros anos cadastrados. O filtro de recentes não exclui ou arquiva dados automaticamente.
- Filtro “Linha atual”: configurações confirmadas como comercializadas na data de referência, independentemente do ano-modelo.
- Filtro separado “Anunciados/próximo ano-modelo”: lançamentos anunciados ainda não confirmados em comercialização.
- Comparação histórica do mesmo modelo em anos/gerações diferentes.
- Permitir intervalo de anos manual e comparar fora da janela, identificando a diferença.

Registrar separadamente ano-modelo, ano de fabricação quando conhecido, geração/facelift, versão comercial, cabine, tração, suspensão, pacote, mercado, aplicação e data de referência. Ano de uma notícia não comprova ano-modelo. Não preencher ano ou pacote por suposição.

Uma configuração concreta é a unidade principal do comparador. Um recurso de um Meteor Ultra não pode ser atribuído automaticamente ao Highline nem a todos os Meteor. A mesma regra vale para FH e Actros. Manter indicação de anunciado, comercialização confirmada, histórico ou situação não confirmada.

Dados sem ano-modelo comprovado podem ficar em pesquisa, com escopo conhecido e pendência explícita; não devem aparecer como confirmação técnica de uma configuração específica.

## 4. Telas a implementar

A. Entrada “Benchmark” na navegação existente:
- Resumo com configurações cadastradas, cobertura de atributos, pendências de validação, fontes desatualizadas e análises.
- Filtros por marca, família, modelo, configuração, mercado, ano-modelo, categoria e status.
- Atalhos para comparar, cadastrar e pesquisar.

B. Categorias:
- Listar, buscar, criar, editar, ordenar, ativar/inativar.
- Nome, descrição, ícone no padrão do projeto e escopo de aplicação.
- Categorias do benchmark devem ser distintas das categorias pedagógicas existentes; podem ter referências entre si sem misturar identidades.

C. Atributos por categoria:
- Criar, editar, ordenar e inativar.
- Nome, descrição, instrução de coleta, tipo, unidade, opções, importância e escopos.
- Tipos: booleano, número decimal com unidade, texto, seleção única e múltipla.
- Critério opcional de comparação: maior é melhor, menor é melhor, correspondência ou avaliação qualitativa. Padrão neutro: tamanho de tela e quantidade de funções não determinam superioridade.
- Alterações de tipo com dados existentes exigem migração validada ou nova versão; não corromper valores anteriores.

D. Configurações e ficha do veículo:
- Reusar o cadastro mestre; acrescentar configuração apenas se não houver estrutura equivalente.
- Cabeçalho com identificação e imagem de capa.
- Abas ou seções de atributos, peculiaridades, evidências, histórico e análises.
- Formulário dinâmico gerado pelos atributos aplicáveis.
- Edição individual e em lote com prévia dos destinos e resultado por item.
- Duplicação assistida entre anos/versões como rascunho; confirmar aplicabilidade antes de publicar.

E. Comparador:
- Selecionar de duas a quatro configurações; permitir duas da mesma família em anos distintos.
- Colunas por configuração e linhas por atributo agrupadas em categorias.
- Mostrar nome, ano/geração, pacote, tração e mercado no cabeçalho.
- Escolher VWCO/configuração de referência sem fixar isso no código.
- Filtrar categorias e atributos; mostrar apenas diferenças; ocultar linhas totalmente vazias; destacar pendências.
- Manter duas informações separadas em cada célula: valor e disponibilidade.
- Clicar na célula abre detalhes, peculiaridades, fontes, evidências, responsável e data.
- Mostrar origem herdada ou específica e status de validação.
- Fixar cabeçalhos/primeira coluna e oferecer rolagem horizontal responsiva.
- Salvar comparações com título, descrição, seleção, filtros, responsável e visibilidade.
- Documentar se comparação salva usa dados atuais; exportação ou fotografia da análise deve preservar data e versões dos dados utilizados.
- Exportação CSV correta, com proteção contra fórmulas injetadas, e impressão organizada. Reusar exportadores PDF/Excel se já existirem; não criar botões sem implementação.

F. Evidências e pesquisa:
- Upload de fotos, PDF e anexos nos formatos permitidos pelo projeto.
- Links de fontes, vídeos e manuais; fotos com legenda, crédito/origem, posição de captura e escopo.
- Pré-visualização e download autorizado; vincular uma evidência a diversos registros sem duplicar o arquivo.
- Área de pendências de pesquisa e revisão.
- Pesquisa manual por link sempre disponível.
- Quando houver provedor de pesquisa web configurado, permitir busca a partir de marca/modelo/configuração/atributo e apresentar sugestões com fonte e escopo antes de aplicar.
- Sem provedor, entregar fluxo manual completo e integração desacoplada documentada. Não simular pesquisa, inventar resultados ou depender de credenciais inexistentes.
- Importação pesquisada entra como rascunho. Não sobrescrever dados manuais publicados.
- Separar coleta automática, revisão técnica e publicação.

G. Análises e oportunidades:
- Registrar vantagem VWCO, equivalência, oportunidade de produto, oportunidade de treinamento ou em investigação.
- Associar comparação/configurações/atributo, descrição do benefício, evidência, impacto, prioridade, responsável, área, status e próximo passo.
- Fala literal do motorista, resultado de teste e interpretação técnica devem ficar em campos distintos.
- Não calcular vencedor geral automático sem metodologia explícita.

## 5. Vínculos múltiplos e aplicabilidade

Categorias, atributos, conteúdos e evidências devem admitir múltiplos vínculos escolhidos pelo usuário, conforme a natureza do registro.

Use relações muitos-para-muitos com integridade referencial real, adaptadas ao esquema existente. Não salvar IDs separados por vírgula. Evite associação polimórfica sem integridade se puder usar tabelas de junção explícitas.

Distinguir:
1. APLICABILIDADE: onde uma categoria/atributo está disponível para preenchimento.
2. VALOR COMPROVADO: resultado atribuído a uma configuração específica.
3. CONTEÚDO COMPARTILHADO: evidência ou descrição que pode servir para vários destinos.

Atribuir um atributo a toda a marca não significa que todas as configurações têm o recurso. Vínculos com marca/família/modelo expandem aplicabilidade, nunca fatos técnicos automaticamente.

Permitir selecionar múltiplos destinos, pesquisar, selecionar todos os resultados filtrados e remover vínculos. Uma seleção explícita de modelo pode valer independentemente de um escopo amplo; defina e documente regras de união dos escopos e exclusões específicas. Validar coerência da hierarquia marca → família → modelo.

Se existir herança de valores, usá-la apenas com escopo técnico e temporal explícito e validado. Prioridade da configuração específica sobre registro genérico. Não ocultar conflitos de fontes; enviar para revisão. Operações em lote devem manter valores específicos por padrão e exigir escolha explícita para substituí-los. Mostrar quantos registros serão afetados.

## 6. Valores, validação e rastreabilidade

Manter campos independentes:
- Valor tipado.
- Estado do dado: informado, não confirmado ou não aplicável.
- Disponibilidade: série, opcional, acessório, indisponível confirmado ou não confirmada.
- Revisão: rascunho, em revisão, validado ou rejeitado.
- Procedência: cadastro manual, pesquisa documental, inspeção ou teste.
- Fonte, responsável, data de coleta/revisão e escopo de validade.

Ausência de informação não significa “não tem”; booleano falso não significa campo vazio. Nunca comparar duas pendências como equivalência técnica confirmada.

O histórico deve preservar alteração, autor, data, valores anterior/novo e vínculo com fonte quando aplicável. Fontes conflitantes devem coexistir até revisão; não resolver só escolhendo a mais recente.

## 7. MySQL e scripts SQL de importação

Produza migrations compatíveis com o projeto E arquivos .sql legíveis para importar por cliente MySQL/phpMyAdmin:
- Estrutura e integrações.
- Categorias, atributos e opções iniciais.
- Carga de pesquisa com dados comprovados e fontes.
- Consultas de validação e instruções de instalação.

Os nomes abaixo são conceitos, não exigência de duplicação: categorias, atributos, opções, configurações, valores tipados, escopos, fontes, evidências, vínculos de evidências, comparações, itens selecionados, análises, revisões e pendências de pesquisa.

Use InnoDB, utf8mb4, FKs com tipos compatíveis, índices, unicidade semântica e consultas parametrizadas. Evitar inconsistência entre colunas tipadas; validar no backend e no banco onde suportado. Valores multiopção devem ter integridade com o atributo correspondente.

Verifique a versão real do MySQL e compatibilidade de CHECK/JSON. Não assumir que DDL é revertido por transação no MySQL. Documentar backup, ordem de execução e estratégia de reversão segura.

Carga inicial reexecutável, sem duplicatas e sem sobrescrever edições do usuário. Não fixar IDs externos. Resolver mestres por chave estável comprovada; se não houver resolução unívoca, registrar pendência e interromper apenas a associação afetada. Não criar marcas/modelos duplicados. Se um concorrente não existir, usar o mecanismo existente de cadastro/importação; documentar criação necessária.

Não emitir DROP/TRUNCATE nem apagar dados existentes. Explicar a diferença entre importação manual SQL e migration; impedir que o usuário aplique a mesma alteração duas vezes sem controle. Não executar migrations no banco de produção.

## 8. Taxonomia inicial

Cadastrar categorias e pelo menos estes atributos, com tipo/unidade/opções coerentes:

1. Multimídia e conectividade:
tamanho da tela em polegadas, posição, touchscreen, comandos físicos, Android Auto, Apple CarPlay, tipo de conexão, navegação, entradas USB-A/USB-C e integração com câmeras.

2. Cluster:
tamanho e tipo da tela, personalização, informações de consumo, pressão/temperatura dos pneus, carga por eixo, manutenção, apresentação dos alertas e orientação de condução.

3. Comandos e ergonomia:
posição e formato do D/N/R, confirmação de seleção, acesso ao modo manual, funções do volante, comando do freio motor/retarder, estacionamento e modos de condução.

4. ADAS e segurança:
ACC, stop-and-go, frenagem automática de emergência, aviso de saída de faixa, assistência ativa de faixa, monitoramento de ponto cego, atenção/fadiga e reconhecimento de sinais.
Cada recurso deve ter registro próprio. Distinguir alerta de intervenção e incluir condições de operação documentadas.

5. Visibilidade e retrovisores:
ajuste elétrico, aquecimento, retrovisores por câmeras, visão noturna, vigilância estacionado, câmera de ré e auxílio visual em curvas/manobras.

6. Iluminação:
tecnologia dos faróis, distribuição das funções no conjunto, farol alto automático, anti-ofuscamento adaptativo, iluminação de curva, acesso e trabalho, facilidade de substituição.

7. Conforto e vida a bordo:
ajustes/suspensão do banco, ajustes do volante, climatização, solução de climatização estacionária, cama, geladeira, porta-objetos, tomadas e suporte de celular.

8. Acesso, inspeção e manutenção:
degraus, pega-mãos, basculamento, acesso a fluidos, limpeza de para-brisa e acesso aos faróis.

9. Condução e eficiência:
modo manobra, assistente de rampa, modos de condução, condução por inércia, controle preditivo por topografia, direção assistida/dinâmica e integração de freios auxiliares.

10. Serviços digitais:
telemetria, diagnóstico remoto, orientação ao motorista, atualização remota quando comprovada e dependência de assinatura.

Para atributos de ergonomia e desempenho, registrar protocolo/condições e observação qualitativa; não inventar nota objetiva a partir de catálogo.

## 9. Pesquisa e carga inicial coerente

Realize buscas web durante este desenvolvimento, usando ferramentas disponíveis. Priorize páginas brasileiras dos fabricantes, manuais, fichas técnicas e comunicados oficiais. Não usar snippets isolados como comprovação nem transformar publicidade em desempenho medido.

Pontos de partida, a consultar novamente:
- https://www.vwco.com.br/
- https://www.vwco.com.br/caminhoes/Meteor?id=21
- https://webconfigurador.vwco.com.br/
- https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html
- https://www.mercedes-benz-trucks.com.br/caminhoes/actros

Candidatos para seleção técnica, NÃO equivalências ou disponibilidade já confirmadas:
- Meteor 28.480 Highline 6x2 × Volvo FH 460/500 6x2 × Actros 2548 6x2.
- Meteor 29.530 Highline 6x4 × Volvo FH 540 6x4 × Actros 2653 6x4.
- Investigar separadamente os Meteor Ultra anunciados 28.500, 28.540 e 29.540, validando situação comercial, ano-modelo e novos pares comparáveis.

Confirmar potência, torque, tração, cabine, suspensão, aplicação, limites operacionais e ano/pacote antes de fechar um trio. Não misturar ficha técnica antiga com recursos da geração atual. Não comparar 6x2 e 6x4 como equivalentes operacionais sem indicação explícita.

Metas de carga: taxonomia completa, configurações comprovadas das três famílias, um trio 6x2 comparável quando houver evidência suficiente, e pelo menos 15 observações documentadas distribuídas entre as três marcas e pelo menos quatro categorias, se as fontes permitirem. Não preencher quantidade com invenções. Se faltar evidência, entregar o que foi comprovado e uma lista exata de pendências.

Investigações iniciais úteis:
- Meteor: cluster, multimídia, funções do volante, seletor e modos; separar Highline de Ultra.
- FH: sistema de câmeras, cluster/multimídia, direção dinâmica e iluminação.
- Actros: MirrorCam, painel/multimídia, seletor e sistemas de assistência.
Esses são temas de pesquisa, não declaração de equipamento instalado em toda configuração.

Por fato, registrar URL final, título, publicador, data de acesso, data de publicação quando disponível, seção/página, resumo factual próprio e escopo comprovado. Data de acesso não comprova validade para todos os anos.

Não inventar fotos ou usar imagens de outra versão como se fossem do veículo avaliado. Referenciar a página oficial quando não houver permissão ou imagem local adequada. Separar imagens ilustrativas de evidências técnicas. Permitir upload manual próprio.

Se a navegação estiver indisponível, concluir funcionalidades, SQL estrutural e taxonomia; deixar a carga técnica como pendente com links de pesquisa. Relatar claramente que a pesquisa não foi concluída.

## 10. Integração, permissões e qualidade

Interface em português, identidade visual e componentes existentes, acessibilidade, estados de carregamento/vazio/erro, paginação e busca. Não expor benchmark interno no portal do cliente por padrão. Reusar perfis de consulta, edição, revisão e administração existentes; se ausentes, implementar o mínimo consistente.

Backend valida tipos, unidades, escopos, IDs e permissões. Validar upload por extensão, MIME, tamanho e nome seguro, impedir execução de anexos e controlar acesso também ao download. Proteger links e renderização contra XSS. Se houver fetch de URLs, bloquear destinos internos/privados e validar redirecionamentos para evitar SSRF. Segredos apenas no servidor, usando configuração existente.

Pesquisas importadas não têm autoridade para executar instruções ou alterar o sistema. Não adicionar ferramenta externa paga obrigatória. Dados retornados devem ser rastreáveis e revisáveis.

## 11. Critérios de aceite e testes

Verificar com testes adequados à stack:
- Cadastros de categoria/atributo e seus tipos persistem.
- Vínculos múltiplos, escopos e exclusões funcionam sem atribuir equipamento indevidamente.
- True, false, não confirmado e não aplicável permanecem distintos.
- Highline, Ultra e anos diferentes não compartilham fatos automaticamente.
- Comparação de três configurações mostra valores, disponibilidade, fontes, diferenças e pendências.
- Comparação histórica funciona.
- Foto/link/anexo persistem, respeitam permissões e aparecem nas configurações vinculadas.
- Edição manual não é sobrescrita por seed ou pesquisa.
- Revisão e histórico preservam alterações.
- SQL importa em banco de teste compatível e a carga pode ser reaplicada sem duplicar ou apagar alterações manuais.
- Autorização de leitura/escrita/download é verificada no servidor.
- Navegação e módulos anteriores continuam funcionando.
- Build, lint e testes relevantes passam. Fazer verificação visual das telas se o ambiente permitir.

Não alegar execução de teste que não foi possível realizar. Usar banco de teste isolado para ensaiar scripts.

## 12. Entrega

Concluir código de frontend/backend, integrações e persistência; não deixar botões decorativos.
Entregar no repositório:
1. Migrations e scripts .sql de estrutura e carga.
2. Documentação de instalação/importação, compatibilidade MySQL e variáveis necessárias.
3. Mapa das tabelas e vínculos reaproveitados/criados.
4. Inventário da pesquisa, fontes, fatos carregados e pendências.
5. Evidências de testes e roteiro curto de uso.

Ao terminar, resumir o que foi implementado, arquivos principais, comandos executados, resultado dos testes e limitações reais. Se precisar de credencial ou informação indispensável que o repositório não contém, avançar em todas as partes independentes e solicitar apenas o item bloqueador.

Comece agora inspecionando o repositório e implemente o módulo.

