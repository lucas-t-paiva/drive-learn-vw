<?php
declare(strict_types=1);

function handle_assistant_settings_post(string $route,string $method): void
{
    if($route!=='configuracoes-assistente'||$method!=='POST')return;
    verify_csrf();
    try{
        if(!is_master())throw new RuntimeException('Somente o Administrador Master pode alterar esta política.');
        $pdo=db();if(!$pdo||!database_ready())throw new RuntimeException('Banco de dados indisponível.');
        $action=(string)($_POST['action']??'');
        if($action==='save_global'){
            $limit=max(1,min(1000,(int)($_POST['limite_diario']??40)));
            $pdo->prepare("INSERT INTO assistente_limites(empresa_id,chave_escopo,limite_diario,observacao,ativo,criado_por) VALUES(NULL,'global',?,?,1,?) ON DUPLICATE KEY UPDATE limite_diario=VALUES(limite_diario),observacao=VALUES(observacao),ativo=1,criado_por=VALUES(criado_por)")->execute([$limit,trim((string)($_POST['observacao']??''))?:null,(int)user()['id']]);
            flash('success','Limite padrão do assistente atualizado.');
        }elseif($action==='save_company'){
            $companyId=(int)($_POST['empresa_id']??0);$limit=max(1,min(1000,(int)($_POST['limite_diario']??40)));
            $company=$pdo->prepare('SELECT id FROM empresas WHERE id=? AND ativo=1');$company->execute([$companyId]);if(!$company->fetchColumn())throw new RuntimeException('Selecione uma empresa ativa.');
            $pdo->prepare('INSERT INTO assistente_limites(empresa_id,chave_escopo,limite_diario,observacao,ativo,criado_por) VALUES(?,?,?,?,1,?) ON DUPLICATE KEY UPDATE empresa_id=VALUES(empresa_id),limite_diario=VALUES(limite_diario),observacao=VALUES(observacao),ativo=1,criado_por=VALUES(criado_por)')->execute([$companyId,'empresa-'.$companyId,$limit,trim((string)($_POST['observacao']??''))?:null,(int)user()['id']]);
            flash('success','Limite específico da empresa salvo.');
        }elseif($action==='delete_company'){
            $id=(int)($_POST['id']??0);$pdo->prepare("DELETE FROM assistente_limites WHERE id=? AND chave_escopo<>'global'")->execute([$id]);flash('success','Exceção removida. A empresa voltará a usar o limite global.');
        }else throw new RuntimeException('Ação inválida.');
    }catch(Throwable $e){flash('error',$e->getMessage());}
    redirect('configuracoes-assistente');
}

function load_assistant_settings_page(): array
{
    $pdo=db();$data=['ready'=>false,'global'=>40,'overrides'=>[],'companies'=>[],'usage'=>[]];
    if(!$pdo)return $data;
    try{
        $pdo->query('SELECT 1 FROM assistente_limites LIMIT 1');$data['ready']=true;
        $global=$pdo->query("SELECT * FROM assistente_limites WHERE chave_escopo='global' LIMIT 1")->fetch();if($global){$data['global']=(int)$global['limite_diario'];$data['global_row']=$global;}
        $data['overrides']=$pdo->query("SELECT al.*,e.nome_fantasia,e.tipo FROM assistente_limites al JOIN empresas e ON e.id=al.empresa_id WHERE al.chave_escopo<>'global' ORDER BY e.nome_fantasia")->fetchAll();
        $data['companies']=$pdo->query("SELECT e.id,e.nome_fantasia,e.tipo FROM empresas e WHERE e.ativo=1 AND NOT EXISTS(SELECT 1 FROM assistente_limites al WHERE al.empresa_id=e.id AND al.ativo=1) ORDER BY e.nome_fantasia")->fetchAll();
        $data['usage']=$pdo->query("SELECT DATE(ai.criado_em) dia,COUNT(*) consultas,COUNT(DISTINCT ai.usuario_id) usuarios FROM assistente_interacoes ai WHERE ai.tipo_interacao='consulta' AND ai.criado_em>=DATE_SUB(CURDATE(),INTERVAL 6 DAY) GROUP BY DATE(ai.criado_em) ORDER BY dia DESC")->fetchAll();
    }catch(Throwable){$data['ready']=false;}
    return $data;
}
