<?php
declare(strict_types=1);

function load_technical_catalog_page(): array
{
    $pdo = db();
    if (!$pdo) return ['brands'=>[],'families'=>[],'models'=>[],'totals'=>[]];

    $models = $pdo->query(
        "SELECT m.id,m.familia_id,m.nome,m.slug,m.descricao,m.imagem,m.motor,m.potencia,m.torque,
                m.transmissao,m.pbt,m.especificacoes,
                f.nome familia_nome,f.marca_id,
                ma.nome marca_nome,ma.logo marca_logo,
                md.arquivo ficha_arquivo,md.url_origem ficha_url,md.fonte_pagina ficha_fonte,
                (SELECT COUNT(*) FROM video_modelos vm JOIN videos v ON v.id=vm.video_id WHERE vm.modelo_id=m.id AND v.status='publicado') videos_publicados
           FROM modelos m
           JOIN familias f ON f.id=m.familia_id AND f.ativo=1
           JOIN marcas ma ON ma.id=f.marca_id AND ma.ativo=1
      LEFT JOIN modelo_documentos md ON md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1
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
            'id'=>(int)$model['familia_id'],'marca_id'=>(int)$model['marca_id'],
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
