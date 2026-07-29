<?php
declare(strict_types=1);

function service_desk_internal_user(): bool
{
    return is_master() || in_array((string)(user()['active_company_type'] ?? ''), ['vwco','concessionaria'], true);
}

function service_desk_statuses(): array
{
    return [
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

function service_desk_access_clause(array &$params, string $alias='sr'): string
{
    $current=user();
    if(is_master() && !active_company_id()) return '1=1';
    if(($current['active_company_type']??'')==='cliente'){
        $params[]=active_company_id()?:0;
        return "{$alias}.empresa_cliente_id=?";
    }
    $ids=accessible_client_company_ids();
    if(!$ids)return '1=0';
    $params=array_merge($params,$ids);
    return "{$alias}.empresa_cliente_id IN (".implode(',',array_fill(0,count($ids),'?')).')';
}

function service_desk_categorize(PDO $pdo,string $text,string $preferredType=''): array
{
    $normalized=function_exists('assistant_normalize')?assistant_normalize($text):mb_strtolower($text,'UTF-8');
    $normalizedPadded=' '.$normalized.' ';
    $rows=$pdo->query("SELECT mc.*,ct.termo,ct.peso FROM master_categories mc LEFT JOIN category_terms ct ON ct.categoria_id=mc.id AND ct.ativo=1 WHERE mc.ativo=1 ORDER BY mc.id")->fetchAll();
    $categories=[];
    foreach($rows as $row){
        $id=(int)$row['id'];
        if(!isset($categories[$id]))$categories[$id]=['id'=>$id,'nome'=>$row['nome'],'slug'=>$row['slug'],'tipo'=>$row['tipo'],'setor_id'=>$row['setor_padrao_id']?:(null),'first'=>(int)$row['sla_primeira_resposta_horas'],'resolution'=>(int)$row['sla_resolucao_horas'],'score'=>0];
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
    return $best?:['id'=>null,'nome'=>'Outros relatos','tipo'=>'geral','setor_id'=>null,'first'=>8,'resolution'=>72,'score'=>0];
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
        $categories=$pdo->query('SELECT id,nome,tipo,descricao,setor_padrao_id,sla_primeira_resposta_horas,sla_resolucao_horas FROM master_categories WHERE ativo=1 ORDER BY nome')->fetchAll();
        $payload=['model'=>$config['text_model'],'instructions'=>'Classifique um relato automotivo. Responda somente JSON válido com category_id, criticidade (baixa, media, alta ou critica) e resumo em português, sem inventar fatos.','input'=>"Tipo informado: {$preferredType}\nCategorias: ".json_encode($categories,JSON_UNESCAPED_UNICODE)."\nRelato: {$text}",'max_output_tokens'=>300];
        $curl=curl_init('https://api.openai.com/v1/responses');curl_setopt_array($curl,[CURLOPT_POST=>true,CURLOPT_POSTFIELDS=>json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),CURLOPT_HTTPHEADER=>['Authorization: Bearer '.$config['key'],'Content-Type: application/json'],CURLOPT_RETURNTRANSFER=>true,CURLOPT_TIMEOUT=>$config['timeout']]);
        $raw=curl_exec($curl);$status=(int)curl_getinfo($curl,CURLINFO_RESPONSE_CODE);curl_close($curl);
        if(!is_string($raw)||$status<200||$status>=300)return $local;
        $response=json_decode($raw,true);$output=trim((string)($response['output_text']??''));
        if($output==='')foreach($response['output']??[] as $item)foreach($item['content']??[] as $content)if(($content['type']??'')==='output_text')$output.=(string)($content['text']??'');
        $output=preg_replace('/^```(?:json)?\s*|\s*```$/i','',$output)??$output;$classified=json_decode($output,true);
        if(!is_array($classified))return $local;
        foreach($categories as $category)if((int)$category['id']===(int)($classified['category_id']??0)){
            $resolved=['id'=>(int)$category['id'],'nome'=>$category['nome'],'tipo'=>$category['tipo'],'setor_id'=>$category['setor_padrao_id']?:null,'first'=>(int)$category['sla_primeira_resposta_horas'],'resolution'=>(int)$category['sla_resolucao_horas'],'score'=>100];
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
    $type=service_desk_types()[$flow['type']??'falha']??'Relato';
    $vehicle=$flow['vehicle']??[];
    $vehicleName=implode(' · ',array_filter([$vehicle['marca']??null,$vehicle['familia']??null,$vehicle['modelo']??null]));
    return "Confira antes de enviar:\n\nTipo: {$type}\nVeículo: ".($vehicleName?:'Não identificado')."\nCategoria: ".($flow['category']['nome']??'Outros relatos')."\nRelato: ".trim((string)($flow['description']??''))."\n\nPosso reportar isso para nosso time de assistência e produto?";
}

function service_desk_create_from_flow(PDO $pdo,array $flow,string $inputType): array
{
    $current=user();$userId=(int)($current['id']??0);$companyId=active_company_id();
    $vehicle=$flow['vehicle']??[];$category=$flow['category']??service_desk_classify($pdo,(string)$flow['description'],(string)$flow['type']);
    $title=mb_substr((service_desk_types()[$flow['type']]??'Relato').' · '.($vehicle['modelo']??$vehicle['familia']??$category['nome']),0,190);
    $slaFirst=date('Y-m-d H:i:s',time()+((int)$category['first']*3600));
    $slaResolution=date('Y-m-d H:i:s',time()+((int)$category['resolution']*3600));
    $pdo->beginTransaction();
    try{
        $stmt=$pdo->prepare('INSERT INTO service_reports(usuario_id,empresa_cliente_id,marca_id,familia_id,modelo_id,setor_id,categoria_id,tipo,canal,titulo,relato_original,relato_normalizado,resumo_triagem,criticidade,sla_primeira_resposta_em,sla_resolucao_em) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
        $stmt->execute([$userId,$companyId,$vehicle['marca_id']??null,$vehicle['familia_id']??null,$vehicle['modelo_id']??null,$category['setor_id']??null,$category['id']??null,$flow['type'],$inputType,$title,$flow['description'],function_exists('assistant_normalize')?assistant_normalize((string)$flow['description']):(string)$flow['description'],$category['resumo']??service_desk_summary($flow),$category['criticidade']??'media',$slaFirst,$slaResolution]);
        $id=(int)$pdo->lastInsertId();$protocol='DL-'.date('Ymd').'-'.str_pad((string)$id,6,'0',STR_PAD_LEFT);
        $pdo->prepare('UPDATE service_reports SET protocolo=? WHERE id=?')->execute([$protocol,$id]);
        $message=$pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem,audio_segundos) VALUES(?,?,?,?,?)');
        foreach($flow['messages']??[] as $item)$message->execute([$id,$item['origin']==='usuario'?$userId:null,$item['origin'],$item['text'],(int)($item['audio_seconds']??0)]);
        $message->execute([$id,null,'sistema','Relato confirmado e protocolado pelo usuário.',0]);
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
        unset($_SESSION['service_desk_flow'],$_SESSION['assistant_awaiting_close'],$_SESSION['assistant_rating_pending']);
        return ['answer'=>'Certo. Pergunte sobre um treinamento, função do veículo, ficha técnica, frota ou indicador da plataforma.','options'=>[]];
    }
    if($action==='start_report'){
        unset($_SESSION['assistant_awaiting_close'],$_SESSION['assistant_rating_pending']);
        $_SESSION['service_desk_flow']=['state'=>'type','messages'=>[['origin'=>'assistente','text'=>'O que você deseja registrar?']]];
        return ['answer'=>'O que você deseja registrar?','options'=>[
            service_desk_option('report_type_falha','Reportar uma falha','bi-exclamation-triangle'),
            service_desk_option('report_type_erro','Reportar um erro','bi-bug'),
            service_desk_option('report_type_melhoria','Sugerir uma melhoria','bi-lightbulb'),
            service_desk_option('report_type_sugestao','Enviar uma sugestão','bi-chat-square-heart'),
        ]];
    }
    if(str_starts_with($action,'report_type_')){
        $type=substr($action,12);
        if(!isset(service_desk_types()[$type]))return null;
        $prompt='Conte com suas palavras o que aconteceu ou o que gostaria de melhorar. Você pode digitar ou gravar um áudio de até um minuto.';
        $messages=is_array($flow)?($flow['messages']??[]):[];
        $messages[]=['origin'=>'usuario','text'=>service_desk_types()[$type]];
        $messages[]=['origin'=>'assistente','text'=>$prompt];
        $_SESSION['service_desk_flow']=['state'=>'description','type'=>$type,'messages'=>$messages];
        return ['answer'=>$prompt,'options'=>[]];
    }
    if($action==='report_cancel'){
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
        $flow['category']=service_desk_classify($pdo,$flow['description'],(string)$flow['type']);
        $flow['vehicle']=service_desk_detect_vehicle($pdo,$question);
    }elseif($state==='more'){
        $flow['description']=trim((string)$flow['description']."\n\nComplemento: ".$question);
        $flow['category']=service_desk_classify($pdo,$flow['description'],(string)$flow['type']);
        if(empty($flow['vehicle']['modelo_id']))$flow['vehicle']=service_desk_detect_vehicle($pdo,$question);
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
    $response=service_desk_vehicle_next($pdo,$flow);
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
        if($action==='update_report'){
            if(!can('service_desk','update')||!service_desk_internal_user())throw new RuntimeException('Seu perfil não permite tratar chamados.');
            $id=(int)($_POST['id']??0);$status=(string)($_POST['status']??'novo');$sectorId=(int)($_POST['setor_id']??0);$responsibleId=(int)($_POST['responsavel_id']??0);
            if(!isset(service_desk_statuses()[$status]))throw new RuntimeException('Selecione um status válido.');
            $params=[];$access=service_desk_access_clause($params);$find=$pdo->prepare("SELECT * FROM service_reports sr WHERE sr.id=? AND {$access}");$find->execute(array_merge([$id],$params));$current=$find->fetch();
            if(!$current)throw new RuntimeException('Chamado não encontrado no seu escopo.');
            $proposed=trim((string)($_POST['solucao_proposta']??''));$final=trim((string)($_POST['solucao_final']??''));$note=trim((string)($_POST['observacao']??''));
            if($status==='possivel_solucao'&&$proposed==='')throw new RuntimeException('Informe a possível solução.');
            if($status==='finalizado'&&$final==='')throw new RuntimeException('Informe a solução final antes de encerrar.');
            $first=$current['primeira_resposta_em']?:date('Y-m-d H:i:s');$finished=$status==='finalizado'?date('Y-m-d H:i:s'):null;
            $pdo->beginTransaction();
            $pdo->prepare('UPDATE service_reports SET status=?,setor_id=?,responsavel_id=?,solucao_proposta=?,solucao_final=?,primeira_resposta_em=?,finalizado_em=? WHERE id=?')->execute([$status,$sectorId?:null,$responsibleId?:null,$proposed?:null,$final?:null,$first,$finished,$id]);
            $pdo->prepare('INSERT INTO service_report_history(report_id,usuario_id,evento,status_anterior,status_novo,setor_anterior_id,setor_novo_id,responsavel_anterior_id,responsavel_novo_id,observacao) VALUES(?,?,?,?,?,?,?,?,?,?)')->execute([$id,(int)user()['id'],'atualizacao',$current['status'],$status,$current['setor_id'],$sectorId?:null,$current['responsavel_id'],$responsibleId?:null,$note?:null]);
            if($note!=='')$pdo->prepare('INSERT INTO service_report_messages(report_id,usuario_id,origem,mensagem) VALUES(?,?,?,?)')->execute([$id,(int)user()['id'],'interno',$note]);
            $pdo->commit();flash('success','Chamado atualizado e histórico registrado.');
            $return='service-desk?id='.$id;
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
    $pdo=db();$data=['ready'=>false,'reports'=>[],'selected'=>null,'counts'=>[],'sectors'=>[],'users'=>[],'companies'=>[],'categories'=>[]];
    if(!$pdo)return $data;
    try{
        $pdo->query('SELECT 1 FROM service_reports LIMIT 1');$data['ready']=true;
        $params=[];$access=service_desk_access_clause($params);$where=["{$access}"];
        $status=(string)($_GET['status']??'');$type=(string)($_GET['tipo']??'');$sector=(int)($_GET['setor']??0);$q=trim((string)($_GET['q']??''));
        if(isset(service_desk_statuses()[$status])){$where[]='sr.status=?';$params[]=$status;}
        if(isset(service_desk_types()[$type])){$where[]='sr.tipo=?';$params[]=$type;}
        if($sector){$where[]='sr.setor_id=?';$params[]=$sector;}
        if($q!==''){$where[]='(sr.protocolo LIKE ? OR sr.titulo LIKE ? OR sr.relato_original LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%");}
        $sql='SELECT sr.*,u.nome usuario_nome,e.nome_fantasia empresa_nome,ma.nome marca_nome,f.nome familia_nome,m.nome modelo_nome,mc.nome categoria_nome,s.nome setor_nome,r.nome responsavel_nome FROM service_reports sr JOIN usuarios u ON u.id=sr.usuario_id LEFT JOIN empresas e ON e.id=sr.empresa_cliente_id LEFT JOIN marcas ma ON ma.id=sr.marca_id LEFT JOIN familias f ON f.id=sr.familia_id LEFT JOIN modelos m ON m.id=sr.modelo_id LEFT JOIN master_categories mc ON mc.id=sr.categoria_id LEFT JOIN setores s ON s.id=sr.setor_id LEFT JOIN usuarios r ON r.id=sr.responsavel_id WHERE '.implode(' AND ',$where).' ORDER BY FIELD(sr.status,"novo","transferido","em_tratamento","possivel_solucao","finalizado","cancelado"),sr.criado_em DESC LIMIT 200';
        $stmt=$pdo->prepare($sql);$stmt->execute($params);$data['reports']=$stmt->fetchAll();
        foreach(service_desk_statuses() as $key=>$label)$data['counts'][$key]=count(array_filter($data['reports'],static fn(array $row):bool=>$row['status']===$key));
        $data['sectors']=$pdo->query('SELECT s.*,e.nome_fantasia empresa_nome FROM setores s LEFT JOIN empresas e ON e.id=s.empresa_id WHERE s.ativo=1 ORDER BY e.nome_fantasia,s.nome')->fetchAll();
        $data['categories']=$pdo->query('SELECT id,nome,tipo FROM master_categories WHERE ativo=1 ORDER BY nome')->fetchAll();
        $data['users']=$pdo->query("SELECT DISTINCT u.id,u.nome FROM usuarios u JOIN usuario_empresas ue ON ue.usuario_id=u.id JOIN empresas e ON e.id=ue.empresa_id WHERE u.ativo=1 AND e.tipo IN ('vwco','concessionaria') ORDER BY u.nome")->fetchAll();
        $selectedId=(int)($_GET['id']??0);
        if($selectedId){
            foreach($data['reports'] as $row)if((int)$row['id']===$selectedId){$data['selected']=$row;break;}
            if($data['selected']){
                $message=$pdo->prepare('SELECT sm.*,u.nome usuario_nome FROM service_report_messages sm LEFT JOIN usuarios u ON u.id=sm.usuario_id WHERE sm.report_id=? ORDER BY sm.criado_em');$message->execute([$selectedId]);$data['messages']=$message->fetchAll();
                $history=$pdo->prepare('SELECT sh.*,u.nome usuario_nome FROM service_report_history sh LEFT JOIN usuarios u ON u.id=sh.usuario_id WHERE sh.report_id=? ORDER BY sh.criado_em DESC');$history->execute([$selectedId]);$data['history']=$history->fetchAll();
                $rating=$pdo->prepare('SELECT * FROM service_report_satisfaction WHERE report_id=?');$rating->execute([$selectedId]);$data['satisfaction']=$rating->fetch()?:null;
            }
        }
    }catch(Throwable){$data['ready']=false;}
    return $data;
}
