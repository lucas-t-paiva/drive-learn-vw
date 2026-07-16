<?php
declare(strict_types=1);

function report_valid_date(mixed $value, string $fallback): string
{
    $value = trim((string)$value);
    if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $value)) return $fallback;
    $date = DateTimeImmutable::createFromFormat('!Y-m-d', $value);
    return $date && $date->format('Y-m-d') === $value ? $value : $fallback;
}

function report_company_expression(array $companyIds): string
{
    $ids = implode(',', array_map('intval', $companyIds ?: [0]));
    return "(SELECT GROUP_CONCAT(DISTINCT e.nome_fantasia ORDER BY e.nome_fantasia SEPARATOR ', ') FROM usuario_empresas ue JOIN empresas e ON e.id=ue.empresa_id WHERE ue.usuario_id=u.id AND ue.ativo=1 AND ue.empresa_id IN ({$ids}))";
}

function report_export_csv(PDO $pdo, string $whereSql, array $params, string $companyExpression): never
{
    $sql = "SELECT vv.iniciado_em,v.titulo,c.nome categoria,u.nome usuario,u.email,{$companyExpression} empresa,vv.percentual,CASE WHEN vv.concluido_em IS NOT NULL OR vv.percentual>=90 THEN 'Sim' ELSE 'Não' END concluido,fb.nota,fb.comentario,fb.melhorias
            FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id JOIN usuarios u ON u.id=vv.usuario_id LEFT JOIN feedbacks fb ON fb.visualizacao_id=vv.id
            {$whereSql} ORDER BY vv.iniciado_em DESC";
    $stmt = $pdo->prepare($sql); $stmt->execute($params);
    header('Content-Type: text/csv; charset=UTF-8');
    header('Content-Disposition: attachment; filename="relatorio-drive-learn-'.date('Y-m-d').'.csv"');
    $output = fopen('php://output', 'wb');
    fwrite($output, "\xEF\xBB\xBF");
    fputcsv($output, ['Data','Treinamento','Categoria','Usuário','E-mail','Empresa','Progresso (%)','Concluído','Nota','Comentário','Melhorias'], ';');
    while ($row = $stmt->fetch()) {
        $values = array_map(static function (mixed $value): mixed {
            return is_string($value) && preg_match('/^[=+\-@]/u', $value) ? "'".$value : $value;
        }, array_values($row));
        fputcsv($output, $values, ';');
    }
    fclose($output);
    exit;
}

function load_reports_page(): array
{
    $pdo = db();
    if (!$pdo) return [];

    $today = date('Y-m-d');
    $start = report_valid_date($_GET['inicio'] ?? '', date('Y-m-d', strtotime('-29 days')));
    $end = report_valid_date($_GET['fim'] ?? '', $today);
    if ($start > $end) [$start, $end] = [$end, $start];

    $allowedClients = array_values(array_unique(array_filter(array_map('intval', accessible_client_company_ids()))));
    $requestedClient = (int)($_GET['cliente'] ?? 0);
    if ($requestedClient && !in_array($requestedClient, $allowedClients, true)) $requestedClient = 0;
    $isClient = (user()['active_company_type'] ?? '') === 'cliente';
    if ($isClient) $requestedClient = active_company_id() ?? 0;
    $clientOptions = [];
    if ($allowedClients) {
        $marks = implode(',', array_fill(0, count($allowedClients), '?'));
        $stmt = $pdo->prepare("SELECT e.id,e.nome_fantasia FROM empresas e WHERE e.id IN ({$marks}) AND e.tipo='cliente' AND e.ativo=1 AND EXISTS(SELECT 1 FROM usuario_empresas ue JOIN video_visualizacoes vv ON vv.usuario_id=ue.usuario_id WHERE ue.empresa_id=e.id AND ue.ativo=1 AND vv.iniciado_em>=? AND vv.iniciado_em<DATE_ADD(?,INTERVAL 1 DAY)) ORDER BY e.nome_fantasia");
        $stmt->execute(array_merge($allowedClients,[$start,$end])); $clientOptions = $stmt->fetchAll();
    }
    $clientsWithData = array_map('intval',array_column($clientOptions,'id'));
    $clientFilter = $isClient ? $requestedClient : ($requestedClient && in_array($requestedClient,$clientsWithData,true) ? $requestedClient : 0);
    $companyIds = $clientFilter ? [$clientFilter] : $allowedClients;

    $categoryOptions = []; $videoOptions = [];
    if ($companyIds) {
        $marks = implode(',', array_fill(0, count($companyIds), '?'));
        $optionWhere = "vv.iniciado_em>=? AND vv.iniciado_em<DATE_ADD(?,INTERVAL 1 DAY) AND EXISTS(SELECT 1 FROM usuario_empresas ux WHERE ux.usuario_id=vv.usuario_id AND ux.ativo=1 AND ux.empresa_id IN ({$marks}))";
        $optionParams = array_merge([$start,$end],$companyIds);
        $stmt = $pdo->prepare("SELECT DISTINCT c.id,c.nome,c.ordem FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id WHERE {$optionWhere} ORDER BY c.ordem,c.nome");
        $stmt->execute($optionParams); $categoryOptions = $stmt->fetchAll();
    }
    $requestedCategory = max(0,(int)($_GET['categoria']??0));
    $categoryIds = array_map('intval',array_column($categoryOptions,'id'));
    $categoryFilter = in_array($requestedCategory,$categoryIds,true) ? $requestedCategory : 0;
    if ($companyIds) {
        $marks = implode(',', array_fill(0, count($companyIds), '?'));
        $optionWhere = "vv.iniciado_em>=? AND vv.iniciado_em<DATE_ADD(?,INTERVAL 1 DAY) AND EXISTS(SELECT 1 FROM usuario_empresas ux WHERE ux.usuario_id=vv.usuario_id AND ux.ativo=1 AND ux.empresa_id IN ({$marks}))";
        $optionParams = array_merge([$start,$end],$companyIds);
        if ($categoryFilter) { $optionWhere .= ' AND v.categoria_id=?'; $optionParams[]=$categoryFilter; }
        $stmt = $pdo->prepare("SELECT DISTINCT v.id,v.titulo FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id WHERE {$optionWhere} ORDER BY v.titulo");
        $stmt->execute($optionParams); $videoOptions = $stmt->fetchAll();
    }
    $requestedVideo = max(0,(int)($_GET['video']??0));
    $videoIds = array_map('intval',array_column($videoOptions,'id'));
    $videoFilter = in_array($requestedVideo,$videoIds,true) ? $requestedVideo : 0;

    $companyMarks = implode(',', array_fill(0, max(1, count($companyIds)), '?'));
    $where = ['vv.iniciado_em>=?', 'vv.iniciado_em<DATE_ADD(?,INTERVAL 1 DAY)'];
    $params = [$start, $end];
    if ($companyIds) {
        $where[] = "EXISTS(SELECT 1 FROM usuario_empresas ux WHERE ux.usuario_id=vv.usuario_id AND ux.ativo=1 AND ux.empresa_id IN ({$companyMarks}))";
        array_push($params, ...$companyIds);
    } else $where[] = '1=0';
    if ($categoryFilter) { $where[] = 'c.id=?'; $params[] = $categoryFilter; }
    if ($videoFilter) { $where[] = 'v.id=?'; $params[] = $videoFilter; }
    $whereSql = 'WHERE '.implode(' AND ', $where);
    $companyExpression = report_company_expression($companyIds);

    if (($_GET['exportar'] ?? '') === 'csv') report_export_csv($pdo, $whereSql, $params, $companyExpression);

    $metricSql = "SELECT COUNT(*) visualizacoes,COUNT(DISTINCT vv.usuario_id) usuarios,COALESCE(SUM(vv.concluido_em IS NOT NULL OR vv.percentual>=90),0) conclusoes,COALESCE(ROUND(AVG(vv.percentual),1),0) progresso_medio,ROUND(AVG(fb.nota),1) nota_media,COUNT(fb.id) avaliacoes
                  FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id LEFT JOIN feedbacks fb ON fb.visualizacao_id=vv.id {$whereSql}";
    $stmt = $pdo->prepare($metricSql); $stmt->execute($params); $metrics = $stmt->fetch() ?: [];
    $metrics['taxa_conclusao'] = (int)($metrics['visualizacoes'] ?? 0) > 0 ? round((int)$metrics['conclusoes'] * 100 / (int)$metrics['visualizacoes'], 1) : 0;

    $stmt = $pdo->prepare("SELECT DATE(vv.iniciado_em) dia,COUNT(*) visualizacoes,COALESCE(SUM(vv.concluido_em IS NOT NULL OR vv.percentual>=90),0) conclusoes FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id {$whereSql} GROUP BY DATE(vv.iniciado_em) ORDER BY dia");
    $stmt->execute($params); $trend = $stmt->fetchAll();
    $trendMax = $trend ? max(1,max(array_map(static fn(array $row): int => (int)$row['visualizacoes'], $trend))) : 1;

    $stmt = $pdo->prepare("SELECT v.id,v.titulo,c.nome categoria,COUNT(*) visualizacoes,COUNT(DISTINCT vv.usuario_id) usuarios,COALESCE(SUM(vv.concluido_em IS NOT NULL OR vv.percentual>=90),0) conclusoes,ROUND(AVG(vv.percentual),1) progresso_medio,ROUND(AVG(fb.nota),1) nota_media
                           FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id LEFT JOIN feedbacks fb ON fb.visualizacao_id=vv.id {$whereSql} GROUP BY v.id,c.id ORDER BY visualizacoes DESC,conclusoes DESC,v.titulo LIMIT 10");
    $stmt->execute($params); $topVideos = $stmt->fetchAll();

    $userPerPage = (int)($_GET['usuarios_por_pagina'] ?? 10); if (!in_array($userPerPage,[5,10,25,50],true)) $userPerPage=10;
    $userPage = max(1,(int)($_GET['usuarios_pagina']??1));
    $stmt = $pdo->prepare("SELECT COUNT(DISTINCT vv.usuario_id) FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id {$whereSql}");
    $stmt->execute($params); $userTotal=(int)$stmt->fetchColumn(); $userPages=max(1,(int)ceil($userTotal/$userPerPage)); $userPage=min($userPage,$userPages); $userOffset=($userPage-1)*$userPerPage;
    $stmt = $pdo->prepare("SELECT u.id,u.nome,u.email,{$companyExpression} empresa,COUNT(*) visualizacoes,COUNT(DISTINCT vv.video_id) videos,COALESCE(SUM(vv.concluido_em IS NOT NULL OR vv.percentual>=90),0) conclusoes,ROUND(AVG(vv.percentual),1) progresso_medio,ROUND(AVG(fb.nota),1) nota_media,MAX(vv.iniciado_em) ultimo_acesso
                           FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id JOIN usuarios u ON u.id=vv.usuario_id LEFT JOIN feedbacks fb ON fb.visualizacao_id=vv.id {$whereSql} GROUP BY u.id ORDER BY conclusoes DESC,visualizacoes DESC,u.nome LIMIT {$userPerPage} OFFSET {$userOffset}");
    $stmt->execute($params); $users = $stmt->fetchAll();

    $feedbackWhere = $whereSql.' AND fb.id IS NOT NULL';
    $stmt = $pdo->prepare("SELECT fb.id,fb.nota,fb.comentario,fb.melhorias,fb.criado_em,v.titulo,u.nome usuario,{$companyExpression} empresa
                           FROM video_visualizacoes vv JOIN videos v ON v.id=vv.video_id JOIN categorias c ON c.id=v.categoria_id JOIN usuarios u ON u.id=vv.usuario_id JOIN feedbacks fb ON fb.visualizacao_id=vv.id {$feedbackWhere} ORDER BY fb.criado_em DESC LIMIT 50");
    $stmt->execute($params); $feedbacks = $stmt->fetchAll();

    return compact('start','end','clientFilter','videoFilter','categoryFilter','clientOptions','categoryOptions','videoOptions','metrics','trend','trendMax','topVideos','users','userTotal','userPages','userPage','userPerPage','userOffset','feedbacks');
}
