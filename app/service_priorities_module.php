<?php
declare(strict_types=1);

function handle_service_priorities_post(string $route,string $method): void
{
    if($route!=='prioridades-service-desk'||$method!=='POST')return;
    verify_csrf();$pdo=db();
    try{
        if(!$pdo||!database_ready())throw new RuntimeException('Banco de dados indisponível.');
        $action=(string)($_POST['action']??'');
        if(!in_array($action,['create','update','delete'],true)||!can('service_priorities',$action))throw new RuntimeException('Seu perfil não permite realizar esta ação.');
        $id=$action==='update'||$action==='delete'?(int)($_POST['id']??0):0;
        if($action==='delete'){
            $check=$pdo->prepare('SELECT sp.codigo,(SELECT COUNT(*) FROM service_reports sr WHERE sr.prioridade_id=sp.id)+(SELECT COUNT(*) FROM master_categories mc WHERE mc.prioridade_padrao_id=sp.id) vinculos FROM service_priorities sp WHERE sp.id=?');
            $check->execute([$id]);$priority=$check->fetch();
            if(!$priority)throw new RuntimeException('Prioridade não encontrada.');
            if((int)$priority['vinculos']>0)throw new RuntimeException('A prioridade possui chamados ou categorias vinculadas. Inative-a para preservar o histórico.');
            $pdo->prepare('DELETE FROM service_priorities WHERE id=?')->execute([$id]);
            flash('success','Prioridade excluída.');
        }else{
            $code=mb_strtoupper(trim((string)($_POST['codigo']??'')),'UTF-8');
            $name=trim((string)($_POST['nome']??''));
            $first=max(1,min(525600,(int)($_POST['sla_primeira_interacao_minutos']??60)));
            $resolution=max($first,min(525600,(int)($_POST['sla_resolucao_minutos']??1440)));
            $order=max(1,min(99,(int)($_POST['ordem']??3)));
            $color=trim((string)($_POST['cor']??'#64748b'));
            if(!preg_match('/^P[1-9][0-9]?$/',$code)||$name==='')throw new RuntimeException('Informe um código como P1 e o nome da prioridade.');
            if(!preg_match('/^#[0-9a-fA-F]{6}$/',$color))$color='#64748b';
            $duplicate=$pdo->prepare('SELECT id FROM service_priorities WHERE codigo=? AND id<>?');$duplicate->execute([$code,$id]);
            if($duplicate->fetchColumn())throw new RuntimeException('Já existe uma prioridade com este código.');
            $values=[$code,$name,trim((string)($_POST['descricao']??''))?:null,$color,$order,$first,$resolution,(int)isset($_POST['ativo'])];
            if($action==='create'){
                $pdo->prepare('INSERT INTO service_priorities(codigo,nome,descricao,cor,ordem,sla_primeira_interacao_minutos,sla_resolucao_minutos,ativo) VALUES(?,?,?,?,?,?,?,?)')->execute($values);
                flash('success','Prioridade cadastrada com seus SLAs.');
            }else{
                $values[]=$id;
                $pdo->prepare('UPDATE service_priorities SET codigo=?,nome=?,descricao=?,cor=?,ordem=?,sla_primeira_interacao_minutos=?,sla_resolucao_minutos=?,ativo=? WHERE id=?')->execute($values);
                flash('success','Prioridade e SLAs atualizados.');
            }
        }
    }catch(PDOException $e){flash('error',$e->getCode()==='23000'?'Não foi possível concluir porque existem vínculos ou dados duplicados.':'Não foi possível salvar a prioridade.');}
    catch(Throwable $e){flash('error',$e->getMessage());}
    redirect('prioridades-service-desk');
}

function load_service_priorities_page(): array
{
    $pdo=db();$data=['ready'=>false,'rows'=>[],'total'=>0,'pages'=>1];
    if(!$pdo)return $data;
    try{
        $pdo->query('SELECT 1 FROM service_priorities LIMIT 1');$data['ready']=true;
        [$page,$perPage,$offset]=pagination_params();
        $q=trim((string)($_GET['q']??''));$status=(string)($_GET['status']??'');
        $where=[];$params=[];
        if($q!==''){$where[]='(sp.codigo LIKE ? OR sp.nome LIKE ? OR sp.descricao LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%");}
        if(in_array($status,['ativo','inativo'],true)){$where[]='sp.ativo=?';$params[]=$status==='ativo'?1:0;}
        $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
        $count=$pdo->prepare('SELECT COUNT(*) FROM service_priorities sp'.$whereSql);$count->execute($params);$total=(int)$count->fetchColumn();
        $stmt=$pdo->prepare('SELECT sp.*,(SELECT COUNT(*) FROM service_reports sr WHERE sr.prioridade_id=sp.id) chamados,(SELECT COUNT(*) FROM master_categories mc WHERE mc.prioridade_padrao_id=sp.id) categorias FROM service_priorities sp'.$whereSql.' ORDER BY sp.ordem,sp.codigo LIMIT ? OFFSET ?');
        foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);
        $stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();
        $data=array_merge($data,['rows'=>$stmt->fetchAll(),'page'=>$page,'per_page'=>$perPage,'offset'=>$offset,'total'=>$total,'pages'=>max(1,(int)ceil($total/$perPage)),'q'=>$q,'status'=>$status]);
    }catch(Throwable){$data['ready']=false;}
    return $data;
}

function service_priority_duration(int $minutes): string
{
    if($minutes<60)return $minutes.' min';
    if($minutes%1440===0)return (int)($minutes/1440).' dia(s)';
    if($minutes%60===0)return (int)($minutes/60).' h';
    return (int)floor($minutes/60).' h '.($minutes%60).' min';
}
