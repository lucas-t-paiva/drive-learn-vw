<?php
declare(strict_types=1);

function load_technical_catalog_page(): array
{
    $pdo = db();
    if (!$pdo) return ['brands'=>[],'families'=>[],'models'=>[],'totals'=>[]];

    $priceTable = (bool)$pdo->query("SHOW TABLES LIKE 'modelo_precos'")->fetchColumn();
    $priceSelect = $priceTable
        ? ",mp.tipo_preco preco_tipo,mp.valor_min preco_valor_min,mp.valor_max preco_valor_max,
                mp.moeda preco_moeda,mp.ano_modelo preco_ano_modelo,mp.variante preco_variante,
                mp.fonte_url preco_fonte,mp.consultado_em preco_consultado_em,mp.observacao preco_observacao"
        : ",NULL preco_tipo,NULL preco_valor_min,NULL preco_valor_max,NULL preco_moeda,
                NULL preco_ano_modelo,NULL preco_variante,NULL preco_fonte,NULL preco_consultado_em,NULL preco_observacao";
    $priceJoin = $priceTable
        ? " LEFT JOIN modelo_precos mp ON mp.id=(SELECT mp2.id FROM modelo_precos mp2 WHERE mp2.modelo_id=m.id AND mp2.ativo=1 ORDER BY mp2.consultado_em DESC,mp2.id DESC LIMIT 1)"
        : '';

    $models = $pdo->query(
        "SELECT m.id,m.familia_id,m.nome,m.slug,m.descricao,m.imagem,m.motor,m.potencia,m.torque,
                m.transmissao,m.pbt,m.pbtc,m.relacao_reducao,m.especificacoes,
                f.nome familia_nome,f.marca_id,f.tipo_veiculo,
                ma.nome marca_nome,ma.logo marca_logo,
                md.arquivo ficha_arquivo,md.url_origem ficha_url,md.fonte_pagina ficha_fonte
                {$priceSelect},
                (SELECT COUNT(*) FROM video_modelos vm JOIN videos v ON v.id=vm.video_id WHERE vm.modelo_id=m.id AND v.status='publicado') videos_publicados
           FROM modelos m
           JOIN familias f ON f.id=m.familia_id AND f.ativo=1
           JOIN marcas ma ON ma.id=f.marca_id AND ma.ativo=1
      LEFT JOIN modelo_documentos md ON md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1
          {$priceJoin}
          WHERE m.ativo=1
       ORDER BY ma.nome,f.nome,m.nome"
    )->fetchAll();

    $brandMap = [];
    $familyMap = [];
    $documents = 0;
    foreach ($models as $model) {
        $brandMap[(int)$model['marca_id']] = [
            'id'=>(int)$model['marca_id'],'nome'=>$model['marca_nome'],'logo'=>$model['marca_logo'],
        ];
        $familyMap[(int)$model['familia_id']] = [
            'id'=>(int)$model['familia_id'],'marca_id'=>(int)$model['marca_id'],'tipo_veiculo'=>$model['tipo_veiculo'],
            'nome'=>$model['familia_nome'],'marca_nome'=>$model['marca_nome'],
        ];
        if ($model['ficha_arquivo'] || $model['ficha_url']) $documents++;
    }

    return [
        'brands'=>array_values($brandMap),
        'families'=>array_values($familyMap),
        'models'=>$models,
        'totals'=>[
            'brands'=>count($brandMap),'families'=>count($familyMap),
            'models'=>count($models),'documents'=>$documents,
        ],
    ];
}
