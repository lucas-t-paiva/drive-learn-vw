<?php
declare(strict_types=1);

function fleet_client_scope(): array
{
    $ids = accessible_client_company_ids();
    return array_values(array_unique(array_filter(array_map('intval', $ids))));
}

function fleet_requested_client_company_id(array $allowed): int
{
    if ((user()['active_company_type'] ?? '') === 'cliente') return active_company_id() ?? 0;
    $requested = (int)($_POST['cliente_empresa_id'] ?? $_GET['cliente'] ?? 0);
    if ($requested && in_array($requested, $allowed, true)) return $requested;
    return count($allowed) === 1 ? $allowed[0] : 0;
}

function fleet_legacy_client_id(PDO $pdo, int $companyId): int
{
    $stmt = $pdo->prepare("SELECT c.id FROM clientes c JOIN empresas e ON e.id=c.empresa_id WHERE c.empresa_id=? AND e.tipo='cliente' AND e.ativo=1 AND c.ativo=1");
    $stmt->execute([$companyId]);
    return (int)$stmt->fetchColumn();
}

function handle_fleet_post(string $route, string $method): void
{
    if ($method !== 'POST' || !in_array($route, ['frota','normas-emissoes'], true)) return;
    verify_csrf();
    $pdo = db();
    $action = (string)($_POST['action'] ?? '');
    try {
        if (!$pdo || !database_ready()) throw new RuntimeException('O banco de dados não está disponível.');
        if ($route === 'normas-emissoes') {
            if (!can('emission_standards', $action)) throw new RuntimeException('Seu perfil não permite realizar esta ação.');
            $id = $action === 'create' ? 0 : (int)($_POST['id'] ?? 0);
            if (in_array($action, ['create','update'], true)) {
                $code = strtoupper(trim((string)($_POST['codigo'] ?? '')));
                $name = trim((string)($_POST['nome'] ?? ''));
                if ($code === '' || $name === '') throw new RuntimeException('Informe o código e o nome da norma de emissões.');
                if (!preg_match('/^[A-Z0-9._ -]{2,30}$/', $code)) throw new RuntimeException('Use somente letras, números, ponto, espaço, hífen ou sublinhado no código.');
                $values = [$code,$name,trim((string)($_POST['descricao'] ?? '')) ?: null,max(0,(int)($_POST['ordem'] ?? 0)),(int)isset($_POST['ativo'])];
                if ($action === 'create') $pdo->prepare('INSERT INTO normas_emissoes(codigo,nome,descricao,ordem,ativo) VALUES(?,?,?,?,?)')->execute($values);
                else { if (!$id) throw new RuntimeException('Norma de emissões inválida.'); $values[]=$id; $pdo->prepare('UPDATE normas_emissoes SET codigo=?,nome=?,descricao=?,ordem=?,ativo=? WHERE id=?')->execute($values); }
                flash('success','Norma de emissões salva com sucesso.');
            } elseif ($action === 'delete') {
                if (!$id) throw new RuntimeException('Norma de emissões inválida.');
                $check=$pdo->prepare('SELECT nome,(SELECT COUNT(*) FROM frotas f WHERE f.norma_emissao_id=n.id) frotas FROM normas_emissoes n WHERE n.id=?');$check->execute([$id]);$standard=$check->fetch();
                if(!$standard)throw new RuntimeException('Norma de emissões não encontrada.');
                if((int)$standard['frotas']>0)throw new RuntimeException('Esta norma está vinculada a registros de frota e não pode ser excluída. Desative-a para preservar o histórico.');
                $pdo->prepare('DELETE FROM normas_emissoes WHERE id=?')->execute([$id]);
                flash('success','Norma de emissões excluída com sucesso.');
            }
            redirect('normas-emissoes');
        }

        $allowed = fleet_client_scope();
        if (!$allowed) throw new RuntimeException('Nenhum cliente está disponível no seu escopo de acesso.');
        if (!can('fleet', $action)) throw new RuntimeException('Seu perfil não permite realizar esta ação na frota.');
        $id = $action === 'create' ? 0 : (int)($_POST['id'] ?? 0);
        if ($id) {
            $marks=implode(',',array_fill(0,count($allowed),'?'));
            $find=$pdo->prepare("SELECT f.*,c.empresa_id FROM frotas f JOIN clientes c ON c.id=f.cliente_id WHERE f.id=? AND c.empresa_id IN ({$marks})");
            $find->execute(array_merge([$id],$allowed));$current=$find->fetch();
            if(!$current)throw new RuntimeException('Registro de frota não encontrado ou fora do seu acesso.');
        }
        if (in_array($action, ['create','update'], true)) {
            $clientCompanyId = fleet_requested_client_company_id($allowed);
            if (!$clientCompanyId || !in_array($clientCompanyId,$allowed,true)) throw new RuntimeException('Selecione a empresa cliente responsável pela frota.');
            $clientId = fleet_legacy_client_id($pdo,$clientCompanyId);
            if(!$clientId)throw new RuntimeException('O cadastro do cliente não está preparado para receber uma frota.');
            $familyId=(int)($_POST['familia_id']??0);$modelId=(int)($_POST['modelo_id']??0);$standardId=(int)($_POST['norma_emissao_id']??0);
            $quantity=(int)($_POST['quantidade']??0);$year=(int)($_POST['ano']??0);$maxYear=(int)date('Y')+2;
            if($quantity<1||$quantity>100000)throw new RuntimeException('A quantidade deve estar entre 1 e 100.000 veículos.');
            if($year<1950||$year>$maxYear)throw new RuntimeException("Informe um ano entre 1950 e {$maxYear}.");
            $model=$pdo->prepare('SELECT id FROM modelos WHERE id=? AND familia_id=? AND ativo=1');$model->execute([$modelId,$familyId]);if(!$model->fetchColumn())throw new RuntimeException('Selecione um modelo válido para a família informada.');
            $standard=$pdo->prepare('SELECT id FROM normas_emissoes WHERE id=? AND ativo=1');$standard->execute([$standardId]);if(!$standard->fetchColumn())throw new RuntimeException('Selecione uma norma de emissões ativa.');
            $values=[$clientId,$modelId,$quantity,$year,$standardId,trim((string)($_POST['observacao']??''))?:null,user()['id']??null];
            if($action==='create')$pdo->prepare('INSERT INTO frotas(cliente_id,modelo_id,quantidade,ano,norma_emissao_id,observacao,cadastrado_por) VALUES(?,?,?,?,?,?,?)')->execute($values);
            else{$values[]=$id;$pdo->prepare('UPDATE frotas SET cliente_id=?,modelo_id=?,quantidade=?,ano=?,norma_emissao_id=?,observacao=?,cadastrado_por=? WHERE id=?')->execute($values);}
            flash('success','Composição da frota salva com sucesso.');
        } elseif ($action === 'delete') {
            if(!$id)throw new RuntimeException('Registro de frota inválido.');
            $pdo->prepare('DELETE FROM frotas WHERE id=?')->execute([$id]);
            flash('success','Composição removida da frota com sucesso.');
        }
    } catch (PDOException $e) {
        flash('error',$e->getCode()==='23000'?'Já existe uma composição com este cliente, modelo, ano e norma de emissões. Edite o registro existente.':'Não foi possível salvar a frota no banco de dados.');
    } catch (Throwable $e) {
        flash('error',$e->getMessage());
    }
    redirect($route);
}

function load_fleet_page(): array
{
    $pdo=db();if(!$pdo)return [];
    $allowed=fleet_client_scope();[$page,$perPage,$offset]=pagination_params();
    $q=trim((string)($_GET['q']??''));$familyFilter=(int)($_GET['familia']??0);$standardFilter=(int)($_GET['norma']??0);$clientFilter=fleet_requested_client_company_id($allowed);
    $families=$pdo->query('SELECT id,nome FROM familias WHERE ativo=1 ORDER BY nome')->fetchAll();
    $models=$pdo->query('SELECT id,familia_id,nome,imagem FROM modelos WHERE ativo=1 ORDER BY nome')->fetchAll();
    $standards=$pdo->query('SELECT id,codigo,nome,descricao FROM normas_emissoes WHERE ativo=1 ORDER BY ordem,nome')->fetchAll();
    if(!$allowed)return compact('page','perPage','offset','q','familyFilter','standardFilter','clientFilter','families','models','standards')+['rows'=>[],'clients'=>[],'totalRows'=>0,'totalPages'=>1,'metrics'=>['vehicles'=>0,'families'=>0,'videos'=>0]];
    $marks=implode(',',array_fill(0,count($allowed),'?'));
    $clientStmt=$pdo->prepare("SELECT e.id,e.nome_fantasia FROM empresas e WHERE e.id IN ({$marks}) AND e.tipo='cliente' AND e.ativo=1 ORDER BY e.nome_fantasia");$clientStmt->execute($allowed);$clients=$clientStmt->fetchAll();
    $where=["e.id IN ({$marks})"];$params=$allowed;
    if($clientFilter){$where[]='e.id=?';$params[]=$clientFilter;}
    if($q!==''){$where[]='(m.nome LIKE ? OR fa.nome LIKE ? OR ne.nome LIKE ? OR e.nome_fantasia LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%","%{$q}%");}
    if($familyFilter){$where[]='fa.id=?';$params[]=$familyFilter;}
    if($standardFilter){$where[]='ne.id=?';$params[]=$standardFilter;}
    $whereSql=' WHERE '.implode(' AND ',$where);
    $base=' FROM frotas f JOIN clientes c ON c.id=f.cliente_id JOIN empresas e ON e.id=c.empresa_id JOIN modelos m ON m.id=f.modelo_id JOIN familias fa ON fa.id=m.familia_id LEFT JOIN normas_emissoes ne ON ne.id=f.norma_emissao_id';
    $count=$pdo->prepare('SELECT COUNT(*)'.$base.$whereSql);$count->execute($params);$totalRows=(int)$count->fetchColumn();$totalPages=max(1,(int)ceil($totalRows/$perPage));
    $sql='SELECT f.*,e.id cliente_empresa_id,e.nome_fantasia cliente_nome,m.nome modelo_nome,m.imagem modelo_imagem,fa.id familia_id,fa.nome familia_nome,ne.nome norma_nome,ne.codigo norma_codigo,(SELECT COUNT(DISTINCT v.id) FROM videos v LEFT JOIN video_modelos vm ON vm.video_id=v.id LEFT JOIN video_familias vf ON vf.video_id=v.id WHERE vm.modelo_id=m.id OR vf.familia_id=fa.id) videos'.$base.$whereSql.' ORDER BY e.nome_fantasia,fa.nome,m.nome,f.ano DESC LIMIT ? OFFSET ?';
    $stmt=$pdo->prepare($sql);foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$rows=$stmt->fetchAll();
    $metricWhere=["e.id IN ({$marks})"];$metricParams=$allowed;if($clientFilter){$metricWhere[]='e.id=?';$metricParams[]=$clientFilter;}$metricSql=' WHERE '.implode(' AND ',$metricWhere);
    $metric=$pdo->prepare('SELECT COALESCE(SUM(f.quantidade),0) vehicles,COUNT(DISTINCT m.familia_id) families'.$base.$metricSql);$metric->execute($metricParams);$metrics=$metric->fetch()?:['vehicles'=>0,'families'=>0];
    $video=$pdo->prepare("SELECT COUNT(DISTINCT video_id) FROM (SELECT vm.video_id FROM frotas f JOIN clientes c ON c.id=f.cliente_id JOIN modelos m ON m.id=f.modelo_id JOIN video_modelos vm ON vm.modelo_id=m.id WHERE c.empresa_id IN ({$marks})".($clientFilter?' AND c.empresa_id=?':'')." UNION SELECT vf.video_id FROM frotas f JOIN clientes c ON c.id=f.cliente_id JOIN modelos m ON m.id=f.modelo_id JOIN video_familias vf ON vf.familia_id=m.familia_id WHERE c.empresa_id IN ({$marks})".($clientFilter?' AND c.empresa_id=?':'').') v');
    $videoParams=$clientFilter?array_merge($allowed,[$clientFilter],$allowed,[$clientFilter]):array_merge($allowed,$allowed);$video->execute($videoParams);$metrics['videos']=(int)$video->fetchColumn();
    return compact('rows','clients','families','models','standards','metrics','page','perPage','offset','totalRows','totalPages','q','familyFilter','standardFilter','clientFilter');
}

function load_emission_standards_page(): array
{
    $pdo=db();if(!$pdo)return [];[$page,$perPage,$offset]=pagination_params();$q=trim((string)($_GET['q']??''));$status=(string)($_GET['status']??'');$where=[];$params=[];
    if($q!==''){$where[]='(n.codigo LIKE ? OR n.nome LIKE ? OR n.descricao LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%");}
    if(in_array($status,['ativo','inativo'],true)){$where[]='n.ativo=?';$params[]=$status==='ativo'?1:0;}$whereSql=$where?' WHERE '.implode(' AND ',$where):'';
    $count=$pdo->prepare('SELECT COUNT(*) FROM normas_emissoes n'.$whereSql);$count->execute($params);$totalRows=(int)$count->fetchColumn();$totalPages=max(1,(int)ceil($totalRows/$perPage));
    $stmt=$pdo->prepare('SELECT n.*,(SELECT COUNT(*) FROM frotas f WHERE f.norma_emissao_id=n.id) frotas FROM normas_emissoes n'.$whereSql.' ORDER BY n.ordem,n.nome LIMIT ? OFFSET ?');foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$standards=$stmt->fetchAll();
    return compact('standards','page','perPage','offset','totalRows','totalPages','q','status');
}
