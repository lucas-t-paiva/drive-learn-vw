<?php
declare(strict_types=1);

function access_city_id(PDO $pdo, int $stateId, string $cityName): ?int
{
    $cityName = trim($cityName);
    if ($stateId < 1 || $cityName === '') return null;
    $state = $pdo->prepare('SELECT id FROM estados WHERE id=? AND ativo=1');
    $state->execute([$stateId]);
    if (!$state->fetchColumn()) throw new RuntimeException('Selecione um estado válido.');
    $stmt = $pdo->prepare('INSERT INTO cidades(estado_id,nome,ativo) VALUES(?,?,1) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id),ativo=1');
    $stmt->execute([$stateId,$cityName]);
    return (int)$pdo->lastInsertId();
}

function access_clean_document(string $document): ?string
{
    $value = preg_replace('/\D+/', '', $document) ?: '';
    if ($value === '') return null;
    if (!in_array(strlen($value), [11,14], true)) throw new RuntimeException('Informe um CPF ou CNPJ válido, contendo 11 ou 14 números.');
    return $value;
}

function access_company_allowed(int $companyId): bool
{
    return is_master() || in_array($companyId, manageable_company_ids(), true);
}

function handle_access_post(string $route, string $method): void
{
    if ($method !== 'POST' || !in_array($route, ['empresas-vwco','clientes','usuarios','permissoes'], true)) return;
    verify_csrf();
    $pdo = db();
    $action = (string)($_POST['action'] ?? '');
    $pendingImage = null;
    $previousImage = null;
    $imageModule = null;
    try {
        if (!$pdo || !database_ready()) throw new RuntimeException('O banco de dados não está disponível.');
        if (in_array($route, ['empresas-vwco','clientes'], true)) {
            $resource = $route === 'clientes' ? 'clients' : 'organizations';
            if ($action === 'create' || $action === 'update') {
                if (!can($resource, $action)) throw new RuntimeException('Seu perfil não permite salvar este cadastro.');
                $id = $action === 'update' ? (int)($_POST['id'] ?? 0) : 0;
                if ($route === 'empresas-vwco' && !is_master() && $action === 'create') throw new RuntimeException('Somente o Administrador Master pode cadastrar empresas VWCO ou concessionárias.');
                if ($id && !access_company_allowed($id)) throw new RuntimeException('Você não pode alterar esta empresa.');
                $type = $route === 'clientes' ? 'cliente' : (string)($_POST['tipo'] ?? 'concessionaria');
                if ($route === 'empresas-vwco' && !in_array($type, ['vwco','concessionaria'], true)) throw new RuntimeException('Selecione um tipo de empresa válido.');
                $subtype = (string)($_POST['subtipo'] ?? 'matriz');
                if (!in_array($subtype, ['fabrica','polo','matriz','filial','assistencia','outro'], true)) $subtype = 'matriz';
                $legalName = trim((string)($_POST['razao_social'] ?? ''));
                $tradeName = trim((string)($_POST['nome_fantasia'] ?? ''));
                if ($legalName === '' || $tradeName === '') throw new RuntimeException('Informe a razão social e o nome fantasia.');
                $document = access_clean_document((string)($_POST['documento'] ?? ''));
                $email = trim((string)($_POST['email'] ?? '')) ?: null;
                if ($email && !filter_var($email, FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Informe um e-mail válido.');
                $cityId = access_city_id($pdo, (int)($_POST['estado_id'] ?? 0), (string)($_POST['cidade'] ?? ''));
                $parentId = (int)($_POST['empresa_pai_id'] ?? 0) ?: null;
                if ($parentId === $id) throw new RuntimeException('Uma empresa não pode ser unidade dela mesma.');
                if ($id) { $currentImage = $pdo->prepare('SELECT logo FROM empresas WHERE id=?'); $currentImage->execute([$id]); $previousImage = $currentImage->fetchColumn() ?: null; }
                $imageModule = 'empresas';
                $pendingImage = save_optimized_image($imageModule, $_FILES['logo'] ?? [], $previousImage, 900, 600);
                $values = [$parentId,$type,$subtype,$legalName,$tradeName,$document,$email,trim((string)($_POST['telefone'] ?? '')) ?: null,$cityId,trim((string)($_POST['endereco'] ?? '')) ?: null,trim((string)($_POST['cep'] ?? '')) ?: null,$pendingImage,(int)isset($_POST['ativo'])];
                $pdo->beginTransaction();
                if ($action === 'create') {
                    $stmt = $pdo->prepare('INSERT INTO empresas(empresa_pai_id,tipo,subtipo,razao_social,nome_fantasia,documento,email,telefone,cidade_id,endereco,cep,logo,ativo) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)');
                    $stmt->execute($values); $id = (int)$pdo->lastInsertId();
                } else {
                    $values[] = $id;
                    $stmt = $pdo->prepare('UPDATE empresas SET empresa_pai_id=?,tipo=?,subtipo=?,razao_social=?,nome_fantasia=?,documento=?,email=?,telefone=?,cidade_id=?,endereco=?,cep=?,logo=?,ativo=? WHERE id=?');
                    $stmt->execute($values);
                }
                if ($route === 'clientes') {
                    $legacy = $pdo->prepare('SELECT id FROM clientes WHERE empresa_id=?'); $legacy->execute([$id]); $legacyId = $legacy->fetchColumn();
                    if ($legacyId) {
                        $pdo->prepare('UPDATE clientes SET nome=?,nome_fantasia=?,documento=?,email=?,telefone=?,ativo=? WHERE id=?')->execute([$legalName,$tradeName,$document,$email,trim((string)($_POST['telefone'] ?? '')),(int)isset($_POST['ativo']),(int)$legacyId]);
                    } else {
                        $pdo->prepare('INSERT INTO clientes(empresa_id,nome,nome_fantasia,documento,email,telefone,ativo) VALUES(?,?,?,?,?,?,?)')->execute([$id,$legalName,$tradeName,$document,$email,trim((string)($_POST['telefone'] ?? '')),(int)isset($_POST['ativo'])]);
                    }
                    $partners = array_values(array_unique(array_filter(array_map('intval',(array)($_POST['empresas_vw'] ?? [])))));
                    if (!is_master() && active_company_id() && (user()['active_company_type'] ?? '') !== 'cliente') $partners[] = active_company_id();
                    $partners = array_values(array_unique($partners));
                    if (is_master()) $pdo->prepare('DELETE FROM empresa_clientes WHERE cliente_id=?')->execute([$id]);
                    $validPartner = $pdo->prepare("SELECT id FROM empresas WHERE id=? AND tipo IN('vwco','concessionaria') AND ativo=1");
                    $link = $pdo->prepare('INSERT INTO empresa_clientes(empresa_vw_id,cliente_id,tipo_relacao,ativo,criado_por) VALUES(?,?,?,1,?) ON DUPLICATE KEY UPDATE tipo_relacao=VALUES(tipo_relacao),ativo=1');
                    foreach ($partners as $partnerId) {
                        $validPartner->execute([$partnerId]); if (!$validPartner->fetchColumn()) continue;
                        $link->execute([$partnerId,$id,(string)($_POST['tipo_relacao'] ?? 'assistencia'),user()['id'] ?? null]);
                    }
                }
                $pdo->commit();
                if ($pendingImage && $previousImage && $pendingImage !== $previousImage) remove_module_image($imageModule, $previousImage);
                flash('success', ($route === 'clientes' ? 'Cliente' : 'Empresa') . ($action === 'create' ? ' cadastrado' : ' atualizado') . ' com sucesso.');
            } elseif ($action === 'delete') {
                if (!can($resource, 'delete')) throw new RuntimeException('Seu perfil não permite desativar este cadastro.');
                $id = (int)($_POST['id'] ?? 0);
                if (!$id || !access_company_allowed($id)) throw new RuntimeException('Empresa não encontrada ou fora do seu acesso.');
                if ($id === active_company_id()) throw new RuntimeException('Não é possível desativar a empresa que está ativa na sua sessão.');
                $pdo->prepare('UPDATE empresas SET ativo=0 WHERE id=?')->execute([$id]);
                $pdo->prepare('UPDATE clientes SET ativo=0 WHERE empresa_id=?')->execute([$id]);
                flash('success', 'Cadastro desativado com sucesso. O histórico e os vínculos foram preservados.');
            }
        } elseif ($route === 'usuarios') {
            if ($action === 'create' || $action === 'update') {
                if (!can('users', $action)) throw new RuntimeException('Seu perfil não permite salvar usuários.');
                $id = $action === 'update' ? (int)($_POST['id'] ?? 0) : 0;
                $clientContext = !is_master() && (user()['active_company_type'] ?? '') === 'cliente';
                $selfUpdate = $action === 'update' && $id === (int)(user()['id'] ?? 0);
                $name = trim((string)($_POST['nome'] ?? '')); $email = strtolower(trim((string)($_POST['email'] ?? ''))); $password = (string)($_POST['senha'] ?? '');
                if ($name === '' || !filter_var($email, FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Informe o nome e um e-mail válido.');
                $existingEmail = $pdo->prepare('SELECT id FROM usuarios WHERE email=?'); $existingEmail->execute([$email]); $preExistingId = (int)$existingEmail->fetchColumn();
                if ($action === 'create' && !$preExistingId && strlen($password) < 8) throw new RuntimeException('A senha inicial deve ter pelo menos 8 caracteres.');
                if ($password !== '' && strlen($password) < 8) throw new RuntimeException('A nova senha deve ter pelo menos 8 caracteres.');
                $allowedCompanies = manageable_company_ids();
                $companyIds = array_values(array_unique(array_filter(array_map('intval',(array)($_POST['empresa_ids'] ?? [])))));
                if ($clientContext) {
                    $activeCompanyId = active_company_id() ?? 0;
                    if (!$activeCompanyId || !in_array($activeCompanyId,$allowedCompanies,true)) throw new RuntimeException('A empresa cliente ativa não está disponível para este cadastro.');
                    $companyIds = [$activeCompanyId];
                }
                if (!$companyIds) throw new RuntimeException('Vincule o usuário a pelo menos uma empresa.');
                foreach ($companyIds as $companyId) if (!in_array($companyId,$allowedCompanies,true)) throw new RuntimeException('Uma das empresas selecionadas está fora do seu acesso.');
                $profileMap = (array)($_POST['perfil_empresa'] ?? []); $memberships = [];
                $profileQuery = $pdo->prepare('SELECT p.id,p.slug,p.nivel,p.tipo_empresa,e.tipo empresa_tipo FROM perfis p JOIN empresas e ON e.id=? WHERE p.id=? AND p.ativo=1');
                foreach ($companyIds as $companyId) {
                    $profileId = (int)($profileMap[$companyId] ?? 0); $profileQuery->execute([$companyId,$profileId]); $profile = $profileQuery->fetch();
                    if ($clientContext && $selfUpdate && $companyId === active_company_id()) {
                        $ownProfile=$pdo->prepare('SELECT perfil_id FROM usuario_empresas WHERE usuario_id=? AND empresa_id=? AND ativo=1');$ownProfile->execute([$id,$companyId]);$profileId=(int)$ownProfile->fetchColumn();
                        $profileQuery->execute([$companyId,$profileId]);$profile=$profileQuery->fetch();
                    }
                    if (!$profile) throw new RuntimeException('Selecione um perfil válido para cada empresa.');
                    if (!is_master() && ((int)$profile['nivel'] > (int)(user()['role_level'] ?? 0) || $profile['slug'] === 'administrador')) throw new RuntimeException('Você não pode atribuir um perfil superior ao seu.');
                    if ($profile['tipo_empresa'] !== 'qualquer' && $profile['tipo_empresa'] !== $profile['empresa_tipo'] && !($profile['tipo_empresa']==='vwco' && $profile['empresa_tipo']==='concessionaria')) throw new RuntimeException('O perfil escolhido não é compatível com o tipo da empresa.');
                    if ($profile['empresa_tipo']==='cliente' && !in_array($profile['slug'],['cliente','colaborador-cliente'],true)) throw new RuntimeException('Empresas clientes permitem somente os perfis Gestor do Cliente e Colaborador do Cliente.');
                    $memberships[] = [$companyId,$profileId,$profile['slug']];
                }
                $targetUserId = $action === 'create' ? $preExistingId : $id;
                if ($targetUserId) { $currentImage = $pdo->prepare('SELECT foto FROM usuarios WHERE id=?'); $currentImage->execute([$targetUserId]); $previousImage = $currentImage->fetchColumn() ?: null; }
                $imageModule = 'usuarios';
                $pendingImage = save_optimized_image($imageModule, $_FILES['foto'] ?? [], $previousImage, 600, 600);
                $pdo->beginTransaction();
                $emailOwner = $preExistingId;
                if ($action === 'create' && $emailOwner) { $id = $emailOwner; $existing = true; }
                elseif ($action === 'update' && $emailOwner && $emailOwner !== $id) throw new RuntimeException('Este e-mail já pertence a outro usuário.');
                if (!$id) {
                    $primaryProfile = (int)$memberships[0][1];
                    $pdo->prepare('INSERT INTO usuarios(perfil_id,nome,email,foto,senha_hash,ativo) VALUES(?,?,?,?,?,?)')->execute([$primaryProfile,$name,$email,$pendingImage,password_hash($password,PASSWORD_DEFAULT),(int)isset($_POST['ativo'])]);
                    $id = (int)$pdo->lastInsertId(); $existing = false;
                } elseif (!empty($existing) && $action === 'create') {
                    // A identidade já existe: preserva nome, senha e demais vínculos; apenas acrescenta os novos acessos.
                    if ($pendingImage !== $previousImage) $pdo->prepare('UPDATE usuarios SET foto=? WHERE id=?')->execute([$pendingImage,$id]);
                } else {
                    $allowedTarget = is_master();
                    if (!$allowedTarget) { $marks=implode(',',array_fill(0,count($allowedCompanies),'?')); $check=$pdo->prepare("SELECT COUNT(*) FROM usuario_empresas WHERE usuario_id=? AND empresa_id IN ({$marks})"); $check->execute(array_merge([$id],$allowedCompanies)); $allowedTarget=(bool)$check->fetchColumn(); }
                    if (!$allowedTarget && $action === 'update') throw new RuntimeException('Este usuário está fora do seu acesso.');
                    $sql='UPDATE usuarios SET nome=?,email=?,foto=?,ativo=?'.($password!==''?',senha_hash=?':'').' WHERE id=?';
                    $params=[$name,$email,$pendingImage,$selfUpdate?1:(int)isset($_POST['ativo'])]; if($password!=='')$params[]=password_hash($password,PASSWORD_DEFAULT); $params[]=$id; $pdo->prepare($sql)->execute($params);
                }
                if (!(!empty($existing) && $action === 'create')) {
                    if (is_master()) $pdo->prepare('DELETE FROM usuario_empresas WHERE usuario_id=?')->execute([$id]);
                    else { $marks=implode(',',array_fill(0,count($allowedCompanies),'?')); $pdo->prepare("DELETE FROM usuario_empresas WHERE usuario_id=? AND empresa_id IN ({$marks})")->execute(array_merge([$id],$allowedCompanies)); }
                }
                $memberStmt=$pdo->prepare('INSERT INTO usuario_empresas(usuario_id,empresa_id,perfil_id,principal,administrador,ativo,cadastrado_por) VALUES(?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE perfil_id=VALUES(perfil_id),principal=VALUES(principal),administrador=VALUES(administrador),ativo=VALUES(ativo),cadastrado_por=VALUES(cadastrado_por)');
                foreach($memberships as $index=>$membership)$memberStmt->execute([$id,$membership[0],$membership[1],(!empty($existing)&&$action==='create')?0:($index===0?1:0),in_array($membership[2],['administrador','admin-empresa'],true)?1:0,1,user()['id']??null]);
                if (!(!empty($existing) && $action === 'create')) $pdo->prepare('UPDATE usuarios SET perfil_id=? WHERE id=?')->execute([(int)$memberships[0][1],$id]);
                $pdo->commit();
                if ($pendingImage && $previousImage && $pendingImage !== $previousImage) remove_module_image($imageModule, $previousImage);
                flash('success', !empty($existing) ? 'O e-mail já existia e recebeu os novos vínculos de empresa.' : 'Usuário salvo com sucesso.');
            } elseif ($action === 'delete') {
                if (!can('users','delete')) throw new RuntimeException('Seu perfil não permite desativar usuários.');
                $id=(int)($_POST['id']??0); if($id===(int)(user()['id']??0)) throw new RuntimeException('Você não pode desativar o próprio acesso.');
                $pdo->prepare('UPDATE usuarios SET ativo=0 WHERE id=?')->execute([$id]);
                flash('success','Usuário desativado com sucesso.');
            }
        } elseif ($route === 'permissoes') {
            if ($action === 'create' || $action === 'update') {
                if (!can('permissions',$action)) throw new RuntimeException('Seu perfil não permite salvar perfis.');
                $id=$action==='update'?(int)($_POST['id']??0):0; $name=trim((string)($_POST['nome']??'')); $level=max(1,min(99,(int)($_POST['nivel']??50)));
                if($name==='')throw new RuntimeException('Informe o nome do perfil.');
                if(!is_master()&&$level>=(int)(user()['role_level']??0))throw new RuntimeException('O novo perfil deve ter nível inferior ao seu.');
                if($id){$find=$pdo->prepare('SELECT * FROM perfis WHERE id=?');$find->execute([$id]);$current=$find->fetch();if(!$current)throw new RuntimeException('Perfil não encontrado.');if($current['slug']==='administrador')throw new RuntimeException('O perfil Master não pode ser alterado por esta tela.');if(!is_master()&&(int)$current['empresa_id']!==active_company_id())throw new RuntimeException('Este perfil pertence a outra empresa.');}
                $companyId=is_master()?((int)($_POST['empresa_id']??0)?:null):active_company_id(); $companyType='qualquer';
                if($companyId){$type=$pdo->prepare('SELECT tipo FROM empresas WHERE id=?');$type->execute([$companyId]);$companyType=(string)$type->fetchColumn();}
                $slug=($companyId?'empresa-'.$companyId.'-':'').slugify($name); $pdo->beginTransaction();
                if($action==='create'){$pdo->prepare('INSERT INTO perfis(empresa_id,nome,slug,escopo,nivel,sistema,tipo_empresa,pode_gerenciar_usuarios,ativo) VALUES(?,?,?,"empresa",?,0,?,?,?)')->execute([$companyId,$name,$slug,$level,$companyType,(int)isset($_POST['gerencia_usuarios']),(int)isset($_POST['ativo'])]);$id=(int)$pdo->lastInsertId();}
                else{$pdo->prepare('UPDATE perfis SET nome=?,nivel=?,pode_gerenciar_usuarios=?,ativo=? WHERE id=?')->execute([$name,$level,(int)isset($_POST['gerencia_usuarios']),(int)isset($_POST['ativo']),$id]);$pdo->prepare('DELETE FROM perfil_permissoes WHERE perfil_id=?')->execute([$id]);}
                $permissionIds=array_values(array_unique(array_filter(array_map('intval',(array)($_POST['permissoes']??[])))));$insert=$pdo->prepare('INSERT INTO perfil_permissoes(perfil_id,permissao_id,permitido) VALUES(?,?,1)');
                $allowedPermissions=is_master()?null:(user()['permissions']??[]);$permission=$pdo->prepare('SELECT id,CONCAT(recurso,".",acao) chave FROM permissoes WHERE id=?');
                foreach($permissionIds as $permissionId){$permission->execute([$permissionId]);$row=$permission->fetch();if(!$row)continue;if($allowedPermissions!==null&&!in_array($row['chave'],$allowedPermissions,true))continue;$insert->execute([$id,$permissionId]);}
                $pdo->commit();flash('success','Perfil e permissões salvos com sucesso.');
            } elseif($action==='delete'){
                if(!can('permissions','delete'))throw new RuntimeException('Seu perfil não permite excluir perfis.');$id=(int)($_POST['id']??0);$find=$pdo->prepare('SELECT sistema,slug,(SELECT COUNT(*) FROM usuario_empresas ue WHERE ue.perfil_id=p.id) usuarios FROM perfis p WHERE p.id=?');$find->execute([$id]);$profile=$find->fetch();if(!$profile)throw new RuntimeException('Perfil não encontrado.');if($profile['sistema'])throw new RuntimeException('Perfis padrão do sistema não podem ser excluídos.');if((int)$profile['usuarios']>0)throw new RuntimeException('Este perfil possui usuários vinculados.');$pdo->prepare('DELETE FROM perfis WHERE id=?')->execute([$id]);flash('success','Perfil excluído com sucesso.');
            }
        }
    } catch (PDOException $e) {
        if ($pdo && $pdo->inTransaction()) $pdo->rollBack();
        if ($pendingImage && $pendingImage !== $previousImage && $imageModule) remove_module_image($imageModule, $pendingImage);
        flash('error',$e->getCode()==='23000'?'Não foi possível concluir: documento, e-mail ou nome já cadastrado, ou existem vínculos ativos.':'Não foi possível salvar os dados no banco.');
    } catch (Throwable $e) {
        if ($pdo && $pdo->inTransaction()) $pdo->rollBack();
        if ($pendingImage && $pendingImage !== $previousImage && $imageModule) remove_module_image($imageModule, $pendingImage);
        flash('error',$e->getMessage());
    }
    redirect($route);
}

function load_access_page(string $resource): array
{
    $pdo=db(); if(!$pdo)return [];
    $data=['states'=>$pdo->query('SELECT id,sigla,nome FROM estados WHERE ativo=1 ORDER BY nome')->fetchAll()];
    if(in_array($resource,['organizations','clients'],true)){
        [$page,$perPage,$offset]=pagination_params();$q=trim((string)($_GET['q']??''));$status=(string)($_GET['status']??'');$params=[];$where=[];
        $where[]=$resource==='clients'?"e.tipo='cliente'":"e.tipo IN('vwco','concessionaria')";
        if($q!==''){$where[]='(e.razao_social LIKE ? OR e.nome_fantasia LIKE ? OR e.documento LIKE ? OR c.nome LIKE ?)';array_push($params,"%{$q}%","%{$q}%","%{$q}%","%{$q}%");}
        if(in_array($status,['ativo','inativo'],true)){$where[]='e.ativo=?';$params[]=$status==='ativo'?1:0;}
        if(!is_master()){
            $ids=$resource==='clients'?accessible_client_company_ids():manageable_company_ids();if(!$ids)$ids=[0];$marks=implode(',',array_fill(0,count($ids),'?'));$where[]="e.id IN ({$marks})";$params=array_merge($params,$ids);
        }
        $whereSql=' WHERE '.implode(' AND ',$where);$count=$pdo->prepare('SELECT COUNT(*) FROM empresas e LEFT JOIN cidades c ON c.id=e.cidade_id'.$whereSql);$count->execute($params);$total=(int)$count->fetchColumn();$pages=max(1,(int)ceil($total/$perPage));
        $sql='SELECT e.*,c.nome cidade_nome,es.id estado_id,es.sigla uf,ep.nome_fantasia empresa_pai_nome,(SELECT COUNT(*) FROM usuario_empresas ue WHERE ue.empresa_id=e.id AND ue.ativo=1) usuarios,(SELECT COUNT(*) FROM empresa_clientes ec WHERE '.($resource==='clients'?'ec.cliente_id':'ec.empresa_vw_id').'=e.id AND ec.ativo=1) vinculos,(SELECT GROUP_CONCAT(ec.empresa_vw_id) FROM empresa_clientes ec WHERE ec.cliente_id=e.id AND ec.ativo=1) parceiro_ids FROM empresas e LEFT JOIN cidades c ON c.id=e.cidade_id LEFT JOIN estados es ON es.id=c.estado_id LEFT JOIN empresas ep ON ep.id=e.empresa_pai_id'.$whereSql.' ORDER BY e.nome_fantasia LIMIT ? OFFSET ?';$stmt=$pdo->prepare($sql);foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();
        $data+=['companies'=>$stmt->fetchAll(),'q'=>$q,'status'=>$status,'page'=>$page,'perPage'=>$perPage,'offset'=>$offset,'totalRows'=>$total,'totalPages'=>$pages,'parentOptions'=>$pdo->query("SELECT id,nome_fantasia FROM empresas WHERE tipo IN('vwco','concessionaria') AND ativo=1 ORDER BY nome_fantasia")->fetchAll(),'partnerOptions'=>$pdo->query("SELECT id,nome_fantasia,tipo FROM empresas WHERE tipo IN('vwco','concessionaria') AND ativo=1 ORDER BY nome_fantasia")->fetchAll()];
    }elseif($resource==='users'){
        $allowed=manageable_company_ids();if(!$allowed)$allowed=[0];$marks=implode(',',array_fill(0,count($allowed),'?'));$stmt=$pdo->prepare("SELECT DISTINCT u.*,(SELECT GROUP_CONCAT(CONCAT(e.nome_fantasia,'|',p.nome) ORDER BY ue.principal DESC,e.nome_fantasia SEPARATOR ';;') FROM usuario_empresas ue JOIN empresas e ON e.id=ue.empresa_id JOIN perfis p ON p.id=ue.perfil_id WHERE ue.usuario_id=u.id AND ue.ativo=1) vinculos,(SELECT GROUP_CONCAT(CONCAT(ue.empresa_id,':',ue.perfil_id) SEPARATOR ',') FROM usuario_empresas ue WHERE ue.usuario_id=u.id AND ue.ativo=1) vinculo_ids FROM usuarios u JOIN usuario_empresas ux ON ux.usuario_id=u.id WHERE ux.empresa_id IN ({$marks}) ORDER BY u.nome");$stmt->execute($allowed);
        $companyStmt=$pdo->prepare("SELECT id,nome_fantasia,tipo FROM empresas WHERE id IN ({$marks}) AND ativo=1 ORDER BY nome_fantasia");$companyStmt->execute($allowed);$maxLevel=is_master()?100:(int)(user()['role_level']??0);$clientContext=!is_master()&&(user()['active_company_type']??'')==='cliente';$profileRestriction=$clientContext?' AND slug IN("cliente","colaborador-cliente")':(is_master()?'':' AND slug<>"administrador"');$profileStmt=$pdo->prepare('SELECT id,empresa_id,nome,slug,nivel,tipo_empresa FROM perfis WHERE ativo=1 AND nivel<=?'.$profileRestriction.' ORDER BY nivel DESC,nome');$profileStmt->execute([$maxLevel]);
        $data+=['users'=>$stmt->fetchAll(),'companyOptions'=>$companyStmt->fetchAll(),'profileOptions'=>$profileStmt->fetchAll()];
    }elseif($resource==='permissions'){
        $where=is_master()?'':' WHERE (p.empresa_id=? OR p.empresa_id IS NULL) AND p.slug<>"administrador"';$stmt=$pdo->prepare('SELECT p.*,(SELECT COUNT(*) FROM usuario_empresas ue WHERE ue.perfil_id=p.id AND ue.ativo=1) usuarios,(SELECT GROUP_CONCAT(pp.permissao_id) FROM perfil_permissoes pp WHERE pp.perfil_id=p.id AND pp.permitido=1) permission_ids,e.nome_fantasia empresa_nome FROM perfis p LEFT JOIN empresas e ON e.id=p.empresa_id'.$where.' ORDER BY p.nivel DESC,p.nome');$stmt->execute(is_master()?[]:[active_company_id()]);
        $permissionRows=$pdo->query('SELECT id,recurso,acao,descricao FROM permissoes ORDER BY recurso,FIELD(acao,"view","create","update","delete")')->fetchAll();$groups=[];foreach($permissionRows as $permission)$groups[$permission['recurso']][]=$permission;
        $data+=['profiles'=>$stmt->fetchAll(),'permissionGroups'=>$groups,'companyOptions'=>$pdo->query('SELECT id,nome_fantasia FROM empresas WHERE ativo=1 ORDER BY nome_fantasia')->fetchAll()];
    }
    return $data;
}
