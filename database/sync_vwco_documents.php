<?php
declare(strict_types=1);
require __DIR__ . '/../app/bootstrap.php';

$pdo=db();
if(!$pdo)exit("Banco de dados indisponível.\n");
require __DIR__ . '/migrate_model_documents.php';

$pages = [
    'https://www.vwco.com.br/caminhoes/Delivery/Deliveryexpress?id=1&productid=197' => ['Delivery Express'],
    'https://www.vwco.com.br/caminhoes/Delivery/Delivery6.170-euro?id=1&productid=198' => ['Delivery 6.170'],
    'https://www.vwco.com.br/caminhoes/Delivery/Delivery9.180-euro?id=1&productid=199' => ['Delivery 9.180'],
    'https://www.vwco.com.br/caminhoes/Delivery/Delivery11.180-euro?id=1&productid=200' => ['Delivery 11.180'],
    'https://www.vwco.com.br/caminhoes/Delivery/Delivery11.1804x4-euro?id=1&productid=201' => ['Delivery 11.180 4x4'],
    'https://www.vwco.com.br/caminhoes/Delivery/Delivery14.180-euro?id=1&productid=202' => ['Delivery 14.180'],
    'https://www.vwco.com.br/caminhoes/e-Delivery/edelivery11?id=27&productid=184' => ['e-Delivery 11'],
    'https://www.vwco.com.br/caminhoes/e-Delivery/e-Delivery%2014?id=27&productid=185' => ['e-Delivery 14'],
    'https://www.vwco.com.br/caminhoes/Constellation/14.210?id=2&productid=203' => ['Constellation 14.210 4x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/17.210?id=2&productid=204' => ['Constellation 17.210 4x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/18.210?id=2&productid=205' => ['Constellation 18.210 4x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/18.260?id=2&productid=206' => ['Constellation 18.260 4x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/18.320?id=2&productid=207' => ['Constellation 18.320 4x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/26.260?id=2&productid=208' => ['Constellation 26.260 6x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/26.320?id=2&productid=209' => ['Constellation 26.320 6x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/30.320?id=2&productid=210' => ['Constellation 30.320 8x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/27.260?id=2&productid=211' => ['Constellation 27.260 6x4'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation27.320-euro?id=2&productid=214' => ['Novo Constellation 27.320 6x4'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation31.320-euro?id=2&productid=212' => ['Constellation 31.320 6x4'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation32.380-euro?id=2&productid=215' => ['Constellation 32.380 6x4'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation33.260?id=2&productid=253' => ['Constellation 33.260 8x4'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation19.380-euro?id=2&productid=216' => ['Constellation 19.380 4x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation25.380-euro?id=2&productid=217' => ['Constellation 25.380 6x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation25.480-euro?id=2&productid=218' => ['Constellation 25.480HD 6x2'],
    'https://www.vwco.com.br/caminhoes/Constellation/Constellation20.480?id=2&productid=256' => ['Constellation 20.480 4x2'],
    'https://www.vwco.com.br/caminhoes/Meteor/Meteor28.480-euro?id=21&productid=219' => ['Novo Meteor Highline 28.480HD'],
    'https://www.vwco.com.br/caminhoes/Meteor/Meteor29.530-euro?id=21&productid=220' => ['Novo Meteor Highline 29.530'],
    'https://www.vwco.com.br/onibus/Urbano/Volksbus9.180?id=5&productid=221' => ['Volksbus 9.180 / S'],
    'https://www.vwco.com.br/onibus/Urbano/Novo11.180S?id=5&productid=223' => ['Volksbus 11.180 / S'],
    'https://www.vwco.com.br/onibus/Urbano/Novo15.210?id=5&productid=224' => ['Volksbus 15.210 / S'],
    'https://www.vwco.com.br/onibus/Urbano/Novo17.230S?id=5&productid=228' => ['Volksbus 17.230 / S'],
    'https://www.vwco.com.br/onibus/Urbano/novo17.260?id=5&productid=226' => ['Volksbus 17.260 / S'],
    'https://www.vwco.com.br/onibus/Urbano/novo18.320SL?id=5&productid=227' => ['Volksbus 18.320 SL'],
    'https://www.vwco.com.br/onibus/Urbano/Novo22.260?id=5&productid=225' => ['Volksbus 22.260'],
    'https://www.vwco.com.br/onibus/FretamentoeRodoviario/Novo18.320SH?id=16&productid=222' => ['Volksbus 18.320 SH'],
    'https://www.vwco.com.br/onibus/Escolar/8.180onurea?id=28&productid=235' => ['Volksbus 8.180 (ONUREA)'],
    'https://www.vwco.com.br/onibus/Escolar/8.180R?id=28&productid=236' => ['Volksbus 8.180 E (ORE 1)'],
];

$aliases = [
    'Volksbus 9.180 / S'=>['Volksbus 9.180 / S'],
    'Volksbus 11.180 / S'=>['Volksbus 11.180 / S'],
    'Volksbus 15.210 / S'=>['Volksbus 15.210 / S'],
    'Volksbus 17.230 / S'=>['Volksbus 17.230 / S'],
    'Volksbus 17.260 / S'=>['Volksbus 17.260 / S'],
];

$context=stream_context_create(['http'=>['timeout'=>35,'user_agent'=>'Drive Learn VWCO catalog sync/1.0'],'ssl'=>['verify_peer'=>true,'verify_peer_name'=>true]]);
$directory=__DIR__.'/../public/assets/documents/modelos';
if(!is_dir($directory)&&!mkdir($directory,0775,true)&&!is_dir($directory))exit("Não foi possível preparar a pasta de documentos.\n");
$find=$pdo->prepare('SELECT id,nome FROM modelos WHERE nome=? ORDER BY id');
$save=$pdo->prepare('INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,fonte_pagina,ativo) VALUES(?,?,?,?,?,?,1) ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),arquivo=VALUES(arquivo),url_origem=VALUES(url_origem),fonte_pagina=VALUES(fonte_pagina),ativo=1');
$downloaded=[];$linked=0;$missing=[];$errors=[];

foreach($pages as $page=>$modelNames){
    $html=@file_get_contents($page,false,$context);
    if($html===false){$errors[]="Página indisponível: {$page}";continue;}
    preg_match_all('~<a[^>]+href=["\']([^"\']+\.pdf)["\'][^>]*>(.*?)</a>~is',$html,$matches,PREG_SET_ORDER);
    $documents=[];
    foreach($matches as $match){
        $label=trim(preg_replace('/\s+/u',' ',html_entity_decode(strip_tags($match[2]),ENT_QUOTES|ENT_HTML5,'UTF-8')));
        // A carga automática prioriza fichas técnicas. Algumas diretrizes oficiais
        // ultrapassam 100 MB e podem ser anexadas manualmente quando necessárias.
        $type=stripos($label,'Ficha técnica')!==false?'ficha_tecnica':null;
        if($type)$documents[$type]=html_entity_decode($match[1],ENT_QUOTES|ENT_HTML5,'UTF-8');
    }
    if(!$documents){$errors[]="Nenhum documento técnico em {$page}";continue;}
    foreach($modelNames as $modelName){
        $find->execute([$modelName]);$models=$find->fetchAll();
        if(!$models){$missing[]=$modelName;continue;}
        foreach($models as $model){foreach($documents as $type=>$remoteUrl){
            $filename='vwco-'.substr(sha1($remoteUrl),0,24).'.pdf';$absolute=$directory.'/'.$filename;
            if(!isset($downloaded[$remoteUrl])&&!is_file($absolute)){
                $source=@fopen($remoteUrl,'rb',false,$context);$temporary=$absolute.'.part';$target=$source?@fopen($temporary,'wb'):false;$size=0;$valid=false;
                if($source&&$target){
                    $header=fread($source,5);$valid=$header==='%PDF-';if($valid){fwrite($target,$header);$size=5;}
                    while($valid&&!feof($source)){$chunk=fread($source,1024*1024);if($chunk===false)break;$size+=strlen($chunk);if($size>25*1024*1024){$valid=false;break;}fwrite($target,$chunk);}
                    fclose($source);fclose($target);
                }
                if(!$valid){if(is_resource($source))fclose($source);if(is_resource($target))fclose($target);if(is_file($temporary))unlink($temporary);$errors[]="PDF inválido ou maior que 25 MB: {$remoteUrl}";continue;}
                rename($temporary,$absolute);
            }
            $downloaded[$remoteUrl]=$absolute;
            $title=$type==='ficha_tecnica'?'Ficha técnica completa':'Diretrizes de implementação';
            $save->execute([(int)$model['id'],$type,$title,'public/assets/documents/modelos/'.$filename,$remoteUrl,$page]);$linked++;
        }}
    }
}

echo "Documentos vinculados: {$linked}. Arquivos locais únicos: ".count($downloaded).".\n";
if($missing)echo 'Modelos não localizados: '.implode(', ',array_unique($missing)).".\n";
if($errors)echo "Avisos:\n- ".implode("\n- ",$errors)."\n";
