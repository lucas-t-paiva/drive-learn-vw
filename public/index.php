<?php
declare(strict_types=1);
require __DIR__ . '/../app/bootstrap.php';

$route = trim((string)($_GET['route'] ?? ''), '/');
$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';

if ($route === 'login') {
    if (user()) redirect('dashboard');
    $error = null;
    if ($method === 'POST') {
        verify_csrf();
        if (login_user(trim((string)$_POST['email']), (string)$_POST['password'])) redirect('dashboard');
        $error = 'E-mail ou senha inválidos. Confira os dados e tente novamente.';
    }
    require __DIR__ . '/../views/login.php'; exit;
}

if ($route === 'logout') {
    if ($method === 'POST') verify_csrf();
    $_SESSION = []; session_destroy(); redirect('login');
}

require_auth();
if (!refresh_user_session()) { $_SESSION=[]; session_destroy(); redirect('login'); }
$data = demo_data();
$flash = pull_flash();
require_once __DIR__ . '/../app/access_module.php';
require_once __DIR__ . '/../app/fleet_module.php';
require_once __DIR__ . '/../app/library_module.php';
require_once __DIR__ . '/../app/reports_module.php';
require_once __DIR__ . '/../app/dashboard_module.php';

if ($route === 'empresa-ativa' && $method === 'POST') {
    verify_csrf();
    if (!switch_active_company((int)($_POST['empresa_id'] ?? 0))) flash('error','Você não possui acesso à empresa selecionada.');
    redirect('dashboard');
}

handle_access_post($route, $method);
handle_fleet_post($route, $method);
handle_library_event($route, $method);

if ($route === 'familias' && $method === 'POST') {
    verify_csrf();
    $action = (string)($_POST['action'] ?? '');
    try {
        $pdo = db();
        if (!$pdo || !database_ready()) throw new RuntimeException('O banco de dados não está disponível.');

        if ($action === 'create') {
            if (!can('families', 'create')) throw new RuntimeException('Seu perfil não permite cadastrar famílias.');
            $name = trim((string)($_POST['nome'] ?? ''));
            if ($name === '') throw new RuntimeException('Informe o nome da família.');
            $image = save_family_image($_FILES['imagem'] ?? []);
            $stmt = $pdo->prepare('INSERT INTO familias(nome, descricao, imagem, ativo) VALUES(?,?,?,?)');
            $stmt->execute([$name, trim((string)($_POST['descricao'] ?? '')), $image, (int)isset($_POST['ativo'])]);
            flash('success', 'Família cadastrada com sucesso.');
        } elseif ($action === 'update') {
            if (!can('families', 'update')) throw new RuntimeException('Seu perfil não permite editar famílias.');
            $id = filter_var($_POST['id'] ?? null, FILTER_VALIDATE_INT);
            $name = trim((string)($_POST['nome'] ?? ''));
            if (!$id || $name === '') throw new RuntimeException('Dados da família inválidos.');
            $find = $pdo->prepare('SELECT imagem FROM familias WHERE id=?'); $find->execute([$id]);
            $current = $find->fetch();
            if (!$current) throw new RuntimeException('Família não encontrada.');
            $image = save_family_image($_FILES['imagem'] ?? [], $current['imagem']);
            $stmt = $pdo->prepare('UPDATE familias SET nome=?, descricao=?, imagem=?, ativo=? WHERE id=?');
            $stmt->execute([$name, trim((string)($_POST['descricao'] ?? '')), $image, (int)isset($_POST['ativo']), $id]);
            if ($image !== $current['imagem']) remove_family_image($current['imagem']);
            flash('success', 'Família atualizada com sucesso.');
        } elseif ($action === 'delete') {
            if (!can('families', 'delete')) throw new RuntimeException('Seu perfil não permite excluir famílias.');
            $id = filter_var($_POST['id'] ?? null, FILTER_VALIDATE_INT);
            $find = $pdo->prepare('SELECT f.imagem,(SELECT COUNT(*) FROM modelos m WHERE m.familia_id=f.id) modelos,(SELECT COUNT(*) FROM video_familias vf WHERE vf.familia_id=f.id) videos FROM familias f WHERE f.id=?'); $find->execute([$id]);
            $current = $find->fetch();
            if (!$current) throw new RuntimeException('Família não encontrada.');
            if ((int)$current['modelos'] > 0) throw new RuntimeException('Esta família possui modelos vinculados e não pode ser excluída. Remova ou transfira os modelos primeiro.');
            if ((int)$current['videos'] > 0) throw new RuntimeException('Esta família possui vídeos vinculados e não pode ser excluída. Remova os vínculos primeiro.');
            $stmt = $pdo->prepare('DELETE FROM familias WHERE id=?'); $stmt->execute([$id]);
            remove_family_image($current['imagem']);
            flash('success', 'Família excluída com sucesso.');
        }
    } catch (PDOException $e) {
        $message = $e->getCode() === '23000' ? 'Não é possível concluir: o nome já existe ou a família possui registros vinculados.' : 'Não foi possível salvar a família no banco de dados.';
        flash('error', $message);
    } catch (Throwable $e) {
        flash('error', $e->getMessage());
    }
    redirect('familias');
}

if ($route === 'modelos' && $method === 'POST') {
    verify_csrf();
    $action = (string)($_POST['action'] ?? '');
    try {
        $pdo = db();
        if (!$pdo || !database_ready()) throw new RuntimeException('O banco de dados não está disponível.');
        if ($action === 'create' || $action === 'update') {
            $permission = $action === 'create' ? 'create' : 'update';
            if (!can('models', $permission)) throw new RuntimeException('Seu perfil não permite salvar modelos.');
            $id = $action === 'update' ? filter_var($_POST['id'] ?? null, FILTER_VALIDATE_INT) : null;
            $familyId = filter_var($_POST['familia_id'] ?? null, FILTER_VALIDATE_INT);
            $name = trim((string)($_POST['nome'] ?? ''));
            if (!$familyId || $name === '' || ($action === 'update' && !$id)) throw new RuntimeException('Informe a família e o nome do modelo.');
            $family = $pdo->prepare('SELECT id FROM familias WHERE id=? AND ativo=1'); $family->execute([$familyId]);
            if (!$family->fetch()) throw new RuntimeException('Selecione uma família ativa.');

            $current = ['imagem' => null];
            $currentDocuments = ['ficha_tecnica'=>['arquivo'=>null,'url_origem'=>null],'diretriz_implementacao'=>['arquivo'=>null,'url_origem'=>null]];
            if ($action === 'update') {
                $find = $pdo->prepare('SELECT imagem FROM modelos WHERE id=?'); $find->execute([$id]);
                $current = $find->fetch();
                if (!$current) throw new RuntimeException('Modelo não encontrado.');
                $documentFind = $pdo->prepare("SELECT tipo,arquivo,url_origem FROM modelo_documentos WHERE modelo_id=? AND tipo IN ('ficha_tecnica','diretriz_implementacao')");
                $documentFind->execute([$id]);
                foreach ($documentFind->fetchAll() as $document) $currentDocuments[$document['tipo']] = $document;
            }
            $image = save_module_image('modelos', $_FILES['imagem'] ?? [], $current['imagem']);
            $technicalFile = save_model_document($_FILES['ficha_tecnica'] ?? [], $currentDocuments['ficha_tecnica']['arquivo']);
            $implementationFile = save_model_document($_FILES['diretriz_implementacao'] ?? [], $currentDocuments['diretriz_implementacao']['arquivo']);
            $technicalUrl = trim((string)($_POST['ficha_url'] ?? '')) ?: null;
            $implementationUrl = trim((string)($_POST['diretriz_url'] ?? '')) ?: null;
            foreach ([$technicalUrl,$implementationUrl] as $documentUrl) if ($documentUrl && !filter_var($documentUrl,FILTER_VALIDATE_URL)) throw new RuntimeException('Informe uma URL válida para o documento técnico.');
            $values = [$familyId, $name, slugify($name), trim((string)($_POST['descricao'] ?? '')), $image, trim((string)($_POST['motor'] ?? '')), trim((string)($_POST['potencia'] ?? '')), trim((string)($_POST['torque'] ?? '')), trim((string)($_POST['transmissao'] ?? '')), trim((string)($_POST['pbt'] ?? '')), (int)isset($_POST['ativo'])];
            if ($action === 'create') {
                $stmt = $pdo->prepare('INSERT INTO modelos(familia_id,nome,slug,descricao,imagem,motor,potencia,torque,transmissao,pbt,ativo) VALUES(?,?,?,?,?,?,?,?,?,?,?)');
                $stmt->execute($values);
                $id = (int)$pdo->lastInsertId();
                flash('success', 'Modelo cadastrado com sucesso.');
            } else {
                $values[] = $id;
                $stmt = $pdo->prepare('UPDATE modelos SET familia_id=?,nome=?,slug=?,descricao=?,imagem=?,motor=?,potencia=?,torque=?,transmissao=?,pbt=?,ativo=? WHERE id=?');
                $stmt->execute($values);
                if ($image !== $current['imagem']) remove_module_image('modelos', $current['imagem']);
                flash('success', 'Modelo atualizado com sucesso.');
            }
            $saveDocument = $pdo->prepare('INSERT INTO modelo_documentos(modelo_id,tipo,titulo,arquivo,url_origem,ativo) VALUES(?,?,?,?,?,1) ON DUPLICATE KEY UPDATE titulo=VALUES(titulo),arquivo=VALUES(arquivo),url_origem=VALUES(url_origem),ativo=1');
            if ($technicalFile || $technicalUrl) $saveDocument->execute([$id,'ficha_tecnica','Ficha técnica completa',$technicalFile,$technicalUrl]);
            if ($implementationFile || $implementationUrl) $saveDocument->execute([$id,'diretriz_implementacao','Diretrizes de implementação',$implementationFile,$implementationUrl]);
            if ($technicalFile !== $currentDocuments['ficha_tecnica']['arquivo']) remove_model_document($currentDocuments['ficha_tecnica']['arquivo']);
            if ($implementationFile !== $currentDocuments['diretriz_implementacao']['arquivo']) remove_model_document($currentDocuments['diretriz_implementacao']['arquivo']);
        } elseif ($action === 'delete') {
            if (!can('models', 'delete')) throw new RuntimeException('Seu perfil não permite excluir modelos.');
            $id = filter_var($_POST['id'] ?? null, FILTER_VALIDATE_INT);
            $find = $pdo->prepare('SELECT m.imagem,(SELECT COUNT(*) FROM video_modelos vm WHERE vm.modelo_id=m.id) videos,(SELECT COUNT(*) FROM frotas f WHERE f.modelo_id=m.id) frotas FROM modelos m WHERE m.id=?'); $find->execute([$id]);
            $current = $find->fetch();
            if (!$current) throw new RuntimeException('Modelo não encontrado.');
            if ((int)$current['videos'] > 0) throw new RuntimeException('Este modelo possui vídeos vinculados e não pode ser excluído. Remova os vínculos primeiro.');
            if ((int)$current['frotas'] > 0) throw new RuntimeException('Este modelo está presente em frotas e não pode ser excluído. Remova os vínculos primeiro.');
            $documentFind=$pdo->prepare('SELECT arquivo FROM modelo_documentos WHERE modelo_id=?');$documentFind->execute([$id]);$documentFiles=$documentFind->fetchAll(PDO::FETCH_COLUMN);
            $stmt = $pdo->prepare('DELETE FROM modelos WHERE id=?'); $stmt->execute([$id]);
            remove_module_image('modelos', $current['imagem']);
            foreach($documentFiles as $documentFile)remove_model_document($documentFile);
            flash('success', 'Modelo excluído com sucesso.');
        }
    } catch (PDOException $e) {
        $message = $e->getCode() === '23000' ? 'Não é possível concluir: o modelo já existe ou possui frota, vídeos ou outros registros vinculados.' : 'Não foi possível salvar o modelo no banco de dados.';
        flash('error', $message);
    } catch (Throwable $e) {
        flash('error', $e->getMessage());
    }
    redirect('modelos');
}

if (in_array($route, ['categorias', 'subcategorias'], true) && $method === 'POST') {
    verify_csrf();
    $isCategory = $route === 'categorias';
    $resourceName = $isCategory ? 'categories' : 'subcategories';
    $label = $isCategory ? 'categoria' : 'subcategoria';
    $module = $isCategory ? 'categorias' : 'subcategorias';
    $action = (string)($_POST['action'] ?? '');
    try {
        $pdo = db();
        if (!$pdo || !database_ready()) throw new RuntimeException('O banco de dados não está disponível.');
        if ($action === 'create' || $action === 'update') {
            $permission = $action === 'create' ? 'create' : 'update';
            if (!can($resourceName, $permission)) throw new RuntimeException("Seu perfil não permite salvar {$label}s.");
            $id = $action === 'update' ? filter_var($_POST['id'] ?? null, FILTER_VALIDATE_INT) : null;
            $name = trim((string)($_POST['nome'] ?? ''));
            if ($name === '' || ($action === 'update' && !$id)) throw new RuntimeException("Informe os dados da {$label}.");
            $current = ['imagem' => null];
            if ($action === 'update') {
                $find = $pdo->prepare("SELECT imagem FROM {$module} WHERE id=?");
                $find->execute([$id]); $current = $find->fetch();
                if (!$current) throw new RuntimeException(ucfirst($label) . ' não encontrada.');
            }
            $image = save_module_image($module, $_FILES['imagem'] ?? [], $current['imagem']);
            $description = trim((string)($_POST['descricao'] ?? ''));
            $order = max(0, (int)($_POST['ordem'] ?? 0));
            $active = (int)isset($_POST['ativo']);
            if ($isCategory) {
                $icon = trim((string)($_POST['icone'] ?? 'gear')) ?: 'gear';
                if ($action === 'create') {
                    $stmt = $pdo->prepare('INSERT INTO categorias(nome,descricao,icone,imagem,ordem,ativo) VALUES(?,?,?,?,?,?)');
                    $stmt->execute([$name,$description,$icon,$image,$order,$active]);
                } else {
                    $stmt = $pdo->prepare('UPDATE categorias SET nome=?,descricao=?,icone=?,imagem=?,ordem=?,ativo=? WHERE id=?');
                    $stmt->execute([$name,$description,$icon,$image,$order,$active,$id]);
                }
            } else {
                $categoryId = filter_var($_POST['categoria_id'] ?? null, FILTER_VALIDATE_INT);
                $category = $pdo->prepare('SELECT id FROM categorias WHERE id=? AND ativo=1'); $category->execute([$categoryId]);
                if (!$categoryId || !$category->fetch()) throw new RuntimeException('Selecione uma categoria ativa.');
                if ($action === 'create') {
                    $stmt = $pdo->prepare('INSERT INTO subcategorias(categoria_id,nome,descricao,imagem,ordem,ativo) VALUES(?,?,?,?,?,?)');
                    $stmt->execute([$categoryId,$name,$description,$image,$order,$active]);
                } else {
                    $stmt = $pdo->prepare('UPDATE subcategorias SET categoria_id=?,nome=?,descricao=?,imagem=?,ordem=?,ativo=? WHERE id=?');
                    $stmt->execute([$categoryId,$name,$description,$image,$order,$active,$id]);
                }
            }
            if ($action === 'update' && $image !== $current['imagem']) remove_module_image($module, $current['imagem']);
            flash('success', ucfirst($label) . ($action === 'create' ? ' cadastrada' : ' atualizada') . ' com sucesso.');
        } elseif ($action === 'delete') {
            if (!can($resourceName, 'delete')) throw new RuntimeException("Seu perfil não permite excluir {$label}s.");
            $id = filter_var($_POST['id'] ?? null, FILTER_VALIDATE_INT);
            if ($isCategory) {
                $find = $pdo->prepare('SELECT c.imagem,(SELECT COUNT(*) FROM subcategorias s WHERE s.categoria_id=c.id) subcategorias,(SELECT COUNT(*) FROM videos v WHERE v.categoria_id=c.id) videos FROM categorias c WHERE c.id=?');
                $find->execute([$id]); $current = $find->fetch();
                if (!$current) throw new RuntimeException('Categoria não encontrada.');
                if ((int)$current['subcategorias'] > 0) throw new RuntimeException('Esta categoria possui subcategorias vinculadas e não pode ser excluída. Transfira ou exclua as subcategorias primeiro.');
                if ((int)$current['videos'] > 0) throw new RuntimeException('Esta categoria possui vídeos vinculados e não pode ser excluída. Remova os vínculos primeiro.');
            } else {
                $find = $pdo->prepare('SELECT s.imagem,(SELECT COUNT(*) FROM videos v WHERE v.subcategoria_id=s.id) videos FROM subcategorias s WHERE s.id=?');
                $find->execute([$id]); $current = $find->fetch();
                if (!$current) throw new RuntimeException('Subcategoria não encontrada.');
                if ((int)$current['videos'] > 0) throw new RuntimeException('Esta subcategoria possui vídeos vinculados e não pode ser excluída. Remova os vínculos primeiro.');
            }
            $stmt = $pdo->prepare("DELETE FROM {$module} WHERE id=?"); $stmt->execute([$id]);
            remove_module_image($module, $current['imagem']);
            flash('success', ucfirst($label) . ' excluída com sucesso.');
        }
    } catch (PDOException $e) {
        flash('error', $e->getCode() === '23000' ? 'Não é possível concluir: já existe um registro igual ou há vínculos ativos.' : "Não foi possível salvar a {$label} no banco de dados.");
    } catch (Throwable $e) { flash('error', $e->getMessage()); }
    redirect($route);
}

if ($route === 'videos' && $method === 'POST') {
    verify_csrf();
    $action=(string)($_POST['action']??'');
    $newVideoPath=null; $newThumbnail=null;
    try {
        $pdo=db();
        if(!$pdo||!database_ready()) throw new RuntimeException('O banco de dados não está disponível.');
        if($action==='create'||$action==='update'){
            $permission=$action==='create'?'create':'update';
            if(!can('videos',$permission)) throw new RuntimeException('Seu perfil não permite salvar vídeos.');
            $id=$action==='update'?filter_var($_POST['id']??null,FILTER_VALIDATE_INT):null;
            $title=trim((string)($_POST['titulo']??''));
            $categoryId=filter_var($_POST['categoria_id']??null,FILTER_VALIDATE_INT);
            $subcategoryId=filter_var($_POST['subcategoria_id']??null,FILTER_VALIDATE_INT)?:null;
            $type=(string)($_POST['tipo']??'upload');
            $status=(string)($_POST['status']??'rascunho');
            if($title===''||!$categoryId||($action==='update'&&!$id)) throw new RuntimeException('Informe o título e a categoria do vídeo.');
            if(!in_array($type,['upload','youtube'],true)) throw new RuntimeException('Selecione uma origem de vídeo válida.');
            if(!in_array($status,['rascunho','publicado','arquivado'],true)) $status='rascunho';
            $category=$pdo->prepare('SELECT id FROM categorias WHERE id=? AND ativo=1'); $category->execute([$categoryId]);
            if(!$category->fetch()) throw new RuntimeException('Selecione uma categoria ativa.');
            if($subcategoryId){
                $subcategory=$pdo->prepare('SELECT id FROM subcategorias WHERE id=? AND categoria_id=? AND ativo=1'); $subcategory->execute([$subcategoryId,$categoryId]);
                if(!$subcategory->fetch()) throw new RuntimeException('A subcategoria selecionada não pertence à categoria informada.');
            }
            $current=['arquivo_url'=>null,'thumbnail'=>null,'tipo'=>null,'publicado_em'=>null];
            if($action==='update'){
                $find=$pdo->prepare('SELECT arquivo_url,thumbnail,tipo,publicado_em FROM videos WHERE id=?'); $find->execute([$id]); $current=$find->fetch();
                if(!$current) throw new RuntimeException('Vídeo não encontrado.');
            }

            $fileInput=$_FILES['arquivo']??[];
            $hasNewVideo=(int)($fileInput['error']??UPLOAD_ERR_NO_FILE)===UPLOAD_ERR_OK;
            if($type==='upload'){
                $existing=$current['tipo']==='upload'?$current['arquivo_url']:null;
                $fileUrl=save_video_file($fileInput,$existing);
                if(!$fileUrl) throw new RuntimeException('Selecione o arquivo de vídeo que será enviado.');
                if($hasNewVideo) $newVideoPath=$fileUrl;
            }else{
                $youtubeId=youtube_video_id((string)($_POST['youtube_url']??''));
                if(!$youtubeId) throw new RuntimeException('Informe um link válido do YouTube.');
                $fileUrl='https://www.youtube.com/watch?v='.$youtubeId;
            }

            $thumbnailInput=$_FILES['thumbnail']??[];
            $hasNewThumbnail=(int)($thumbnailInput['error']??UPLOAD_ERR_NO_FILE)===UPLOAD_ERR_OK;
            $thumbnail=save_module_image('videos',$thumbnailInput,$current['thumbnail']);
            if($hasNewThumbnail) $newThumbnail=$thumbnail;
            if($type==='youtube'&&!$thumbnail) $thumbnail='https://img.youtube.com/vi/'.$youtubeId.'/hqdefault.jpg';
            if($type==='upload'&&$thumbnail&&str_starts_with($thumbnail,'https://img.youtube.com/')) $thumbnail=null;

            $familyIds=array_values(array_unique(array_filter(array_map('intval',(array)($_POST['familias']??[])))));
            $modelIds=array_values(array_unique(array_filter(array_map('intval',(array)($_POST['modelos']??[])))));
            if($familyIds){
                $marks=implode(',',array_fill(0,count($familyIds),'?')); $valid=$pdo->prepare("SELECT id FROM familias WHERE ativo=1 AND id IN ({$marks})"); $valid->execute($familyIds);
                if(count($valid->fetchAll())!==count($familyIds)) throw new RuntimeException('Uma das famílias selecionadas está inativa ou não existe.');
            }
            if($modelIds){
                $marks=implode(',',array_fill(0,count($modelIds),'?')); $valid=$pdo->prepare("SELECT id,familia_id FROM modelos WHERE ativo=1 AND id IN ({$marks})"); $valid->execute($modelIds); $validModels=$valid->fetchAll();
                if(count($validModels)!==count($modelIds)) throw new RuntimeException('Um dos modelos selecionados está inativo ou não existe.');
                foreach($validModels as $validModel) $familyIds[]=(int)$validModel['familia_id'];
                $familyIds=array_values(array_unique($familyIds));
            }
            $duration=max(0,(int)($_POST['duracao_minutos']??0))*60;
            $publishedAt=$status==='publicado'?($current['publicado_em']?:date('Y-m-d H:i:s')):null;
            $pdo->beginTransaction();
            if($action==='create'){
                $stmt=$pdo->prepare('INSERT INTO videos(categoria_id,subcategoria_id,titulo,descricao,tipo,arquivo_url,thumbnail,duracao_segundos,status,criado_por,publicado_em) VALUES(?,?,?,?,?,?,?,?,?,?,?)');
                $stmt->execute([$categoryId,$subcategoryId,$title,trim((string)($_POST['descricao']??'')),$type,$fileUrl,$thumbnail,$duration?:null,$status,user()['id']??null,$publishedAt]);
                $id=(int)$pdo->lastInsertId();
            }else{
                $stmt=$pdo->prepare('UPDATE videos SET categoria_id=?,subcategoria_id=?,titulo=?,descricao=?,tipo=?,arquivo_url=?,thumbnail=?,duracao_segundos=?,status=?,publicado_em=? WHERE id=?');
                $stmt->execute([$categoryId,$subcategoryId,$title,trim((string)($_POST['descricao']??'')),$type,$fileUrl,$thumbnail,$duration?:null,$status,$publishedAt,$id]);
                $pdo->prepare('DELETE FROM video_familias WHERE video_id=?')->execute([$id]);
                $pdo->prepare('DELETE FROM video_modelos WHERE video_id=?')->execute([$id]);
            }
            $familyLink=$pdo->prepare('INSERT INTO video_familias(video_id,familia_id) VALUES(?,?)'); foreach($familyIds as $familyId)$familyLink->execute([$id,$familyId]);
            $modelLink=$pdo->prepare('INSERT INTO video_modelos(video_id,modelo_id) VALUES(?,?)'); foreach($modelIds as $modelId)$modelLink->execute([$id,$modelId]);
            $pdo->commit();
            if($action==='update'&&$current['tipo']==='upload'&&$current['arquivo_url']!==$fileUrl) remove_video_file($current['arquivo_url']);
            if($action==='update'&&$current['thumbnail']!==$thumbnail) remove_module_image('videos',$current['thumbnail']);
            flash('success','Vídeo '.($action==='create'?'cadastrado':'atualizado').' com sucesso.');
        }elseif($action==='delete'){
            if(!can('videos','delete')) throw new RuntimeException('Seu perfil não permite excluir vídeos.');
            $id=filter_var($_POST['id']??null,FILTER_VALIDATE_INT);
            $find=$pdo->prepare('SELECT v.arquivo_url,v.thumbnail,v.tipo,(SELECT COUNT(*) FROM video_visualizacoes vv WHERE vv.video_id=v.id) visualizacoes FROM videos v WHERE v.id=?'); $find->execute([$id]); $current=$find->fetch();
            if(!$current) throw new RuntimeException('Vídeo não encontrado.');
            if((int)$current['visualizacoes']>0) throw new RuntimeException('Este vídeo possui histórico de visualizações e não pode ser excluído. Arquive-o para preservar os relatórios.');
            $pdo->prepare('DELETE FROM videos WHERE id=?')->execute([$id]);
            if($current['tipo']==='upload') remove_video_file($current['arquivo_url']);
            remove_module_image('videos',$current['thumbnail']);
            flash('success','Vídeo excluído com sucesso.');
        }
    }catch(PDOException $e){
        if(isset($pdo)&&$pdo->inTransaction())$pdo->rollBack();
        if($newVideoPath)remove_video_file($newVideoPath); if($newThumbnail)remove_module_image('videos',$newThumbnail);
        flash('error',$e->getCode()==='23000'?'Não foi possível concluir porque há vínculos inválidos.':'Não foi possível salvar o vídeo no banco de dados.');
    }catch(Throwable $e){
        if(isset($pdo)&&$pdo->inTransaction())$pdo->rollBack();
        if($newVideoPath)remove_video_file($newVideoPath); if($newThumbnail)remove_module_image('videos',$newThumbnail);
        flash('error',$e->getMessage());
    }
    redirect('videos');
}
$pages = [
    '' => ['dashboard','Visão geral'], 'dashboard' => ['dashboard','Visão geral'],
    'biblioteca' => ['library','Biblioteca de treinamentos'], 'frota' => ['fleet','Minha frota'], 'normas-emissoes' => ['emission_standards','Normas de emissões'],
    'familias' => ['families','Famílias de veículos'], 'modelos' => ['models','Modelos'],
    'categorias' => ['categories','Categorias'], 'subcategorias' => ['subcategories','Subcategorias'], 'videos' => ['videos','Vídeos'],
    'empresas-vwco' => ['organizations','Empresas VWCO'], 'clientes' => ['clients','Clientes'], 'usuarios' => ['users','Usuários'],
    'permissoes' => ['permissions','Perfis e permissões'], 'relatorios' => ['reports','Relatórios e avaliações'],
];
$selected = $pages[$route] ?? null;
if (!$selected) { http_response_code(404); $selected = ['not-found','Página não encontrada']; }
[$resource, $pageTitle] = $selected;
if ($resource !== 'not-found' && !can($resource, 'view')) { http_response_code(403); $resource = 'forbidden'; $pageTitle = 'Acesso restrito'; }

$families = []; $models = []; $categories = []; $subcategories = []; $videos = []; $familyOptions = []; $modelOptions = []; $categoryOptions = []; $subcategoryOptions = []; $dashboard = []; $totalRows = 0; $totalPages = 1; $access = []; $fleet = []; $emissionStandards = []; $library = []; $reports = [];
if (in_array($resource, ['organizations','clients','users','permissions'], true) && database_ready()) $access = load_access_page($resource);
if ($resource === 'fleet' && database_ready()) $fleet = load_fleet_page();
if ($resource === 'emission_standards' && database_ready()) $emissionStandards = load_emission_standards_page();
if ($resource === 'library' && database_ready()) $library = load_library_page();
if ($resource === 'reports' && database_ready()) $reports = load_reports_page();
if ($resource === 'dashboard' && database_ready()) $dashboard = load_dashboard_page();
if ($resource === 'families' && database_ready()) {
    [$page, $perPage, $offset] = pagination_params();
    $q = trim((string)($_GET['q'] ?? '')); $status = (string)($_GET['status'] ?? '');
    $where = []; $params = [];
    if ($q !== '') { $where[] = '(f.nome LIKE ? OR f.descricao LIKE ?)'; $params[] = "%{$q}%"; $params[] = "%{$q}%"; }
    if (in_array($status, ['ativo','inativo'], true)) { $where[] = 'f.ativo=?'; $params[] = $status === 'ativo' ? 1 : 0; }
    $whereSql = $where ? ' WHERE ' . implode(' AND ', $where) : '';
    $count = db()->prepare('SELECT COUNT(*) FROM familias f' . $whereSql); $count->execute($params); $totalRows = (int)$count->fetchColumn();
    $totalPages = max(1, (int)ceil($totalRows / $perPage));
    $stmt = db()->prepare('SELECT f.*, (SELECT COUNT(*) FROM modelos m WHERE m.familia_id=f.id) modelos, (SELECT COUNT(*) FROM video_familias vf WHERE vf.familia_id=f.id) videos FROM familias f' . $whereSql . ' ORDER BY f.nome LIMIT ? OFFSET ?');
    foreach ($params as $i => $value) $stmt->bindValue($i + 1, $value);
    $stmt->bindValue(count($params) + 1, $perPage, PDO::PARAM_INT); $stmt->bindValue(count($params) + 2, $offset, PDO::PARAM_INT); $stmt->execute(); $families = $stmt->fetchAll();
}
if ($resource === 'models' && database_ready()) {
    [$page, $perPage, $offset] = pagination_params();
    $q = trim((string)($_GET['q'] ?? '')); $status = (string)($_GET['status'] ?? ''); $familyFilter = (int)($_GET['familia'] ?? 0);
    $familyOptions = db()->query('SELECT id,nome FROM familias WHERE ativo=1 ORDER BY nome')->fetchAll();
    $where = []; $params = [];
    if ($q !== '') { $where[] = '(m.nome LIKE ? OR m.motor LIKE ? OR m.potencia LIKE ?)'; $params[] = "%{$q}%"; $params[] = "%{$q}%"; $params[] = "%{$q}%"; }
    if (in_array($status, ['ativo','inativo'], true)) { $where[] = 'm.ativo=?'; $params[] = $status === 'ativo' ? 1 : 0; }
    if ($familyFilter > 0) { $where[] = 'm.familia_id=?'; $params[] = $familyFilter; }
    $whereSql = $where ? ' WHERE ' . implode(' AND ', $where) : '';
    $count = db()->prepare('SELECT COUNT(*) FROM modelos m' . $whereSql); $count->execute($params); $totalRows = (int)$count->fetchColumn();
    $totalPages = max(1, (int)ceil($totalRows / $perPage));
    $stmt = db()->prepare("SELECT m.*,f.nome familia_nome,(SELECT COUNT(*) FROM video_modelos vm WHERE vm.modelo_id=m.id) videos,(SELECT COALESCE(SUM(fr.quantidade),0) FROM frotas fr WHERE fr.modelo_id=m.id) frota,(SELECT md.arquivo FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1 LIMIT 1) ficha_arquivo,(SELECT md.url_origem FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1 LIMIT 1) ficha_url,(SELECT md.arquivo FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='diretriz_implementacao' AND md.ativo=1 LIMIT 1) diretriz_arquivo,(SELECT md.url_origem FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='diretriz_implementacao' AND md.ativo=1 LIMIT 1) diretriz_url FROM modelos m JOIN familias f ON f.id=m.familia_id" . $whereSql . ' ORDER BY f.nome,m.nome LIMIT ? OFFSET ?');
    foreach ($params as $i => $value) $stmt->bindValue($i + 1, $value);
    $stmt->bindValue(count($params) + 1, $perPage, PDO::PARAM_INT); $stmt->bindValue(count($params) + 2, $offset, PDO::PARAM_INT); $stmt->execute(); $models = $stmt->fetchAll();
}
if ($resource === 'categories' && database_ready()) {
    [$page, $perPage, $offset] = pagination_params();
    $q = trim((string)($_GET['q'] ?? '')); $status = (string)($_GET['status'] ?? '');
    $where=[]; $params=[];
    if($q!==''){ $where[]='(c.nome LIKE ? OR c.descricao LIKE ?)'; $params[]="%{$q}%"; $params[]="%{$q}%"; }
    if(in_array($status,['ativo','inativo'],true)){ $where[]='c.ativo=?'; $params[]=$status==='ativo'?1:0; }
    $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
    $count=db()->prepare('SELECT COUNT(*) FROM categorias c'.$whereSql); $count->execute($params); $totalRows=(int)$count->fetchColumn(); $totalPages=max(1,(int)ceil($totalRows/$perPage));
    $stmt=db()->prepare('SELECT c.*,(SELECT COUNT(*) FROM subcategorias s WHERE s.categoria_id=c.id) subcategorias,(SELECT COUNT(*) FROM videos v WHERE v.categoria_id=c.id) videos FROM categorias c'.$whereSql.' ORDER BY c.ordem,c.nome LIMIT ? OFFSET ?');
    foreach($params as $i=>$value)$stmt->bindValue($i+1,$value); $stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT); $stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT); $stmt->execute(); $categories=$stmt->fetchAll();
}
if ($resource === 'subcategories' && database_ready()) {
    [$page, $perPage, $offset] = pagination_params();
    $q=trim((string)($_GET['q']??'')); $status=(string)($_GET['status']??''); $categoryFilter=(int)($_GET['categoria']??0);
    $categoryOptions=db()->query('SELECT id,nome FROM categorias WHERE ativo=1 ORDER BY ordem,nome')->fetchAll();
    $where=[]; $params=[];
    if($q!==''){ $where[]='(s.nome LIKE ? OR s.descricao LIKE ? OR c.nome LIKE ?)'; $params[]="%{$q}%"; $params[]="%{$q}%"; $params[]="%{$q}%"; }
    if(in_array($status,['ativo','inativo'],true)){ $where[]='s.ativo=?'; $params[]=$status==='ativo'?1:0; }
    if($categoryFilter>0){ $where[]='s.categoria_id=?'; $params[]=$categoryFilter; }
    $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
    $count=db()->prepare('SELECT COUNT(*) FROM subcategorias s JOIN categorias c ON c.id=s.categoria_id'.$whereSql); $count->execute($params); $totalRows=(int)$count->fetchColumn(); $totalPages=max(1,(int)ceil($totalRows/$perPage));
    $stmt=db()->prepare('SELECT s.*,c.nome categoria_nome,(SELECT COUNT(*) FROM videos v WHERE v.subcategoria_id=s.id) videos FROM subcategorias s JOIN categorias c ON c.id=s.categoria_id'.$whereSql.' ORDER BY c.ordem,s.ordem,s.nome LIMIT ? OFFSET ?');
    foreach($params as $i=>$value)$stmt->bindValue($i+1,$value); $stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT); $stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT); $stmt->execute(); $subcategories=$stmt->fetchAll();
}
if($resource==='videos'&&database_ready()){
    [$page,$perPage,$offset]=pagination_params();
    $q=trim((string)($_GET['q']??'')); $status=(string)($_GET['status']??''); $typeFilter=(string)($_GET['tipo']??''); $categoryFilter=(int)($_GET['categoria']??0);
    $categoryOptions=db()->query('SELECT id,nome FROM categorias WHERE ativo=1 ORDER BY ordem,nome')->fetchAll();
    $subcategoryOptions=db()->query('SELECT id,categoria_id,nome FROM subcategorias WHERE ativo=1 ORDER BY ordem,nome')->fetchAll();
    $familyOptions=db()->query('SELECT id,nome FROM familias WHERE ativo=1 ORDER BY nome')->fetchAll();
    $modelOptions=db()->query('SELECT m.id,m.familia_id,m.nome,f.nome familia_nome FROM modelos m JOIN familias f ON f.id=m.familia_id WHERE m.ativo=1 ORDER BY f.nome,m.nome')->fetchAll();
    $where=[];$params=[];
    if($q!==''){ $where[]='(v.titulo LIKE ? OR v.descricao LIKE ?)';$params[]="%{$q}%";$params[]="%{$q}%"; }
    if(in_array($status,['rascunho','publicado','arquivado'],true)){ $where[]='v.status=?';$params[]=$status; }
    if(in_array($typeFilter,['upload','youtube'],true)){ $where[]='v.tipo=?';$params[]=$typeFilter; }
    if($categoryFilter>0){ $where[]='v.categoria_id=?';$params[]=$categoryFilter; }
    $whereSql=$where?' WHERE '.implode(' AND ',$where):'';
    $count=db()->prepare('SELECT COUNT(*) FROM videos v'.$whereSql);$count->execute($params);$totalRows=(int)$count->fetchColumn();$totalPages=max(1,(int)ceil($totalRows/$perPage));
    $sql='SELECT v.*,c.nome categoria_nome,s.nome subcategoria_nome,(SELECT GROUP_CONCAT(f.nome ORDER BY f.nome SEPARATOR ", ") FROM video_familias vf JOIN familias f ON f.id=vf.familia_id WHERE vf.video_id=v.id) familias_nomes,(SELECT GROUP_CONCAT(m.nome ORDER BY m.nome SEPARATOR ", ") FROM video_modelos vm JOIN modelos m ON m.id=vm.modelo_id WHERE vm.video_id=v.id) modelos_nomes,(SELECT GROUP_CONCAT(vf.familia_id) FROM video_familias vf WHERE vf.video_id=v.id) familia_ids,(SELECT GROUP_CONCAT(vm.modelo_id) FROM video_modelos vm WHERE vm.video_id=v.id) modelo_ids,(SELECT COUNT(*) FROM video_visualizacoes vv WHERE vv.video_id=v.id) visualizacoes FROM videos v JOIN categorias c ON c.id=v.categoria_id LEFT JOIN subcategorias s ON s.id=v.subcategoria_id'.$whereSql.' ORDER BY v.criado_em DESC LIMIT ? OFFSET ?';
    $stmt=db()->prepare($sql);foreach($params as $i=>$value)$stmt->bindValue($i+1,$value);$stmt->bindValue(count($params)+1,$perPage,PDO::PARAM_INT);$stmt->bindValue(count($params)+2,$offset,PDO::PARAM_INT);$stmt->execute();$videos=$stmt->fetchAll();
}

require __DIR__ . '/../views/layout/header.php';
$view = __DIR__ . '/../views/pages/' . $resource . '.php';
require is_file($view) ? $view : __DIR__ . '/../views/pages/generic.php';
require __DIR__ . '/../views/layout/footer.php';
