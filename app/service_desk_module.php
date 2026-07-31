<?php
declare(strict_types=1);

function service_desk_internal_user(): bool
{
    return is_master() || in_array((string)(user()['active_company_type'] ?? ''), ['vwco','concessionaria'], true);
}

function service_desk_can_manage(): bool
{
    $role=(string)(user()['role_slug']??'');
    if(is_master())return true;
    if(in_array($role,['coordenacao','cliente','colaborador-cliente','colaborador-vwco'],true))return false;
    return service_desk_internal_user()&&can('service_desk','update');
}

function service_desk_statuses(): array
{
    return [
        'rascunho'=>'Rascunho',
        'novo'=>'Novo',
        'transferido'=>'Transferido para a área responsável',
        'em_tratamento'=>'Em tratamento',
        'possivel_solucao'=>'Possível solução',
        'finalizado'=>'Finalizado',
        'cancelado'=>'Cancelado',
    ];
}

function service_desk_types(): array
{
    return ['falha'=>'Falha','erro'=>'Erro','melhoria'=>'Melhoria','sugestao'=>'Sugestão'];
}

function service_desk_groups(): array
{
    return ['incidente'=>'Incidente','requisicao'=>'Requisição'];
}

function service_desk_origins(): array
{
    return ['veiculo'=>'Veículo','sistema'=>'Sistema'];
}

function service_desk_group_for_type(string $type): string
{
    return in_array($type,['melhoria','sugestao'],true)?'requisicao':'incidente';
}

function service_desk_priority_for_classification(PDO $pdo,array $category,string $type,string $criticality): array
{
    $priorityId=(int)($category['prioridade_id']??0);
    if(!$priorityId){
        $code=in_array($type,['melhoria','sugestao'],true)?'P5':match($criticality){'critica'=>'P1','alta'=>'P2','baixa'=>'P4',default=>'P3'};
        $stmt=$pdo->prepare('SELECT * FROM service_priorities WHERE codigo=? AND ativo=1 LIMIT 1');$stmt->execute([$code]);$priority=$stmt->fetch();
    }else{
        $stmt=$pdo->prepare('SELECT * FROM service_priorities WHERE id=? AND ativo=1 LIMIT 1');$stmt->execute([$priorityId]);$priority=$stmt->fetch();
    }
    if(!$priority)$priority=$pdo->query('SELECT * FROM service_priorities WHERE ativo=1 ORDER BY ABS(ordem-3),ordem LIMIT 1')->fetch();
    return $priority?:['id'=>null,'codigo'=>'P3','sla_primeira_interacao_minutos'=>240,'sla_resolucao_minutos'=>1440];
}

function service_desk_access_clause(array &$params, string $alias='sr'): string
{
    $current=user();
    $role=(string)($current['role_slug']??'');
    $level=(int)($current['role_level']??0);
    if(is_master()||$role==='coordenacao')return '1=1';
    if(($current['active_company_type']??'')==='cliente'){
        if($role==='colaborador-cliente'||$level<60){
            $params[]=(int)($current['id']??0);
            return "{$alias}.usuario_id=?";
        }
        $params[]=active_company_id()?:0;
        return "{$alias}.empresa_cliente_id=?";
    }
    if($role==='colaborador-vwco'){
        $params[]=(int)($current['id']??0);
        return "{$alias}.usuario_id=?";
    }
    $ids=accessible_client_company_ids();
    if(active_company_id())$ids[]=(int)active_company_id();
    $ids=array_values(array_unique(array_filter(array_map('intval',$ids))));
    if(!$ids)return '1=0';
    $params=array_merge($params,$ids);
    return "{$alias}.empresa_cliente_id IN (".implode(',',array_fill(0,count($ids),'?')).')';
}

function service_desk_allowed_companies(PDO $pdo): array
{
    $current=user();$role=(string)($current['role_slug']??'');
    if(is_master()||$role==='coordenacao')return $pdo->query('SELECT id,nome_fantasia,tipo FROM empresas WHERE ativo=1 ORDER BY tipo,nome_fantasia')->fetchAll();
    if(($current['active_company_type']??'')==='cliente'||$role==='colaborador-vwco'){
        $id=(int)(active_company_id()??0);
        if(!$id)return [];
        $stmt=$pdo->prepare('SELECT id,nome_fantasia,tipo FROM empresas WHERE id=? AND ativo=1');$stmt->execute([$id]);
        return $stmt->fetchAll();
    }
    $ids=accessible_client_company_ids();
    if(active_company_id())$ids[]=(int)active_company_id();
    $ids=array_values(array_unique(array_filter(array_map('intval',$ids))));
    if(!$ids)return [];
    $marks=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT id,nome_fantasia,tipo FROM empresas WHERE id IN ({$marks}) AND ativo=1 ORDER BY tipo,nome_fantasia");$stmt->execute($ids);
    return $stmt->fetchAll();
}

function service_desk_company_allowed(PDO $pdo,int $companyId): bool
{
    foreach(service_desk_allowed_companies($pdo) as $company)if((int)$company['id']===$companyId)return true;
    return false;
}

function service_desk_attachments_ready(PDO $pdo): bool
{
    try{$pdo->query('SELECT 1 FROM service_report_attachments LIMIT 1');return true;}catch(Throwable){return false;}
}

function service_desk_normalize_uploads(array $input): array
{
    if(!isset($input['name']))return [];
    if(!is_array($input['name']))return [$input];
    $files=[];
    foreach($input['name'] as $index=>$name)$files[]=[
        'name'=>$name,
        'type'=>$input['type'][$index]??'',
        'tmp_name'=>$input['tmp_name'][$index]??'',
        'error'=>$input['error'][$index]??UPLOAD_ERR_NO_FILE,
        'size'=>$input['size'][$index]??0,
    ];
    return $files;
}

function service_desk_upload_definition(string $mime): ?array
{
    $definitions=[
        'image/jpeg'=>['imagem','jpg',8*1024*1024],'image/png'=>['imagem','png',8*1024*1024],'image/webp'=>['imagem','webp',8*1024*1024],
        'video/mp4'=>['video','mp4',50*1024*1024],'video/webm'=>['video','webm',50*1024*1024],'video/quicktime'=>['video','mov',50*1024*1024],
        'audio/mpeg'=>['audio','mp3',20*1024*1024],'audio/mp4'=>['audio','m4a',20*1024*1024],'audio/x-m4a'=>['audio','m4a',20*1024*1024],
        'audio/wav'=>['audio','wav',20*1024*1024],'audio/x-wav'=>['audio','wav',20*1024*1024],'audio/ogg'=>['audio','ogg',20*1024*1024],'audio/webm'=>['audio','webm',20*1024*1024],
        'application/pdf'=>['documento','pdf',20*1024*1024],'text/plain'=>['documento','txt',5*1024*1024],
        'application/msword'=>['documento','doc',20*1024*1024],
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document'=>['documento','docx',20*1024*1024],
        'application/vnd.ms-excel'=>['documento','xls',20*1024*1024],
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'=>['documento','xlsx',20*1024*1024],
    ];
    return $definitions[$mime]??null;
}

function service_desk_store_attachments(PDO $pdo,int $reportId,array $input,string $context='abertura',?int $messageId=null): array
{
    if(!service_desk_attachments_ready($pdo))throw new RuntimeException('Execute a migração 20260730_024 para habilitar anexos.');
    $files=service_desk_normalize_uploads($input);$stored=[];$moved=[];
    if(!$files)return [];
    $root=dirname(__DIR__).'/public/assets/uploads/service-desk/'.$reportId;
    if(!is_dir($root)&&!mkdir($root,0775,true)&&!is_dir($root))throw new RuntimeException('Não foi possível preparar a pasta de anexos.');
    try{
        $finfo=new finfo(FILEINFO_MIME_TYPE);
        $insert=$pdo->prepare('INSERT INTO service_report_attachments(report_id,message_id,usuario_id,contexto,tipo,nome_original,caminho,mime,tamanho) VALUES(?,?,?,?,?,?,?,?,?)');
        foreach($files as $file){
            $error=(int)($file['error']??UPLOAD_ERR_NO_FILE);if($error===UPLOAD_ERR_NO_FILE)continue;
            if($error!==UPLOAD_ERR_OK)throw new RuntimeException('Não foi possível receber um dos anexos.');
            $tmp=(string)($file['tmp_name']??'');$mime=(string)$finfo->file($tmp);$definition=service_desk_upload_definition($mime);
            if(!$definition)throw new RuntimeException('Formato de anexo não permitido. Utilize imagem, vídeo curto, áudio, PDF, Word, Excel ou TXT.');
            [$type,$extension,$limit]=$definition;$size=(int)($file['size']??0);
            if($size<1||$size>$limit)throw new RuntimeException('Um dos anexos ultrapassa o limite permitido para esse formato.');
            $filename=bin2hex(random_bytes(18)).'.'.$extension;$absolute=$root.'/'.$filename;
            if(!move_uploaded_file($tmp,$absolute))throw new RuntimeException('Não foi possível salvar um dos anexos.');
            $moved[]=$absolute;$relative='/public/assets/uploads/service-desk/'.$reportId.'/'.$filename;
            $original=mb_substr(basename((string)$file['name']),0,255);
            $insert->execute([$reportId,$messageId,(int)(user()['id']??0),$context,$type,$original,$relative,$mime,$size]);
            $stored[]=['path'=>$relative,'name'=>$original,'type'=>$type];
        }
        return $stored;
    }catch(Throwable $e){
        foreach($moved as $path)if(is_file($path))@unlink($path);
        throw $e;
    }
}

function service_desk_clear_staged_attachments(): void
{
    foreach((array)($_SESSION['service_desk_staged_attachments']??[]) as $file)if(is_file((string)($file['absolute']??'')))@unlink($file['absolute']);
    unset($_SESSION['service_desk_staged_attachments']);
}

function service_desk_stage_chat_attachments(array $input): int
{
    $files=service_desk_normalize_uploads($input);if(!$files)return 0;
    $root=dirname(__DIR__).'/storage/service-desk-temp/'.hash('sha256',session_id());
    if(!is_dir($root)&&!mkdir($root,0775,true)&&!is_dir($root))throw new RuntimeException('Não foi possível preparar os anexos do assistente.');
    $finfo=new finfo(FILEINFO_MIME_TYPE);$staged=(array)($_SESSION['service_desk_staged_attachments']??[]);
    foreach($files as $file){
        $error=(int)($file['error']??UPLOAD_ERR_NO_FILE);if($error===UPLOAD_ERR_NO_FILE)continue;if($error!==UPLOAD_ERR_OK)throw new RuntimeException('Não foi possível receber um dos anexos.');
        $mime=(string)$finfo->file((string)$file['tmp_name']);$definition=service_desk_upload_definition($mime);
        if(!$definition)throw new RuntimeException('Formato de anexo não permitido no assistente.');
        [$type,$extension,$limit]=$definition;$size=(int)$file['size'];if($size<1||$size>$limit)throw new RuntimeException('Um anexo ultrapassa o limite permitido.');
        $absolute=$root.'/'.bin2hex(random_bytes(16)).'.'.$extension;if(!move_uploaded_file((string)$file['tmp_name'],$absolute))throw new RuntimeException('Não foi possível guardar o anexo temporário.');
        $staged[]=['absolute'=>$absolute,'name'=>mb_substr(basename((string)$file['name']),0,255),'type'=>$type,'mime'=>$mime,'size'=>$size,'extension'=>$extension];
    }
    $_SESSION['service_desk_staged_attachments']=$staged;return count($staged);
}

function service_desk_commit_staged_attachments(PDO $pdo,int $reportId): void
{
    $staged=(array)($_SESSION['service_desk_staged_attachments']??[]);if(!$staged)return;
    if(!service_desk_attachments_ready($pdo))throw new RuntimeException('Execute a migração 20260730_024 para habilitar anexos.');
    $root=dirname(__DIR__).'/public/assets/uploads/service-desk/'.$reportId;if(!is_dir($root)&&!mkdir($root,0775,true)&&!is_dir($root))throw new RuntimeException('Não foi possível preparar a pasta do chamado.');
    $insert=$pdo->prepare('INSERT INTO service_report_attachments(report_id,usuario_id,contexto,tipo,nome_original,caminho,mime,tamanho) VALUES(?,?,?,?,?,?,?,?)');
    foreach($staged as $file){$filename=bin2hex(random_bytes(18)).'.'.$file['extension'];$destination=$root.'/'.$filename;if(!rename($file['absolute'],$destination))throw new RuntimeException('Não foi possível vincular o anexo ao chamado.');$insert->execute([$reportId,(int)(user()['id']??0),'assistente',$file['type'],$file['name'],'/public/assets/uploads/service-desk/'.$reportId.'/'.$filename,$file['mime'],$file['size']]);}
    unset($_SESSION['service_desk_staged_attachments']);
}

function service_desk_manual_save(PDO $pdo): array
{
    if(!can('service_desk','create'))throw new RuntimeException('Seu perfil não permite criar chamados.');
    $id=(int)($_POST['id']??0);$mode=(string)($_POST['submission_mode']??'submit');$draft=$mode==='draft';
    $companyId=(int)($_POST['empresa_id']??0);$type=(string)($_POST['tipo']??'falha');$origin=(string)($_POST['origem_item']??'veiculo');
    $brandId=(int)($_POST['marca_id']??0);$familyId=(int)($_POST['familia_id']??0);$modelId=(int)($_POST['modelo_id']??0);
    $title=trim((string)($_POST['titulo']??''));$description=trim((string)($_POST['relato']??''));
    if(!$companyId||!service_desk_company_allowed($pdo,$companyId))throw new RuntimeException('Selecione uma empresa disponível no seu escopo.');
    if(!in_array($type,['falha','melhoria'],true))throw new RuntimeException('Selecione Falha ou Melhoria.');
    if(!in_array($origin,['veiculo','sistema'],true))throw new RuntimeException('Selecione se o relato é sobre veículo ou sistema.');
    if(!$draft&&($title===''||mb_strlen($description)<10))throw new RuntimeException('Informe um título e descreva a situação com pelo menos 10 caracteres.');
    if($origin==='veiculo'&&!$draft&&(!$brandId||!$familyId||!$modelId))throw new RuntimeException('Identifique marca, família e modelo do veículo.');
    if($origin==='veiculo'&&($brandId||$familyId||$modelId)){
        $valid=$pdo->prepare('SELECT m.id FROM modelos m JOIN familias f ON f.id=m.familia_id WHERE m.id=? AND f.id=? AND f.marca_id=? AND m.ativo=1 AND f.ativo=1');
        $valid->execute([$modelId,$familyId,$brandId]);
        if(!$draft&&!$valid->fetchColumn())throw new RuntimeException('O modelo não pertence à família e à marca selecionadas.');
    }else{$brandId=$familyId=$modelId=0;}
    $group=service_desk_group_for_type($type);
    $classification=$origin==='sistema'?service_desk_system_category($pdo,$description,$type):service_desk_classify($pdo,$description,$type);
    $priority=service_desk_priority_for_classification($pdo,$classification,$type,(string)($classification['criticidade']??'media'));
    $status=$draft?'rascunho':'novo';$now=date('Y-m-d H:i:s');
    $slaFirst=$draft?null:date('Y-m-d H:i:s',time()+((int)$priority['sla_primeira_interacao_minutos']*60));
    $slaResolution=$draft?null:date('Y-m-d H:i:s',time()+((int)$priority['sla_resolucao_minutos']*60));
    $pdo->beginTransaction();
    try{
        if($id){
            $find=$pdo->prepare("SELECT * FROM service_reports WHERE id=? AND usuario_id=? AND status='rascunho'");$find->execute([$id,(int)(user()['id']??0)]);$current=$find->fetch();
            if(!$current&&!is_master())throw new RuntimeException('Este rascunho não está disponível para edição.');
            if(!$current&&is_master()){$find=$pdo->prepare("SELECT * FROM service_reports WHERE id=? AND status='rascunho'");$find->execute([$id]);$current=$find->fetch();}
            if(!$current)throw new RuntimeException('Rascunho não encontrado.');
            $pdo->prepare('UPDATE service_reports SET empresa_cliente_id=?,marca_id=?,familia_id=?,modelo_id=?,setor_id=?,categoria_id=?,prioridade_id=?,grupo=?,origem_item=?,tipo=?,canal="texto",titulo=?,relato_original=?,relato_normalizado=?,resumo_triagem=?,criticidade=?,status=?,sla_primeira_resposta_em=?,sla_resolucao_em=? WHERE id=?')
                ->execute([$companyId,$brandId?:null,$familyId?:null,$modelId?:null,$classification['setor_id']??null,$classification['id']??null,$priority['id']??null,$group,$origin,$type,$title?:'Rascunho sem título',$description,function_exists('assistant_normalize')?assistant_normalize($description):$description,$classification['resumo']??$description,$classification['criticidade']??'media',$status,$slaFirst,$slaResolution,$id]);
        }else{
            $pdo->prepare('INSERT INTO service_reports(usuario_id,empresa_cliente_id,marca_id,familia_id,modelo_id,setor_id,categoria_id,prioridade_id,grupo,origem_item,tipo,canal,titulo,relato_original,relato_normalizado,resumo_triagem,criticidade,status,sla_primeira_resposta_em,sla_resolucao_em) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)')
                ->execute([(int)(user()['id']??0),$companyId,$brandId?:null,$familyId?:null,$modelId?:null,$classification['setor_id']??null,$classification['id']??null,$priority['id']??null,$group,$origin,$type,'texto',$title?:'Rascunho sem título',$description,function_exists('assistant_normalize')?assistant_normalize($description):$description,$classification['resumo']??$description,$classification['criticidade']??'media',$status,$slaFirst,$slaResolution]);
            $id=(int)$pdo->lastInsertId();
        }
        $protocol=($draft?'DR':($group==='incidente'?'RE':'RQ')).'-'.date('Ymd').'-'.str_pad((string)$id,6,'0',STR_PAD_LEFT);
        $pdo->prepare('UPDATE service_reports SET protocolo=? WHERE id=?')->execute([$protocol,$id]);
        $event=$draft?'rascunho_salvo':'criacao_manual';
        $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_novo,setor_novo_id,observacao) VALUES(?,?,?,?,?,?)')->execute([$id,(int)(user()['id']??0),$event,$status,$classification['setor_id']??null,$draft?'Rascunho salvo para continuar depois.':'Chamado enviado pelo formulário do Service Desk.']);
        if(!$draft)$pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem) VALUES(?,?,?,?)')->execute([$id,(int)(user()['id']??0),'usuario',$description]);
        if(!empty($_FILES['anexos']))service_desk_store_attachments($pdo,$id,$_FILES['anexos'],'abertura');
        $pdo->commit();
        return ['id'=>$id,'protocol'=>$protocol,'draft'=>$draft];
    }catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
}

function service_desk_categorize(PDO $pdo,string $text,string $preferredType=''): array
{
    $normalized=function_exists('assistant_normalize')?assistant_normalize($text):mb_strtolower($text,'UTF-8');
    $normalizedPadded=' '.$normalized.' ';
    $rows=$pdo->query("SELECT mc.*,ct.termo,ct.peso FROM master_categories mc LEFT JOIN category_terms ct ON ct.categoria_id=mc.id AND ct.ativo=1 WHERE mc.ativo=1 ORDER BY mc.id")->fetchAll();
    $categories=[];
    foreach($rows as $row){
        $id=(int)$row['id'];
        if(!isset($categories[$id]))$categories[$id]=['id'=>$id,'nome'=>$row['nome'],'slug'=>$row['slug'],'tipo'=>$row['tipo'],'setor_id'=>$row['setor_padrao_id']?:(null),'prioridade_id'=>$row['prioridade_padrao_id']?:(null),'score'=>0];
        $term=trim((string)($row['termo']??''));
        $termNormalized=$term!==''?(function_exists('assistant_normalize')?assistant_normalize($term):mb_strtolower($term,'UTF-8')):'';
        if($termNormalized!==''&&str_contains($normalizedPadded,' '.$termNormalized.' '))$categories[$id]['score']+=(int)$row['peso'];
        if($preferredType!==''&&$row['tipo']===$preferredType)$categories[$id]['score']++;
    }
    usort($categories,static fn(array $a,array $b):int=>$b['score']<=>$a['score']);
    $best=$categories[0]??null;
    if(!$best||$best['score']<1){
        foreach($categories as $category)if($category['slug']==='outros-relatos'){$best=$category;break;}
    }
    return $best?:['id'=>null,'nome'=>'Outros relatos','tipo'=>'geral','setor_id'=>null,'prioridade_id'=>null,'score'=>0];
}

function service_desk_classify(PDO $pdo,string $text,string $preferredType=''): array
{
    $local=service_desk_categorize($pdo,$text,$preferredType);
    $local['criticidade']=preg_match('/\b(fumaca|fogo|incendio|sem freio|acidente|risco grave|parou na pista)\b/',assistant_normalize($text))?'critica':'media';
    $local['resumo']=mb_substr(trim($text),0,500);
    if(!function_exists('assistant_config'))return $local;
    $config=assistant_config();
    if($config['mode']==='local'||$config['key']===''||!function_exists('curl_init'))return $local;
    try{
        $categories=$pdo->query('SELECT id,nome,tipo,descricao,setor_padrao_id,prioridade_padrao_id FROM master_categories WHERE ativo=1 ORDER BY nome')->fetchAll();
        $payload=['model'=>$config['text_model'],'instructions'=>'Classifique um relato automotivo. Responda somente JSON válido com category_id, criticidade (baixa, media, alta ou critica) e resumo em português, sem inventar fatos.','input'=>"Tipo informado: {$preferredType}\nCategorias: ".json_encode($categories,JSON_UNESCAPED_UNICODE)."\nRelato: {$text}",'max_output_tokens'=>300];
        $curl=curl_init('https://api.openai.com/v1/responses');curl_setopt_array($curl,[CURLOPT_POST=>true,CURLOPT_POSTFIELDS=>json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),CURLOPT_HTTPHEADER=>['Authorization: Bearer '.$config['key'],'Content-Type: application/json'],CURLOPT_RETURNTRANSFER=>true,CURLOPT_TIMEOUT=>$config['timeout']]);
        $raw=curl_exec($curl);$status=(int)curl_getinfo($curl,CURLINFO_RESPONSE_CODE);curl_close($curl);
        if(!is_string($raw)||$status<200||$status>=300)return $local;
        $response=json_decode($raw,true);$output=trim((string)($response['output_text']??''));
        if($output==='')foreach($response['output']??[] as $item)foreach($item['content']??[] as $content)if(($content['type']??'')==='output_text')$output.=(string)($content['text']??'');
        $output=preg_replace('/^```(?:json)?\s*|\s*```$/i','',$output)??$output;$classified=json_decode($output,true);
        if(!is_array($classified))return $local;
        foreach($categories as $category)if((int)$category['id']===(int)($classified['category_id']??0)){
            $resolved=['id'=>(int)$category['id'],'nome'=>$category['nome'],'tipo'=>$category['tipo'],'setor_id'=>$category['setor_padrao_id']?:null,'prioridade_id'=>$category['prioridade_padrao_id']?:null,'score'=>100];
            if(in_array($classified['criticidade']??'',['baixa','media','alta','critica'],true))$resolved['criticidade']=$classified['criticidade'];
            $resolved['resumo']=mb_substr(trim((string)($classified['resumo']??$text)),0,500);
            return $resolved;
        }
    }catch(Throwable){}
    return $local;
}

function service_desk_detect_vehicle(PDO $pdo,string $text): array
{
    $normalized=function_exists('assistant_normalize')?assistant_normalize($text):mb_strtolower($text,'UTF-8');
    $rows=$pdo->query('SELECT m.id,m.nome modelo,f.id familia_id,f.nome familia,ma.id marca_id,ma.nome marca FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE m.ativo=1 ORDER BY CHAR_LENGTH(m.nome) DESC')->fetchAll();
    $best=null;$bestScore=0;
    foreach($rows as $row){
        $model=function_exists('assistant_normalize')?assistant_normalize((string)$row['modelo']):mb_strtolower((string)$row['modelo'],'UTF-8');
        $family=function_exists('assistant_normalize')?assistant_normalize((string)$row['familia']):mb_strtolower((string)$row['familia'],'UTF-8');
        $brand=function_exists('assistant_normalize')?assistant_normalize((string)$row['marca']):mb_strtolower((string)$row['marca'],'UTF-8');
        $score=0;
        if($model!==''&&str_contains($normalized,$model))$score+=100+strlen($model);
        else{
            foreach(array_filter(explode(' ',$model),static fn(string $v):bool=>strlen($v)>=3) as $term)if(str_contains($normalized,$term))$score+=4;
            if($family!==''&&str_contains($normalized,$family))$score+=25;
            if($brand!==''&&str_contains($normalized,$brand))$score+=10;
        }
        if($score>$bestScore){$bestScore=$score;$best=$row;}
    }
    if($best&&$bestScore>=100)return ['marca_id'=>(int)$best['marca_id'],'marca'=>$best['marca'],'familia_id'=>(int)$best['familia_id'],'familia'=>$best['familia'],'modelo_id'=>(int)$best['id'],'modelo'=>$best['modelo'],'complete'=>true];

    $families=$pdo->query('SELECT f.id,f.nome,ma.id marca_id,ma.nome marca FROM familias f JOIN marcas ma ON ma.id=f.marca_id WHERE f.ativo=1 ORDER BY CHAR_LENGTH(f.nome) DESC')->fetchAll();
    foreach($families as $family){
        $name=function_exists('assistant_normalize')?assistant_normalize((string)$family['nome']):mb_strtolower((string)$family['nome'],'UTF-8');
        if($name!==''&&str_contains($normalized,$name))return ['marca_id'=>(int)$family['marca_id'],'marca'=>$family['marca'],'familia_id'=>(int)$family['id'],'familia'=>$family['nome'],'modelo_id'=>null,'modelo'=>null,'complete'=>false];
    }
    $brands=$pdo->query('SELECT id,nome FROM marcas WHERE ativo=1 ORDER BY CHAR_LENGTH(nome) DESC')->fetchAll();
    foreach($brands as $brand){
        $name=function_exists('assistant_normalize')?assistant_normalize((string)$brand['nome']):mb_strtolower((string)$brand['nome'],'UTF-8');
        if($name!==''&&str_contains($normalized,$name))return ['marca_id'=>(int)$brand['id'],'marca'=>$brand['nome'],'familia_id'=>null,'familia'=>null,'modelo_id'=>null,'modelo'=>null,'complete'=>false];
    }
    return ['marca_id'=>null,'marca'=>null,'familia_id'=>null,'familia'=>null,'modelo_id'=>null,'modelo'=>null,'complete'=>false];
}

function service_desk_summary(array $flow): string
{
    $type=service_desk_types()[$flow['type']??'falha']??'Relato';$origin=service_desk_origins()[$flow['origin']??'veiculo']??'Veículo';
    $vehicle=$flow['vehicle']??[];
    $vehicleName=implode(' · ',array_filter([$vehicle['marca']??null,$vehicle['familia']??null,$vehicle['modelo']??null]));
    return "Confira antes de enviar:\n\nTipo: {$type}\nOrigem: {$origin}\n".(($flow['origin']??'veiculo')==='veiculo'?'Veículo: '.($vehicleName?:'Não identificado')."\n":'')."Categoria: ".($flow['category']['nome']??'Outros relatos')."\nRelato: ".trim((string)($flow['description']??''))."\n\nPosso reportar isso para nosso time responsável?";
}

function service_desk_create_from_flow(PDO $pdo,array $flow,string $inputType): array
{
    $current=user();$userId=(int)($current['id']??0);$companyId=active_company_id();
    $vehicle=$flow['vehicle']??[];$category=$flow['category']??service_desk_classify($pdo,(string)$flow['description'],(string)$flow['type']);
    $type=(string)($flow['type']??'falha');$origin=(string)($flow['origin']??'veiculo');$group=service_desk_group_for_type($type);
    $priority=service_desk_priority_for_classification($pdo,$category,$type,(string)($category['criticidade']??'media'));
    $title=mb_substr((service_desk_types()[$type]??'Relato').' · '.($origin==='sistema'?'Sistema':($vehicle['modelo']??$vehicle['familia']??$category['nome'])),0,190);
    $slaFirst=date('Y-m-d H:i:s',time()+((int)$priority['sla_primeira_interacao_minutos']*60));
    $slaResolution=date('Y-m-d H:i:s',time()+((int)$priority['sla_resolucao_minutos']*60));
    $pdo->beginTransaction();
    try{
        $stmt=$pdo->prepare('INSERT INTO service_reports(usuario_id,empresa_cliente_id,marca_id,familia_id,modelo_id,setor_id,categoria_id,prioridade_id,grupo,origem_item,tipo,canal,titulo,relato_original,relato_normalizado,resumo_triagem,criticidade,sla_primeira_resposta_em,sla_resolucao_em) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
        $stmt->execute([$userId,$companyId,$origin==='veiculo'?($vehicle['marca_id']??null):null,$origin==='veiculo'?($vehicle['familia_id']??null):null,$origin==='veiculo'?($vehicle['modelo_id']??null):null,$category['setor_id']??null,$category['id']??null,$priority['id']??null,$group,$origin,$type,$inputType,$title,$flow['description'],function_exists('assistant_normalize')?assistant_normalize((string)$flow['description']):(string)$flow['description'],$category['resumo']??service_desk_summary($flow),$category['criticidade']??'media',$slaFirst,$slaResolution]);
        $id=(int)$pdo->lastInsertId();$protocol=($group==='incidente'?'RE':'RQ').'-'.date('Ymd').'-'.str_pad((string)$id,6,'0',STR_PAD_LEFT);
        $pdo->prepare('UPDATE service_reports SET protocolo=? WHERE id=?')->execute([$protocol,$id]);
        $message=$pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem,audio_segundos) VALUES(?,?,?,?,?)');
        foreach($flow['messages']??[] as $item)$message->execute([$id,$item['origin']==='usuario'?$userId:null,$item['origin'],$item['text'],(int)($item['audio_seconds']??0)]);
        $message->execute([$id,null,'sistema','Relato confirmado e protocolado pelo usuário.',0]);
        service_desk_commit_staged_attachments($pdo,$id);
        $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_novo,setor_novo_id,observacao) VALUES(?,?,?, ?,?,?)')->execute([$id,$userId,'criacao','novo',$category['setor_id']??null,'Triagem conversacional confirmada pelo usuário.']);
        $pdo->commit();
        return ['id'=>$id,'protocol'=>$protocol];
    }catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
}

function service_desk_option(string $action,string $label,string $icon='bi-chevron-right'): array
{
    return ['action'=>$action,'label'=>$label,'icon'=>$icon];
}

function service_desk_save_assistant_rating(PDO $pdo,array $rating,string $comment=''): void
{
    $comment=trim($comment);
    $pdo->prepare('INSERT INTO assistente_satisfacoes(interacao_id,usuario_id,nota,comentario) VALUES(?,?,?,?)')
        ->execute([(int)($rating['interaction_id']??0)?:null,(int)(user()['id']??0),max(1,min(5,(int)($rating['note']??0))),$comment!==''?mb_substr($comment,0,1000):null]);
}

function service_desk_vehicle_catalog(PDO $pdo,string $kind,int $parentId=0): array
{
    if($kind==='brand'){
        return $pdo->query('SELECT id,nome label FROM marcas WHERE ativo=1 ORDER BY nome')->fetchAll();
    }
    if($kind==='family'&&$parentId>0){
        $stmt=$pdo->prepare('SELECT id,nome label FROM familias WHERE ativo=1 AND marca_id=? ORDER BY nome');
        $stmt->execute([$parentId]);
        return $stmt->fetchAll();
    }
    if($kind==='model'&&$parentId>0){
        $stmt=$pdo->prepare('SELECT id,nome label FROM modelos WHERE ativo=1 AND familia_id=? ORDER BY nome');
        $stmt->execute([$parentId]);
        return $stmt->fetchAll();
    }
    return [];
}

function service_desk_vehicle_selector(PDO $pdo,string $kind,int $parentId=0): array
{
    $labels=[
        'brand'=>['Marca do veículo','Pesquisar marca...','Selecione a marca'],
        'family'=>['Família do veículo','Pesquisar família...','Selecione a família'],
        'model'=>['Modelo exato','Pesquisar modelo...','Selecione o modelo'],
    ];
    $copy=$labels[$kind]??$labels['brand'];
    return [
        'kind'=>$kind,
        'label'=>$copy[0],
        'placeholder'=>$copy[1],
        'empty_label'=>$copy[2],
        'action'=>'report_select_'.$kind,
        'options'=>array_map(static fn(array $row):array=>['value'=>(int)$row['id'],'label'=>(string)$row['label']],service_desk_vehicle_catalog($pdo,$kind,$parentId)),
    ];
}

function service_desk_vehicle_by_id(PDO $pdo,string $kind,int $id,int $parentId=0): ?array
{
    if($id<=0)return null;
    if($kind==='brand'){
        $stmt=$pdo->prepare('SELECT id,nome FROM marcas WHERE id=? AND ativo=1');
        $stmt->execute([$id]);$row=$stmt->fetch();
        return $row?['marca_id'=>(int)$row['id'],'marca'=>$row['nome'],'familia_id'=>null,'familia'=>null,'modelo_id'=>null,'modelo'=>null,'complete'=>false]:null;
    }
    if($kind==='family'&&$parentId>0){
        $stmt=$pdo->prepare('SELECT f.id,f.nome,ma.id marca_id,ma.nome marca FROM familias f JOIN marcas ma ON ma.id=f.marca_id WHERE f.id=? AND f.marca_id=? AND f.ativo=1');
        $stmt->execute([$id,$parentId]);$row=$stmt->fetch();
        return $row?['marca_id'=>(int)$row['marca_id'],'marca'=>$row['marca'],'familia_id'=>(int)$row['id'],'familia'=>$row['nome'],'modelo_id'=>null,'modelo'=>null,'complete'=>false]:null;
    }
    if($kind==='model'&&$parentId>0){
        $stmt=$pdo->prepare('SELECT m.id,m.nome modelo,f.id familia_id,f.nome familia,ma.id marca_id,ma.nome marca FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE m.id=? AND m.familia_id=? AND m.ativo=1');
        $stmt->execute([$id,$parentId]);$row=$stmt->fetch();
        return $row?['marca_id'=>(int)$row['marca_id'],'marca'=>$row['marca'],'familia_id'=>(int)$row['familia_id'],'familia'=>$row['familia'],'modelo_id'=>(int)$row['id'],'modelo'=>$row['modelo'],'complete'=>true]:null;
    }
    return null;
}

function service_desk_vehicle_match(PDO $pdo,string $kind,string $text,int $parentId=0): ?array
{
    $normalized=trim(function_exists('assistant_normalize')?assistant_normalize($text):mb_strtolower($text,'UTF-8'));
    if($normalized==='')return null;
    $best=null;$bestScore=0;
    foreach(service_desk_vehicle_catalog($pdo,$kind,$parentId) as $option){
        $name=trim(function_exists('assistant_normalize')?assistant_normalize((string)$option['label']):mb_strtolower((string)$option['label'],'UTF-8'));
        if($name==='')continue;
        $score=0;
        if($normalized===$name)$score=1000+mb_strlen($name);
        elseif(str_contains($normalized,$name))$score=500+mb_strlen($name);
        elseif(mb_strlen($normalized)>=3&&str_contains($name,$normalized))$score=100+mb_strlen($normalized);
        if($score>$bestScore){$bestScore=$score;$best=$option;}
    }
    if(!$best||$bestScore<100)return null;
    return service_desk_vehicle_by_id($pdo,$kind,(int)$best['id'],$parentId);
}

function service_desk_vehicle_next(PDO $pdo,array &$flow): array
{
    $vehicle=$flow['vehicle']??[];
    if(empty($vehicle['marca_id'])){
        $prompt='Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.';
        $flow['state']='vehicle_brand';
        return ['answer'=>$prompt,'selector'=>service_desk_vehicle_selector($pdo,'brand')];
    }
    if(empty($vehicle['familia_id'])){
        $prompt="Certo, a marca é {$vehicle['marca']}. Qual é a família do veículo? Você pode falar, digitar ou selecionar uma das famílias dessa marca.";
        $flow['state']='vehicle_family';
        return ['answer'=>$prompt,'selector'=>service_desk_vehicle_selector($pdo,'family',(int)$vehicle['marca_id'])];
    }
    if(empty($vehicle['modelo_id'])){
        $prompt="Identifiquei a família {$vehicle['familia']}. Qual é o modelo exato? Você pode falar, digitar ou selecionar um dos modelos dessa família.";
        $flow['state']='vehicle_model';
        return ['answer'=>$prompt,'selector'=>service_desk_vehicle_selector($pdo,'model',(int)$vehicle['familia_id'])];
    }
    $flow['vehicle']['complete']=true;
    if(trim((string)($flow['description']??''))===''){
        $prompt="Veículo identificado: {$vehicle['marca']} · {$vehicle['familia']} · {$vehicle['modelo']}. Agora descreva a falha ou melhoria com o máximo de detalhes que puder.";
        $flow['state']='description';
        return ['answer'=>$prompt,'options'=>[
            service_desk_option('report_change_vehicle','Trocar veículo','bi-truck'),
            service_desk_option('report_cancel','Cancelar','bi-x-circle'),
        ]];
    }
    $summary=service_desk_summary($flow);
    $flow['messages'][]=['origin'=>'assistente','text'=>$summary];
    $flow['state']='confirm';
    return ['answer'=>$summary,'options'=>[
        service_desk_option('report_confirm','Sim, pode enviar','bi-check2-circle'),
        service_desk_option('report_change_vehicle','Trocar veículo','bi-truck'),
        service_desk_option('report_more','Adicionar informação','bi-plus-circle'),
        service_desk_option('report_cancel','Cancelar','bi-x-circle'),
    ]];
}

function service_desk_system_category(PDO $pdo,string $text,string $type): array
{
    $stmt=$pdo->query("SELECT * FROM master_categories WHERE slug='sistemas' AND ativo=1 LIMIT 1");$category=$stmt->fetch();
    if(!$category)return service_desk_classify($pdo,$text,$type);
    $category['id']=(int)$category['id'];$category['nome']=(string)$category['nome'];$category['setor_id']=$category['setor_padrao_id']?:null;$category['prioridade_id']=$category['prioridade_padrao_id']?:null;
    $category['criticidade']=preg_match('/\\b(indisponivel|fora do ar|nao acessa|dados perdidos|erro geral)\\b/',assistant_normalize($text))?'alta':'media';
    $category['resumo']=mb_substr(trim($text),0,500);
    return $category;
}

function service_desk_confirmation(PDO $pdo,array &$flow): array
{
    $summary=service_desk_summary($flow);$flow['messages'][]=['origin'=>'assistente','text'=>$summary];$flow['state']='confirm';
    return ['answer'=>$summary,'options'=>[
        service_desk_option('report_confirm','Sim, pode enviar','bi-check2-circle'),
        ...(($flow['origin']??'veiculo')==='veiculo'?[service_desk_option('report_change_vehicle','Trocar veículo','bi-truck')]:[]),
        service_desk_option('report_more','Adicionar informação','bi-plus-circle'),
        service_desk_option('report_cancel','Cancelar','bi-x-circle'),
    ]];
}

function service_desk_resume_flow(PDO $pdo): ?array
{
    $flow=$_SESSION['service_desk_flow']??null;
    if(!is_array($flow))return null;
    $state=(string)($flow['state']??'');
    if($state==='type')return ['answer'=>'O que você deseja registrar?','options'=>[
        service_desk_option('report_type_falha','Reportar uma falha','bi-exclamation-triangle'),
        service_desk_option('report_type_melhoria','Sugerir uma melhoria','bi-lightbulb'),
    ]];
    if($state==='origin')return ['answer'=>'Escolha se o relato é sobre um veículo ou sobre o sistema Drive Learn.','options'=>[
        service_desk_option('report_origin_vehicle','É em um veículo','bi-truck'),
        service_desk_option('report_origin_system','É no sistema','bi-window'),
    ]];
    if(in_array($state,['vehicle_brand','vehicle_family','vehicle_model'],true)){
        $vehicle=$flow['vehicle']??[];
        $kind=['vehicle_brand'=>'brand','vehicle_family'=>'family','vehicle_model'=>'model'][$state];
        $parentId=$kind==='family'?(int)($vehicle['marca_id']??0):($kind==='model'?(int)($vehicle['familia_id']??0):0);
        $answer=[
            'brand'=>'Qual é a marca do veículo? Você pode falar, digitar ou selecionar na lista abaixo.',
            'family'=>'Qual é a família do veículo? Selecione uma família da marca informada ou diga o nome.',
            'model'=>'Qual é o modelo exato? Selecione um modelo da família informada ou diga o nome.',
        ][$kind];
        return ['answer'=>$answer,'selector'=>service_desk_vehicle_selector($pdo,$kind,$parentId)];
    }
    if($state==='description'){
        $vehicle=$flow['vehicle']??[];
        $identified=implode(' · ',array_filter([$vehicle['marca']??null,$vehicle['familia']??null,$vehicle['modelo']??null]));
        $answer=($flow['origin']??'veiculo')==='sistema'
            ?'Descreva livremente a falha ou melhoria encontrada no sistema Drive Learn.'
            :'Descreva a falha ou melhoria'.($identified!==''?" encontrada no {$identified}":' encontrada no veículo').'.';
        return ['answer'=>$answer,'options'=>($flow['origin']??'veiculo')==='veiculo'?[service_desk_option('report_change_vehicle','Trocar veículo','bi-truck')]:[]];
    }
    if($state==='more')return ['answer'=>'Pode complementar. Inclua qualquer detalhe que ajude o time a entender a situação.','options'=>[]];
    if($state==='confirm'){
        $summary=service_desk_summary($flow);
        return ['answer'=>$summary,'options'=>[
            service_desk_option('report_confirm','Sim, pode enviar','bi-check2-circle'),
            ...(($flow['origin']??'veiculo')==='veiculo'?[service_desk_option('report_change_vehicle','Trocar veículo','bi-truck')]:[]),
            service_desk_option('report_more','Adicionar informação','bi-plus-circle'),
            service_desk_option('report_cancel','Cancelar','bi-x-circle'),
        ]];
    }
    return null;
}

function service_desk_assistant_flow(PDO $pdo,string $question,string $inputType,int $audioSeconds,string $action): ?array
{
    $action=trim($action);$flow=$_SESSION['service_desk_flow']??null;
    $normalizedQuestion=trim(function_exists('assistant_normalize')?assistant_normalize($question):mb_strtolower($question,'UTF-8'));
    $pendingRating=$_SESSION['assistant_rating_pending']??null;
    if(is_array($pendingRating)&&$action===''){
        if(trim($question)==='')return ['answer'=>'Se desejar, escreva um comentário sobre o atendimento ou escolha “Encerrar sem comentário”.','options'=>[service_desk_option('rate_skip','Encerrar sem comentário','bi-skip-forward')]];
        service_desk_save_assistant_rating($pdo,$pendingRating,$question);
        unset($_SESSION['assistant_rating_pending'],$_SESSION['assistant_last_interaction_id'],$_SESSION['service_desk_flow']);
        return ['answer'=>'Obrigado pela nota e pelo comentário. Seu retorno foi registrado e o atendimento foi encerrado.','closed'=>true];
    }
    if(is_array($pendingRating)&&$action==='rate_skip'){
        service_desk_save_assistant_rating($pdo,$pendingRating);
        unset($_SESSION['assistant_rating_pending'],$_SESSION['assistant_last_interaction_id'],$_SESSION['service_desk_flow']);
        return ['answer'=>'Obrigado pela avaliação. Atendimento encerrado. Quando precisar, é só chamar.','closed'=>true];
    }
    if($action===''&&is_array($flow)&&($flow['state']??'')==='confirm'){
        if(preg_match('/^(sim|pode|confirmo|envie|manda|mandar)\b/',$normalizedQuestion)){
            $flow['messages'][]=['origin'=>'usuario','text'=>$question,'audio_seconds'=>$audioSeconds];
            if(mb_strlen($normalizedQuestion)>25){
                $flow['description']=trim((string)$flow['description']."\n\nComplemento na confirmação: ".$question);
                $flow['category']=service_desk_classify($pdo,$flow['description'],(string)$flow['type']);
            }
            $_SESSION['service_desk_flow']=$flow;$action='report_confirm';
        }elseif(preg_match('/^(nao|cancelar|cancela)\b/',$normalizedQuestion))$action='report_cancel';
        else{$flow['state']='more';$_SESSION['service_desk_flow']=$flow;}
    }
    if($action===''&&!is_array($flow)&&($_SESSION['assistant_awaiting_close']??false)){
        unset($_SESSION['assistant_awaiting_close']);
        if(preg_match('/^(sim|pode encerrar|encerrar|finalizar)\b/',$normalizedQuestion))$action='close_yes';
        elseif(preg_match('/^(nao|continuar|quero continuar)\b/',$normalizedQuestion))$action='close_no';
    }
    if($action==='start_consult'){
        service_desk_clear_staged_attachments();
        unset($_SESSION['service_desk_flow'],$_SESSION['assistant_awaiting_close'],$_SESSION['assistant_rating_pending']);
        return ['answer'=>'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.','options'=>[]];
    }
    if($action==='start_report'){
        service_desk_clear_staged_attachments();
        unset($_SESSION['assistant_awaiting_close'],$_SESSION['assistant_rating_pending']);
        $_SESSION['service_desk_flow']=['state'=>'type','messages'=>[['origin'=>'assistente','text'=>'O que você deseja registrar?']]];
        return ['answer'=>'O que você deseja registrar?','options'=>[
            service_desk_option('report_type_falha','Reportar uma falha','bi-exclamation-triangle'),
            service_desk_option('report_type_melhoria','Sugerir uma melhoria','bi-lightbulb'),
        ]];
    }
    if(str_starts_with($action,'report_type_')){
        $type=substr($action,12);
        if(!isset(service_desk_types()[$type]))return null;
        if(!in_array($type,['falha','melhoria'],true))return null;
        $prompt='Isso aconteceu em um veículo ou no sistema Drive Learn?';
        $messages=is_array($flow)?($flow['messages']??[]):[];
        $messages[]=['origin'=>'usuario','text'=>service_desk_types()[$type]];
        $messages[]=['origin'=>'assistente','text'=>$prompt];
        $_SESSION['service_desk_flow']=['state'=>'origin','type'=>$type,'messages'=>$messages];
        return ['answer'=>$prompt,'options'=>[
            service_desk_option('report_origin_vehicle','É em um veículo','bi-truck'),
            service_desk_option('report_origin_system','É no sistema','bi-window'),
        ]];
    }
    if(str_starts_with($action,'report_origin_')&&is_array($flow)){
        $originAction=substr($action,14);
        $origin=['vehicle'=>'veiculo','system'=>'sistema'][$originAction]??$originAction;
        if(!isset(service_desk_origins()[$origin]))return null;
        $flow['origin']=$origin;$flow['messages'][]=['origin'=>'usuario','text'=>service_desk_origins()[$origin]];
        if($origin==='veiculo'){
            $flow['vehicle']=['marca_id'=>null,'marca'=>null,'familia_id'=>null,'familia'=>null,'modelo_id'=>null,'modelo'=>null,'complete'=>false];
            $response=service_desk_vehicle_next($pdo,$flow);
        }else{
            $prompt='Descreva livremente a falha ou melhoria no sistema. O chamado será classificado como Sistemas · sistemas web.';
            $flow['state']='description';
            $response=['answer'=>$prompt,'options'=>[]];
        }
        $flow['messages'][]=['origin'=>'assistente','text'=>$response['answer']];$_SESSION['service_desk_flow']=$flow;
        return $response;
    }
    if($action===''&&is_array($flow)&&($flow['state']??'')==='origin'){
        if(preg_match('/\b(veiculo|caminhao|onibus|carro)\b/',$normalizedQuestion))$action='report_origin_vehicle';
        elseif(preg_match('/\b(sistema|plataforma|site|portal|tela)\b/',$normalizedQuestion))$action='report_origin_system';
        if($action!=='')return service_desk_assistant_flow($pdo,$question,$inputType,$audioSeconds,$action);
        return ['answer'=>'Escolha se o relato é sobre um veículo ou sobre o sistema Drive Learn.','options'=>[
            service_desk_option('report_origin_vehicle','É em um veículo','bi-truck'),
            service_desk_option('report_origin_system','É no sistema','bi-window'),
        ]];
    }
    if($action==='report_cancel'){
        service_desk_clear_staged_attachments();
        unset($_SESSION['service_desk_flow']);
        return ['answer'=>'Tudo bem, o relato foi cancelado e nada foi enviado. Posso ajudar em outra coisa?','ask_close'=>true];
    }
    if($action==='report_more'&&is_array($flow)){
        $prompt='Pode complementar. Inclua qualquer detalhe que ajude o time a entender a situação.';
        $flow['messages'][]=['origin'=>'usuario','text'=>'Adicionar informação'];
        $flow['messages'][]=['origin'=>'assistente','text'=>$prompt];
        $flow['state']='more';$_SESSION['service_desk_flow']=$flow;
        return ['answer'=>$prompt,'options'=>[]];
    }
    if($action==='report_change_vehicle'&&is_array($flow)){
        $flow['vehicle']=['marca_id'=>null,'marca'=>null,'familia_id'=>null,'familia'=>null,'modelo_id'=>null,'modelo'=>null,'complete'=>false];
        $flow['messages'][]=['origin'=>'usuario','text'=>'Trocar veículo'];
        $response=service_desk_vehicle_next($pdo,$flow);
        $flow['messages'][]=['origin'=>'assistente','text'=>$response['answer']];
        $_SESSION['service_desk_flow']=$flow;
        return $response;
    }
    if($action==='report_confirm'&&is_array($flow)&&!empty($flow['description'])){
        $flow['messages'][]=['origin'=>'usuario','text'=>'Sim, pode enviar'];
        $created=service_desk_create_from_flow($pdo,$flow,$inputType);unset($_SESSION['service_desk_flow']);
        return ['answer'=>"Obrigado. O relato foi registrado com o protocolo {$created['protocol']}. Nosso time poderá acompanhar, classificar e informar a solução pelo Service Desk.",'report_id'=>$created['id'],'action'=>['type'=>'service_report','route'=>'service-desk','query'=>['id'=>$created['id']],'label'=>'Acompanhar o protocolo'],'ask_close'=>true];
    }
    if($action==='close_yes'){
        unset($_SESSION['assistant_awaiting_close']);
        return ['answer'=>'Antes de encerrar, como você avalia este atendimento?','options'=>[
            service_desk_option('rate_1','1 · Ruim','bi-star'),
            service_desk_option('rate_2','2 · Regular','bi-star'),
            service_desk_option('rate_3','3 · Bom','bi-star'),
            service_desk_option('rate_4','4 · Muito bom','bi-star'),
            service_desk_option('rate_5','5 · Excelente','bi-star-fill'),
        ]];
    }
    if($action==='close_no'){unset($_SESSION['assistant_awaiting_close'],$_SESSION['assistant_rating_pending']);return ['answer'=>'Sem problema. Continue me contando sua dúvida ou escolha outra jornada.','options'=>[
        service_desk_option('start_consult','Consultar o Drive Learn','bi-search'),
        service_desk_option('start_report','Reportar problema ou melhoria','bi-headset'),
    ]];}
    if(preg_match('/^rate_([1-5])$/',$action,$match)){
        $interactionId=(int)($_SESSION['assistant_last_interaction_id']??0);
        $_SESSION['assistant_rating_pending']=['interaction_id'=>$interactionId,'note'=>(int)$match[1]];
        unset($_SESSION['service_desk_flow']);
        return ['answer'=>'Obrigado pela nota. Se quiser, conte brevemente o que foi útil ou o que podemos melhorar. O comentário é opcional.','options'=>[
            service_desk_option('rate_skip','Encerrar sem comentário','bi-skip-forward'),
        ]];
    }
    if(!is_array($flow))return null;
    if(!in_array($flow['state']??'',['description','vehicle_brand','vehicle_family','vehicle_model','more'],true))return null;

    $selectedKind='';$selectedId=0;
    if(preg_match('/^report_select_(brand|family|model):(\d+)$/',$action,$selected)){
        $selectedKind=$selected[1];$selectedId=(int)$selected[2];
    }
    $flow['messages'][]=['origin'=>'usuario','text'=>$question,'audio_seconds'=>$audioSeconds];
    $state=(string)($flow['state']??'');
    if($state==='description'){
        $flow['description']=$question;
        $flow['category']=($flow['origin']??'veiculo')==='sistema'?service_desk_system_category($pdo,$flow['description'],(string)$flow['type']):service_desk_classify($pdo,$flow['description'],(string)$flow['type']);
        if(($flow['origin']??'veiculo')==='veiculo'){
            $vehicle=$flow['vehicle']??[];
            if(empty($vehicle['modelo_id']))$flow['vehicle']=service_desk_detect_vehicle($pdo,$question);
        }else $flow['vehicle']=[];
    }elseif($state==='more'){
        $flow['description']=trim((string)$flow['description']."\n\nComplemento: ".$question);
        $flow['category']=($flow['origin']??'veiculo')==='sistema'?service_desk_system_category($pdo,$flow['description'],(string)$flow['type']):service_desk_classify($pdo,$flow['description'],(string)$flow['type']);
        if(($flow['origin']??'veiculo')==='veiculo'&&empty($flow['vehicle']['modelo_id']))$flow['vehicle']=service_desk_detect_vehicle($pdo,$question);
    }else{
        $vehicle=$flow['vehicle']??[];
        $kind=['vehicle_brand'=>'brand','vehicle_family'=>'family','vehicle_model'=>'model'][$state]??'brand';
        $parentId=$kind==='family'?(int)($vehicle['marca_id']??0):($kind==='model'?(int)($vehicle['familia_id']??0):0);
        $choice=$selectedKind===$kind?service_desk_vehicle_by_id($pdo,$kind,$selectedId,$parentId):null;
        if(!$choice){
            $detected=service_desk_detect_vehicle($pdo,$question);
            if(!empty($detected['modelo_id']))$choice=$detected;
            elseif($kind==='family'&&!empty($detected['familia_id'])&&(int)$detected['marca_id']===$parentId)$choice=$detected;
            elseif($kind==='brand'&&!empty($detected['marca_id']))$choice=$detected;
            else $choice=service_desk_vehicle_match($pdo,$kind,$question,$parentId);
        }
        if(!$choice){
            $retry=[
                'brand'=>'Não localizei essa marca no catálogo. Pesquise na lista ou diga novamente o nome da marca.',
                'family'=>'Não localizei essa família para a marca selecionada. Pesquise na lista ou diga novamente a família.',
                'model'=>'Não localizei esse modelo na família selecionada. Pesquise na lista ou diga novamente o modelo exato.',
            ][$kind];
            $flow['messages'][]=['origin'=>'assistente','text'=>$retry];
            $_SESSION['service_desk_flow']=$flow;
            return ['answer'=>$retry,'selector'=>service_desk_vehicle_selector($pdo,$kind,$parentId)];
        }
        $flow['vehicle']=$choice;
    }
    $response=(($flow['origin']??'veiculo')==='sistema')?service_desk_confirmation($pdo,$flow):service_desk_vehicle_next($pdo,$flow);
    if(($flow['messages'][array_key_last($flow['messages'])]['text']??'')!==$response['answer'])$flow['messages'][]=['origin'=>'assistente','text'=>$response['answer']];
    $_SESSION['service_desk_flow']=$flow;
    return $response;
}

function handle_service_desk_post(string $route,string $method): void
{
    if($route!=='service-desk'||$method!=='POST')return;
    verify_csrf();$pdo=db();$return='service-desk';
    try{
        if(!$pdo||!database_ready())throw new RuntimeException('Banco de dados indisponível.');
        $action=(string)($_POST['action']??'');
        if($action==='save_manual_report'){
            $saved=service_desk_manual_save($pdo);
            flash('success',$saved['draft']?'Rascunho salvo. Você pode continuar quando quiser.':'Chamado '.$saved['protocol'].' criado com sucesso.');
            $return='service-desk?id='.$saved['id'];
        }elseif($action==='update_report'){
            if(!service_desk_can_manage())throw new RuntimeException('Seu perfil não permite tratar chamados.');
            $id=(int)($_POST['id']??0);$status=(string)($_POST['status']??'novo');$sectorId=(int)($_POST['setor_id']??0);$responsibleId=(int)($_POST['responsavel_id']??0);$categoryId=(int)($_POST['categoria_id']??0);$priorityId=(int)($_POST['prioridade_id']??0);$type=(string)($_POST['tipo']??'falha');$recurring=isset($_POST['recorrente']);$parentId=$recurring?(int)($_POST['ticket_pai_id']??0):0;
            if(!isset(service_desk_statuses()[$status]))throw new RuntimeException('Selecione um status válido.');
            if(!isset(service_desk_types()[$type]))throw new RuntimeException('Selecione um tipo válido.');
            $params=[];$access=service_desk_access_clause($params);$find=$pdo->prepare("SELECT * FROM service_reports sr WHERE sr.id=? AND {$access}");$find->execute(array_merge([$id],$params));$current=$find->fetch();
            if(!$current)throw new RuntimeException('Chamado não encontrado no seu escopo.');
            if(!$categoryId||!$priorityId)throw new RuntimeException('Selecione a categoria e a prioridade do chamado.');
            if($parentId===$id)throw new RuntimeException('O próprio chamado não pode ser seu ticket pai.');
            if($parentId){$parent=$pdo->prepare("SELECT id FROM service_reports sr WHERE sr.id=? AND {$access}");$parent->execute(array_merge([$parentId],$params));if(!$parent->fetchColumn())throw new RuntimeException('Ticket pai não encontrado no seu escopo.');}
            if($status==='finalizado'){$solutionCheck=$pdo->prepare("SELECT COUNT(*) FROM service_report_solutions WHERE report_id=? AND tipo='aplicada'");$solutionCheck->execute([$id]);if(!(int)$solutionCheck->fetchColumn())throw new RuntimeException('Registre uma solução aplicada antes de finalizar o chamado.');}
            $note=trim((string)($_POST['observacao']??''));$first=$current['primeira_resposta_em']?:date('Y-m-d H:i:s');$finished=$status==='finalizado'?date('Y-m-d H:i:s'):null;
            $priority=$pdo->prepare('SELECT * FROM service_priorities WHERE id=? AND ativo=1');$priority->execute([$priorityId]);$priorityRow=$priority->fetch();if(!$priorityRow)throw new RuntimeException('Prioridade inválida.');
            $slaFirst=$current['sla_primeira_resposta_em'];$slaResolution=$current['sla_resolucao_em'];
            if((int)$current['prioridade_id']!==$priorityId){$base=strtotime((string)$current['criado_em']);$slaFirst=date('Y-m-d H:i:s',$base+((int)$priorityRow['sla_primeira_interacao_minutos']*60));$slaResolution=date('Y-m-d H:i:s',$base+((int)$priorityRow['sla_resolucao_minutos']*60));}
            $pdo->beginTransaction();
            $pdo->prepare('UPDATE service_reports SET status=?,setor_id=?,responsavel_id=?,categoria_id=?,prioridade_id=?,tipo=?,grupo=?,recorrente=?,ticket_pai_id=?,primeira_resposta_em=?,sla_primeira_resposta_em=?,sla_resolucao_em=?,finalizado_em=? WHERE id=?')->execute([$status,$sectorId?:null,$responsibleId?:null,$categoryId,$priorityId,$type,service_desk_group_for_type($type),(int)$recurring,$parentId?:null,$first,$slaFirst,$slaResolution,$finished,$id]);
            $changes=[];if($current['status']!==$status)$changes[]='Status atualizado';if((int)$current['prioridade_id']!==$priorityId)$changes[]='Prioridade alterada';if((int)$current['categoria_id']!==$categoryId)$changes[]='Chamado recategorizado';if((int)$current['setor_id']!==$sectorId)$changes[]='Transferência de setor';if((int)$current['responsavel_id']!==$responsibleId)$changes[]='Responsável alterado';
            $audit=['tipo'=>['de'=>$current['tipo'],'para'=>$type],'categoria_id'=>['de'=>$current['categoria_id'],'para'=>$categoryId],'prioridade_id'=>['de'=>$current['prioridade_id'],'para'=>$priorityId],'recorrente'=>['de'=>(bool)$current['recorrente'],'para'=>$recurring],'ticket_pai_id'=>['de'=>$current['ticket_pai_id'],'para'=>$parentId?:null]];
            $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_anterior,status_novo,setor_anterior_id,setor_novo_id,responsavel_anterior_id,responsavel_novo_id,observacao,dados_json) VALUES(?,?,?,?,?,?,?,?,?,?,?)')->execute([$id,(int)user()['id'],$changes?implode(' · ',$changes):'atualizacao',$current['status'],$status,$current['setor_id'],$sectorId?:null,$current['responsavel_id'],$responsibleId?:null,$note?:null,json_encode($audit,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)]);
            if($note!=='')$pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem) VALUES(?,?,?,?)')->execute([$id,(int)user()['id'],'interno',$note]);
            if($status==='finalizado'&&$current['status']!=='finalizado'){
                $children=$pdo->prepare("SELECT id,status FROM service_reports WHERE ticket_pai_id=? AND status NOT IN ('finalizado','cancelado')");$children->execute([$id]);
                foreach($children->fetchAll() as $child){
                    $pdo->prepare("UPDATE service_reports SET status='possivel_solucao' WHERE id=?")->execute([(int)$child['id']]);
                    $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_anterior,status_novo,observacao) VALUES(?,?,?,?,?,?)')->execute([(int)$child['id'],(int)user()['id'],'ticket_pai_finalizado',$child['status'],'possivel_solucao','O ticket pai '.$current['protocolo'].' foi finalizado. Validar se a mesma solução atende esta recorrência.']);
                    $pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem) VALUES(?,?,?,?)')->execute([(int)$child['id'],null,'sistema','O ticket pai '.$current['protocolo'].' foi finalizado. A solução deve ser validada neste chamado recorrente.']);
                }
            }
            $pdo->commit();flash('success','Chamado atualizado e histórico registrado.');
            $return='service-desk?id='.$id;
        }elseif($action==='add_interaction'){
            $id=(int)($_POST['id']??0);$message=trim((string)($_POST['mensagem']??''));
            $hasFiles=!empty(array_filter((array)($_FILES['anexos']['name']??[])));
            if($message===''&&!$hasFiles)throw new RuntimeException('Escreva um comentário ou adicione um anexo.');
            $params=[];$access=service_desk_access_clause($params);$find=$pdo->prepare("SELECT * FROM service_reports sr WHERE sr.id=? AND {$access}");$find->execute(array_merge([$id],$params));$current=$find->fetch();if(!$current)throw new RuntimeException('Chamado não encontrado.');
            $internalInteraction=service_desk_can_manage();$authorInteraction=(int)$current['usuario_id']===(int)(user()['id']??0);
            if(!$internalInteraction&&!$authorInteraction)throw new RuntimeException('Seu perfil não permite interagir neste chamado.');
            $pdo->beginTransaction();
            $message=$message?:'Anexo adicionado ao chamado.';
            $pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem) VALUES(?,?,?,?)')->execute([$id,(int)user()['id'],$internalInteraction?'interno':'usuario',$message]);
            $messageId=(int)$pdo->lastInsertId();
            if($hasFiles)service_desk_store_attachments($pdo,$id,$_FILES['anexos'],'interacao',$messageId);
            $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_anterior,status_novo,observacao) VALUES(?,?,?,?,?,?)')->execute([$id,(int)user()['id'],'interacao',$current['status'],$current['status'],$message]);
            if($internalInteraction&&!$current['primeira_resposta_em'])$pdo->prepare('UPDATE service_reports SET primeira_resposta_em=NOW() WHERE id=?')->execute([$id]);
            $pdo->commit();flash('success','Interação registrada no histórico.');$return='service-desk?id='.$id.'&tab=timeline';
        }elseif($action==='add_solution'){
            if(!service_desk_can_manage())throw new RuntimeException('Seu perfil não permite registrar soluções.');
            $id=(int)($_POST['id']??0);$solutionType=(string)($_POST['tipo_solucao']??'proposta');$description=trim((string)($_POST['descricao_solucao']??''));
            if(!in_array($solutionType,['proposta','aplicada'],true)||$description==='')throw new RuntimeException('Informe o tipo e a descrição da solução.');
            $params=[];$access=service_desk_access_clause($params);$find=$pdo->prepare("SELECT * FROM service_reports sr WHERE sr.id=? AND {$access}");$find->execute(array_merge([$id],$params));$current=$find->fetch();if(!$current)throw new RuntimeException('Chamado não encontrado.');
            $pdo->beginTransaction();
            $pdo->prepare('INSERT INTO service_report_solutions(report_id,usuario_id,tipo,descricao) VALUES(?,?,?,?)')->execute([$id,(int)user()['id'],$solutionType,$description]);
            $field=$solutionType==='aplicada'?'solucao_final':'solucao_proposta';$pdo->prepare("UPDATE service_reports SET {$field}=? WHERE id=?")->execute([$description,$id]);
            $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_anterior,status_novo,observacao) VALUES(?,?,?,?,?,?)')->execute([$id,(int)user()['id'],$solutionType==='aplicada'?'solucao_aplicada':'solucao_proposta',$current['status'],$current['status'],$description]);
            $pdo->commit();flash('success',$solutionType==='aplicada'?'Solução aplicada registrada.':'Solução proposta registrada.');$return='service-desk?id='.$id.'&tab=solutions';
        }elseif($action==='delete_report'){
            if(!is_master()||!can('service_desk','delete'))throw new RuntimeException('Somente o Administrador Master pode excluir chamados.');
            $id=(int)($_POST['id']??0);$paths=[];
            if(service_desk_attachments_ready($pdo)){$files=$pdo->prepare('SELECT caminho FROM service_report_attachments WHERE report_id=?');$files->execute([$id]);$paths=$files->fetchAll(PDO::FETCH_COLUMN);}
            $delete=$pdo->prepare('DELETE FROM service_reports WHERE id=?');$delete->execute([$id]);
            if(!$delete->rowCount())throw new RuntimeException('Chamado não encontrado.');
            foreach($paths as $relative){$absolute=dirname(__DIR__).'/'.ltrim((string)$relative,'/');if(is_file($absolute))@unlink($absolute);}
            flash('success','Chamado excluído com sucesso.');$return='service-desk';
        }elseif($action==='satisfaction'){
            $id=(int)($_POST['id']??0);$note=max(1,min(5,(int)($_POST['nota']??0)));
            $find=$pdo->prepare('SELECT id FROM service_reports WHERE id=? AND usuario_id=? AND status="finalizado"');$find->execute([$id,(int)user()['id']]);if(!$find->fetchColumn())throw new RuntimeException('Este relato ainda não está disponível para avaliação.');
            $pdo->prepare('INSERT INTO service_report_satisfaction(report_id,usuario_id,nota,resolvido,comentario) VALUES(?,?,?,?,?) ON DUPLICATE KEY UPDATE nota=VALUES(nota),resolvido=VALUES(resolvido),comentario=VALUES(comentario)')->execute([$id,(int)user()['id'],$note,(int)isset($_POST['resolvido']),trim((string)($_POST['comentario']??''))?:null]);
            flash('success','Obrigado por avaliar a solução.');$return='service-desk?id='.$id;
        }
    }catch(Throwable $e){if(isset($pdo)&&$pdo instanceof PDO&&$pdo->inTransaction())$pdo->rollBack();flash('error',$e->getMessage());}
    header('Location: '.url($return));exit;
}

function load_service_desk_page(): array
{
    $pdo=db();$data=['ready'=>false,'attachments_ready'=>false,'reports'=>[],'selected'=>null,'counts'=>[],'filter_types'=>[],'filter_groups'=>[],'sectors'=>[],'filter_sectors'=>[],'users'=>[],'companies'=>[],'brands'=>[],'families'=>[],'models'=>[],'attachments'=>[],'categories'=>[],'filter_categories'=>[],'priorities'=>[],'filter_priorities'=>[],'parent_tickets'=>[],'solutions'=>[],'total'=>0,'pages'=>1];
    if(!$pdo)return $data;
    try{
        $pdo->query('SELECT 1 FROM service_report_solutions LIMIT 1');$data['attachments_ready']=service_desk_attachments_ready($pdo);
        if(!$data['attachments_ready'])return $data;
        $data['ready']=true;
        [$page,$perPage,$offset]=pagination_params();
        $params=[];$access=service_desk_access_clause($params);$where=["{$access}"];
        $status=(string)($_GET['status']??'');$type=(string)($_GET['tipo']??'');$sector=(int)($_GET['setor']??0);$priorityId=(int)($_GET['prioridade']??0);$categoryId=(int)($_GET['categoria']??0);$group=(string)($_GET['grupo']??'');$q=trim((string)($_GET['q']??''));
        if(isset(service_desk_statuses()[$status])){$where[]='sr.status=?';$params[]=$status;}
        if(isset(service_desk_types()[$type])){$where[]='sr.tipo=?';$params[]=$type;}
        if($sector){$where[]='sr.setor_id=?';$params[]=$sector;}
        if($priorityId){$where[]='sr.prioridade_id=?';$params[]=$priorityId;}
        if($categoryId){$where[]='sr.categoria_id=?';$params[]=$categoryId;}
        if(isset(service_desk_groups()[$group])){$where[]='sr.grupo=?';$params[]=$group;}
        if($q!==''){$where[]='(sr.protocolo LIKE ? OR sr.titulo LIKE ? OR sr.relato_original LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%");}
        $whereSql=' WHERE '.implode(' AND ',$where);
        $count=$pdo->prepare('SELECT COUNT(*) FROM service_reports sr'.$whereSql);$count->execute($params);$total=(int)$count->fetchColumn();
        $select='SELECT sr.*,u.nome usuario_nome,e.nome_fantasia empresa_nome,ma.nome marca_nome,f.nome familia_nome,m.nome modelo_nome,mc.nome categoria_nome,s.nome setor_nome,r.nome responsavel_nome,sp.codigo prioridade_codigo,sp.nome prioridade_nome,sp.cor prioridade_cor,pai.protocolo ticket_pai_protocolo FROM service_reports sr JOIN usuarios u ON u.id=sr.usuario_id LEFT JOIN empresas e ON e.id=sr.empresa_cliente_id LEFT JOIN marcas ma ON ma.id=sr.marca_id LEFT JOIN familias f ON f.id=sr.familia_id LEFT JOIN modelos m ON m.id=sr.modelo_id LEFT JOIN master_categories mc ON mc.id=sr.categoria_id LEFT JOIN setores s ON s.id=sr.setor_id LEFT JOIN usuarios r ON r.id=sr.responsavel_id LEFT JOIN service_priorities sp ON sp.id=sr.prioridade_id LEFT JOIN service_reports pai ON pai.id=sr.ticket_pai_id';
        $sql=$select.$whereSql.' ORDER BY FIELD(sr.status,"rascunho","novo","transferido","em_tratamento","possivel_solucao","finalizado","cancelado"),COALESCE(sp.ordem,99),sr.criado_em DESC LIMIT ? OFFSET ?';
        $stmt=$pdo->prepare($sql);foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$data['reports']=$stmt->fetchAll();
        $countParams=[];$countAccess=service_desk_access_clause($countParams);$counts=$pdo->prepare("SELECT status,COUNT(*) total FROM service_reports sr WHERE {$countAccess} GROUP BY status");$counts->execute($countParams);foreach($counts->fetchAll() as $row)$data['counts'][$row['status']]=(int)$row['total'];
        $data['sectors']=$pdo->query('SELECT s.*,e.nome_fantasia empresa_nome FROM setores s LEFT JOIN empresas e ON e.id=s.empresa_id WHERE s.ativo=1 ORDER BY e.nome_fantasia,s.nome')->fetchAll();
        $data['categories']=$pdo->query('SELECT id,nome,tipo FROM master_categories WHERE ativo=1 ORDER BY nome')->fetchAll();
        $data['priorities']=$pdo->query('SELECT * FROM service_priorities WHERE ativo=1 ORDER BY ordem,codigo')->fetchAll();
        $data['companies']=service_desk_allowed_companies($pdo);
        $data['brands']=$pdo->query('SELECT id,nome FROM marcas WHERE ativo=1 ORDER BY nome')->fetchAll();
        $data['families']=$pdo->query('SELECT id,marca_id,nome,tipo_veiculo FROM familias WHERE ativo=1 ORDER BY nome')->fetchAll();
        $data['models']=$pdo->query('SELECT m.id,m.familia_id,m.nome,f.marca_id,f.tipo_veiculo FROM modelos m JOIN familias f ON f.id=m.familia_id WHERE m.ativo=1 AND f.ativo=1 ORDER BY m.nome')->fetchAll();
        $optionParams=[];$optionAccess=service_desk_access_clause($optionParams);
        $filterCategories=$pdo->prepare("SELECT DISTINCT mc.id,mc.nome FROM service_reports sr JOIN master_categories mc ON mc.id=sr.categoria_id WHERE {$optionAccess} ORDER BY mc.nome");$filterCategories->execute($optionParams);$data['filter_categories']=$filterCategories->fetchAll();
        $filterPriorities=$pdo->prepare("SELECT DISTINCT sp.id,sp.codigo,sp.nome,sp.ordem FROM service_reports sr JOIN service_priorities sp ON sp.id=sr.prioridade_id WHERE {$optionAccess} ORDER BY sp.ordem,sp.codigo");$filterPriorities->execute($optionParams);$data['filter_priorities']=$filterPriorities->fetchAll();
        $filterSectors=$pdo->prepare("SELECT DISTINCT s.id,s.nome FROM service_reports sr JOIN setores s ON s.id=sr.setor_id WHERE {$optionAccess} ORDER BY s.nome");$filterSectors->execute($optionParams);$data['filter_sectors']=$filterSectors->fetchAll();
        $filterKinds=$pdo->prepare("SELECT DISTINCT tipo,grupo FROM service_reports sr WHERE {$optionAccess}");$filterKinds->execute($optionParams);foreach($filterKinds->fetchAll() as $kind){$data['filter_types'][(string)$kind['tipo']]=true;$data['filter_groups'][(string)$kind['grupo']]=true;}
        $data['users']=$pdo->query("SELECT DISTINCT u.id,u.nome FROM usuarios u JOIN usuario_empresas ue ON ue.usuario_id=u.id JOIN empresas e ON e.id=ue.empresa_id WHERE u.ativo=1 AND e.tipo IN ('vwco','concessionaria') ORDER BY u.nome")->fetchAll();
        $parentParams=[];$parentAccess=service_desk_access_clause($parentParams);$parents=$pdo->prepare("SELECT id,protocolo,titulo,status FROM service_reports sr WHERE {$parentAccess} ORDER BY criado_em DESC LIMIT 500");$parents->execute($parentParams);$data['parent_tickets']=$parents->fetchAll();
        $data=array_merge($data,['page'=>$page,'per_page'=>$perPage,'offset'=>$offset,'total'=>$total,'pages'=>max(1,(int)ceil($total/$perPage)),'q'=>$q,'status_filter'=>$status,'type_filter'=>$type,'sector_filter'=>$sector,'priority_filter'=>$priorityId,'category_filter'=>$categoryId,'group_filter'=>$group]);
        $selectedId=(int)($_GET['id']??0);
        if($selectedId){
            $selectedParams=[];$selectedAccess=service_desk_access_clause($selectedParams);$selectedStmt=$pdo->prepare($select." WHERE sr.id=? AND {$selectedAccess}");$selectedStmt->execute(array_merge([$selectedId],$selectedParams));$data['selected']=$selectedStmt->fetch()?:null;
            if($data['selected']){
                $message=$pdo->prepare('SELECT sm.*,u.nome usuario_nome FROM service_report_messages sm LEFT JOIN usuarios u ON u.id=sm.usuario_id WHERE sm.report_id=? ORDER BY sm.criado_em');$message->execute([$selectedId]);$data['messages']=$message->fetchAll();
                $history=$pdo->prepare('SELECT sh.*,u.nome usuario_nome FROM service_report_history sh LEFT JOIN usuarios u ON u.id=sh.usuario_id WHERE sh.report_id=? ORDER BY sh.criado_em DESC');$history->execute([$selectedId]);$data['history']=$history->fetchAll();
                $solutions=$pdo->prepare('SELECT ss.*,u.nome usuario_nome FROM service_report_solutions ss LEFT JOIN usuarios u ON u.id=ss.usuario_id WHERE ss.report_id=? ORDER BY ss.criado_em DESC');$solutions->execute([$selectedId]);$data['solutions']=$solutions->fetchAll();
                if($data['attachments_ready']){$attachments=$pdo->prepare('SELECT sa.*,u.nome usuario_nome FROM service_report_attachments sa LEFT JOIN usuarios u ON u.id=sa.usuario_id WHERE sa.report_id=? ORDER BY sa.criado_em');$attachments->execute([$selectedId]);$data['attachments']=$attachments->fetchAll();}
                $rating=$pdo->prepare('SELECT * FROM service_report_satisfaction WHERE report_id=?');$rating->execute([$selectedId]);$data['satisfaction']=$rating->fetch()?:null;
            }
        }
    }catch(Throwable){$data['ready']=false;}
    return $data;
}
