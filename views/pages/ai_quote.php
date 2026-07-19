<?php
$aiModels = [
    ['id'=>'gpt-5-nano','name'=>'GPT-5 nano','input'=>0.05,'output'=>0.40,'profile'=>'Mais econômico para consultas objetivas e resumos curtos.'],
    ['id'=>'gpt-5.4-mini','name'=>'GPT-5.4 mini','input'=>0.75,'output'=>4.50,'profile'=>'Mais qualidade para comparações e perguntas menos previsíveis.'],
    ['id'=>'gpt-5.6-luna','name'=>'GPT-5.6 Luna','input'=>1.00,'output'=>6.00,'profile'=>'Linha atual otimizada para volume com maior capacidade de raciocínio.'],
];
?>
<link rel="stylesheet" href="<?= url('public/assets/css/ai-quote.css') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/css/ai-quote.css') ?: 1) ?>">
<section class="page-heading split ai-quote-heading">
    <div><span class="eyebrow blue">Planejamento estratégico</span><h1>Cotação do Assistente de IA</h1><p>Simule o custo mensal de um agente que consulta marcas, famílias, modelos e fichas técnicas sem permitir acesso direto ao banco.</p></div>
    <span class="ai-master-badge"><i class="bi bi-shield-lock"></i> Somente Administrador Master</span>
</section>

<section class="ai-quote-summary">
    <article><span><i class="bi bi-stars"></i></span><div><small>Recomendação para o MVP</small><strong>GPT-5 nano</strong><em>Consultas objetivas com menor custo</em></div></article>
    <article><span><i class="bi bi-box-arrow-in-right"></i></span><div><small>Entrada · 1 milhão de tokens</small><strong>US$ 0,05</strong><em>Preço oficial consultado em 18/07/2026</em></div></article>
    <article><span><i class="bi bi-box-arrow-left"></i></span><div><small>Saída · 1 milhão de tokens</small><strong>US$ 0,40</strong><em>Respostas e tokens de raciocínio faturáveis</em></div></article>
    <article><span><i class="bi bi-currency-exchange"></i></span><div><small>PTAX utilizada</small><strong>R$ 5,1176</strong><em>Venda · Banco Central · 17/07/2026</em></div></article>
</section>

<section class="ai-proposal-grid" data-ai-quote>
    <article class="ai-calculator-card">
        <div class="ai-card-heading"><div><span class="eyebrow blue">Premissas editáveis</span><h2>Simulador mensal</h2></div><i class="bi bi-sliders"></i></div>
        <div class="ai-presets"><button type="button" data-ai-preset="light">Uso leve</button><button type="button" class="active" data-ai-preset="moderate">Uso moderado</button><button type="button" data-ai-preset="intense">Uso intenso</button></div>
        <div class="ai-calculator-fields">
            <label class="full">Modelo da API<select data-ai-model><?php foreach($aiModels as $model): ?><option value="<?= e($model['id']) ?>" data-input-price="<?= $model['input'] ?>" data-output-price="<?= $model['output'] ?>" data-profile="<?= e($model['profile']) ?>"><?= e($model['name']) ?></option><?php endforeach; ?></select><small data-ai-model-profile><?= e($aiModels[0]['profile']) ?></small></label>
            <label>Perguntas por usuário/dia<input type="number" min="1" max="100" step="1" value="5" data-ai-questions></label>
            <label>Dias ativos no mês<input type="number" min="1" max="31" step="1" value="22" data-ai-days></label>
            <label>Tokens de entrada/pergunta<input type="number" min="100" max="50000" step="100" value="1200" data-ai-input-tokens><small>Instruções, pergunta e dados do modelo.</small></label>
            <label>Tokens de saída/pergunta<input type="number" min="50" max="10000" step="50" value="300" data-ai-output-tokens><small>Resumo apresentado ao usuário.</small></label>
            <label>Dólar em reais<input type="number" min="1" max="20" step="0.0001" value="5.1176" data-ai-exchange></label>
            <label>Margem de segurança<input type="number" min="0" max="200" step="5" value="20" data-ai-margin><small>Absorve variações e respostas maiores.</small></label>
        </div>
        <div class="ai-formula"><i class="bi bi-calculator"></i><div><strong>Como calculamos</strong><span>Consultas × dias × tokens × preço por milhão, acrescido da margem de segurança.</span></div></div>
    </article>
    <aside class="ai-result-card"><span class="eyebrow">Estimativa por usuário</span><strong class="ai-result-main" data-ai-cost-user-brl>R$ 0,00</strong><small>por mês, já incluindo a margem configurada</small><dl><div><dt>Consultas mensais</dt><dd data-ai-requests-user>0</dd></div><div><dt>Tokens mensais</dt><dd data-ai-total-tokens-user>0</dd></div><div><dt>Custo por consulta</dt><dd data-ai-cost-request>R$ 0,0000</dd></div><div><dt>Custo em dólar</dt><dd data-ai-cost-user-usd>US$ 0,0000</dd></div></dl><div class="ai-result-note"><i class="bi bi-info-circle"></i><span>Estimativa de API. Não inclui impostos, IOF, hospedagem ou desenvolvimento.</span></div></aside>
</section>

<section class="panel ai-scenarios-panel"><div class="panel-head"><div><span class="eyebrow blue">Projeção de escala</span><h2>Custo mensal estimado</h2></div><span data-ai-selected-model>GPT-5 nano</span></div><div class="table-wrap"><table><thead><tr><th>Usuários ativos</th><th>Consultas/mês</th><th>Tokens de entrada</th><th>Tokens de saída</th><th>API + margem</th><th>Estimativa em reais</th></tr></thead><tbody><?php foreach([10,25,50,75,100] as $users): ?><tr data-ai-scenario data-users="<?= $users ?>"><td><strong><?= $users ?></strong><small> usuários</small></td><td data-ai-requests>—</td><td data-ai-input>—</td><td data-ai-output>—</td><td data-ai-usd>—</td><td><strong data-ai-brl>—</strong></td></tr><?php endforeach; ?></tbody></table></div></section>

<section class="ai-model-comparison"><div class="section-heading"><div><h2>Comparação dos modelos considerados</h2><p>Preços de texto por 1 milhão de tokens. O modelo pode ser alterado no simulador.</p></div></div><div class="ai-model-grid"><?php foreach($aiModels as $index=>$model): ?><article class="<?= $index===0?'recommended':'' ?>"><?php if($index===0): ?><span class="ai-recommended">Recomendado para começar</span><?php endif; ?><h3><?= e($model['name']) ?></h3><p><?= e($model['profile']) ?></p><dl><div><dt>Entrada</dt><dd>US$ <?= number_format($model['input'],2,',','.') ?></dd></div><div><dt>Saída</dt><dd>US$ <?= number_format($model['output'],2,',','.') ?></dd></div></dl></article><?php endforeach; ?></div></section>

<section class="ai-implementation-card"><div><span class="eyebrow blue">Escopo sugerido</span><h2>MVP do Assistente Drive Learn</h2><p>A IA não receberia credenciais nem executaria SQL livre. O PHP disponibilizaria apenas consultas preparadas e somente leitura.</p></div><ol><li><span>1</span><div><strong>Entender a pergunta</strong><small>Identificar modelo, família, marca e campos solicitados.</small></div></li><li><span>2</span><div><strong>Consultar com segurança</strong><small>Buscar apenas motor, potência, torque, transmissão, PBT, entre-eixos e documentos.</small></div></li><li><span>3</span><div><strong>Responder com os dados</strong><small>Resumir sem inventar valores ausentes e indicar a ficha técnica disponível.</small></div></li></ol><div class="ai-controls"><span><i class="bi bi-check2-circle"></i> Limite diário por usuário</span><span><i class="bi bi-check2-circle"></i> Registro de consumo</span><span><i class="bi bi-check2-circle"></i> Teto mensal de gastos</span><span><i class="bi bi-check2-circle"></i> Cache de perguntas repetidas</span></div></section>

<section class="ai-source-note"><i class="bi bi-link-45deg"></i><div><strong>Fontes e validade da cotação</strong><p>Valores consultados em 18/07/2026. Preços da OpenAI e câmbio podem mudar; revise antes da contratação.</p><a href="https://developers.openai.com/api/docs/models/gpt-5-nano" target="_blank" rel="noopener">GPT-5 nano</a><a href="https://developers.openai.com/api/docs/models/gpt-5.4-mini" target="_blank" rel="noopener">GPT-5.4 mini</a><a href="https://developers.openai.com/api/docs/models" target="_blank" rel="noopener">Modelos OpenAI</a><a href="https://ptax.bcb.gov.br/ptax_internet/consultarTodasAsMoedas.do?method=consultaTodasMoedas" target="_blank" rel="noopener">PTAX Banco Central</a></div></section>
<script src="<?= url('public/assets/js/ai-quote.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/js/ai-quote.js') ?: 1) ?>"></script>
