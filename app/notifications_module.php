<?php
declare(strict_types=1);

function notification_item(string $key, string $title, string $description, string $route, string $icon, string $tone = 'info'): array
{
    return compact('key','title','description','route','icon','tone');
}

function load_header_notifications(): array
{
    $pdo = db(); $current = user();
    if (!$pdo || !$current || !database_ready()) return ['items'=>[],'unread'=>0];
    $items = [];

    try {
        if (($current['active_company_type'] ?? '') === 'cliente') {
            $companyId = active_company_id() ?? 0;
            $fleet = $pdo->prepare('SELECT COALESCE(SUM(f.quantidade),0) FROM frotas f JOIN clientes c ON c.id=f.cliente_id WHERE c.empresa_id=?');
            $fleet->execute([$companyId]);
            if ((int)$fleet->fetchColumn() === 0) {
                $items[] = notification_item('client_fleet_empty','Sua frota ainda está vazia','Cadastre os veículos para liberar treinamentos compatíveis.','frota','bi-truck','warning');
            }

            $accessParams=[]; $accessSql=function_exists('library_video_access_sql')?library_video_access_sql($accessParams,'v'):'1=1';
            $sql="SELECT COUNT(*) FROM videos v WHERE v.status='publicado' AND {$accessSql} AND NOT EXISTS(SELECT 1 FROM video_visualizacoes vv WHERE vv.video_id=v.id AND vv.usuario_id=?)";
            $accessParams[]=(int)$current['id']; $stmt=$pdo->prepare($sql); $stmt->execute($accessParams); $newVideos=(int)$stmt->fetchColumn();
            if ($newVideos > 0) $items[] = notification_item('client_new_training_'.$newVideos,"{$newVideos} treinamento(s) para conhecer",'Conteúdos publicados e ainda não iniciados por você.','biblioteca','bi-play-circle','info');

            $continue=$pdo->prepare('SELECT COUNT(DISTINCT video_id) FROM video_visualizacoes WHERE usuario_id=? AND percentual>0 AND percentual<90 AND concluido_em IS NULL');
            $continue->execute([(int)$current['id']]); $pending=(int)$continue->fetchColumn();
            if($pending>0)$items[]=notification_item('client_continue_'.$pending,"{$pending} treinamento(s) em andamento",'Continue do ponto em que você parou.','biblioteca','bi-clock-history','info');
        } else {
            if (can('videos','view')) {
                $drafts=(int)$pdo->query("SELECT COUNT(*) FROM videos WHERE status='rascunho'")->fetchColumn();
                if($drafts>0)$items[]=notification_item('draft_videos_'.$drafts,"{$drafts} vídeo(s) em rascunho",'Revise e publique os conteúdos que estiverem prontos.','videos','bi-camera-video','warning');
            }
            if (can('models','view')) {
                $withoutImage=(int)$pdo->query("SELECT COUNT(*) FROM modelos WHERE ativo=1 AND (imagem IS NULL OR imagem='')")->fetchColumn();
                if($withoutImage>0)$items[]=notification_item('models_without_image_'.$withoutImage,"{$withoutImage} modelo(s) sem imagem",'Complete a apresentação visual do catálogo.','modelos','bi-image','warning');
                $withoutSheet=(int)$pdo->query("SELECT COUNT(*) FROM modelos m WHERE m.ativo=1 AND NOT EXISTS(SELECT 1 FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1 AND (md.arquivo IS NOT NULL OR md.url_origem IS NOT NULL))")->fetchColumn();
                if($withoutSheet>0)$items[]=notification_item('models_without_sheet_'.$withoutSheet,"{$withoutSheet} modelo(s) sem ficha técnica",'Vincule uma especificação oficial quando estiver disponível.','modelos','bi-file-earmark-x','info');
            }
            if (can('reports','view')) {
                $feedbacks=(int)$pdo->query('SELECT COUNT(*) FROM feedbacks WHERE criado_em>=DATE_SUB(NOW(),INTERVAL 7 DAY)')->fetchColumn();
                if($feedbacks>0)$items[]=notification_item('recent_feedbacks_'.$feedbacks,"{$feedbacks} avaliação(ões) recentes",'Feedbacks recebidos nos últimos sete dias.','relatorios','bi-chat-square-text','success');
            }
        }

        $keys=array_column($items,'key'); $read=[];
        if($keys){$marks=implode(',',array_fill(0,count($keys),'?'));$stmt=$pdo->prepare("SELECT notification_key FROM notificacoes_lidas WHERE usuario_id=? AND notification_key IN ({$marks})");$stmt->execute(array_merge([(int)$current['id']],$keys));$read=array_flip($stmt->fetchAll(PDO::FETCH_COLUMN));}
        foreach($items as &$item)$item['read']=isset($read[$item['key']]); unset($item);
    } catch (Throwable $e) {
        return ['items'=>$items,'unread'=>count($items)];
    }
    return ['items'=>$items,'unread'=>count(array_filter($items,static fn(array $item):bool=>!$item['read']))];
}

function handle_notification_post(string $route, string $method): void
{
    if($route!=='notificacoes'||$method!=='POST')return;
    verify_csrf(); $pdo=db(); $current=user();
    if(!$pdo||!$current)redirect('dashboard');
    $keys=array_values(array_unique(array_filter(array_map(static fn($value):string=>substr(trim((string)$value),0,190),(array)($_POST['notification_keys']??[])))));
    $single=substr(trim((string)($_POST['notification_key']??'')),0,190); if($single!=='')$keys[]=$single;
    if($keys){$save=$pdo->prepare('INSERT INTO notificacoes_lidas(usuario_id,notification_key,lida_em) VALUES(?,?,NOW()) ON DUPLICATE KEY UPDATE lida_em=NOW()');foreach(array_unique($keys) as $key)$save->execute([(int)$current['id'],$key]);}
    $return=trim((string)($_POST['retorno']??'dashboard'),'/');
    if(!preg_match('/^[a-z0-9-]+$/',$return))$return='dashboard';
    redirect($return);
}
