<?php
declare(strict_types=1);

function sector_management_slug(string $value): string
{
    $value=mb_strtolower(trim($value),'UTF-8');
    $ascii=@iconv('UTF-8','ASCII//TRANSLIT//IGNORE',$value);
    if(is_string($ascii))$value=$ascii;
    return trim(preg_replace('/[^a-z0-9]+/','-',$value)?:'','-');
}

function sector_manageable_company_ids(): array
{
    if(is_master()){
        $pdo=db();
        return $pdo?array_map('intval',$pdo->query("SELECT id FROM empresas WHERE ativo=1 AND tipo IN ('vwco','concessionaria')")->fetchAll(PDO::FETCH_COLUMN)):[];
    }
    return array_values(array_intersect(manageable_company_ids(),array_map('intval',db()->query("SELECT id FROM empresas WHERE ativo=1 AND tipo IN ('vwco','concessionaria')")->fetchAll(PDO::FETCH_COLUMN))));
}

function sector_find_for_management(PDO $pdo,int $id,bool $allowGlobalForMaster=true): array
{
    $stmt=$pdo->prepare('SELECT * FROM setores WHERE id=?');$stmt->execute([$id]);$sector=$stmt->fetch();
    if(!$sector)throw new RuntimeException('Setor não encontrado.');
    if(is_master()&&($allowGlobalForMaster||(int)($sector['empresa_id']??0)>0))return $sector;
    $companyId=(int)($sector['empresa_id']??0);
    if(!$companyId||!in_array($companyId,sector_manageable_company_ids(),true))throw new RuntimeException('Este setor está fora do seu escopo de administração.');
    return $sector;
}

function handle_sectors_post(string $route,string $method): void
{
    if($route!=='setores'||$method!=='POST')return;
    verify_csrf();$pdo=db();
    try{
        if(!$pdo||!database_ready())throw new RuntimeException('Banco de dados indisponível.');
        $action=(string)($_POST['action']??'');
        if(!in_array($action,['create','update','link_member','unlink_member'],true))throw new RuntimeException('Ação inválida.');
        $permission=$action==='create'?'create':'update';
        if(!can('sectors',$permission))throw new RuntimeException('Seu perfil não permite realizar esta ação.');

        if(in_array($action,['create','update'],true)){
            $id=$action==='update'?(int)($_POST['id']??0):0;
            $name=trim((string)($_POST['nome']??''));$email=trim((string)($_POST['email']??''));$description=trim((string)($_POST['descricao']??''));
            $companyId=(int)($_POST['empresa_id']??0);$active=(int)isset($_POST['ativo']);
            if($name===''||mb_strlen($name)>120)throw new RuntimeException('Informe um nome de setor com até 120 caracteres.');
            if($email!==''&&!filter_var($email,FILTER_VALIDATE_EMAIL))throw new RuntimeException('Informe um e-mail válido.');
            if(!is_master()&&!$companyId)throw new RuntimeException('Selecione a empresa responsável pelo setor.');
            if($companyId&&!in_array($companyId,sector_manageable_company_ids(),true))throw new RuntimeException('A empresa selecionada está fora do seu escopo.');
            $slug=sector_management_slug($name);if($slug==='')throw new RuntimeException('Informe um nome válido.');
            $duplicate=$pdo->prepare('SELECT id FROM setores WHERE empresa_id <=> ? AND slug=? AND id<>?');$duplicate->execute([$companyId?:null,$slug,$id]);
            if($duplicate->fetchColumn())throw new RuntimeException('Já existe um setor com este nome na organização selecionada.');

            if($action==='create'){
                $stmt=$pdo->prepare('INSERT INTO setores(empresa_id,nome,slug,descricao,email,ativo) VALUES(?,?,?,?,?,?)');
                $stmt->execute([$companyId?:null,$name,$slug,$description?:null,$email?:null,$active]);
                flash('success','Setor cadastrado com sucesso.');
            }else{
                $current=sector_find_for_management($pdo,$id);
                $oldCompany=(int)($current['empresa_id']??0);
                if($oldCompany!==$companyId){
                    $links=$pdo->prepare('SELECT (SELECT COUNT(*) FROM usuario_setores WHERE setor_id=? AND ativo=1)+(SELECT COUNT(*) FROM master_categories WHERE setor_padrao_id=?)+(SELECT COUNT(*) FROM service_reports WHERE setor_id=?)');
                    $links->execute([$id,$id,$id]);
                    if((int)$links->fetchColumn()>0)throw new RuntimeException('Desvincule integrantes, categorias e relatos antes de alterar a organização do setor.');
                }
                if(!$active&&(int)$current['ativo']===1){
                    $links=$pdo->prepare("SELECT (SELECT COUNT(*) FROM master_categories WHERE setor_padrao_id=? AND ativo=1)+(SELECT COUNT(*) FROM service_reports WHERE setor_id=? AND status NOT IN ('finalizado','cancelado'))");
                    $links->execute([$id,$id]);
                    if((int)$links->fetchColumn()>0)throw new RuntimeException('Este setor possui categorias ativas ou chamados em andamento. Transfira os vínculos antes de inativá-lo.');
                }
                $stmt=$pdo->prepare('UPDATE setores SET empresa_id=?,nome=?,slug=?,descricao=?,email=?,ativo=? WHERE id=?');
                $stmt->execute([$companyId?:null,$name,$slug,$description?:null,$email?:null,$active,$id]);
                flash('success','Setor atualizado com sucesso.');
            }
        }elseif($action==='link_member'){
            $sectorId=(int)($_POST['setor_id']??0);$userId=(int)($_POST['usuario_id']??0);$principal=(int)isset($_POST['principal']);
            if(!$sectorId||!$userId)throw new RuntimeException('Selecione o setor e o usuário.');
            $sector=sector_find_for_management($pdo,$sectorId);
            if(!(int)$sector['ativo'])throw new RuntimeException('Ative o setor antes de vincular integrantes.');
            $companyId=(int)($sector['empresa_id']??0);
            if($companyId){
                $check=$pdo->prepare('SELECT 1 FROM usuarios u JOIN usuario_empresas ue ON ue.usuario_id=u.id AND ue.ativo=1 WHERE u.id=? AND u.ativo=1 AND ue.empresa_id=?');
                $check->execute([$userId,$companyId]);
            }else{
                $check=$pdo->prepare("SELECT 1 FROM usuarios u JOIN usuario_empresas ue ON ue.usuario_id=u.id AND ue.ativo=1 JOIN empresas e ON e.id=ue.empresa_id WHERE u.id=? AND u.ativo=1 AND e.tipo IN ('vwco','concessionaria') LIMIT 1");
                $check->execute([$userId]);
            }
            if(!$check->fetchColumn())throw new RuntimeException('O usuário selecionado não pertence ao escopo deste setor.');
            $pdo->beginTransaction();
            if($principal)$pdo->prepare('UPDATE usuario_setores SET principal=0 WHERE usuario_id=?')->execute([$userId]);
            $pdo->prepare('INSERT INTO usuario_setores(usuario_id,setor_id,principal,ativo) VALUES(?,?,?,1) ON DUPLICATE KEY UPDATE principal=VALUES(principal),ativo=1')->execute([$userId,$sectorId,$principal]);
            $pdo->commit();flash('success','Integrante vinculado ao setor.');
        }else{
            $sectorId=(int)($_POST['setor_id']??0);$userId=(int)($_POST['usuario_id']??0);
            sector_find_for_management($pdo,$sectorId);
            $stmt=$pdo->prepare('UPDATE usuario_setores SET ativo=0,principal=0 WHERE setor_id=? AND usuario_id=? AND ativo=1');$stmt->execute([$sectorId,$userId]);
            if(!$stmt->rowCount())throw new RuntimeException('Vínculo ativo não encontrado.');
            flash('success','Integrante desvinculado do setor.');
        }
    }catch(Throwable $e){
        if($pdo instanceof PDO&&$pdo->inTransaction())$pdo->rollBack();
        flash('error',$e->getMessage());
    }
    redirect('setores');
}

function load_sectors_page(): array
{
    $pdo=db();$data=['ready'=>false,'rows'=>[],'companies'=>[],'users'=>[],'members'=>[],'total'=>0,'pages'=>1];
    if(!$pdo)return $data;
    try{
        $pdo->query('SELECT 1 FROM setores LIMIT 1');$data['ready']=true;
        [$page,$perPage,$offset]=pagination_params();
        $q=trim((string)($_GET['q']??''));$status=(string)($_GET['status']??'');$companyFilter=(int)($_GET['empresa']??0);
        $companyIds=sector_manageable_company_ids();
        $where=[];$params=[];
        if(!is_master()){
            if($companyIds){$where[]='(s.empresa_id IS NULL OR s.empresa_id IN ('.implode(',',array_fill(0,count($companyIds),'?')).'))';$params=array_merge($params,$companyIds);}
            else $where[]='s.empresa_id IS NULL';
        }
        if($q!==''){$where[]='(s.nome LIKE ? OR s.email LIKE ? OR s.descricao LIKE ? OR e.nome_fantasia LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%","%{$q}%");}
        if(in_array($status,['ativo','inativo'],true)){$where[]='s.ativo=?';$params[]=$status==='ativo'?1:0;}
        if($companyFilter){
            if(!is_master()&&!in_array($companyFilter,$companyIds,true))$where[]='1=0';
            else{$where[]='s.empresa_id=?';$params[]=$companyFilter;}
        }elseif(($_GET['empresa']??'')==='global')$where[]='s.empresa_id IS NULL';
        $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
        $count=$pdo->prepare('SELECT COUNT(*) FROM setores s LEFT JOIN empresas e ON e.id=s.empresa_id'.$whereSql);$count->execute($params);$data['total']=(int)$count->fetchColumn();
        $data['pages']=max(1,(int)ceil($data['total']/$perPage));
        $sql='SELECT s.*,e.nome_fantasia empresa_nome,(SELECT COUNT(*) FROM usuario_setores us WHERE us.setor_id=s.id AND us.ativo=1) integrantes,(SELECT COUNT(*) FROM master_categories mc WHERE mc.setor_padrao_id=s.id AND mc.ativo=1) categorias,(SELECT COUNT(*) FROM service_reports sr WHERE sr.setor_id=s.id AND sr.status NOT IN ("finalizado","cancelado")) chamados_abertos FROM setores s LEFT JOIN empresas e ON e.id=s.empresa_id'.$whereSql.' ORDER BY s.ativo DESC,e.nome_fantasia,s.nome LIMIT ? OFFSET ?';
        $stmt=$pdo->prepare($sql);foreach($params as $index=>$value)$stmt->bindValue($index+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$data['rows']=$stmt->fetchAll();

        $companyWhere=is_master()?'':($companyIds?' AND id IN ('.implode(',',array_fill(0,count($companyIds),'?')).')':' AND 1=0');
        $companies=$pdo->prepare("SELECT id,nome_fantasia FROM empresas WHERE ativo=1 AND tipo IN ('vwco','concessionaria'){$companyWhere} ORDER BY nome_fantasia");
        $companies->execute(is_master()?[]:$companyIds);$data['companies']=$companies->fetchAll();

        $userWhere=is_master()?'':($companyIds?' AND ue.empresa_id IN ('.implode(',',array_fill(0,count($companyIds),'?')).')':' AND 1=0');
        $users=$pdo->prepare("SELECT u.id,u.nome,u.email,GROUP_CONCAT(DISTINCT ue.empresa_id ORDER BY ue.empresa_id) empresa_ids FROM usuarios u JOIN usuario_empresas ue ON ue.usuario_id=u.id AND ue.ativo=1 JOIN empresas e ON e.id=ue.empresa_id WHERE u.ativo=1 AND e.tipo IN ('vwco','concessionaria'){$userWhere} GROUP BY u.id,u.nome,u.email ORDER BY u.nome");
        $users->execute(is_master()?[]:$companyIds);$data['users']=$users->fetchAll();

        $sectorIds=array_map(static fn(array $row):int=>(int)$row['id'],$data['rows']);
        if($sectorIds){
            $marks=implode(',',array_fill(0,count($sectorIds),'?'));
            $members=$pdo->prepare("SELECT us.setor_id,us.usuario_id,us.principal,u.nome,u.email FROM usuario_setores us JOIN usuarios u ON u.id=us.usuario_id WHERE us.ativo=1 AND us.setor_id IN ({$marks}) ORDER BY us.principal DESC,u.nome");
            $members->execute($sectorIds);
            foreach($members->fetchAll() as $member)$data['members'][(int)$member['setor_id']][]=$member;
        }
        $data+=['page'=>$page,'per_page'=>$perPage,'offset'=>$offset,'q'=>$q,'status'=>$status,'company_filter'=>$_GET['empresa']??''];
    }catch(Throwable){$data['ready']=false;}
    return $data;
}
