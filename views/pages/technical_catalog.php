<?php
$catalogBrands=$technicalCatalog['brands']??[];
$catalogFamilies=$technicalCatalog['families']??[];
$catalogModels=$technicalCatalog['models']??[];
$catalogTotals=$technicalCatalog['totals']??[];
$specLabels=[
    'tipo_veiculo'=>'Tipo de veículo','energia'=>'Energia','configuracao'=>'Configuração',
    'emissoes'=>'Norma de emissões','bateria'=>'Bateria','autonomia'=>'Autonomia',
    'capacidade_passageiros'=>'Capacidade de passageiros','comprimento'=>'Comprimento',
    'entre_eixos'=>'Entre-eixos','carregamento'=>'Carregamento','mercado'=>'Mercado',
    'tipo_carroceria'=>'Tipo de carroceria','imagem_escopo'=>'Escopo da imagem',
    'auditoria_status'=>'Situação da conferência',
];
$modelPayload=static function(array $model) use($specLabels):array {
    $specs=json_decode((string)($model['especificacoes']??''),true);
    if(!is_array($specs))$specs=[];
    $extra=[];
    foreach($specLabels as $key=>$label){$value=$specs[$key]??null;if($value!==null&&$value!=='')$extra[$label]=(string)$value;}
    $document=$model['ficha_arquivo']?url($model['ficha_arquivo']):(string)($model['ficha_url']??'');
    return [
        'id'=>(int)$model['id'],'marca_id'=>(int)$model['marca_id'],'marca'=>$model['marca_nome'],
        'familia_id'=>(int)$model['familia_id'],'familia'=>$model['familia_nome'],'nome'=>$model['nome'],
        'descricao'=>$model['descricao'],'imagem'=>$model['imagem']?url($model['imagem']):'',
        'motor'=>$model['motor'],'potencia'=>$model['potencia'],'torque'=>$model['torque'],
        'transmissao'=>$model['transmissao'],'pbt'=>$model['pbt'],'extras'=>$extra,
        'documento'=>$document,'fonte'=>$model['ficha_fonte']?:($specs['fonte_oficial']??$model['ficha_url']??''),
        'videos'=>(int)$model['videos_publicados'],
    ];
};
?>
<section class="page-heading split catalog-heading"><div><span class="eyebrow blue">Inteligência de produto</span><h1>Catálogo técnico de veículos</h1><p>Consulte todas as marcas, famílias e modelos disponíveis e compare as principais especificações lado a lado.</p></div><button class="btn primary" type="button" data-catalog-open-comparison disabled><i class="bi bi-columns-gap"></i> Comparar <span data-catalog-compare-count>0</span></button></section>

<section class="catalog-summary" aria-label="Resumo do catálogo">
    <article><span><i class="bi bi-tags"></i></span><div><strong><?= (int)($catalogTotals['brands']??0) ?></strong><small>marcas disponíveis</small></div></article>
    <article><span><i class="bi bi-collection"></i></span><div><strong><?= (int)($catalogTotals['families']??0) ?></strong><small>famílias cadastradas</small></div></article>
    <article><span><i class="bi bi-truck-front"></i></span><div><strong><?= (int)($catalogTotals['models']??0) ?></strong><small>modelos ativos</small></div></article>
    <article><span><i class="bi bi-file-earmark-text"></i></span><div><strong><?= (int)($catalogTotals['documents']??0) ?></strong><small>fichas técnicas</small></div></article>
</section>

<section class="catalog-filter-panel" data-technical-catalog>
    <div class="catalog-filter-copy"><div><span class="eyebrow blue">Encontre o veículo</span><h2>Filtre o catálogo</h2></div><span data-catalog-result-count><?= count($catalogModels) ?> modelo(s)</span></div>
    <form class="catalog-filters" data-catalog-filters>
        <div class="catalog-search"><i class="bi bi-search"></i><input type="search" name="q" placeholder="Buscar modelo, motor, potência ou aplicação..." autocomplete="off"></div>
        <select name="marca" data-catalog-brand><option value="">Todas as marcas</option><?php foreach($catalogBrands as $brand): ?><option value="<?= (int)$brand['id'] ?>"><?= e($brand['nome']) ?></option><?php endforeach; ?></select>
        <select name="familia" data-catalog-family><option value="">Todas as famílias</option><?php foreach($catalogFamilies as $family): ?><option value="<?= (int)$family['id'] ?>" data-brand="<?= (int)$family['marca_id'] ?>"><?= e($family['marca_nome'].' · '.$family['nome']) ?></option><?php endforeach; ?></select>
        <select name="modelo" data-catalog-model><option value="">Todos os modelos</option><?php foreach($catalogModels as $model): ?><option value="<?= (int)$model['id'] ?>" data-brand="<?= (int)$model['marca_id'] ?>" data-family="<?= (int)$model['familia_id'] ?>"><?= e($model['marca_nome'].' · '.$model['nome']) ?></option><?php endforeach; ?></select>
        <button class="btn secondary catalog-clear" type="button" data-catalog-clear><i class="bi bi-x-lg"></i><span>Limpar</span></button>
    </form>
</section>

<section class="catalog-compare-bar" data-catalog-compare-bar hidden>
    <div><span class="compare-icon"><i class="bi bi-columns-gap"></i></span><div><strong>Veículos selecionados</strong><small>Escolha de 2 a 5 modelos para comparar.</small></div></div>
    <div class="compare-selection" data-catalog-selection></div>
    <button class="btn primary" type="button" data-catalog-open-comparison disabled>Comparar agora <i class="bi bi-arrow-right"></i></button>
</section>

<section class="technical-vehicle-grid" data-catalog-grid>
<?php foreach($catalogModels as $model): $payload=$modelPayload($model); $wheelbase=$payload['extras']['Entre-eixos']??'Não informado'; ?>
    <article class="technical-vehicle-card" data-catalog-card data-brand="<?= (int)$model['marca_id'] ?>" data-family="<?= (int)$model['familia_id'] ?>" data-model-id="<?= (int)$model['id'] ?>" data-model="<?= e(json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)) ?>">
        <div class="technical-vehicle-media">
            <span class="vehicle-brand-pill"><?= e($model['marca_nome']) ?></span>
            <label class="compare-toggle"><input type="checkbox" data-catalog-select value="<?= (int)$model['id'] ?>"><span><i class="bi bi-plus-lg"></i><b>Comparar</b></span></label>
            <?php if($model['imagem']): ?><img src="<?= url($model['imagem']) ?>" alt="<?= e($model['marca_nome'].' '.$model['nome']) ?>" loading="lazy"><?php else: ?><span class="catalog-image-placeholder"><i class="bi bi-truck-front"></i></span><?php endif; ?>
        </div>
        <div class="technical-vehicle-body">
            <span class="vehicle-family"><?= e($model['familia_nome']) ?></span>
            <h2><?= e($model['nome']) ?></h2>
            <p><?= e($model['descricao']?:'Modelo disponível no catálogo técnico.') ?></p>
            <dl class="vehicle-spec-preview">
                <div><dt>Motor</dt><dd><?= e($model['motor']?:'Não informado') ?></dd></div>
                <div><dt>Potência</dt><dd><?= e($model['potencia']?:'Não informada') ?></dd></div>
                <div><dt>Torque</dt><dd><?= e($model['torque']?:'Não informado') ?></dd></div>
                <div><dt>PBT / capacidade</dt><dd><?= e($model['pbt']?:'Não informado') ?></dd></div>
                <div class="vehicle-wheelbase"><dt>Entre-eixos</dt><dd><?= e($wheelbase) ?></dd></div>
            </dl>
            <div class="technical-vehicle-meta"><span><i class="bi bi-play-circle"></i> <?= (int)$model['videos_publicados'] ?> treinamento(s)</span><span class="<?= ($model['ficha_arquivo']||$model['ficha_url'])?'has-document':'' ?>"><i class="bi bi-file-earmark-check"></i> <?= ($model['ficha_arquivo']||$model['ficha_url'])?'Ficha disponível':'Sem ficha externa' ?></span></div>
            <button class="catalog-spec-button" type="button" data-catalog-spec><i class="bi bi-card-list"></i> Ver especificações técnicas <i class="bi bi-arrow-right"></i></button>
        </div>
    </article>
<?php endforeach; ?>
</section>

<div class="catalog-empty" data-catalog-empty hidden><i class="bi bi-search"></i><strong>Nenhum modelo encontrado</strong><p>Altere os filtros ou limpe a busca para visualizar outros veículos.</p></div>

<div class="modal catalog-spec-modal" id="catalog-spec-modal" aria-hidden="true"><div class="modal-dialog catalog-spec-dialog"><button class="modal-close" data-modal-close aria-label="Fechar especificações"><i class="bi bi-x-lg"></i></button><div class="modal-content">
    <div class="catalog-spec-header"><div class="catalog-spec-image" data-catalog-spec-image></div><div><span class="eyebrow blue" data-catalog-spec-brand></span><h2 data-catalog-spec-title></h2><p data-catalog-spec-description></p></div></div>
    <div class="catalog-spec-grid" data-catalog-spec-grid></div>
    <div class="catalog-spec-extras" data-catalog-spec-extras hidden><h3>Informações complementares</h3><div></div></div>
    <div class="modal-actions catalog-spec-actions"><a class="btn secondary" data-catalog-source target="_blank" rel="noopener" hidden><i class="bi bi-box-arrow-up-right"></i> Fonte oficial</a><a class="btn primary" data-catalog-document target="_blank" rel="noopener" hidden><i class="bi bi-file-earmark-pdf"></i> Abrir ficha técnica</a><button class="btn secondary" type="button" data-modal-close>Fechar</button></div>
</div></div></div>

<div class="modal catalog-comparison-modal" id="catalog-comparison-modal" aria-hidden="true"><div class="modal-dialog catalog-comparison-dialog"><button class="modal-close" data-modal-close aria-label="Fechar comparação"><i class="bi bi-x-lg"></i></button><div class="modal-content"><span class="eyebrow blue">Comparador técnico</span><h2>Comparação de veículos</h2><p>As informações abaixo são apresentadas conforme os dados oficiais disponíveis para cada fabricante.</p><div class="comparison-table-wrap" data-comparison-table></div><div class="modal-actions"><button class="btn secondary" type="button" data-modal-close>Fechar comparação</button></div></div></div></div>
