<?php
declare(strict_types=1);

function report_taxonomy_slug(string $value): string
{
    $value=mb_strtolower(trim($value),'UTF-8');
    $ascii=@iconv('UTF-8','ASCII//TRANSLIT//IGNORE',$value);
    if(is_string($ascii))$value=$ascii;
    return trim(preg_replace('/[^a-z0-9]+/','-',$value)?:'','-');
}

function report_category_types(): array
{
    return ['falha'=>'Falha','erro'=>'Erro','melhoria'=>'Melhoria','sugestao'=>'Sugestão','geral'=>'Geral'];
}

function handle_report_taxonomy_post(string $route,string $method): void
{
    $resources=['categorias-relatos'=>'report_categories','termos-classificacao'=>'report_terms'];
    if($method!=='POST'||!isset($resources[$route]))return;
    verify_csrf();$pdo=db();$resource=$resources[$route];
    try{
        if(!$pdo||!database_ready())throw new RuntimeException('Banco de dados indisponível.');
        $action=(string)($_POST['action']??'');
        if(!in_array($action,['create','update','delete'],true))throw new RuntimeException('Ação inválida.');
        if(!can($resource,$action))throw new RuntimeException('Seu perfil não permite realizar esta ação.');

        if($resource==='report_categories'){
            if($action==='delete'){
                $id=(int)($_POST['id']??0);
                $stmt=$pdo->prepare('SELECT mc.nome,(SELECT COUNT(*) FROM category_terms ct WHERE ct.categoria_id=mc.id) termos,(SELECT COUNT(*) FROM service_reports sr WHERE sr.categoria_id=mc.id) relatos,(SELECT COUNT(*) FROM master_categories child WHERE child.parent_id=mc.id) filhas FROM master_categories mc WHERE mc.id=?');$stmt->execute([$id]);$current=$stmt->fetch();
                if(!$current)throw new RuntimeException('Categoria não encontrada.');
                if((int)$current['termos']>0||(int)$current['relatos']>0||(int)$current['filhas']>0)throw new RuntimeException('Esta categoria possui termos, relatos ou categorias vinculadas. Inative-a ou remova os vínculos primeiro.');
                $pdo->prepare('DELETE FROM master_categories WHERE id=?')->execute([$id]);flash('success','Categoria de relato excluída.');
            }else{
                $id=$action==='update'?(int)($_POST['id']??0):0;$name=trim((string)($_POST['nome']??''));$type=(string)($_POST['tipo']??'geral');$sectorId=(int)($_POST['setor_padrao_id']??0);
                $first=max(1,min(720,(int)($_POST['sla_primeira_resposta_horas']??8)));$resolution=max($first,min(8760,(int)($_POST['sla_resolucao_horas']??72)));
                if($name===''||!isset(report_category_types()[$type]))throw new RuntimeException('Informe o nome e o tipo da categoria.');
                $slug=report_taxonomy_slug($name);if($slug==='')throw new RuntimeException('Informe um nome válido.');
                $duplicate=$pdo->prepare('SELECT id FROM master_categories WHERE slug=? AND id<>?');$duplicate->execute([$slug,$id]);if($duplicate->fetchColumn())$slug.='-'.substr(hash('crc32b',$name.($id?:microtime())),0,5);
                if($action==='create'){
                    $stmt=$pdo->prepare('INSERT INTO master_categories(setor_padrao_id,nome,slug,tipo,descricao,sla_primeira_resposta_horas,sla_resolucao_horas,ativo) VALUES(?,?,?,?,?,?,?,?)');
                    $stmt->execute([$sectorId?:null,$name,$slug,$type,trim((string)($_POST['descricao']??''))?:null,$first,$resolution,(int)isset($_POST['ativo'])]);
                    flash('success','Categoria de relato cadastrada.');
                }else{
                    if(!$id)throw new RuntimeException('Categoria inválida.');
                    $stmt=$pdo->prepare('UPDATE master_categories SET setor_padrao_id=?,nome=?,slug=?,tipo=?,descricao=?,sla_primeira_resposta_horas=?,sla_resolucao_horas=?,ativo=? WHERE id=?');
                    $stmt->execute([$sectorId?:null,$name,$slug,$type,trim((string)($_POST['descricao']??''))?:null,$first,$resolution,(int)isset($_POST['ativo']),$id]);
                    flash('success','Categoria de relato atualizada.');
                }
            }
        }else{
            if($action==='delete'){
                $id=(int)($_POST['id']??0);$stmt=$pdo->prepare('DELETE FROM category_terms WHERE id=?');$stmt->execute([$id]);if(!$stmt->rowCount())throw new RuntimeException('Termo não encontrado.');flash('success','Termo de classificação excluído.');
            }else{
                $id=$action==='update'?(int)($_POST['id']??0):0;$categoryId=(int)($_POST['categoria_id']??0);$term=mb_strtolower(trim((string)($_POST['termo']??'')),'UTF-8');$weight=max(1,min(10,(int)($_POST['peso']??1)));
                if(!$categoryId||mb_strlen($term)<2)throw new RuntimeException('Selecione a categoria e informe um termo com pelo menos dois caracteres.');
                $category=$pdo->prepare('SELECT id FROM master_categories WHERE id=?');$category->execute([$categoryId]);if(!$category->fetchColumn())throw new RuntimeException('Categoria de relato não encontrada.');
                $duplicate=$pdo->prepare('SELECT id FROM category_terms WHERE categoria_id=? AND termo=? AND id<>?');$duplicate->execute([$categoryId,$term,$id]);if($duplicate->fetchColumn())throw new RuntimeException('Este termo já está vinculado à categoria selecionada.');
                if($action==='create')$pdo->prepare('INSERT INTO category_terms(categoria_id,termo,peso,ativo) VALUES(?,?,?,?)')->execute([$categoryId,$term,$weight,(int)isset($_POST['ativo'])]);
                else{$pdo->prepare('UPDATE category_terms SET categoria_id=?,termo=?,peso=?,ativo=? WHERE id=?')->execute([$categoryId,$term,$weight,(int)isset($_POST['ativo']),$id]);}
                flash('success',$action==='create'?'Termo de classificação cadastrado.':'Termo de classificação atualizado.');
            }
        }
    }catch(PDOException $e){flash('error',$e->getCode()==='23000'?'Já existe um cadastro igual ou há vínculos que impedem a operação.':'Não foi possível salvar no banco de dados.');}
    catch(Throwable $e){flash('error',$e->getMessage());}
    redirect($route);
}

function load_report_taxonomy_page(string $resource): array
{
    $pdo=db();$data=['ready'=>false,'rows'=>[],'categories'=>[],'sectors'=>[],'total'=>0,'pages'=>1];
    if(!$pdo)return $data;
    try{
        $pdo->query('SELECT 1 FROM master_categories LIMIT 1');$data['ready']=true;
        [$page,$perPage,$offset]=pagination_params();$q=trim((string)($_GET['q']??''));$status=(string)($_GET['status']??'');$type=(string)($_GET['tipo']??'');$categoryId=(int)($_GET['categoria']??0);
        $data['page']=$page;$data['per_page']=$perPage;$data['offset']=$offset;$data['q']=$q;$data['status']=$status;$data['type']=$type;$data['category_filter']=$categoryId;
        $data['categories']=$pdo->query('SELECT id,nome,tipo FROM master_categories WHERE ativo=1 ORDER BY nome')->fetchAll();
        $data['sectors']=$pdo->query('SELECT id,nome FROM setores WHERE ativo=1 ORDER BY nome')->fetchAll();
        $where=[];$params=[];
        if($resource==='report_categories'){
            if($q!==''){$where[]='(mc.nome LIKE ? OR mc.descricao LIKE ? OR mc.slug LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%");}
            if(isset(report_category_types()[$type])){$where[]='mc.tipo=?';$params[]=$type;}
            if(in_array($status,['ativo','inativo'],true)){$where[]='mc.ativo=?';$params[]=$status==='ativo'?1:0;}
            $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
            $count=$pdo->prepare('SELECT COUNT(*) FROM master_categories mc'.$whereSql);$count->execute($params);$data['total']=(int)$count->fetchColumn();
            $stmt=$pdo->prepare('SELECT mc.*,s.nome setor_nome,(SELECT COUNT(*) FROM category_terms ct WHERE ct.categoria_id=mc.id) termos,(SELECT COUNT(*) FROM service_reports sr WHERE sr.categoria_id=mc.id) relatos FROM master_categories mc LEFT JOIN setores s ON s.id=mc.setor_padrao_id'.$whereSql.' ORDER BY mc.nome LIMIT ? OFFSET ?');
        }else{
            if($q!==''){$where[]='(ct.termo LIKE ? OR mc.nome LIKE ?)';array_push($params,"%{$q}%","%{$q}%");}
            if($categoryId){$where[]='ct.categoria_id=?';$params[]=$categoryId;}
            if(in_array($status,['ativo','inativo'],true)){$where[]='ct.ativo=?';$params[]=$status==='ativo'?1:0;}
            $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
            $count=$pdo->prepare('SELECT COUNT(*) FROM category_terms ct JOIN master_categories mc ON mc.id=ct.categoria_id'.$whereSql);$count->execute($params);$data['total']=(int)$count->fetchColumn();
            $stmt=$pdo->prepare('SELECT ct.*,mc.nome categoria_nome,mc.tipo categoria_tipo FROM category_terms ct JOIN master_categories mc ON mc.id=ct.categoria_id'.$whereSql.' ORDER BY mc.nome,ct.peso DESC,ct.termo LIMIT ? OFFSET ?');
        }
        $data['pages']=max(1,(int)ceil($data['total']/$perPage));
        foreach($params as $index=>$value)$stmt->bindValue($index+1,$value);
        $stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$data['rows']=$stmt->fetchAll();
    }catch(Throwable){$data['ready']=false;}
    return $data;
}
