<?php
$dashboardMetrics = $dashboard['metrics'] ?? ['vehicles'=>0,'models'=>0,'videos'=>0,'people'=>0,'completed'=>0,'time_label'=>'0min'];
$dashboardModels = $dashboard['models'] ?? [];
$dashboardContinue = $dashboard['continue'] ?? null;
$dashboardProgress = $dashboard['progress'] ?? ['available'=>0,'completed'=>0,'pending'=>0,'percent'=>0,'last30'=>0];
$weekdays=['domingo','segunda-feira','terça-feira','quarta-feira','quinta-feira','sexta-feira','sábado'];
$months=['janeiro','fevereiro','março','abril','maio','junho','julho','agosto','setembro','outubro','novembro','dezembro'];
$today=$weekdays[(int)date('w')].', '.date('j').' de '.$months[(int)date('n')-1];
?>
<section class="welcome dashboard-welcome"><div><span class="eyebrow blue"><?= e(ucfirst($today)) ?></span><h1>Olá, <?= e(explode(' ',trim((string)(user()['nome'] ?? 'usuário')))[0]) ?>! <span>👋</span></h1><p>Visão geral de <?= e((string)($dashboard['scope_label'] ?? 'seu ambiente')) ?>, com dados reais de frota e aprendizagem.</p></div><a class="btn primary" href="<?= url('biblioteca') ?>">Explorar treinamentos <i class="bi bi-arrow-right"></i></a></section>

<section class="metrics dashboard-metrics">
    <article class="metric"><span class="metric-icon blue"><i class="bi bi-play-circle"></i></span><div><small>Vídeos disponíveis</small><strong><?= (int)$dashboardMetrics['videos'] ?></strong><em>Somente conteúdos publicados</em></div></article>
    <article class="metric"><span class="metric-icon green"><i class="bi bi-check-circle"></i></span><div><small>Concluídos por você</small><strong><?= (int)$dashboardMetrics['completed'] ?></strong><em><?= (int)$dashboardProgress['last30'] ?> nos últimos 30 dias</em></div></article>
    <article class="metric"><span class="metric-icon orange"><i class="bi bi-clock-history"></i></span><div><small>Tempo de aprendizado</small><strong><?= e((string)$dashboardMetrics['time_label']) ?></strong><em>Tempo efetivamente assistido</em></div></article>
    <article class="metric"><span class="metric-icon violet"><i class="bi bi-truck"></i></span><div><small>Veículos na frota</small><strong><?= number_format((int)$dashboardMetrics['vehicles'],0,',','.') ?></strong><em><?= (int)$dashboardMetrics['models'] ?> modelo(s) vinculado(s)</em></div></article>
    <article class="metric"><span class="metric-icon navy"><i class="bi bi-people"></i></span><div><small>Pessoas no ambiente</small><strong><?= number_format((int)$dashboardMetrics['people'],0,',','.') ?></strong><em>Usuários ativos no seu escopo</em></div></article>
</section>

<div class="dashboard-columns overview-learning">
    <section><div class="section-heading compact"><div><h2>Continue assistindo</h2><p>Retome exatamente de onde parou.</p></div><a href="<?= url('biblioteca') ?>">Ver biblioteca</a></div>
        <?php if($dashboardContinue): ?>
        <article class="continue-card real-continue">
            <a class="video-thumb" href="<?= url('biblioteca?q='.rawurlencode((string)$dashboardContinue['titulo'])) ?>"<?php if($dashboardContinue['thumbnail']): ?> style="--continue-image:url('<?= e((string)$dashboardContinue['thumbnail']) ?>')"<?php endif; ?>><span><i class="bi bi-play-fill"></i></span><?php if((int)$dashboardContinue['duracao_segundos']>0): ?><small><?= sprintf('%02d:%02d',intdiv((int)$dashboardContinue['duracao_segundos'],60),(int)$dashboardContinue['duracao_segundos']%60) ?></small><?php endif; ?></a>
            <div><span class="tag"><?= e((string)$dashboardContinue['categoria_nome']) ?></span><h3><?= e((string)$dashboardContinue['titulo']) ?></h3><p><?= e((string)($dashboardContinue['subcategoria_nome'] ?: 'Treinamento VWCO')) ?></p><div class="progress"><i style="width:<?= min(100,max(0,(float)$dashboardContinue['percentual'])) ?>%"></i></div><small><?= (int)round((float)$dashboardContinue['percentual']) ?>% concluído</small><a class="continue-link" href="<?= url('biblioteca?q='.rawurlencode((string)$dashboardContinue['titulo'])) ?>">Continuar vídeo <i class="bi bi-arrow-right"></i></a></div>
        </article>
        <?php else: ?>
        <article class="continue-card dashboard-empty"><span class="empty-round"><i class="bi bi-play-circle"></i></span><div><h3>Escolha seu próximo treinamento</h3><p>Você não possui nenhum vídeo em andamento. Abra a biblioteca para começar.</p><a class="btn secondary" href="<?= url('biblioteca') ?>">Abrir biblioteca</a></div></article>
        <?php endif; ?>
    </section>
    <section><div class="section-heading compact"><div><h2>Seu progresso</h2><p>Catálogo disponível no ambiente atual.</p></div></div><article class="progress-card"><div class="donut" style="--dashboard-progress:<?= (int)$dashboardProgress['percent'] ?>%"><span><?= (int)$dashboardProgress['percent'] ?><small>%</small></span></div><div><strong><?= $dashboardProgress['percent']>=70?'Excelente ritmo!':($dashboardProgress['percent']>0?'Continue avançando!':'Pronto para começar?') ?></strong><p>Você concluiu <?= (int)$dashboardProgress['completed'] ?> de <?= (int)$dashboardProgress['available'] ?> treinamentos disponíveis.</p><div class="legend"><span><i class="done"></i>Concluídos <?= (int)$dashboardProgress['completed'] ?></span><span><i></i>Pendentes <?= (int)$dashboardProgress['pending'] ?></span></div></div></article></section>
</div>

<div class="section-heading fleet-heading"><div><h2>Veículos do seu escopo</h2><p>Modelos cadastrados nas frotas e seus treinamentos compatíveis.</p></div><a href="<?= url('frota') ?>">Ver frota completa <i class="bi bi-arrow-right"></i></a></div>
<section class="family-grid product-grid dashboard-vehicle-grid">
<?php if(!$dashboardModels): ?><article class="empty-fleet-card"><i class="bi bi-truck"></i><div><h3>Nenhuma frota cadastrada</h3><p>Adicione os modelos da empresa para liberar treinamentos compatíveis e indicadores de frota.</p><?php if(can('fleet','create')): ?><a class="btn primary" href="<?= url('frota') ?>">Cadastrar frota</a><?php endif; ?></div></article><?php endif; ?>
<?php foreach ($dashboardModels as $model): ?><article class="family-card product-card"><div class="product-image"><?php if($model['imagem']): ?><img src="<?= url($model['imagem']) ?>" alt="<?= e($model['nome']) ?>"><?php else: ?><i class="bi bi-truck-front"></i><?php endif; ?><span class="product-family"><?= e($model['familia_nome']) ?></span></div><div class="family-body"><h3><?= e($model['nome']) ?></h3><div class="product-specs"><span><small>Fabricante / Motor</small><strong><?= e($model['motor'] ?: 'Não informado') ?></strong></span><span><small>Potência líquida máxima</small><strong><?= e($model['potencia'] ?: 'Não informada') ?></strong></span><span><small>Torque líquido máximo</small><strong><?= e($model['torque'] ?: 'Não informado') ?></strong></span><span><small>PBT / PBTC homologado</small><strong><?= e($model['pbt'] ?: 'Não informado') ?></strong></span></div><div class="card-meta"><span><strong><?= (int)$model['total_veiculos'] ?></strong> veículo(s)</span><span><strong><?= (int)$model['total_videos'] ?></strong> vídeo(s)</span></div><div class="product-card-links"><a class="card-link" href="<?= url('biblioteca?modelo='.(int)$model['id']) ?>">Treinamentos <i class="bi bi-arrow-right"></i></a><?php if($model['ficha_arquivo']): ?><a class="spec-link" href="<?= url($model['ficha_arquivo']) ?>" target="_blank" rel="noopener"><i class="bi bi-file-earmark-pdf"></i> Ficha técnica</a><?php endif; ?></div></div></article><?php endforeach; ?>
</section>
