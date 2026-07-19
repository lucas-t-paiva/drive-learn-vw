<?php
declare(strict_types=1);

require __DIR__ . '/../app/bootstrap.php';
$pdo=db();if(!$pdo)$pdo=new PDO('mysql:host=127.0.0.1;port=3306;dbname=drive-learn-vw;charset=utf8mb4','root','',[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]);

$catalog=[
 'iveco'=>[
  'source'=>'https://new.iveco.com/brasil/Missoes',
  'families'=>[
   'Daily'=>['Veículos comerciais leves para distribuição urbana e aplicações variadas.',[
    ['Daily Chassi Cabine',null,null,null,null],
   ]],
   'Tector'=>['Linha de caminhões médios e semipesados para aplicações urbanas, rodoviárias e severas.',[
    ['Tector 17 t 4x2','FPT NEF','210–320 cv',null,'16 t'],['Tector 17 t 4x2 Trator','FPT NEF','320 cv',null,'36 t PBTC'],['Tector 24 t 6x2','FPT NEF','280–320 cv',null,'23 t'],['Tector 27 t 6x4','FPT NEF','320 cv',null,'27 t'],['Tector 31 t 8x2','FPT NEF','280–320 cv',null,'31 t']
   ]],
   'S-Way'=>['Linha de caminhões pesados para longa distância, disponível também com motorização a gás.',[
    ['S-Way 480 4x2','FPT Cursor 13','480 cv','2.450 Nm','60 t CMT'],['S-Way 480 6x2','FPT Cursor 13','480 cv',null,'60 t CMT'],['S-Way 540 6x4','FPT Cursor 13','540 cv',null,'80 t CMT'],['S-Way Natural 460 6x2',null,'460 cv',null,'53 t CMT']
   ]]
  ]
 ],
 'volvo'=>[
  'source'=>'https://www.volvotrucks.com.br/pt-br/trucks/models.html',
  'families'=>[
   'FH'=>['Linha Volvo para transporte de longa distância.',[['Volvo FH',null,null,null,null]]],
   'FM'=>['Linha versátil para transporte rodoviário e diferentes aplicações.',[['Volvo FM',null,null,null,null]]],
   'FMX'=>['Linha voltada à construção e operações severas.',[['Volvo FMX',null,null,null,null]]],
   'VM'=>['Linha para distribuição e operações de média distância.',[['Volvo VM',null,null,null,null]]]
  ]
 ],
 'mercedes-benz'=>[
  'source'=>'https://www.mercedes-benz-trucks.com/pt/pt/trucks.html',
  'families'=>[
   'Atego'=>['Linha para distribuição e aplicações de construção.',[['Mercedes-Benz Atego',null,null,null,null]]],
   'Actros'=>['Linha de caminhões para longa distância e transporte pesado.',[['Mercedes-Benz Actros',null,null,null,null]]],
   'Arocs'=>['Linha de caminhões para construção e operações severas.',[['Mercedes-Benz Arocs',null,null,null,null]]],
   'eActros'=>['Linha de caminhões elétricos para transporte regional e de longa distância.',[['Mercedes-Benz eActros',null,'400 kW contínuos / 600 kW máximos',null,null]]]
  ]
 ],
 'scania'=>[
  'source'=>'https://www.scania.com/br/pt/home/products.html',
  'families'=>[
   'Linha P'=>['Cabines versáteis para operações urbanas, regionais e de construção.',[['Scania P',null,null,null,null]]],
   'Linha G'=>['Cabines com maior espaço e conforto para operações regionais e rodoviárias.',[['Scania G',null,null,null,null]]],
   'Linha R'=>['Cabines premium para transporte de longa distância.',[['Scania R',null,null,null,null]]],
   'Linha S'=>['Cabines de piso plano para transporte de longa distância.',[['Scania S',null,null,null,null]]],
   'XT'=>['Configurações preparadas para construção, mineração e ambientes exigentes.',[['Scania XT',null,null,null,null]]],
   'Caminhões a gás'=>['Veículos disponíveis em configurações CNG e LNG.',[['Scania Gás',null,null,null,null]]]
  ]
 ]
];

$findBrand=$pdo->prepare('SELECT id FROM marcas WHERE slug=?');$findFamily=$pdo->prepare('SELECT id FROM familias WHERE marca_id=? AND nome=?');$insertFamily=$pdo->prepare('INSERT INTO familias(marca_id,nome,descricao,ativo) VALUES(?,?,?,1)');$updateFamily=$pdo->prepare('UPDATE familias SET descricao=? WHERE id=?');$findModel=$pdo->prepare('SELECT id FROM modelos WHERE familia_id=? AND nome=?');$insertModel=$pdo->prepare('INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,pbt,especificacoes,ativo) VALUES(?,?,?,?,?,?,?,?,?,1)');$updateModel=$pdo->prepare('UPDATE modelos SET descricao=?,motor=?,potencia=?,torque=?,pbt=?,especificacoes=? WHERE id=?');
$createdFamilies=0;$createdModels=0;
foreach($catalog as $brandSlug=>$brandData){$findBrand->execute([$brandSlug]);$brandId=(int)$findBrand->fetchColumn();if(!$brandId)continue;foreach($brandData['families'] as $familyName=>[$description,$models]){$findFamily->execute([$brandId,$familyName]);$familyId=(int)$findFamily->fetchColumn();if(!$familyId){$insertFamily->execute([$brandId,$familyName,$description]);$familyId=(int)$pdo->lastInsertId();$createdFamilies++;}else$updateFamily->execute([$description,$familyId]);foreach($models as [$name,$motor,$power,$torque,$pbt]){$sourceData=json_encode(['fonte_oficial'=>$brandData['source'],'conferido_em'=>'2026-07-18','observacao'=>'Configurações e versões podem variar por mercado e aplicação.'],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);$findModel->execute([$familyId,$name]);$modelId=(int)$findModel->fetchColumn();$values=['Catálogo inicial baseado na linha apresentada pelo fabricante. Consulte a fonte oficial para configuração completa.',$motor,$power,$torque,$pbt,$sourceData];if(!$modelId){$insertModel->execute(array_merge([$familyId,$name,$brandSlug.'-'.slugify($name)],$values));$createdModels++;}else{$values[]=$modelId;$updateModel->execute($values);}}}}

$documents=[
 ['iveco-s-way-480-4x2','https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/S-WAY-450-4x2-20-05-2025.pdf?rev=6623281ecfb145a98900b154b7e14be0','Ficha técnica oficial IVECO S-Way 480 4x2'],
 ['iveco-tector-17-t-4x2','https://www.iveco.com/brasil/-/media/IVECOdotcom/Brasil/ProductBrochures/Iveco_tector_semipesado_MY24-20-05-2025.pdf?rev=dab70d0f69d8422caf23469a00678000','Ficha técnica oficial da linha IVECO Tector'],
 ['volvo-volvo-fm','https://www.volvotrucks.com.br/pt-br/trucks/models/volvo-fm/data-sheets.html','Fichas técnicas oficiais Volvo FM'],
];
$findModelBySlug=$pdo->prepare('SELECT id FROM modelos WHERE slug=?');$saveDocument=$pdo->prepare("INSERT INTO modelo_documentos(modelo_id,tipo,titulo,url_origem,fonte_pagina,ativo) VALUES(?,'ficha_tecnica',?,?,?,1) ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1");
foreach($documents as [$slug,$url,$title]){$findModelBySlug->execute([$slug]);$modelId=(int)$findModelBySlug->fetchColumn();if($modelId)$saveDocument->execute([$modelId,$title,$url,$url]);}
echo "Catálogo inicial concorrente atualizado: {$createdFamilies} família(s) e {$createdModels} modelo(s) novo(s).\n";
