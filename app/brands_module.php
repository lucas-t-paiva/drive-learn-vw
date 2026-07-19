<?php
declare(strict_types=1);

function handle_brand_post(string $route,string $method): void
{
    if($route!=='marcas'||$method!=='POST')return;
    verify_csrf();$pdo=db();$action=(string)($_POST['action']??'');$newLogo=null;
    try{
        if(!$pdo||!database_ready())throw new RuntimeException('O banco de dados não está disponível.');
        if(!can('brands',$action))throw new RuntimeException('Seu perfil não permite realizar esta ação em marcas.');
        $id=$action==='create'?0:(int)($_POST['id']??0);
        if(in_array($action,['create','update'],true)){
            $name=trim((string)($_POST['nome']??''));$site=trim((string)($_POST['site_oficial']??''))?:null;
            if($name==='')throw new RuntimeException('Informe o nome da marca.');
            if($site&&!filter_var($site,FILTER_VALIDATE_URL))throw new RuntimeException('Informe um endereço válido para o site oficial.');
            $current=['logo'=>null];
            if($id){$find=$pdo->prepare('SELECT logo FROM marcas WHERE id=?');$find->execute([$id]);$current=$find->fetch();if(!$current)throw new RuntimeException('Marca não encontrada.');}
            $logo=save_module_image('marcas',$_FILES['logo']??[],$current['logo']);if($logo!==$current['logo'])$newLogo=$logo;
            $values=[$name,slugify($name),trim((string)($_POST['pais_origem']??''))?:null,$site,trim((string)($_POST['descricao']??''))?:null,$logo,(int)isset($_POST['ativo'])];
            if($action==='create')$pdo->prepare('INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,logo,ativo) VALUES(?,?,?,?,?,?,?)')->execute($values);
            else{$values[]=$id;$pdo->prepare('UPDATE marcas SET nome=?,slug=?,pais_origem=?,site_oficial=?,descricao=?,logo=?,ativo=? WHERE id=?')->execute($values);if($logo!==$current['logo'])remove_module_image('marcas',$current['logo']);}
            flash('success','Marca '.($action==='create'?'cadastrada':'atualizada').' com sucesso.');
        }elseif($action==='delete'){
            if(!$id)throw new RuntimeException('Marca inválida.');
            $find=$pdo->prepare('SELECT ma.logo,(SELECT COUNT(*) FROM familias f WHERE f.marca_id=ma.id) familias,(SELECT COUNT(*) FROM frotas fr WHERE fr.marca_id=ma.id) frotas FROM marcas ma WHERE ma.id=?');$find->execute([$id]);$brand=$find->fetch();
            if(!$brand)throw new RuntimeException('Marca não encontrada.');
            if((int)$brand['familias']||(int)$brand['frotas'])throw new RuntimeException('Esta marca possui famílias ou veículos de frota vinculados. Desative-a para preservar o histórico.');
            $pdo->prepare('DELETE FROM marcas WHERE id=?')->execute([$id]);remove_module_image('marcas',$brand['logo']);flash('success','Marca excluída com sucesso.');
        }
    }catch(PDOException $e){if($newLogo)remove_module_image('marcas',$newLogo);flash('error',$e->getCode()==='23000'?'Já existe uma marca com este nome ou há vínculos ativos.':'Não foi possível salvar a marca no banco de dados.');}
    catch(Throwable $e){if($newLogo)remove_module_image('marcas',$newLogo);flash('error',$e->getMessage());}
    redirect('marcas');
}

function load_brands_page(): array
{
    $pdo=db();if(!$pdo)return [];[$page,$perPage,$offset]=pagination_params();$q=trim((string)($_GET['q']??''));$status=(string)($_GET['status']??'');$where=[];$params=[];
    if($q!==''){$where[]='(ma.nome LIKE ? OR ma.pais_origem LIKE ? OR ma.descricao LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%");}
    if(in_array($status,['ativo','inativo'],true)){$where[]='ma.ativo=?';$params[]=$status==='ativo'?1:0;}$whereSql=$where?' WHERE '.implode(' AND ',$where):'';
    $count=$pdo->prepare('SELECT COUNT(*) FROM marcas ma'.$whereSql);$count->execute($params);$totalRows=(int)$count->fetchColumn();$totalPages=max(1,(int)ceil($totalRows/$perPage));
    $stmt=$pdo->prepare('SELECT ma.*,(SELECT COUNT(*) FROM familias f WHERE f.marca_id=ma.id) familias,(SELECT COUNT(*) FROM modelos m JOIN familias f ON f.id=m.familia_id WHERE f.marca_id=ma.id) modelos,(SELECT COALESCE(SUM(fr.quantidade),0) FROM frotas fr WHERE fr.marca_id=ma.id) veiculos FROM marcas ma'.$whereSql.' ORDER BY ma.nome LIMIT ? OFFSET ?');
    foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$brands=$stmt->fetchAll();
    return compact('brands','page','perPage','offset','totalRows','totalPages','q','status');
}
