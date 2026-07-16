<?php
declare(strict_types=1);
require __DIR__ . '/../app/bootstrap.php';

$families = [
    'Delivery' => 'Agilidade, economia e versatilidade para entregas urbanas e operações de distribuição.',
    'e-Delivery' => 'Caminhões elétricos desenvolvidos para operações urbanas mais silenciosas e sustentáveis.',
    'Constellation' => 'Eficiência, conforto, tecnologia e segurança para aplicações urbanas, rodoviárias e fora de estrada.',
    'Meteor' => 'Extrapesados fortes, confortáveis e conectados para operações rodoviárias de alta produtividade.',
    'Urbano' => 'Chassis Volksbus robustos, eficientes e preparados para os desafios diários do transporte coletivo urbano.',
    'Rodoviário' => 'Ônibus para fretamento e operações rodoviárias, com foco no conforto dos passageiros e na eficiência da operação.',
    'Escolar' => 'Ônibus escolares desenvolvidos para transportar estudantes com segurança, conforto e robustez em diferentes trajetos.',
];

$models = [
['Delivery','Delivery Express','F1C 3.0l','156 cv @ 3.300 rpm','360 Nm @ 1.300 - 2.900 rpm','Eaton / ESO 4106A','3.500','https://d1qeqf1yyyqyq8.cloudfront.net/ed4ab9eb-14c4-48e8-b199-a30f9c5cde9d.png'],
['Delivery','Delivery 6.170','F1C 3.0l','156 cv @ 3.300 rpm','430 Nm @ 1.400 - 2.700 rpm','Manual - Eaton / ESO 4206','5.850','https://d1qeqf1yyyqyq8.cloudfront.net/a6681463-ed6e-404c-adb9-3d3117a72759.png'],
['Delivery','Delivery 9.180','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual Eaton ESO 6106 / Automatizada EAO 6106','9.200','https://d1qeqf1yyyqyq8.cloudfront.net/8b94632d-9889-452c-b4f0-c18fe089cf79.png'],
['Delivery','Delivery 11.180','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual Eaton ESO 6106 / Automatizada EAO 6106','10.800','https://d1qeqf1yyyqyq8.cloudfront.net/824afe94-8d5d-4a71-aa20-d5387c964cf0.png'],
['Delivery','Delivery 11.180 4x4','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Eaton / ESO 6106A','10.800','https://d1qeqf1yyyqyq8.cloudfront.net/cfef93a3-fc6f-41cf-be4c-3ca3a2942f80.png'],
['Delivery','Delivery 14.180','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Eaton / ESO 6206A','14.000','https://d1qeqf1yyyqyq8.cloudfront.net/4ea438a1-a745-408f-a492-85008a2f3c16.png'],
['e-Delivery','e-Delivery 11','JJE / SD460','280 @ 1.200 a 3.500','2.300 @ 0 a 1.200','Tração elétrica','11.400','https://d1qeqf1yyyqyq8.cloudfront.net/a9e2cfc3-ec1d-4a96-b5c0-3a02da8197e6.jpeg'],
['e-Delivery','e-Delivery 14','WEG / VW 280','300 @ 1.360 a 3.500','2.150 @ 0 a 1.360','Tração elétrica','14.300','https://d1qeqf1yyyqyq8.cloudfront.net/820b2980-06fa-4ab3-a09a-0af9b1a53724.jpeg'],
['Constellation','Constellation 14.210 4x2','MAN / D0834LF08','205 (150) @ 2.300','750 @ 1.200 - 1.800','Manual - Eaton / FS 5406-A','14.500','https://d1qeqf1yyyqyq8.cloudfront.net/d72a14bf-798d-4d5c-91aa-36e8234abc32.png'],
['Constellation','Constellation 17.210 4x2','MAN / D0834LF08','205 (150) @ 2.300','750 @ 1.200 - 1.800','Manual - Eaton / FS 5406-A','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/d718c564-f01f-4e8b-af09-ba4948e9a2c3.png'],
['Constellation','Constellation 18.210 4x2','MAN / D0834LF08','205 (150) @ 2.300','750 @ 1.200 - 1.800','Eaton FS 5406-A / ZF 8AP 900T','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/b13c99f8-ee07-4ba8-a115-c46b95406e36.png'],
['Constellation','Constellation 18.260 4x2','MAN / D0836LF18','260 (191) @ 2.200','950 @ 1.000 - 1.800','Eaton / FSO 6406 A','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/43e9900a-a53c-4b0d-8b61-e619e8107409.png'],
['Constellation','Constellation 18.320 4x2','MAN / D0836LF17','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF 9S 1310 TD / ZF 12TX 2420 TD','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/33172bb4-c3c4-4de3-9d5f-b2d20ba68519.png'],
['Constellation','Constellation 26.260 6x2','MAN / D0836LF18','260 (191) @ 2.200','950 @ 1.000 - 1.800','Manual - Eaton / FS 6406-A','23.000','https://d1qeqf1yyyqyq8.cloudfront.net/e72402da-2c9c-4069-809d-9064cff87e1a.jpeg'],
['Constellation','Constellation 26.320 6x2','MAN / D0836LF17','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF 9S 1310 TD / ZF 12TX 2420 TD','23.000','https://d1qeqf1yyyqyq8.cloudfront.net/6c8f8190-7b7f-41ed-a7f7-ad006d780acd.jpeg'],
['Constellation','Constellation 30.320 8x2','MAN / D0836LF17','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF 9S 1310 TD / ZF 12TX 2420 TD','29.000','https://d1qeqf1yyyqyq8.cloudfront.net/01004af2-f9d0-4996-8280-2e0d8216aefc.jpeg'],
['Constellation','Constellation 27.260 6x4','MAN / D0836LF18','260 (191) @ 2.200','950 @ 1.000 - 1.800','ZF / 9S 1310 TD','23.000','https://d1qeqf1yyyqyq8.cloudfront.net/d2d3a768-371b-40a9-9026-cde251833572.png'],
['Constellation','Novo Constellation 27.320 6x4','MAN / D0836LF17','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF / 9S 1310 TD','36.000 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/037c18d3-2cd1-4557-8f8e-3870de557df7.jpeg'],
['Constellation','Constellation 31.320 6x4','MAN / D0836LF17','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','Automatizada - ZF / 12TX 2424 TD','23.000','https://d1qeqf1yyyqyq8.cloudfront.net/3eaa47b3-a460-4e2e-a239-ae64745f14f7.jpeg'],
['Constellation','Constellation 32.380 6x4','Cummins / ISL','375 (276) @ 1.900','1.700 @ 1.100 - 1.400','ZF / 12TX 2624 TD','23.000','https://d1qeqf1yyyqyq8.cloudfront.net/66fc044a-6030-419c-ac7d-c7ea8e1e75aa.png'],
['Constellation','Constellation 33.260 8x4','MAN / D0836LF18','260 (191) @ 2.200','950 @ 1.000 - 1.800','ZF / 9S 1310 TD','29.000','https://d1qeqf1yyyqyq8.cloudfront.net/46277841-dc68-4e41-b7bc-7e821bf1890e.jpeg'],
['Constellation','Constellation 33.480 6x4','MAN / D2676LFAG','475 (350) @ 1.800','2.400 @ 930 - 1.350','ZF / 12TX 2824 TO','74.000 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/c21c3887-1a3b-43db-ad9a-718337ac32d7.jpeg'],
['Constellation','Constellation 19.380 4x2','Cummins / ISL','375 (276) @ 1.900','1.700 @ 1.100 - 1.400','ZF / 12TX 2624 TD','45.000 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/76d4e4c6-62bb-4e30-8752-7d6893d4277a.png'],
['Constellation','Constellation 20.480 4x2','MAN / D2676LFAG','475 (350) @ 1.800','2.400 @ 930 - 1.350','ZF / 12TX 2624 TD','56.000 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/8c0abfa7-d3c1-4400-a27b-71bc0b2bcb69.png'],
['Constellation','Constellation 25.380 6x2','Cummins / ISL','375 (276) @ 1.900','1.700 @ 1.100 - 1.400','ZF / 12TX 2624 TD','56.000 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/f4e72e69-b697-4a56-b001-d10978c489c8.jpeg'],
['Constellation','Constellation 25.480HD 6x2','MAN / D2676LFAG','475 (350) @ 1.800','2.400 @ 930 - 1.350','ZF / 12TX 2624 TD','58.500 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/dcb20fa1-0b9c-427f-be36-43ca88aef409.jpeg'],
['Meteor','Novo Meteor Highline 28.480HD','MAN / D2676LFAG','475 (350) @ 1.800','2.400 @ 930 - 1.350','ZF / 12TX 2624 TD','58.500 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/c5f91031-642a-4eaf-ae17-f24e350ea80c.png'],
['Meteor','Novo Meteor Highline 29.530','MAN / D2676LFAD','525 (386) @ 1.800','2.600 @ 930 - 1.350','ZF / 12TX 2624 TD','74.000 PBTC','https://d1qeqf1yyyqyq8.cloudfront.net/cc993590-862e-4258-86f9-2f3c72c2eca0.jpeg'],
['Urbano','e-Volksbus 22L','VW / SD 460','280 kW (380 cv)','2.450 Nm','Tração elétrica — Zero Emission','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/d5ea4bba-5d2e-4c88-9483-a3fa8bbd644c.jpeg','urbano-e-volksbus-22l'],
['Urbano','Volksbus 9.180 / S','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','9.600','https://d1qeqf1yyyqyq8.cloudfront.net/64752ccd-b587-4b2a-8fee-9b5710f08c5b.jpeg','urbano-volksbus-9-180-s'],
['Urbano','Volksbus 11.180 / S','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','10.700','https://d1qeqf1yyyqyq8.cloudfront.net/8ac4bf43-5432-4109-9a04-957fbd79c60b.jpeg','urbano-volksbus-11-180-s'],
['Urbano','Volksbus 15.210 / S','MAN / D0834LF08','205 (150) @ 2.300','750 @ 1.200 - 1.800','ZF 8AP900B / ZF 6S1010BO','15.500','https://d1qeqf1yyyqyq8.cloudfront.net/3ca1594f-d99d-435b-bdd0-3fa907a1eb5e.jpeg','urbano-volksbus-15-210-s'],
['Urbano','Volksbus 17.230 / S','MAN / D0834','225 (166) @ 2.300','850 @ 1.300 - 1.800','ZF 8AP900B / ZF 6S1010BO','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/c2e53947-0c25-4215-ae63-f515b9bb8160.jpeg','urbano-volksbus-17-230-s'],
['Urbano','Volksbus 17.260 / S','MAN / D0836LF18','260 (191) @ 2.200','950 @ 1.000 - 1.800','ZF 8AP900B / ZF 6S1010BO','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/182092f5-fbe0-41e3-92a1-a9956a387c2d.jpeg','urbano-volksbus-17-260-s'],
['Urbano','Volksbus 18.320 SL','MAN / D0836LOH12','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF / 6AP 1220 B','16.000','https://d1qeqf1yyyqyq8.cloudfront.net/5e7ec48e-6455-4ffa-81c7-b9efcf08e9f9.jpeg','urbano-volksbus-18-320-sl'],
['Urbano','Volksbus 22.260','MAN / D0836LF17','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF / 6S 1010 BO','21.000','https://d1qeqf1yyyqyq8.cloudfront.net/e3daeba3-60a9-4211-a9f2-6bde96d2761a.png','urbano-volksbus-22-260'],
['Rodoviário','Volksbus 9.180 / S','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','9.600','https://d1qeqf1yyyqyq8.cloudfront.net/689aabec-8353-41ef-9c0b-67592b6ffa31.jpeg','rodoviario-volksbus-9-180-s'],
['Rodoviário','Volksbus 11.180 / S','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','10.700','https://d1qeqf1yyyqyq8.cloudfront.net/2b54af35-9e39-482c-b58d-f09b8b962f5f.jpeg','rodoviario-volksbus-11-180-s'],
['Rodoviário','Volksbus 15.210 / S','MAN / D0834LF08','205 (150) @ 2.300','750 @ 1.200 - 1.800','ZF 8AP900B / ZF 6S1010BO','15.500','https://d1qeqf1yyyqyq8.cloudfront.net/fae59423-4846-4a6a-bb4b-cef31ff08a83.jpeg','rodoviario-volksbus-15-210-s'],
['Rodoviário','Volksbus 17.230 / S','MAN / D0834','225 (166) @ 2.300','850 @ 1.300 - 1.800','ZF 8AP900B / ZF 6S1010BO','17.000','https://d1qeqf1yyyqyq8.cloudfront.net/01b1808f-b700-4ee8-b64e-763436eb39bf.jpeg','rodoviario-volksbus-17-230-s'],
['Rodoviário','Volksbus 17.260 / S','MAN / D0836LF18','260 (191) @ 2.200','950 @ 1.000 - 1.800','ZF 8AP900B / ZF 6S1010BO','17.000','https://d1qeqf1yyyqyq8.cloudfront.net/629bcc2a-5ef0-4086-80c3-032c76c8d899.jpeg','rodoviario-volksbus-17-260-s'],
['Rodoviário','Volksbus 18.320 SH','MAN / D0836LOH12','315 (231) @ 2.200','1.200 @ 1.200 - 1.700','ZF / 8AP 1200 B','18.000','https://d1qeqf1yyyqyq8.cloudfront.net/af610c58-0f6f-4cbe-b089-9422c842bf8d.jpeg','rodoviario-volksbus-18-320-sh'],
['Escolar','Volksbus 8.180 E (ORE 1)','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','8.700','https://d1qeqf1yyyqyq8.cloudfront.net/77a1f038-a409-4203-8912-7683886d3ec9.jpeg','escolar-volksbus-8-180-e-ore-1'],
['Escolar','Volksbus 11.180 E (ORE 2)','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','10.800','https://d1qeqf1yyyqyq8.cloudfront.net/8ac4bf43-5432-4109-9a04-957fbd79c60b.jpeg','escolar-volksbus-11-180-e-ore-2'],
['Escolar','Volksbus 15.210 E (ORE 3)','MAN / D0834LF08','205 (150) @ 2.300','750 @ 1.200 - 1.800','Eaton / FSB 5406-A','15.000','https://d1qeqf1yyyqyq8.cloudfront.net/3ca1594f-d99d-435b-bdd0-3fa907a1eb5e.jpeg','escolar-volksbus-15-210-e-ore-3'],
['Escolar','Volksbus 8.180 (ONUREA)','Cummins / ISF 3.8l','175 (129) @ 2.500','600 @ 1.100 - 1.800','Manual - Eaton / ESO 6206-A','8.700','https://d1qeqf1yyyqyq8.cloudfront.net/e8a39fbe-af15-48af-9ccb-052750b8f167.jpeg','escolar-volksbus-8-180-onurea'],
];

$pdo = db();
if (!$pdo) throw new RuntimeException('Banco indisponível.');
$imageDir = __DIR__ . '/../public/assets/images/modelos';
if (!is_dir($imageDir)) mkdir($imageDir, 0775, true);
$context = stream_context_create(['http' => ['timeout' => 25, 'header' => "User-Agent: DriveLearnCatalogSync/1.0\r\n"]]);
$familyIds = [];
$familyImages = [];
$aliases = ['Constellation 17.210 4x2'=>'Constellation 17.210','Novo Meteor Highline 29.530'=>'Meteor 29.530'];

$pdo->beginTransaction();
try {
    $familyStmt = $pdo->prepare('INSERT INTO familias(nome,descricao,ativo) VALUES(?,?,1) ON DUPLICATE KEY UPDATE descricao=VALUES(descricao),ativo=1');
    foreach ($families as $name => $description) { $familyStmt->execute([$name,$description]); $id=$pdo->prepare('SELECT id FROM familias WHERE nome=?'); $id->execute([$name]); $familyIds[$name]=(int)$id->fetchColumn(); }
    $findBySlug = $pdo->prepare('SELECT id FROM modelos WHERE slug=? LIMIT 1');
    $findLegacy = $pdo->prepare('SELECT id FROM modelos WHERE nome=? LIMIT 1');
    $insert = $pdo->prepare('INSERT INTO modelos(familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,pbt,ativo) VALUES(?,?,?,?,?,?,?,?,?,?,1)');
    $update = $pdo->prepare('UPDATE modelos SET familia_id=?,nome=?,slug=?,descricao=?,imagem=COALESCE(?,imagem),motor=?,potencia=?,torque=?,transmissao=?,pbt=?,ativo=1 WHERE id=?');
    foreach ($models as $model) {
        [$family,$name,$motor,$power,$torque,$transmission,$pbt,$remoteImage] = array_slice($model, 0, 8);
        $customSlug = $model[8] ?? null;
        $slug = $customSlug ?: slugify($name);
        $remotePath = (string) parse_url($remoteImage, PHP_URL_PATH);
        $remoteExtension = strtolower(pathinfo($remotePath, PATHINFO_EXTENSION));
        $ext = in_array($remoteExtension, ['jpg', 'jpeg', 'png', 'webp'], true) ? ($remoteExtension === 'jpeg' ? 'jpg' : $remoteExtension) : 'jpg';
        $filename=$slug.'.'.$ext; $absolute=$imageDir.'/'.$filename;
        if (!is_file($absolute)) { $content=@file_get_contents($remoteImage,false,$context); if ($content!==false) file_put_contents($absolute,$content); }
        $relative=is_file($absolute)?'public/assets/images/modelos/'.$filename:null;
        $description="Modelo {$name} da família Volkswagen {$family}.";
        $findBySlug->execute([$slug]);
        $id = $findBySlug->fetchColumn();
        if (!$id && !$customSlug) {
            $lookup=$aliases[$name]??$name;
            $findLegacy->execute([$lookup]);
            $id=$findLegacy->fetchColumn();
        }
        $values=[$familyIds[$family],$name,$slug,$description,$relative,$motor,$power,$torque,$transmission,$pbt];
        if ($id) { $values[]=(int)$id; $update->execute($values); } else $insert->execute($values);
        if (!isset($familyImages[$family]) && $relative) $familyImages[$family]=$relative;
    }
    $updateFamilyImage=$pdo->prepare('UPDATE familias SET imagem=? WHERE id=?');
    foreach($familyImages as $family=>$image) $updateFamilyImage->execute([$image,$familyIds[$family]]);
    $pdo->commit();
    echo 'Catálogo sincronizado: '.count($models).' modelos em '.count($families).' famílias.'.PHP_EOL;
} catch(Throwable $e) { $pdo->rollBack(); throw $e; }
