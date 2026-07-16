<?php
declare(strict_types=1);

function library_video_access_sql(array &$params, string $alias = 'v'): string
{
    if ((user()['active_company_type'] ?? '') !== 'cliente') return '1=1';
    $companyId = active_company_id();
    if (!$companyId) return '1=0';
    $params[]=$companyId;$params[]=$companyId;
    return "(NOT EXISTS(SELECT 1 FROM video_modelos vm0 WHERE vm0.video_id={$alias}.id) AND NOT EXISTS(SELECT 1 FROM video_familias vf0 WHERE vf0.video_id={$alias}.id) OR EXISTS(SELECT 1 FROM video_modelos vm JOIN frotas fr ON fr.modelo_id=vm.modelo_id JOIN clientes cl ON cl.id=fr.cliente_id WHERE vm.video_id={$alias}.id AND cl.empresa_id=?) OR EXISTS(SELECT 1 FROM video_familias vf JOIN modelos mo ON mo.familia_id=vf.familia_id JOIN frotas fr ON fr.modelo_id=mo.id JOIN clientes cl ON cl.id=fr.cliente_id WHERE vf.video_id={$alias}.id AND cl.empresa_id=?))";
}

function library_find_video(PDO $pdo, int $videoId): ?array
{
    $params=[];$access=library_video_access_sql($params);
    $stmt=$pdo->prepare("SELECT v.* FROM videos v WHERE v.id=? AND v.status='publicado' AND {$access}");
    $stmt->execute(array_merge([$videoId],$params));
    return $stmt->fetch()?:null;
}

function library_json(array $payload, int $status = 200): never
{
    http_response_code($status);header('Content-Type: application/json; charset=utf-8');echo json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);exit;
}

function handle_library_event(string $route, string $method): void
{
    if ($route !== 'biblioteca-evento') return;
    if ($method !== 'POST') library_json(['ok'=>false,'message'=>'Método não permitido.'],405);
    try {
        verify_csrf();
        if(!can('library','view'))throw new RuntimeException('Você não possui acesso à biblioteca.');
        $pdo=db();if(!$pdo)throw new RuntimeException('Banco de dados indisponível.');
        $action=(string)($_POST['action']??'');$videoId=(int)($_POST['video_id']??0);$video=library_find_video($pdo,$videoId);
        if(!$video)throw new RuntimeException('Vídeo não encontrado ou indisponível para sua frota.');
        if($action==='start'){
            $agent=substr((string)($_SERVER['HTTP_USER_AGENT']??'Não informado'),0,255);$ip=(string)($_SERVER['REMOTE_ADDR']??'');$ipHash=$ip!==''?hash('sha256',$ip.'|drive-learn-vw'):null;
            $pdo->prepare('INSERT INTO video_visualizacoes(video_id,usuario_id,iniciado_em,progresso_segundos,percentual,ip_hash,dispositivo) VALUES(?,?,NOW(),0,0,?,?)')->execute([$videoId,(int)user()['id'],$ipHash,$agent]);
            $newViewId=(int)$pdo->lastInsertId();$previous=$pdo->prepare('SELECT vu.id,fb.nota,fb.comentario,fb.melhorias FROM video_visualizacoes vu LEFT JOIN feedbacks fb ON fb.visualizacao_id=vu.id WHERE vu.video_id=? AND vu.usuario_id=? AND vu.concluido_em IS NOT NULL AND vu.id<>? ORDER BY vu.concluido_em DESC LIMIT 1');$previous->execute([$videoId,(int)user()['id'],$newViewId]);$completed=$previous->fetch();
            library_json(['ok'=>true,'visualizacao_id'=>$newViewId,'completed_before'=>(bool)$completed,'feedback_visualizacao_id'=>$completed?(int)$completed['id']:null,'feedback'=>$completed?['nota'=>(int)($completed['nota']??0),'comentario'=>$completed['comentario']??'','melhorias'=>$completed['melhorias']??'']:null]);
        }
        $viewId=(int)($_POST['visualizacao_id']??0);$find=$pdo->prepare('SELECT * FROM video_visualizacoes WHERE id=? AND video_id=? AND usuario_id=?');$find->execute([$viewId,$videoId,(int)user()['id']]);$view=$find->fetch();
        if(!$view)throw new RuntimeException('Sessão de visualização inválida.');
        if($action==='progress'){
            $seconds=max(0,(int)($_POST['segundos']??0));$percent=max(0,min(100,(float)($_POST['percentual']??0)));$completed=$percent>=90||isset($_POST['concluido']);
            $pdo->prepare('UPDATE video_visualizacoes SET progresso_segundos=GREATEST(progresso_segundos,?),percentual=GREATEST(percentual,?),concluido_em=CASE WHEN ?=1 THEN COALESCE(concluido_em,NOW()) ELSE concluido_em END WHERE id=?')->execute([$seconds,$percent,$completed?1:0,$viewId]);
            library_json(['ok'=>true,'completed'=>$completed]);
        }
        if($action==='feedback'){
            if(!can('feedback','create'))throw new RuntimeException('Seu perfil não permite enviar avaliações.');
            $nota=(int)($_POST['nota']??0);if($nota<1||$nota>5)throw new RuntimeException('Selecione uma nota de 1 a 5 estrelas.');
            $check=$pdo->prepare('SELECT concluido_em,percentual FROM video_visualizacoes WHERE id=?');$check->execute([$viewId]);$progress=$check->fetch();if(!$progress||(!$progress['concluido_em']&&(float)$progress['percentual']<90))throw new RuntimeException('Conclua o vídeo antes de enviar a avaliação.');
            $comment=trim((string)($_POST['comentario']??''));$improvements=trim((string)($_POST['melhorias']??''));if(mb_strlen($comment)>2000||mb_strlen($improvements)>2000)throw new RuntimeException('Comentários e melhorias devem ter no máximo 2.000 caracteres.');
            $pdo->prepare('INSERT INTO feedbacks(visualizacao_id,nota,comentario,melhorias) VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE nota=VALUES(nota),comentario=VALUES(comentario),melhorias=VALUES(melhorias)')->execute([$viewId,$nota,$comment?:null,$improvements?:null]);
            library_json(['ok'=>true,'message'=>'Avaliação registrada. Obrigado pelo feedback!']);
        }
        throw new RuntimeException('Ação inválida.');
    }catch(Throwable $e){library_json(['ok'=>false,'message'=>$e->getMessage()],422);}
}

function load_library_page(): array
{
    $pdo=db();if(!$pdo)return [];$q=trim((string)($_GET['q']??''));$categoryId=(int)($_GET['categoria']??0);$familyId=(int)($_GET['familia']??0);$modelId=(int)($_GET['modelo']??0);$params=[];$where=["v.status='publicado'",library_video_access_sql($params)];
    $userId=(int)(user()['id']??0);$paramsWithUser=array_merge([$userId,$userId,$userId,$userId],$params);
    $sql='SELECT v.*,c.nome categoria_nome,c.icone categoria_icone,s.nome subcategoria_nome,(SELECT GROUP_CONCAT(DISTINCT fa.nome ORDER BY fa.nome SEPARATOR ", ") FROM video_familias vf JOIN familias fa ON fa.id=vf.familia_id WHERE vf.video_id=v.id) familias_nomes,(SELECT GROUP_CONCAT(DISTINCT mo.nome ORDER BY mo.nome SEPARATOR ", ") FROM video_modelos vm JOIN modelos mo ON mo.id=vm.modelo_id WHERE vm.video_id=v.id) modelos_nomes,(SELECT GROUP_CONCAT(DISTINCT vf.familia_id) FROM video_familias vf WHERE vf.video_id=v.id) familia_ids,(SELECT GROUP_CONCAT(DISTINCT vm.modelo_id) FROM video_modelos vm WHERE vm.video_id=v.id) modelo_ids,(SELECT MAX(vu.percentual) FROM video_visualizacoes vu WHERE vu.video_id=v.id AND vu.usuario_id=?) progresso,(SELECT MAX(vu.concluido_em IS NOT NULL) FROM video_visualizacoes vu WHERE vu.video_id=v.id AND vu.usuario_id=?) concluido,(SELECT vu.id FROM video_visualizacoes vu WHERE vu.video_id=v.id AND vu.usuario_id=? ORDER BY (vu.concluido_em IS NOT NULL) DESC,vu.iniciado_em DESC LIMIT 1) visualizacao_anterior_id,(SELECT fb.nota FROM feedbacks fb JOIN video_visualizacoes vu ON vu.id=fb.visualizacao_id WHERE vu.video_id=v.id AND vu.usuario_id=? ORDER BY fb.criado_em DESC LIMIT 1) minha_nota,(SELECT ROUND(AVG(fb.nota),1) FROM feedbacks fb JOIN video_visualizacoes vu ON vu.id=fb.visualizacao_id WHERE vu.video_id=v.id) nota_media,(SELECT COUNT(*) FROM video_visualizacoes vu WHERE vu.video_id=v.id) visualizacoes FROM videos v JOIN categorias c ON c.id=v.categoria_id LEFT JOIN subcategorias s ON s.id=v.subcategoria_id WHERE '.implode(' AND ',$where).' ORDER BY concluido ASC,v.publicado_em DESC,v.criado_em DESC';
    $stmt=$pdo->prepare($sql);$stmt->execute($paramsWithUser);$videos=$stmt->fetchAll();
    foreach($videos as &$video){$video['youtube_id']=$video['tipo']==='youtube'?youtube_video_id($video['arquivo_url']):null;$video['play_url']=$video['tipo']==='upload'?url($video['arquivo_url']):$video['arquivo_url'];if(!$video['thumbnail']&&$video['youtube_id'])$video['thumbnail']='https://img.youtube.com/vi/'.$video['youtube_id'].'/hqdefault.jpg';elseif($video['thumbnail']&&!preg_match('~^https?://~i',$video['thumbnail']))$video['thumbnail']=url($video['thumbnail']);}unset($video);
    $categoryParams=[];$categoryAccess=library_video_access_sql($categoryParams,'vc');
    $categoryStmt=$pdo->prepare("SELECT c.id,c.nome,c.icone,COUNT(DISTINCT vc.id) videos FROM categorias c JOIN videos vc ON vc.categoria_id=c.id AND vc.status='publicado' WHERE c.ativo=1 AND {$categoryAccess} GROUP BY c.id,c.nome,c.icone,c.ordem HAVING COUNT(DISTINCT vc.id)>0 ORDER BY c.ordem,c.nome");
    $categoryStmt->execute($categoryParams);$categories=$categoryStmt->fetchAll();
    $familyParams=[];$familyAccess=library_video_access_sql($familyParams,'vo');$familyStmt=$pdo->prepare("SELECT fa.id,fa.nome FROM familias fa WHERE fa.ativo=1 AND EXISTS(SELECT 1 FROM videos vo WHERE vo.status='publicado' AND {$familyAccess} AND (EXISTS(SELECT 1 FROM video_familias vf WHERE vf.video_id=vo.id AND vf.familia_id=fa.id) OR EXISTS(SELECT 1 FROM video_modelos vm JOIN modelos mx ON mx.id=vm.modelo_id WHERE vm.video_id=vo.id AND mx.familia_id=fa.id))) ORDER BY fa.nome");$familyStmt->execute($familyParams);$families=$familyStmt->fetchAll();
    $modelParams=[];$modelAccess=library_video_access_sql($modelParams,'vo');$clientModelSql='';if((user()['active_company_type']??'')==='cliente'){$clientModelSql=' AND EXISTS(SELECT 1 FROM frotas fr JOIN clientes cl ON cl.id=fr.cliente_id WHERE fr.modelo_id=mo.id AND cl.empresa_id=?)';$modelParams[]=active_company_id();}
    $modelStmt=$pdo->prepare("SELECT mo.id,mo.familia_id,mo.nome FROM modelos mo WHERE mo.ativo=1{$clientModelSql} AND EXISTS(SELECT 1 FROM videos vo WHERE vo.status='publicado' AND {$modelAccess} AND (EXISTS(SELECT 1 FROM video_modelos vm WHERE vm.video_id=vo.id AND vm.modelo_id=mo.id) OR EXISTS(SELECT 1 FROM video_familias vf WHERE vf.video_id=vo.id AND vf.familia_id=mo.familia_id))) ORDER BY mo.nome");$modelStmt->execute($modelParams);$models=$modelStmt->fetchAll();
    $featured=$videos[0]??null;$grouped=[];foreach($videos as $video)$grouped[$video['categoria_nome']][]=$video;
    return compact('videos','categories','families','models','featured','grouped','q','categoryId','familyId','modelId');
}
