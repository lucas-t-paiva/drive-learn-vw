<?php
declare(strict_types=1);

function assistant_load_env(): void
{
    static $loaded=false;
    if($loaded)return;
    $loaded=true;
    $path=dirname(__DIR__).'/.env.ai';
    if(!is_file($path))return;
    foreach(file($path,FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES)?:[] as $line){
        $line=trim($line);
        if($line===''||str_starts_with($line,'#')||!str_contains($line,'='))continue;
        [$name,$value]=explode('=',$line,2);$name=trim($name);$value=trim($value);
        if(!preg_match('/^[A-Z_][A-Z0-9_]*$/',$name))continue;
        $length=strlen($value);
        if($length>=2&&(($value[0]==='"'&&$value[$length-1]==='"')||($value[0]==="'"&&$value[$length-1]==="'")))$value=substr($value,1,-1);
        if(getenv($name)===false){putenv("{$name}={$value}");$_ENV[$name]=$value;}
    }
}

function assistant_config(): array
{
    assistant_load_env();
    $mode=trim((string)(getenv('ASSISTANT_MODE')?:'local'));
    if(!in_array($mode,['local','hybrid','openai'],true))$mode='local';
    $dailyLimit=max(1,min(1000,(int)(getenv('ASSISTANT_DAILY_LIMIT')?:40)));
    try{
        $pdo=db();$companyId=active_company_id();
        if($pdo){
            if($companyId){
                $stmt=$pdo->prepare("SELECT limite_diario FROM assistente_limites WHERE ativo=1 AND (empresa_id=? OR chave_escopo='global') ORDER BY (empresa_id=?) DESC LIMIT 1");
                $stmt->execute([$companyId,$companyId]);$configured=$stmt->fetchColumn();
            }else $configured=$pdo->query("SELECT limite_diario FROM assistente_limites WHERE chave_escopo='global' AND ativo=1 LIMIT 1")->fetchColumn();
            if($configured!==false)$dailyLimit=max(1,min(1000,(int)$configured));
        }
    }catch(Throwable){}
    return [
        'key'=>trim((string)(getenv('OPENAI_API_KEY')?:'')),
        'mode'=>$mode,
        'local_version'=>'3',
        'text_model'=>trim((string)(getenv('OPENAI_TEXT_MODEL')?:'gpt-5.6-luna')),
        'transcribe_model'=>trim((string)(getenv('OPENAI_TRANSCRIBE_MODEL')?:'gpt-realtime-whisper')),
        'timeout'=>max(15,min(120,(int)(getenv('OPENAI_TIMEOUT')?:45))),
        'daily_limit'=>$dailyLimit,
        'max_input_tokens'=>max(1000,min(20000,(int)(getenv('ASSISTANT_MAX_INPUT_TOKENS')?:4000))),
        'max_output_tokens'=>max(100,min(4000,(int)(getenv('ASSISTANT_MAX_OUTPUT_TOKENS')?:800))),
    ];
}

function assistant_json(array $payload,int $status=200): never
{
    http_response_code($status);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    exit;
}

function assistant_normalize(string $value): string
{
    $value=mb_strtolower(trim($value),'UTF-8');
    $transliterated=@iconv('UTF-8','ASCII//TRANSLIT//IGNORE',$value);
    if(is_string($transliterated))$value=$transliterated;
    $value=preg_replace('/[^a-z0-9]+/',' ',$value)?:'';
    return trim(preg_replace('/\s+/',' ',$value)?:'');
}

function assistant_terms(string $normalized): array
{
    $stop=['a','ao','aos','as','com','como','da','das','de','do','dos','e','em','eu','me','meu','na','nas','no','nos','o','os','para','por','pra','que','se','um','uma'];
    return array_values(array_unique(array_filter(explode(' ',$normalized),static fn(string $term):bool=>strlen($term)>=2&&!in_array($term,$stop,true))));
}

function assistant_score(string $text,array $terms): int
{
    $text=assistant_normalize($text);$score=0;
    foreach($terms as $term)$score+=substr_count($text,$term)*(strlen($term)<=3?4:1);
    return $score;
}

function assistant_is_followup_question(string $question): bool
{
    $normalized=assistant_normalize($question);
    $generic=['agora','ainda','ativar','ativa','desativar','desativa','botao','cancelar','como','entao','explique','funcao','funciona','funcionamento','gostaria','ligar','serve','saber','usar','utilizar'];
    $specific=array_values(array_filter(assistant_terms($normalized),static fn(string $term):bool=>!in_array($term,$generic,true)));
    return !$specific;
}

function assistant_requested_limit(string $normalized,int $default=3): int
{
    if(preg_match('/\b([1-9]|10)\b/',$normalized,$match))return max(1,min(10,(int)$match[1]));
    $words=['um'=>1,'uma'=>1,'dois'=>2,'duas'=>2,'tres'=>3,'quatro'=>4,'cinco'=>5,'seis'=>6,'sete'=>7,'oito'=>8,'nove'=>9,'dez'=>10];
    foreach($words as $word=>$number)if(preg_match('/\b'.preg_quote($word,'/').'\b/',$normalized))return $number;
    return $default;
}

function assistant_system_analytics(PDO $pdo,string $question): ?array
{
    $normalized=assistant_normalize($question);
    if(!preg_match('/\b(frota|frotas|cliente|clientes|marca|marcas|veiculo|veiculos|regiao|estado|cidade|ranking|alta)\b/',$normalized))return null;
    $allowed=array_values(array_unique(array_filter(array_map('intval',accessible_client_company_ids()))));
    if(!$allowed)return null;
    $marks=implode(',',array_fill(0,count($allowed),'?'));
    $brandRows=$pdo->query("SELECT id,nome FROM marcas WHERE ativo=1 ORDER BY nome")->fetchAll();
    $requestedBrand=null;
    foreach($brandRows as $brand){
        $brandName=assistant_normalize((string)$brand['nome']);
        $generic=['caminhoes','caminhao','onibus','trucks','bus'];
        $words=array_filter(explode(' ',$brandName),static fn(string $word):bool=>strlen($word)>=3&&!in_array($word,$generic,true));
        if(str_contains($normalized,$brandName)||array_filter($words,static fn(string $word):bool=>str_contains($normalized,$word))){$requestedBrand=$brand;break;}
    }
    if(!$requestedBrand&&preg_match('/\b(vw|vwco|volks)\b/',$normalized))foreach($brandRows as $brand)if(str_contains(assistant_normalize((string)$brand['nome']),'volkswagen')){$requestedBrand=$brand;break;}
    $states=['acre'=>'AC','alagoas'=>'AL','amapa'=>'AP','amazonas'=>'AM','bahia'=>'BA','ceara'=>'CE','distrito federal'=>'DF','espirito santo'=>'ES','goias'=>'GO','maranhao'=>'MA','mato grosso do sul'=>'MS','mato grosso'=>'MT','minas gerais'=>'MG','para'=>'PA','paraiba'=>'PB','parana'=>'PR','pernambuco'=>'PE','piaui'=>'PI','rio de janeiro'=>'RJ','rio grande do norte'=>'RN','rio grande do sul'=>'RS','rondonia'=>'RO','roraima'=>'RR','santa catarina'=>'SC','sao paulo'=>'SP','sergipe'=>'SE','tocantins'=>'TO'];
    $requestedState='';$requestedStateName='';
    foreach($states as $name=>$code)if(str_contains($normalized,$name)){$requestedState=$code;$requestedStateName=$name;break;}
    if(!$requestedState&&preg_match('/\b(AC|AL|AP|AM|BA|CE|DF|ES|GO|MA|MS|MT|MG|PA|PB|PR|PE|PI|RJ|RN|RS|RO|RR|SC|SP|SE|TO)\b/i',$question,$match)){$requestedState=strtoupper($match[1]);$requestedStateName=$requestedState;}
    $base=" FROM frotas fr JOIN clientes c ON c.id=fr.cliente_id JOIN empresas e ON e.id=c.empresa_id JOIN marcas ma ON ma.id=fr.marca_id LEFT JOIN cidades ci ON ci.id=e.cidade_id LEFT JOIN estados es ON es.id=ci.estado_id WHERE e.id IN ({$marks})";
    $params=$allowed;
    if($requestedState!==''){$base.=' AND es.sigla=?';$params[]=$requestedState;}
    $limit=preg_match('/\bqual marca\b/',$normalized)?1:assistant_requested_limit($normalized,3);
    $clientRanking=preg_match('/\b(cliente|clientes)\b/',$normalized)&&preg_match('/\b(mais|maior|ranking|top|veiculo|frota)\b/',$normalized);
    if($clientRanking){
        if($requestedBrand){$base.=' AND ma.id=?';$params[]=(int)$requestedBrand['id'];}
        $stmt=$pdo->prepare("SELECT e.id,e.nome_fantasia cliente,COALESCE(SUM(fr.quantidade),0) veiculos,COUNT(DISTINCT fr.marca_id) marcas{$base} GROUP BY e.id,e.nome_fantasia HAVING veiculos>0 ORDER BY veiculos DESC,e.nome_fantasia LIMIT {$limit}");
        $stmt->execute($params);$rows=$stmt->fetchAll();if(!$rows)return ['answer'=>'Não encontrei frota cadastrada para os filtros informados.','title'=>'Ranking de clientes','rows'=>[],'action'=>null];
        $scope=trim(($requestedBrand?' da marca '.$requestedBrand['nome']:'').($requestedState?' em '.$requestedState:''));
        $lines=[];foreach($rows as $index=>$row)$lines[]=($index+1).'º '.$row['cliente'].' — '.number_format((int)$row['veiculos'],0,',','.').' veículo(s)';
        return ['answer'=>"Os {$limit} clientes com mais veículos{$scope}, considerando os cadastros da frota, são:\n\n".implode("\n",$lines),'title'=>'Ranking de clientes por frota','rows'=>$rows,'action'=>can('fleet','view')?['type'=>'fleet','label'=>'Abrir os registros da frota','route'=>'frota','query'=>array_filter(['marca'=>$requestedBrand['id']??null])]:null];
    }
    $stmt=$pdo->prepare("SELECT ma.id,ma.nome marca,COALESCE(SUM(fr.quantidade),0) veiculos,COUNT(DISTINCT e.id) clientes{$base} GROUP BY ma.id,ma.nome HAVING veiculos>0 ORDER BY veiculos DESC,ma.nome LIMIT {$limit}");
    $stmt->execute($params);$rows=$stmt->fetchAll();if(!$rows)return ['answer'=>'Não encontrei frota cadastrada para a região ou escopo informado.','title'=>'Presença de marcas','rows'=>[],'action'=>null];
    $region=$requestedState?' na região de '.strtoupper($requestedState):' no seu escopo';
    $lines=[];foreach($rows as $index=>$row)$lines[]=($index+1).'º '.$row['marca'].' — '.number_format((int)$row['veiculos'],0,',','.').' veículo(s) em '.(int)$row['clientes'].' cliente(s)';
    $note=str_contains($normalized,'alta')?'Aqui, “em alta” significa a maior quantidade atualmente cadastrada, não crescimento de vendas ao longo do tempo.':'';
    return ['answer'=>"As marcas com maior presença{$region} são:\n\n".implode("\n",$lines).($note?"\n\n{$note}":''),'title'=>'Ranking de marcas por frota','rows'=>$rows,'action'=>can('fleet','view')?['type'=>'fleet','label'=>'Abrir Minha Frota','route'=>'frota','query'=>[]]:null];
}

function assistant_context(PDO $pdo,string $question): array
{
    $terms=assistant_terms(assistant_normalize($question));
    $accessParams=[];$access=library_video_access_sql($accessParams,'v');
    $videoStmt=$pdo->prepare("SELECT v.id,v.titulo,v.descricao,v.transcricao,v.resumo_ia,v.atualizado_em,c.nome categoria_nome,s.nome subcategoria_nome FROM videos v JOIN categorias c ON c.id=v.categoria_id LEFT JOIN subcategorias s ON s.id=v.subcategoria_id WHERE v.status='publicado' AND {$access} ORDER BY v.atualizado_em DESC LIMIT 80");
    $videoStmt->execute($accessParams);$videoRows=$videoStmt->fetchAll();
    foreach($videoRows as &$row)$row['_score']=assistant_score(implode(' ',[$row['titulo'],$row['descricao'],$row['transcricao'],$row['resumo_ia'],$row['categoria_nome'],$row['subcategoria_nome']]),$terms);
    unset($row);
    if(assistant_is_followup_question($question)){
        try{
            $last=$pdo->prepare("SELECT aif.video_id FROM assistente_interacao_fontes aif JOIN assistente_interacoes ai ON ai.id=aif.interacao_id WHERE ai.usuario_id=? AND aif.tipo='video' AND aif.video_id IS NOT NULL ORDER BY ai.id DESC,aif.id LIMIT 1");
            $last->execute([(int)(user()['id']??0)]);$lastVideoId=(int)$last->fetchColumn();
            if($lastVideoId)foreach($videoRows as &$row)if((int)$row['id']===$lastVideoId)$row['_score']+=100;
            unset($row);
        }catch(Throwable){}
    }
    usort($videoRows,static fn(array $a,array $b):int=>$b['_score']<=>$a['_score']);$videos=array_values(array_filter(array_slice($videoRows,0,5),static fn(array $row):bool=>(int)$row['_score']>0));

    $modelParams=[];$scope='';
    if(!is_master()){$scope=' AND EXISTS(SELECT 1 FROM usuario_marcas um WHERE um.usuario_id=? AND um.marca_id=ma.id)';$modelParams[]=(int)(user()['id']??0);}
    $modelStmt=$pdo->prepare("SELECT m.id,m.nome,m.descricao,m.motor,m.potencia,m.torque,m.transmissao,m.pbt,m.pbtc,m.relacao_reducao,JSON_UNQUOTE(JSON_EXTRACT(m.especificacoes,'$.entre_eixos')) AS entre_eixos,m.especificacoes,m.criado_em AS atualizado_em,f.nome familia_nome,ma.nome marca_nome FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id WHERE m.ativo=1{$scope} ORDER BY m.criado_em DESC LIMIT 160");
    $modelStmt->execute($modelParams);$modelRows=$modelStmt->fetchAll();
    foreach($modelRows as &$row)$row['_score']=assistant_score(implode(' ',array_map(static fn($v):string=>is_scalar($v)?(string)$v:'',array_values($row))),$terms);
    unset($row);usort($modelRows,static fn(array $a,array $b):int=>$b['_score']<=>$a['_score']);$models=array_values(array_filter(array_slice($modelRows,0,5),static fn(array $row):bool=>(int)$row['_score']>0));

    $parts=[];$sources=['videos'=>[],'modelos'=>[],'analises'=>[]];$evidence=[];$analytics=assistant_system_analytics($pdo,$question);
    if($analytics){
        $parts[]="ANÁLISE DO SISTEMA - {$analytics['title']}\n".$analytics['answer']."\nDados agregados: ".json_encode($analytics['rows'],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
        $sources['analises'][]=['titulo'=>$analytics['title']];
        $evidence[]=['type'=>'frota','id'=>0,'title'=>$analytics['title'],'transcript'=>null,'content'=>json_encode($analytics,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),'updated_at'=>date('Y-m-d H:i:s'),'score'=>100];
    }
    foreach($videos as $video){
        $content=trim((string)($video['transcricao']?:$video['resumo_ia']?:$video['descricao']));
        $parts[]="VÍDEO #{$video['id']} - {$video['titulo']}\nCategoria: {$video['categoria_nome']} / ".($video['subcategoria_nome']?:'Sem subcategoria')."\nConteúdo: ".mb_substr($content,0,5000);
        $sources['videos'][]=['id'=>(int)$video['id'],'titulo'=>$video['titulo']];
        $evidence[]=['type'=>'video','id'=>(int)$video['id'],'title'=>$video['titulo'],'transcript'=>(string)($video['transcricao']??''),'content'=>$content,'updated_at'=>$video['atualizado_em'],'score'=>(int)$video['_score']];
    }
    foreach($models as $model){
        $parts[]="MODELO #{$model['id']} - {$model['marca_nome']} / {$model['familia_nome']} / {$model['nome']}\nMotor: {$model['motor']}; Potência: {$model['potencia']}; Torque: {$model['torque']}; Transmissão: {$model['transmissao']}; PBT: {$model['pbt']}; PBTC: {$model['pbtc']}; Entre-eixos: {$model['entre_eixos']}; Redução: {$model['relacao_reducao']}; Descrição: {$model['descricao']}; Especificações: {$model['especificacoes']}";
        $sources['modelos'][]=['id'=>(int)$model['id'],'nome'=>$model['nome'],'marca'=>$model['marca_nome']];
        $evidence[]=['type'=>'modelo','id'=>(int)$model['id'],'title'=>$model['marca_nome'].' · '.$model['familia_nome'].' · '.$model['nome'],'transcript'=>null,'content'=>json_encode($model,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),'updated_at'=>$model['atualizado_em'],'score'=>(int)$model['_score']];
    }
    $context=mb_substr(implode("\n\n",$parts),0,13000);
    $sourceSignature=[];
    foreach($videos as $row)$sourceSignature[]='v'.$row['id'].'@'.$row['atualizado_em'];
    foreach($models as $row)$sourceSignature[]='m'.$row['id'].'@'.$row['atualizado_em'];
    if($analytics)$sourceSignature[]='a'.hash('sha256',json_encode($analytics['rows'],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES));
    return ['text'=>$context,'sources'=>$sources,'evidence'=>$evidence,'analytics'=>$analytics,'signature'=>hash('sha256',implode('|',$sourceSignature))];
}

function assistant_catalog_action(PDO $pdo,string $question): ?array
{
    if(!can('technical_catalog','view'))return null;
    $normalized=assistant_normalize($question);
    if(!preg_match('/\b(catalogo|compar|filtr|model|veicul|caminh|onibus|resumo)\w*/',$normalized))return null;
    $limit=4;
    if(preg_match('/\b([2-5])\s+(?:veiculos?|modelos?|caminhoes?|onibus)\b/',$normalized,$match))$limit=(int)$match[1];
    $configuration='';
    if(preg_match('/\b\d+x\d+\b/',$normalized,$match))$configuration=$match[0];
    $params=[];$scope='';
    if(!is_master()){$scope=' AND EXISTS(SELECT 1 FROM usuario_marcas um WHERE um.usuario_id=? AND um.marca_id=ma.id)';$params[]=(int)(user()['id']??0);}
    $stmt=$pdo->prepare("SELECT m.id,m.nome,m.descricao,m.motor,m.potencia,m.torque,m.transmissao,m.pbt,m.pbtc,m.relacao_reducao,JSON_UNQUOTE(JSON_EXTRACT(m.especificacoes,'$.entre_eixos')) AS entre_eixos,m.especificacoes,f.nome familia_nome,ma.id marca_id,ma.nome marca_nome,f.tipo_veiculo FROM modelos m JOIN familias f ON f.id=m.familia_id AND f.ativo=1 JOIN marcas ma ON ma.id=f.marca_id AND ma.ativo=1 WHERE m.ativo=1{$scope} ORDER BY ma.nome,f.nome,m.nome");
    $stmt->execute($params);$rows=$stmt->fetchAll();$candidates=[];$mentionedBrands=[];
    foreach($rows as $row){
        $specs=json_decode((string)($row['especificacoes']??''),true);if(!is_array($specs))$specs=[];
        $haystack=assistant_normalize(implode(' ',array_filter([$row['marca_nome'],$row['familia_nome'],$row['nome'],$row['descricao'],$row['motor'],$row['potencia'],$row['torque'],$row['transmissao'],$row['pbt'],$row['pbtc'],$row['relacao_reducao'],$row['entre_eixos'],json_encode($specs,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)])));
        if($configuration!==''&&!str_contains($haystack,$configuration))continue;
        $brandNormalized=assistant_normalize((string)$row['marca_nome']);
        $brandMentioned=str_contains($normalized,$brandNormalized);
        foreach(explode(' ',$brandNormalized) as $word)if(strlen($word)>=3&&str_contains($normalized,$word))$brandMentioned=true;
        if($brandMentioned)$mentionedBrands[(int)$row['marca_id']]=true;
        $row['_score']=assistant_score($haystack,assistant_terms($normalized))+($brandMentioned?12:0)+(str_contains($normalized,assistant_normalize((string)$row['familia_nome']))?16:0);
        $candidates[]=$row;
    }
    if(!$candidates)return null;
    usort($candidates,static fn(array $a,array $b):int=>$b['_score']<=>$a['_score']);
    $chosen=[];
    foreach(array_keys($mentionedBrands) as $brandId)foreach($candidates as $candidate)if((int)$candidate['marca_id']===$brandId){$chosen[(int)$candidate['id']]=$candidate;break;}
    foreach($candidates as $candidate){if(count($chosen)>=$limit)break;$chosen[(int)$candidate['id']]=$candidate;}
    if(count($chosen)<2)return null;
    $chosen=array_slice(array_values($chosen),0,$limit);
    return [
        'type'=>'technical_catalog',
        'label'=>count($chosen).' veículos encontrados'.($configuration!==''?" em {$configuration}":''),
        'route'=>'catalogo-tecnico',
        'query'=>array_filter(['q'=>$configuration,'tipo'=>$chosen[0]['tipo_veiculo']??'']),
        'compare'=>array_map(static fn(array $row):int=>(int)$row['id'],$chosen),
        'models'=>array_map(static fn(array $row):array=>[
            'id'=>(int)$row['id'],'name'=>$row['marca_nome'].' '.$row['nome'],
            'family'=>$row['familia_nome'],'motor'=>$row['motor'],'power'=>$row['potencia'],
            'torque'=>$row['torque'],'pbt'=>$row['pbt'],'pbtc'=>$row['pbtc'],
            'wheelbase'=>$row['entre_eixos'],'reduction'=>$row['relacao_reducao'],
        ],$chosen),
    ];
}

function assistant_local_excerpt(string $content,string $question): string
{
    $content=trim(preg_replace('/\s+/u',' ',$content)?:'');
    if($content==='')return '';
    $sentences=preg_split('/(?<=[.!?])\s+/u',$content,-1,PREG_SPLIT_NO_EMPTY)?:[$content];
    $terms=assistant_terms(assistant_normalize($question));$ranked=[];
    foreach($sentences as $index=>$sentence){
        $sentence=trim($sentence);if(mb_strlen($sentence)<20)continue;
        $ranked[]=['index'=>$index,'text'=>$sentence,'score'=>assistant_score($sentence,$terms)];
    }
    usort($ranked,static fn(array $a,array $b):int=>$b['score']<=>$a['score']);
    $selected=array_slice(array_filter($ranked,static fn(array $row):bool=>$row['score']>0),0,3);
    if(!$selected)$selected=array_slice($ranked,0,2);
    usort($selected,static fn(array $a,array $b):int=>$a['index']<=>$b['index']);
    return mb_substr(implode(' ',array_column($selected,'text')),0,1200);
}

function assistant_local_video_answer(array $video,string $question): string
{
    $content=trim(preg_replace('/\s+/u',' ',(string)$video['content'])?:'');
    if($content==='')return '';
    $sentences=preg_split('/(?<=[.!?])\s+/u',$content,-1,PREG_SPLIT_NO_EMPTY)?:[$content];
    $sentences=array_values(array_filter(array_map('trim',$sentences),static function(string $sentence):bool{
        $normalized=assistant_normalize($sentence);
        if(mb_strlen($sentence)<18)return false;
        return !preg_match('/^(preparados|entao vamos la|vamos iniciar o treinamento|hoje vamos conhecer)/',$normalized);
    }));
    if(!$sentences)return '';
    $normalizedQuestion=assistant_normalize($question);
    $titleCase=mb_convert_case(mb_strtolower((string)$video['title'],'UTF-8'),MB_CASE_TITLE,'UTF-8');
    $subject=preg_match('/^função\b/iu',$titleCase)?'A '.$titleCase:$titleCase;
    $safety=preg_match('/\b(agora|dirigindo|conduzindo|em movimento)\b/',$normalizedQuestion)?'Se o veículo estiver em movimento, consulte ou opere o sistema somente depois de parar em segurança.'."\n\n":'';
    $purposeIntent=(bool)preg_match('/\b(para que serve|pra que serve|qual finalidade|qual objetivo|quando usar|o que faz)\b/',$normalizedQuestion);
    $activationIntent=(bool)preg_match('/\b(como ativar|como acionar|como ligar|ativacao|acionar|habilitar)\b/',$normalizedQuestion);
    $deactivationIntent=(bool)preg_match('/\b(como desativar|como desligar|cancelar|apagar a velocidade|desativacao)\b/',$normalizedQuestion);

    if($purposeIntent){
        $best='';$bestScore=-1;
        foreach($sentences as $sentence){
            $normalized=assistant_normalize($sentence);
            $score=assistant_score($sentence,assistant_terms($normalizedQuestion));
            if(preg_match('/\b(utilizad|serve|finalidade|objetivo|indicad)\w*/',$normalized))$score+=50;
            elseif(preg_match('/\b(mantem|manter|descida|percurso descendente)\w*/',$normalized))$score+=20;
            if(preg_match('/\b(ativar|desativar|primeiro|depois|em seguida)\b/',$normalized))$score-=8;
            if($score>$bestScore){$bestScore=$score;$best=$sentence;}
        }
        $best=preg_replace('/^(Ela|Ele|Essa função|Esta função)\b/u',$subject,$best)?:$best;
        return $safety."Direto ao ponto: {$best}";
    }

    if($activationIntent){
        $steps=[];$collect=false;
        foreach($sentences as $sentence){
            $normalized=assistant_normalize($sentence);
            if(str_contains($normalized,'para desativar'))break;
            if(str_contains($normalized,'para ativar')){$collect=true;continue;}
            if($collect)$steps[]=$sentence;
            if(count($steps)>=6)break;
        }
        if($steps){
            $numbered=[];foreach($steps as $index=>$step)$numbered[]=($index+1).'. '.$step;
            return $safety."Segundo o treinamento “{$video['title']}”, faça assim:\n\n".implode("\n",$numbered);
        }
    }

    if($deactivationIntent){
        $selected=[];
        foreach($sentences as $index=>$sentence)if(str_contains(assistant_normalize($sentence),'para desativar')){$selected[]=$sentence;if(isset($sentences[$index+1]))$selected[]=$sentences[$index+1];break;}
        if($selected)return $safety.implode(' ',$selected);
    }

    $terms=assistant_terms($normalizedQuestion);$bestIndex=0;$bestScore=-1;
    foreach($sentences as $index=>$sentence){$score=assistant_score($sentence,$terms);if($score>$bestScore){$bestScore=$score;$bestIndex=$index;}}
    $window=array_slice($sentences,max(0,$bestIndex-1),3);
    return $safety.implode(' ',$window);
}

function assistant_local_answer(string $question,array $context,?array $action): array
{
    if($context['analytics']??null)return ['answer'=>$context['analytics']['answer'],'input_tokens'=>0,'output_tokens'=>0,'model'=>'local-rules','sources'=>['videos'=>[],'modelos'=>[],'analises'=>[['titulo'=>$context['analytics']['title']]]]];
    if($action&&($action['models']??[])){
        $lines=[];
        foreach($action['models'] as $model){
            $specs=array_filter([
                $model['power']?'potência '.$model['power']:null,
                $model['torque']?'torque '.$model['torque']:null,
                $model['pbt']?'PBT '.$model['pbt']:null,
                $model['wheelbase']?'entre-eixos '.$model['wheelbase']:null,
            ]);
            $lines[]=$model['name'].($specs?' — '.implode(', ',$specs):'');
        }
        return ['answer'=>"Encontrei ".count($lines)." veículos compatíveis no catálogo:\n\n• ".implode("\n• ",$lines)."\n\nUse o botão abaixo para abrir os filtros e comparar as especificações completas.",'input_tokens'=>0,'output_tokens'=>0,'model'=>'local-rules','sources'=>['videos'=>[],'modelos'=>array_map(static fn(array $model):array=>['id'=>$model['id'],'nome'=>$model['name'],'marca'=>''],$action['models']),'analises'=>[]]];
    }
    $evidence=$context['evidence']??[];
    usort($evidence,static fn(array $a,array $b):int=>($b['score']??0)<=>($a['score']??0));
    $videoEvidence=array_values(array_filter($evidence,static fn(array $item):bool=>$item['type']==='video'));
    $modelEvidence=array_values(array_filter($evidence,static fn(array $item):bool=>$item['type']==='modelo'));
    $video=$videoEvidence[0]??null;$model=$modelEvidence[0]??null;
    $questionNormalized=assistant_normalize($question);
    $preferVideo=(bool)preg_match('/\b(video|treinamento|funcao|botao|painel|como usar|como funciona)\b/',$questionNormalized);
    if($video&&($preferVideo||!$model||($video['score']??0)>=($model['score']??0))){
        $excerpt=assistant_local_video_answer($video,$question);
        if($excerpt!=='')return ['answer'=>"Com base no treinamento “{$video['title']}”:\n\n{$excerpt}\n\nPara ver a demonstração completa, abra o vídeo indicado nas fontes.",'input_tokens'=>0,'output_tokens'=>0,'model'=>'local-rules-v3','sources'=>['videos'=>[['id'=>$video['id'],'titulo'=>$video['title']]],'modelos'=>[],'analises'=>[]]];
    }
    if($model){
        $data=json_decode((string)$model['content'],true)?:[];
        $items=array_filter([
            'Motor: '.($data['motor']??''),
            'Potência: '.($data['potencia']??''),
            'Torque: '.($data['torque']??''),
            'Transmissão: '.($data['transmissao']??''),
            'PBT: '.($data['pbt']??''),
            'PBTC: '.($data['pbtc']??''),
            'Entre-eixos: '.($data['entre_eixos']??''),
            'Relação de redução: '.($data['relacao_reducao']??''),
        ],static fn(string $item):bool=>!str_ends_with($item,': '));
        return ['answer'=>"Dados cadastrados para {$model['title']}:\n\n• ".implode("\n• ",$items)."\n\nEssas informações foram consultadas diretamente no Catálogo Técnico.",'input_tokens'=>0,'output_tokens'=>0,'model'=>'local-rules','sources'=>['videos'=>[],'modelos'=>[['id'=>$model['id'],'nome'=>$data['nome']??$model['title'],'marca'=>$data['marca_nome']??'']],'analises'=>[]]];
    }
    return ['answer'=>'Localizei conteúdo relacionado, mas não há texto suficiente para montar uma resposta segura. Cadastre ou revise a transcrição do vídeo e tente novamente.','input_tokens'=>0,'output_tokens'=>0,'model'=>'local-rules','sources'=>['videos'=>[],'modelos'=>[],'analises'=>[]]];
}

function assistant_transcribe(array $file,array $config): string
{
    if($config['key']==='')throw new RuntimeException('A chave da OpenAI ainda não foi configurada.');
    if(!function_exists('curl_init'))throw new RuntimeException('A extensão cURL do PHP não está habilitada.');
    $error=(int)($file['error']??UPLOAD_ERR_NO_FILE);
    if($error!==UPLOAD_ERR_OK)throw new RuntimeException('Não foi possível receber o áudio.');
    if((int)($file['size']??0)>5*1024*1024)throw new RuntimeException('O áudio deve ter no máximo 5 MB.');
    $mime=(new finfo(FILEINFO_MIME_TYPE))->file((string)$file['tmp_name'])?:'audio/webm';
    $allowed=['audio/webm','video/webm','audio/ogg','audio/wav','audio/x-wav','audio/mpeg','audio/mp4','video/mp4'];
    if(!in_array($mime,$allowed,true))throw new RuntimeException('Formato de áudio não suportado.');
    $post=['model'=>$config['transcribe_model'],'language'=>'pt','file'=>new CURLFile((string)$file['tmp_name'],$mime,(string)($file['name']??'pergunta.webm'))];
    $curl=curl_init('https://api.openai.com/v1/audio/transcriptions');
    curl_setopt_array($curl,[CURLOPT_POST=>true,CURLOPT_POSTFIELDS=>$post,CURLOPT_HTTPHEADER=>['Authorization: Bearer '.$config['key']],CURLOPT_RETURNTRANSFER=>true,CURLOPT_TIMEOUT=>$config['timeout']]);
    $raw=curl_exec($curl);$status=(int)curl_getinfo($curl,CURLINFO_RESPONSE_CODE);$errorMessage=curl_error($curl);curl_close($curl);
    if($raw===false||$status<200||$status>=300)throw new RuntimeException('Não foi possível transcrever o áudio'.($errorMessage!==''?': '.$errorMessage:'.'));
    $data=json_decode($raw,true);$text=trim((string)($data['text']??''));
    if($text==='')throw new RuntimeException('Não consegui compreender o áudio. Tente falar novamente.');
    return $text;
}

function assistant_generate(string $question,array $context,array $config): array
{
    if($config['key']==='')throw new RuntimeException('A chave da OpenAI ainda não foi configurada.');
    if(!function_exists('curl_init'))throw new RuntimeException('A extensão cURL do PHP não está habilitada.');
    $name=trim((string)(user()['nome']??'Motorista'));
    $instructions="Você é o assistente técnico do Drive Learn. Responda em português do Brasil, de forma clara, curta e adequada para leitura em voz alta. Chame o usuário pelo primeiro nome apenas quando soar natural. Use somente o contexto fornecido. Nunca invente comandos, posições de botões, alertas do painel ou procedimentos. Se o contexto não for suficiente ou houver risco operacional, diga isso e recomende abrir o treinamento ou procurar a assistência técnica. Diferencie veículos, marcas, famílias e versões. Não dê instruções que incentivem interação com a tela durante a condução.";
    $input="Usuário: {$name}\nPergunta: {$question}\n\nCONTEXTO APROVADO:\n".($context['text']!==''?$context['text']:'Nenhum conteúdo compatível foi localizado.');
    $payload=['model'=>$config['text_model'],'instructions'=>$instructions,'input'=>$input,'max_output_tokens'=>$config['max_output_tokens']];
    $curl=curl_init('https://api.openai.com/v1/responses');
    curl_setopt_array($curl,[CURLOPT_POST=>true,CURLOPT_POSTFIELDS=>json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),CURLOPT_HTTPHEADER=>['Authorization: Bearer '.$config['key'],'Content-Type: application/json'],CURLOPT_RETURNTRANSFER=>true,CURLOPT_TIMEOUT=>$config['timeout']]);
    $raw=curl_exec($curl);$status=(int)curl_getinfo($curl,CURLINFO_RESPONSE_CODE);$errorMessage=curl_error($curl);curl_close($curl);
    if($raw===false||$status<200||$status>=300)throw new RuntimeException('O assistente não conseguiu gerar a resposta'.($errorMessage!==''?': '.$errorMessage:'.'));
    $data=json_decode($raw,true);$answer=trim((string)($data['output_text']??''));
    if($answer==='')foreach($data['output']??[] as $item)foreach($item['content']??[] as $content)if(($content['type']??'')==='output_text')$answer.=($answer!==''?"\n":'').trim((string)($content['text']??''));
    if($answer==='')throw new RuntimeException('A OpenAI retornou uma resposta vazia.');
    return ['answer'=>$answer,'input_tokens'=>(int)($data['usage']['input_tokens']??0),'output_tokens'=>(int)($data['usage']['output_tokens']??0),'model'=>(string)($data['model']??$config['text_model'])];
}

function assistant_log(PDO $pdo,array $values): int
{
    $arguments=[$values['user_id'],$values['company_id'],$values['response_id']??null,$values['question'],$values['normalized'],$values['answer']??null,$values['input_type'],$values['interaction_type']??'consulta',$values['origin'],$values['input_tokens']??0,$values['output_tokens']??0,$values['audio_seconds']??0,$values['cost']??0,$values['latency']??0,$values['status'],$values['error']??null,isset($values['action'])&&$values['action']?json_encode($values['action'],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES):null];
    try{
        $stmt=$pdo->prepare('INSERT INTO assistente_interacoes(usuario_id,empresa_id,resposta_id,pergunta,pergunta_normalizada,resposta,entrada,tipo_interacao,origem_resposta,tokens_entrada,tokens_saida,audio_segundos,custo_estimado_usd,latencia_ms,status,erro,acao_json) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
        $stmt->execute($arguments);
    }catch(PDOException $e){
        if(!str_contains($e->getMessage(),'tipo_interacao'))throw $e;
        array_splice($arguments,7,1);
        $stmt=$pdo->prepare('INSERT INTO assistente_interacoes(usuario_id,empresa_id,resposta_id,pergunta,pergunta_normalizada,resposta,entrada,origem_resposta,tokens_entrada,tokens_saida,audio_segundos,custo_estimado_usd,latencia_ms,status,erro,acao_json) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
        $stmt->execute($arguments);
    }
    return (int)$pdo->lastInsertId();
}

function assistant_daily_usage(PDO $pdo,int $userId): int
{
    try{$stmt=$pdo->prepare("SELECT COUNT(*) FROM assistente_interacoes WHERE usuario_id=? AND tipo_interacao='consulta' AND criado_em>=CURDATE()");$stmt->execute([$userId]);return (int)$stmt->fetchColumn();}
    catch(Throwable){$stmt=$pdo->prepare('SELECT COUNT(*) FROM assistente_interacoes WHERE usuario_id=? AND criado_em>=CURDATE()');$stmt->execute([$userId]);return (int)$stmt->fetchColumn();}
}

function assistant_save_evidence(PDO $pdo,int $interactionId,array $context): void
{
    if($interactionId<=0)return;
    $stmt=$pdo->prepare('INSERT INTO assistente_interacao_fontes(interacao_id,tipo,video_id,modelo_id,titulo,transcricao_snapshot,conteudo_snapshot,fonte_atualizada_em) VALUES(?,?,?,?,?,?,?,?)');
    foreach($context['evidence']??[] as $item){
        $type=in_array($item['type'],['video','modelo','frota'],true)?$item['type']:'modelo';
        $stmt->execute([$interactionId,$type,$type==='video'?(int)$item['id']:null,$type==='modelo'?(int)$item['id']:null,$item['title'],$item['transcript']?:null,$item['content']?:null,$item['updated_at']?:null]);
    }
}

function assistant_similar_validated_response(PDO $pdo,string $normalized): array|false
{
    $stmt=$pdo->query('SELECT * FROM assistente_respostas WHERE reutilizavel=1 AND validada=1 ORDER BY atualizada_em DESC LIMIT 80');
    $best=false;$bestScore=0.0;
    foreach($stmt->fetchAll() as $candidate){
        similar_text($normalized,(string)$candidate['pergunta_normalizada'],$score);
        if($score>$bestScore){$bestScore=$score;$best=$candidate;}
    }
    return $bestScore>=88.0?$best:false;
}

function handle_assistant_event(string $route,string $method): void
{
    if($route!=='assistente-evento')return;
    if($method!=='POST')assistant_json(['ok'=>false,'message'=>'Método não permitido.'],405);
    $started=microtime(true);$question='';$normalized='';$inputType='texto';$audioSeconds=max(0,min(60,(int)($_POST['audio_segundos']??0)));$browserTranscript=false;$assistantAction=trim((string)($_POST['assistant_action']??''));
    try{
        verify_csrf();
        if(!can('library','view')&&!can('service_desk','view'))throw new RuntimeException('Você não possui acesso ao assistente.');
        $pdo=db();if(!$pdo||!database_ready())throw new RuntimeException('Banco de dados indisponível.');
        $config=assistant_config();$userId=(int)(user()['id']??0);$companyId=active_company_id();
        $used=assistant_daily_usage($pdo,$userId);$hadServiceFlow=isset($_SESSION['service_desk_flow']);
        if(isset($_FILES['audio'])&&(int)($_FILES['audio']['error']??UPLOAD_ERR_NO_FILE)!==UPLOAD_ERR_NO_FILE){$inputType='voz';$question=assistant_transcribe($_FILES['audio'],$config);}
        else{$question=trim((string)($_POST['pergunta']??''));if(($_POST['entrada']??'')==='voz'){$inputType='voz';$browserTranscript=($_POST['transcricao_local']??'')==='1';}}
        if(function_exists('service_desk_assistant_flow')){
            $flowResponse=service_desk_assistant_flow($pdo,$question,$inputType,$audioSeconds,$assistantAction);
            $isServiceDeskRequest=$hadServiceFlow||isset($_SESSION['service_desk_flow'])||$assistantAction==='start_report'||str_starts_with($assistantAction,'report_');
            if(!$flowResponse&&$isServiceDeskRequest){
                $flowResponse=function_exists('service_desk_resume_flow')?service_desk_resume_flow($pdo):null;
                if(!$flowResponse){
                    unset($_SESSION['service_desk_flow']);
                    $flowResponse=['answer'=>'O atendimento anterior perdeu a etapa atual. Vamos reiniciar o relato para manter os dados corretos.','options'=>[
                        ['action'=>'start_report','label'=>'Iniciar relato novamente','icon'=>'bi-arrow-clockwise'],
                    ]];
                }
            }
            if($flowResponse){
                $normalized=assistant_normalize($question!==''?$question:$assistantAction);
                $flowType=$hadServiceFlow||str_starts_with($assistantAction,'report_')||$assistantAction==='start_report'?'service_desk':'controle';
                $interactionId=assistant_log($pdo,['user_id'=>$userId,'company_id'=>$companyId,'question'=>$question!==''?$question:$assistantAction,'normalized'=>$normalized,'answer'=>$flowResponse['answer'],'input_type'=>$inputType,'interaction_type'=>$flowType,'origin'=>'local','audio_seconds'=>$audioSeconds,'latency'=>(int)round((microtime(true)-$started)*1000),'status'=>'sucesso','action'=>$flowResponse['action']??null]);
                $_SESSION['assistant_last_interaction_id']=$interactionId;
                if($flowResponse['ask_close']??false)$_SESSION['assistant_awaiting_close']=true;
                assistant_json(array_merge(['ok'=>true,'question'=>$question,'cached'=>false,'local'=>true,'remaining'=>max(0,$config['daily_limit']-$used-1),'sources'=>[]],$flowResponse));
            }
        }
        if(!can('library','view'))throw new RuntimeException('Seu perfil permite registrar relatos, mas não consultar treinamentos.');
        if($used>=$config['daily_limit'])throw new RuntimeException("Você atingiu o limite diário de {$config['daily_limit']} consultas. O registro de relatos no Service Desk continua disponível.");
        if(mb_strlen($question)<4||mb_strlen($question)>1000)throw new RuntimeException('Faça uma pergunta entre 4 e 1.000 caracteres.');
        $normalized=assistant_normalize($question);$context=assistant_context($pdo,$question);$action=$context['analytics']['action']??assistant_catalog_action($pdo,$question);
        $questionHash=hash('sha256',$normalized);$contextHash=hash('sha256',$normalized.'|'.($companyId??0).'|'.$config['mode'].'|'.$config['local_version'].'|'.$context['signature']);
        $cachedStmt=$pdo->prepare('SELECT * FROM assistente_respostas WHERE contexto_hash=? AND reutilizavel=1 LIMIT 1');$cachedStmt->execute([$contextHash]);$cached=$cachedStmt->fetch();
        if(!$cached)$cached=assistant_similar_validated_response($pdo,$normalized);
        if($cached){
            $pdo->prepare('UPDATE assistente_respostas SET usos=usos+1 WHERE id=?')->execute([(int)$cached['id']]);
            $cost=$inputType==='voz'&&!$browserTranscript?0.017*($audioSeconds/60):0;
            $interactionId=assistant_log($pdo,['user_id'=>$userId,'company_id'=>$companyId,'response_id'=>(int)$cached['id'],'question'=>$question,'normalized'=>$normalized,'answer'=>$cached['resposta'],'input_type'=>$inputType,'origin'=>'cache','audio_seconds'=>$audioSeconds,'cost'=>$cost,'latency'=>(int)round((microtime(true)-$started)*1000),'status'=>'sucesso','action'=>$action]);
            $_SESSION['assistant_last_interaction_id']=$interactionId;
            $_SESSION['assistant_awaiting_close']=true;
            assistant_save_evidence($pdo,$interactionId,$context);
            assistant_json(['ok'=>true,'question'=>$question,'answer'=>$cached['resposta'],'cached'=>true,'remaining'=>max(0,$config['daily_limit']-$used-1),'sources'=>json_decode((string)$cached['fontes'],true)?:[],'action'=>$action,'ask_close'=>true]);
        }
        if($context['text']==='')throw new RuntimeException('Ainda não encontrei um treinamento ou dado técnico compatível com essa dúvida. Procure a assistência técnica ou tente informar a marca e o modelo.');
        $useLocal=$config['mode']==='local'||($config['mode']==='hybrid'&&(($context['analytics']??null)!==null||$action!==null||$config['key']===''));
        $generated=$useLocal?assistant_local_answer($question,$context,$action):assistant_generate($question,$context,$config);
        $responseSources=$generated['sources']??$context['sources'];
        $textCost=$useLocal?0:(($generated['input_tokens']/1000000)*1.00+($generated['output_tokens']/1000000)*6.00);
        $audioCost=$inputType==='voz'&&!$browserTranscript?0.017*($audioSeconds/60):0;$cost=$textCost+$audioCost;
        $save=$pdo->prepare('INSERT INTO assistente_respostas(contexto_hash,pergunta_hash,pergunta_base,pergunta_normalizada,resposta,fontes,modelo_api,validada,reutilizavel,usos,criada_por) VALUES(?,?,?,?,?,?,?,0,1,1,?)');
        $save->execute([$contextHash,$questionHash,$question,$normalized,$generated['answer'],json_encode($responseSources,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),$generated['model'],$userId]);$responseId=(int)$pdo->lastInsertId();
        $interactionId=assistant_log($pdo,['user_id'=>$userId,'company_id'=>$companyId,'response_id'=>$responseId,'question'=>$question,'normalized'=>$normalized,'answer'=>$generated['answer'],'input_type'=>$inputType,'origin'=>$useLocal?'local':'ia','input_tokens'=>$generated['input_tokens'],'output_tokens'=>$generated['output_tokens'],'audio_seconds'=>$audioSeconds,'cost'=>$cost,'latency'=>(int)round((microtime(true)-$started)*1000),'status'=>'sucesso','action'=>$action]);
        $_SESSION['assistant_last_interaction_id']=$interactionId;
        $_SESSION['assistant_awaiting_close']=true;
        assistant_save_evidence($pdo,$interactionId,$context);
        assistant_json(['ok'=>true,'question'=>$question,'answer'=>$generated['answer'],'cached'=>false,'local'=>$useLocal,'remaining'=>max(0,$config['daily_limit']-$used-1),'sources'=>$responseSources,'action'=>$action,'ask_close'=>true]);
    }catch(Throwable $e){
        if(isset($pdo)&&$pdo instanceof PDO&&$question!==''){
            try{assistant_log($pdo,['user_id'=>(int)(user()['id']??0),'company_id'=>active_company_id(),'question'=>$question,'normalized'=>$normalized?:assistant_normalize($question),'input_type'=>$inputType,'origin'=>'indisponivel','audio_seconds'=>$audioSeconds,'latency'=>(int)round((microtime(true)-$started)*1000),'status'=>'erro','error'=>mb_substr($e->getMessage(),0,500)]);}catch(Throwable){}
        }
        assistant_json(['ok'=>false,'message'=>$e->getMessage()],422);
    }
}
