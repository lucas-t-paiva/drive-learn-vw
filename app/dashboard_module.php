<?php
declare(strict_types=1);

function dashboard_scope_user_sql(array $companyIds, array &$params, string $userAlias = 'u'): string
{
    if (is_master() && (user()['active_company_type'] ?? '') === 'global') return '1=1';
    if (!$companyIds) return '1=0';
    $marks = implode(',', array_fill(0, count($companyIds), '?'));
    array_push($params, ...$companyIds);
    return "EXISTS(SELECT 1 FROM usuario_empresas due WHERE due.usuario_id={$userAlias}.id AND due.empresa_id IN ({$marks}) AND due.ativo=1)";
}

function dashboard_format_duration(int $seconds): string
{
    $hours = intdiv(max(0, $seconds), 3600);
    $minutes = intdiv(max(0, $seconds) % 3600, 60);
    return $hours > 0 ? "{$hours}h {$minutes}min" : "{$minutes}min";
}

function load_dashboard_page(): array
{
    $pdo = db();
    $empty = [
        'metrics' => ['vehicles'=>0,'models'=>0,'videos'=>0,'people'=>0,'completed'=>0,'time_seconds'=>0,'time_label'=>'0min'],
        'models' => [], 'continue' => null,
        'progress' => ['available'=>0,'completed'=>0,'pending'=>0,'percent'=>0,'last30'=>0],
        'scope_label' => user()['active_company_name'] ?? 'Seu ambiente',
    ];
    if (!$pdo) return $empty;

    $clientIds = fleet_client_scope();
    $metrics = $empty['metrics'];
    $models = [];
    if ($clientIds) {
        $marks = implode(',', array_fill(0, count($clientIds), '?'));
        $modelSql = "SELECT m.*,fa.nome familia_nome,SUM(fr.quantidade) total_veiculos,
            (SELECT COUNT(DISTINCT v.id) FROM videos v
             LEFT JOIN video_modelos vm ON vm.video_id=v.id
             LEFT JOIN video_familias vf ON vf.video_id=v.id
             WHERE v.status='publicado' AND (vm.modelo_id=m.id OR vf.familia_id=fa.id
                OR (NOT EXISTS(SELECT 1 FROM video_modelos vm0 WHERE vm0.video_id=v.id)
                    AND NOT EXISTS(SELECT 1 FROM video_familias vf0 WHERE vf0.video_id=v.id)))) total_videos,
            (SELECT md.arquivo FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1 ORDER BY md.id DESC LIMIT 1) ficha_arquivo
            FROM frotas fr JOIN clientes c ON c.id=fr.cliente_id
            JOIN modelos m ON m.id=fr.modelo_id JOIN familias fa ON fa.id=m.familia_id
            WHERE c.empresa_id IN ({$marks})
            GROUP BY m.id ORDER BY total_veiculos DESC,fa.nome,m.nome LIMIT 8";
        $stmt = $pdo->prepare($modelSql); $stmt->execute($clientIds); $models = $stmt->fetchAll();

        $metric = $pdo->prepare("SELECT COALESCE(SUM(fr.quantidade),0) vehicles,COUNT(DISTINCT fr.modelo_id) models FROM frotas fr JOIN clientes c ON c.id=fr.cliente_id WHERE c.empresa_id IN ({$marks})");
        $metric->execute($clientIds); $metrics = array_merge($metrics, $metric->fetch() ?: []);
    }

    $videoParams = [];
    $videoAccess = library_video_access_sql($videoParams);
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM videos v WHERE v.status='publicado' AND {$videoAccess}");
    $stmt->execute($videoParams); $metrics['videos'] = (int)$stmt->fetchColumn();

    $peopleCompanyIds = $clientIds;
    if ((user()['active_company_type'] ?? '') !== 'cliente' && active_company_id()) $peopleCompanyIds[] = active_company_id();
    $peopleCompanyIds = array_values(array_unique(array_map('intval', $peopleCompanyIds)));
    $peopleParams = [];
    $peopleWhere = dashboard_scope_user_sql($peopleCompanyIds, $peopleParams);
    $people = $pdo->prepare("SELECT COUNT(DISTINCT u.id) FROM usuarios u WHERE u.ativo=1 AND {$peopleWhere}");
    $people->execute($peopleParams); $metrics['people'] = (int)$people->fetchColumn();

    $userId = (int)(user()['id'] ?? 0);
    $personal = $pdo->prepare("SELECT COUNT(DISTINCT CASE WHEN vv.concluido_em IS NOT NULL OR vv.percentual>=90 THEN vv.video_id END) completed,
        COALESCE(SUM(x.max_seconds),0) time_seconds
        FROM video_visualizacoes vv
        LEFT JOIN (SELECT usuario_id,video_id,MAX(progresso_segundos) max_seconds FROM video_visualizacoes WHERE usuario_id=? GROUP BY usuario_id,video_id) x ON x.usuario_id=vv.usuario_id AND x.video_id=vv.video_id
        WHERE vv.usuario_id=?");
    $personal->execute([$userId,$userId]); $personalRow = $personal->fetch() ?: [];
    $metrics['completed'] = (int)($personalRow['completed'] ?? 0);
    // A subconsulta aparece em várias sessões do mesmo vídeo; somamos novamente por vídeo para não duplicar o tempo.
    $timeStmt = $pdo->prepare('SELECT COALESCE(SUM(max_seconds),0) FROM (SELECT video_id,MAX(progresso_segundos) max_seconds FROM video_visualizacoes WHERE usuario_id=? GROUP BY video_id) watched');
    $timeStmt->execute([$userId]); $metrics['time_seconds'] = (int)$timeStmt->fetchColumn();
    $metrics['time_label'] = dashboard_format_duration($metrics['time_seconds']);

    $last30 = $pdo->prepare('SELECT COUNT(DISTINCT video_id) FROM video_visualizacoes WHERE usuario_id=? AND (concluido_em IS NOT NULL OR percentual>=90) AND COALESCE(concluido_em,iniciado_em)>=DATE_SUB(NOW(),INTERVAL 30 DAY)');
    $last30->execute([$userId]);
    $available = max(0, (int)$metrics['videos']);
    $completed = min($available, (int)$metrics['completed']);
    $progress = ['available'=>$available,'completed'=>$completed,'pending'=>max(0,$available-$completed),'percent'=>$available ? (int)round($completed*100/$available) : 0,'last30'=>(int)$last30->fetchColumn()];

    $continueParams = [$userId];
    $continueAccessParams = [];
    $continueAccess = library_video_access_sql($continueAccessParams);
    $continueSql = "SELECT v.id,v.titulo,v.descricao,v.tipo,v.arquivo_url,v.thumbnail,v.duracao_segundos,c.nome categoria_nome,s.nome subcategoria_nome,
        MAX(vv.percentual) percentual,MAX(vv.progresso_segundos) progresso_segundos,MAX(vv.iniciado_em) ultimo_acesso
        FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id
        LEFT JOIN subcategorias s ON s.id=v.subcategoria_id
        WHERE vv.usuario_id=? AND v.status='publicado' AND vv.concluido_em IS NULL AND vv.percentual<90 AND {$continueAccess}
        GROUP BY v.id ORDER BY ultimo_acesso DESC LIMIT 1";
    $continueStmt = $pdo->prepare($continueSql); $continueStmt->execute(array_merge($continueParams,$continueAccessParams));
    $continue = $continueStmt->fetch() ?: null;
    if ($continue) {
        $youtubeId = $continue['tipo']==='youtube' ? youtube_video_id((string)$continue['arquivo_url']) : null;
        if (!$continue['thumbnail'] && $youtubeId) $continue['thumbnail'] = 'https://img.youtube.com/vi/'.$youtubeId.'/hqdefault.jpg';
        elseif ($continue['thumbnail'] && !preg_match('~^https?://~i',(string)$continue['thumbnail'])) $continue['thumbnail'] = url((string)$continue['thumbnail']);
    }

    return ['metrics'=>$metrics,'models'=>$models,'continue'=>$continue,'progress'=>$progress,'scope_label'=>user()['active_company_name'] ?? 'Seu ambiente'];
}
