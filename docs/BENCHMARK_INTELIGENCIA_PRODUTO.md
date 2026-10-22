# Benchmark & Inteligência de Produto

## Objetivo

O módulo transforma observações de produto, documentos oficiais e inspeções de campo em uma matriz comparável e rastreável. Ele não proclama um “melhor caminhão” automaticamente: apresenta fatos, disponibilidade, confiança, evidências e contexto para apoiar decisões de engenharia, produto, treinamento, pós-venda e comercial.

## Estrutura conceitual

- **Modelo do catálogo:** cadastro comercial já existente no Drive Learn.
- **Configuração comparável:** recorte preciso do modelo por ano, versão, cabine, tração, suspensão, pacote, mercado e data de referência.
- **Categoria e atributo:** dicionário controlado exclusivo do benchmark. Não reutiliza categorias de treinamento.
- **Observação:** valor do atributo em uma configuração, com disponibilidade, estado do dado, revisão, origem e confiança.
- **Evidência:** foto, PDF ou link que pode sustentar uma observação e permanecer ligado à configuração.
- **Análise:** conclusão humana rastreável. Separa fato observado, fala literal do motorista e interpretação técnica.

## Fluxo recomendado em eventos

1. Antes do evento, crie as configurações que serão inspecionadas.
2. No estande, selecione a configuração e o atributo.
3. Descreva o item e indique se ele é de série, opcional, acessório ou ainda não confirmado.
4. Selecione de uma vez as diferentes fotos do mesmo item. Para uma alavanca, por exemplo, registre vista do motorista, vista lateral e detalhe da empunhadura.
5. Preencha posição de captura, evento/origem, crédito, data, escopo e legenda.
6. Mantenha a observação em rascunho ou revisão até que a disponibilidade esteja confirmada por documento ou representante autorizado.
7. Use o comparador para analisar de duas a quatro configurações e registre uma análise quando houver uma decisão ou hipótese útil.

## Estados importantes

**Estado do dado:** informado, não confirmado ou não aplicável.

**Disponibilidade:** série, opcional, acessório, indisponível confirmado ou não confirmado.

**Revisão:** rascunho, em revisão, validado ou rejeitado.

**Origem:** cadastro manual, pesquisa documental, inspeção ou teste.

Esses campos são independentes. Um equipamento pode existir, ser opcional e ainda estar em revisão, por exemplo.

## Permissões

- `benchmark.view`: visualizar panorama, matriz, taxonomia e análises.
- `benchmark.create`: cadastrar configurações, taxonomia, observações, evidências e análises.
- `benchmark.update`: revisar e validar informações.
- `benchmark.delete`: excluir somente registros que não tenham histórico ou vínculos.

O Administrador Master recebe as quatro permissões. Perfis de assistência, comercial e coordenação recebem visualização, criação e atualização quando seus slugs correspondentes existirem. Os demais perfis podem ser configurados em **Perfis e acessos**.

## Instalação

1. Publique os arquivos de código.
2. Execute `database/migrations/20261021_033_benchmark_inteligencia_produto.sql` no banco da HostGator.
3. Saia e entre novamente caso uma sessão não mostre imediatamente a nova permissão.
4. Acesse **Principal → Benchmark**.

Arquivos enviados ficam em `public/assets/uploads/benchmark/AAAA/MM`. A aplicação valida o MIME real e aceita JPG, PNG, WEBP (até 10 MB) e PDF (até 20 MB). URLs remotas são apenas referências; o servidor não baixa arquivos externos, evitando SSRF.

## Comparador e exportação

O comparador trabalha no navegador e não recarrega a página. Permite:

- referência VWCO configurável;
- duas a quatro configurações;
- somente diferenças;
- ocultar campos sem observação;
- galeria navegável dentro da célula;
- impressão;
- CSV em UTF-8 com neutralização de fórmulas iniciadas por `=`, `+`, `-` ou `@`.

## Carga inicial e fontes oficiais

A migração cria cinco recortes brasileiros quando os modelos exatos já existem: Meteor 29.530 Highline, Volvo FH 540 6x4T, Actros 2653 S 6x4 Top Space MY2024, Scania R 500 6x4 Super Smart Dash e DAF XF FTT 6x4 530. Não cria modelos artificiais. Os fatos sem associação inequívoca a pedido, pacote ou cabina são mantidos como disponibilidade não confirmada.

- Volkswagen Meteor Highline: painel digital de 10 polegadas, central multimídia de 7 polegadas e espelhamento de celular. Fonte: [VWCO — Meteor 28.480](https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219).
- Volvo FH: sistema de monitoramento por câmeras com visão noturna e alternativa por espelhos, com aviso oficial de variação por configuração. Fonte: [Volvo Trucks Brasil — Volvo FH](https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fh.html).
- Mercedes-Benz Actros: MirrorCam, opções de painel analógico/digital e ABA 5, sujeitos à configuração. Fonte: [Mercedes-Benz Trucks Brasil — Actros](https://www.mercedes-benz-trucks.com.br/caminhoes/actros).
- Scania R 500 Super: Smart Dash, multimídia de 10,1 ou 12,9 polegadas, Apple CarPlay e Android Auto. Fonte: [Scania Brasil — Super](https://www.scania.com/br/pt/home/products/trucks/Scania-Super.html).
- DAF XF 530: AEBS, ACC e LDWS; integração móvel cadastrada separadamente como acessório PACCAR Parts. Fontes: [DAF in Action](https://www.dafcaminhoes.com.br/-/media/files/countries/br/daf-in-action/2025/daf-in-action-01-2025.pdf?rev=073f315b24af41f2aa54d380dad5afff) e [PACCAR Parts](https://www.dafcaminhoes.com.br/-/media/files/countries/br/brochures/novo-daf-xf/30-11-2020-guia-de-bolso-paccar-parts.pdf).

## Próximas ampliações previstas pela arquitetura

- vínculos explícitos de aplicabilidade do atributo por marca, família, modelo ou configuração;
- opções administráveis para atributos de seleção única e múltipla;
- salvamento e compartilhamento de comparações;
- fluxo de revisão com aprovador dedicado;
- visão de pendências por responsável e prazo;
- extração assistida de atributos a partir de fichas técnicas;
- análise computacional de imagens como sugestão, sempre dependente de validação humana.

