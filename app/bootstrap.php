<?php
declare(strict_types=1);

$sessionPath = __DIR__ . '/../storage/sessions';
if (!is_dir($sessionPath)) mkdir($sessionPath, 0775, true);
session_save_path($sessionPath);
if (session_status() !== PHP_SESSION_ACTIVE) {
    session_start();
}

date_default_timezone_set('America/Sao_Paulo');

function db(): ?PDO
{
    static $pdo = false;
    if ($pdo !== false) return $pdo;
    $config = require __DIR__ . '/../config/database.php';
    try {
        $dsn = "mysql:host={$config['host']};port={$config['port']};dbname={$config['database']};charset={$config['charset']}";
        $pdo = new PDO($dsn, $config['username'], $config['password'], [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ]);
    } catch (Throwable $e) {
        $pdo = null;
    }
    return $pdo;
}

function database_ready(): bool
{
    $pdo = db();
    if (!$pdo) return false;
    try {
        $pdo->query('SELECT 1 FROM usuarios LIMIT 1');
        return true;
    } catch (Throwable $e) {
        return false;
    }
}

function url(string $path = ''): string
{
    $script = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME'] ?? '/'));
    // O front controller fica em /public, mas esse diretório não faz parte
    // da URL pública da aplicação quando o mod_rewrite está ativo.
    if (str_ends_with($script, '/public')) {
        $script = substr($script, 0, -7) ?: '/';
    }
    $base = $script === '/' ? '' : rtrim($script, '/');
    return $base . '/' . ltrim($path, '/');
}

function e(?string $value): string { return htmlspecialchars($value ?? '', ENT_QUOTES, 'UTF-8'); }
function redirect(string $path): never { header('Location: ' . url($path)); exit; }
function csrf_token(): string { return $_SESSION['csrf'] ??= bin2hex(random_bytes(24)); }
function csrf_field(): string { return '<input type="hidden" name="csrf" value="' . e(csrf_token()) . '">'; }
function verify_csrf(): void {
    if (!hash_equals($_SESSION['csrf'] ?? '', (string)($_POST['csrf'] ?? ''))) {
        http_response_code(419); exit('Sessão expirada. Atualize a página e tente novamente.');
    }
}

function flash(string $type, string $message): void
{
    $_SESSION['flash'] = ['type' => $type, 'message' => $message];
}

function pull_flash(): ?array
{
    $flash = $_SESSION['flash'] ?? null;
    unset($_SESSION['flash']);
    return $flash;
}

function save_module_image(string $module, array $file, ?string $current = null): ?string
{
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) return $current;
    if (($file['error'] ?? UPLOAD_ERR_OK) !== UPLOAD_ERR_OK) throw new RuntimeException('Não foi possível enviar a imagem.');
    if (($file['size'] ?? 0) > 5 * 1024 * 1024) throw new RuntimeException('A imagem deve ter no máximo 5 MB.');

    $mime = (new finfo(FILEINFO_MIME_TYPE))->file($file['tmp_name']);
    $extensions = ['image/jpeg' => 'jpg', 'image/png' => 'png', 'image/webp' => 'webp'];
    if (!isset($extensions[$mime])) throw new RuntimeException('Use uma imagem JPG, PNG ou WEBP.');

    if (!preg_match('/^[a-z0-9_-]+$/', $module)) throw new RuntimeException('Módulo de imagem inválido.');
    $relativeDir = 'public/assets/images/' . $module;
    $absoluteDir = __DIR__ . '/../' . $relativeDir;
    if (!is_dir($absoluteDir) && !mkdir($absoluteDir, 0775, true) && !is_dir($absoluteDir)) {
        throw new RuntimeException('Não foi possível preparar a pasta de imagens.');
    }
    $filename = bin2hex(random_bytes(16)) . '.' . $extensions[$mime];
    if (!move_uploaded_file($file['tmp_name'], $absoluteDir . '/' . $filename)) {
        throw new RuntimeException('Não foi possível salvar a imagem enviada.');
    }
    return $relativeDir . '/' . $filename;
}

function save_optimized_image(string $module, array $file, ?string $current = null, int $maxWidth = 720, int $maxHeight = 720): ?string
{
    $error = (int)($file['error'] ?? UPLOAD_ERR_NO_FILE);
    if ($error === UPLOAD_ERR_NO_FILE) return $current;
    if ($error !== UPLOAD_ERR_OK) throw new RuntimeException('Não foi possível enviar a imagem.');
    if ((int)($file['size'] ?? 0) > 3 * 1024 * 1024) throw new RuntimeException('A imagem deve ter no máximo 3 MB.');
    if (!preg_match('/^[a-z0-9_-]+$/', $module)) throw new RuntimeException('Módulo de imagem inválido.');

    $mime = (new finfo(FILEINFO_MIME_TYPE))->file($file['tmp_name']);
    $extensions = ['image/jpeg' => 'jpg', 'image/png' => 'png', 'image/webp' => 'webp'];
    if (!isset($extensions[$mime])) throw new RuntimeException('Use uma imagem JPG, PNG ou WEBP.');
    $dimensions = @getimagesize($file['tmp_name']);
    if (!$dimensions || $dimensions[0] < 1 || $dimensions[1] < 1 || $dimensions[0] > 12000 || $dimensions[1] > 12000) {
        throw new RuntimeException('A imagem enviada é inválida ou possui dimensões excessivas.');
    }

    $relativeDir = 'public/assets/images/' . $module;
    $absoluteDir = __DIR__ . '/../' . $relativeDir;
    if (!is_dir($absoluteDir) && !mkdir($absoluteDir, 0775, true) && !is_dir($absoluteDir)) {
        throw new RuntimeException('Não foi possível preparar a pasta de imagens.');
    }

    $canUseGd = function_exists('imagecreatetruecolor') && function_exists('imagewebp');
    $loaders = ['image/jpeg' => 'imagecreatefromjpeg', 'image/png' => 'imagecreatefrompng', 'image/webp' => 'imagecreatefromwebp'];
    if ($canUseGd && isset($loaders[$mime]) && function_exists($loaders[$mime])) {
        $source = @$loaders[$mime]($file['tmp_name']);
        if ($source) {
            $ratio = min(1, $maxWidth / $dimensions[0], $maxHeight / $dimensions[1]);
            $width = max(1, (int)round($dimensions[0] * $ratio));
            $height = max(1, (int)round($dimensions[1] * $ratio));
            $target = imagecreatetruecolor($width, $height);
            imagealphablending($target, false);
            imagesavealpha($target, true);
            $transparent = imagecolorallocatealpha($target, 0, 0, 0, 127);
            imagefilledrectangle($target, 0, 0, $width, $height, $transparent);
            imagecopyresampled($target, $source, 0, 0, 0, 0, $width, $height, $dimensions[0], $dimensions[1]);
            $filename = bin2hex(random_bytes(16)) . '.webp';
            $saved = imagewebp($target, $absoluteDir . '/' . $filename, 82);
            imagedestroy($source);
            imagedestroy($target);
            if ($saved) return $relativeDir . '/' . $filename;
        }
    }

    $filename = bin2hex(random_bytes(16)) . '.' . $extensions[$mime];
    if (!move_uploaded_file($file['tmp_name'], $absoluteDir . '/' . $filename)) {
        throw new RuntimeException('Não foi possível salvar a imagem enviada.');
    }
    return $relativeDir . '/' . $filename;
}

function remove_module_image(string $module, ?string $relativePath): void
{
    if (!preg_match('/^[a-z0-9_-]+$/', $module) || !$relativePath || !str_starts_with($relativePath, 'public/assets/images/' . $module . '/')) return;
    $base = realpath(__DIR__ . '/../public/assets/images/' . $module);
    $file = realpath(__DIR__ . '/../' . $relativePath);
    if ($base && $file && str_starts_with($file, $base . DIRECTORY_SEPARATOR) && is_file($file)) unlink($file);
}

function remove_model_image_if_unused(?string $relativePath): void
{
    if(!$relativePath)return;
    $pdo=db();
    if($pdo){$stmt=$pdo->prepare('SELECT COUNT(*) FROM modelos WHERE imagem=?');$stmt->execute([$relativePath]);if((int)$stmt->fetchColumn()>0)return;}
    remove_module_image('modelos',$relativePath);
}

function save_family_image(array $file, ?string $current = null): ?string { return save_module_image('familias', $file, $current); }
function remove_family_image(?string $path): void { remove_module_image('familias', $path); }

function save_model_document(array $file, ?string $current = null): ?string
{
    $error = (int)($file['error'] ?? UPLOAD_ERR_NO_FILE);
    if ($error === UPLOAD_ERR_NO_FILE) return $current;
    if ($error !== UPLOAD_ERR_OK) throw new RuntimeException('Não foi possível enviar o documento técnico.');
    if ((int)($file['size'] ?? 0) > 25 * 1024 * 1024) throw new RuntimeException('O documento técnico deve ter no máximo 25 MB.');
    $header = file_get_contents((string)$file['tmp_name'], false, null, 0, 5);
    $mime = (new finfo(FILEINFO_MIME_TYPE))->file((string)$file['tmp_name']);
    if ($header !== '%PDF-' || !in_array($mime, ['application/pdf','application/octet-stream'], true)) throw new RuntimeException('Envie o documento técnico em formato PDF.');
    $relativeDir = 'public/assets/documents/modelos';
    $absoluteDir = __DIR__ . '/../' . $relativeDir;
    if (!is_dir($absoluteDir) && !mkdir($absoluteDir, 0775, true) && !is_dir($absoluteDir)) throw new RuntimeException('Não foi possível preparar a pasta de documentos.');
    $filename = bin2hex(random_bytes(16)) . '.pdf';
    if (!move_uploaded_file((string)$file['tmp_name'], $absoluteDir . '/' . $filename)) throw new RuntimeException('Não foi possível salvar o documento técnico.');
    return $relativeDir . '/' . $filename;
}

function remove_model_document(?string $relativePath): void
{
    if (!$relativePath || !str_starts_with($relativePath, 'public/assets/documents/modelos/')) return;
    $base = realpath(__DIR__ . '/../public/assets/documents/modelos');
    $file = realpath(__DIR__ . '/../' . $relativePath);
    if ($base && $file && str_starts_with($file, $base . DIRECTORY_SEPARATOR) && is_file($file)) unlink($file);
}

function remove_model_document_if_unused(?string $relativePath): void
{
    if(!$relativePath)return;
    $pdo=db();
    if($pdo){$stmt=$pdo->prepare('SELECT COUNT(*) FROM modelo_documentos WHERE arquivo=?');$stmt->execute([$relativePath]);if((int)$stmt->fetchColumn()>0)return;}
    remove_model_document($relativePath);
}

function save_video_file(array $file, ?string $current = null): ?string
{
    $error = (int)($file['error'] ?? UPLOAD_ERR_NO_FILE);
    if ($error === UPLOAD_ERR_NO_FILE) return $current;
    if ($error !== UPLOAD_ERR_OK) {
        $message = $error === UPLOAD_ERR_INI_SIZE || $error === UPLOAD_ERR_FORM_SIZE
            ? 'O vídeo ultrapassa o limite permitido pelo servidor (' . ini_get('upload_max_filesize') . ').'
            : 'O envio do vídeo não foi concluído. Tente novamente.';
        throw new RuntimeException($message);
    }
    if ((int)($file['size'] ?? 0) > 536870912) throw new RuntimeException('O vídeo deve ter no máximo 512 MB.');
    $mime = (new finfo(FILEINFO_MIME_TYPE))->file($file['tmp_name']);
    $extensions = ['video/mp4'=>'mp4','video/webm'=>'webm','video/quicktime'=>'mov','video/x-m4v'=>'m4v'];
    if (!isset($extensions[$mime])) throw new RuntimeException('Formato de vídeo inválido. Envie MP4, WEBM, MOV ou M4V.');
    $relativeDir = 'public/assets/videos';
    $absoluteDir = __DIR__ . '/../' . $relativeDir;
    if (!is_dir($absoluteDir) && !mkdir($absoluteDir, 0775, true) && !is_dir($absoluteDir)) throw new RuntimeException('Não foi possível preparar a pasta de vídeos.');
    $filename = bin2hex(random_bytes(16)) . '.' . $extensions[$mime];
    if (!move_uploaded_file($file['tmp_name'], $absoluteDir . '/' . $filename)) throw new RuntimeException('Não foi possível salvar o vídeo enviado.');
    return $relativeDir . '/' . $filename;
}

function remove_video_file(?string $relativePath): void
{
    if (!$relativePath || !str_starts_with($relativePath, 'public/assets/videos/')) return;
    $base = realpath(__DIR__ . '/../public/assets/videos');
    $file = realpath(__DIR__ . '/../' . $relativePath);
    if ($base && $file && str_starts_with($file, $base . DIRECTORY_SEPARATOR) && is_file($file)) unlink($file);
}

function youtube_video_id(string $url): ?string
{
    $url = trim($url);
    if ($url === '') return null;
    if (preg_match('~(?:youtube\.com/(?:watch\?(?:.*&)?v=|shorts/|embed/)|youtu\.be/)([A-Za-z0-9_-]{11})~i', $url, $match)) return $match[1];
    return preg_match('/^[A-Za-z0-9_-]{11}$/', $url) ? $url : null;
}

function slugify(string $value): string
{
    $ascii = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $value) ?: $value;
    $slug = strtolower(trim((string)preg_replace('/[^a-zA-Z0-9]+/', '-', $ascii), '-'));
    return $slug !== '' ? $slug : 'modelo-' . bin2hex(random_bytes(4));
}

function pagination_params(): array
{
    $allowed = [5, 10, 25, 50];
    $perPage = (int)($_GET['per_page'] ?? 10);
    if (!in_array($perPage, $allowed, true)) $perPage = 10;
    $page = max(1, (int)($_GET['page'] ?? 1));
    return [$page, $perPage, ($page - 1) * $perPage];
}

function page_url(string $route, array $changes): string
{
    $query = array_merge($_GET, $changes);
    unset($query['route']);
    foreach ($query as $key => $value) if ($value === '' || $value === null) unset($query[$key]);
    return url($route) . ($query ? '?' . http_build_query($query) : '');
}

function user(): ?array { return $_SESSION['user'] ?? null; }
function require_auth(): void { if (!user()) redirect('login'); }
function is_master(?array $account = null): bool
{
    $account ??= user();
    return ($account['role_slug'] ?? '') === 'administrador';
}
function profile_permissions(int $profileId): array
{
    $pdo = db();
    if (!$pdo || $profileId < 1) return [];
    $stmt = $pdo->prepare('SELECT CONCAT(pm.recurso, ".", pm.acao) permission FROM perfil_permissoes pp JOIN permissoes pm ON pm.id=pp.permissao_id WHERE pp.perfil_id=? AND pp.permitido=1');
    $stmt->execute([$profileId]);
    return array_column($stmt->fetchAll(), 'permission');
}
function hydrate_user_context(array $account): array
{
    $pdo = db();
    if (!$pdo) return $account;
    $master = is_master($account);
    if ($master) {
        $stmt = $pdo->prepare("SELECT e.id empresa_id,e.nome_fantasia empresa_nome,e.tipo empresa_tipo,e.ativo,COALESCE((SELECT ue.principal FROM usuario_empresas ue WHERE ue.usuario_id=? AND ue.empresa_id=e.id),0) principal,1 administrador FROM empresas e WHERE e.ativo=1 ORDER BY principal DESC,e.nome_fantasia");
        $stmt->execute([(int)$account['id']]);
    } else {
        $stmt = $pdo->prepare('SELECT ue.empresa_id,e.nome_fantasia empresa_nome,e.tipo empresa_tipo,ue.principal,ue.administrador,ue.perfil_id,p.nome perfil_nome,p.slug perfil_slug,p.nivel perfil_nivel,p.pode_gerenciar_usuarios FROM usuario_empresas ue JOIN empresas e ON e.id=ue.empresa_id JOIN perfis p ON p.id=ue.perfil_id WHERE ue.usuario_id=? AND ue.ativo=1 AND e.ativo=1 AND p.ativo=1 ORDER BY ue.principal DESC,e.nome_fantasia');
        $stmt->execute([(int)$account['id']]);
    }
    $companies = $stmt->fetchAll();
    if ($master) {
        array_unshift($companies, [
            'empresa_id' => 0,
            'empresa_nome' => 'Todas as empresas · visão global',
            'empresa_tipo' => 'global',
            'principal' => 0,
            'administrador' => 1,
        ]);
    }
    $hasRequested = array_key_exists('active_company_id', $_SESSION);
    $requested = (int)($_SESSION['active_company_id'] ?? 0);
    $active = null;
    if (!($master && $hasRequested && $requested === 0)) {
        foreach ($companies as $company) if ((int)$company['empresa_id'] === $requested) { $active = $company; break; }
    }
    if (!$active && !($master && $hasRequested && $requested === 0)) $active = $companies[0] ?? null;
    if ($active) $_SESSION['active_company_id'] = (int)$active['empresa_id'];

    $account['companies'] = array_map(static fn(array $company): array => [
        'id'=>(int)$company['empresa_id'],'nome'=>$company['empresa_nome'],'tipo'=>$company['empresa_tipo'],
        'principal'=>(bool)$company['principal'],'administrador'=>(bool)$company['administrador'],
    ], $companies);
    $account['active_company_id'] = $active ? (int)$active['empresa_id'] : null;
    $account['active_company_name'] = $active['empresa_nome'] ?? ($master ? 'Visão global' : 'Volkswagen Caminhões e Ônibus');
    $account['active_company_type'] = $active['empresa_tipo'] ?? ($master ? 'global' : null);
    $account['client_name'] = $account['active_company_name'];
    if (!$master && $active) {
        $account['perfil_id'] = (int)$active['perfil_id'];
        $account['role_name'] = $active['perfil_nome'];
        $account['role_slug'] = $active['perfil_slug'];
        $account['role_level'] = (int)$active['perfil_nivel'];
        $account['can_manage_users'] = (bool)$active['pode_gerenciar_usuarios'] || (bool)$active['administrador'];
        $account['membership_admin'] = (bool)$active['administrador'];
    } else {
        $account['role_level'] = 100;
        $account['can_manage_users'] = true;
        $account['membership_admin'] = true;
    }
    $account['permissions'] = profile_permissions((int)$account['perfil_id']);
    return $account;
}
function switch_active_company(int $companyId): bool
{
    $current = user();
    $pdo = db();
    if (!$current || !$pdo || $companyId < 0) return false;
    if ($companyId === 0 && !is_master($current)) return false;
    $allowed = is_master($current);
    if (!$allowed) {
        $stmt = $pdo->prepare('SELECT COUNT(*) FROM usuario_empresas ue JOIN empresas e ON e.id=ue.empresa_id WHERE ue.usuario_id=? AND ue.empresa_id=? AND ue.ativo=1 AND e.ativo=1');
        $stmt->execute([(int)$current['id'],$companyId]);
        $allowed = (bool)$stmt->fetchColumn();
    }
    if (!$allowed) return false;
    $_SESSION['active_company_id'] = $companyId;
    $stmt = $pdo->prepare('SELECT u.*,p.nome role_name,p.slug role_slug FROM usuarios u JOIN perfis p ON p.id=u.perfil_id WHERE u.id=? AND u.ativo=1');
    $stmt->execute([(int)$current['id']]);
    $account = $stmt->fetch();
    if (!$account) return false;
    unset($account['senha_hash']);
    $_SESSION['user'] = hydrate_user_context($account);
    return true;
}
function refresh_user_session(): bool
{
    $current = user(); $pdo = db();
    if (!$current || !$pdo) return false;
    $stmt = $pdo->prepare('SELECT u.*,p.nome role_name,p.slug role_slug FROM usuarios u JOIN perfis p ON p.id=u.perfil_id WHERE u.id=? AND u.ativo=1');
    $stmt->execute([(int)$current['id']]);
    $account = $stmt->fetch();
    if (!$account) return false;
    unset($account['senha_hash']);
    $_SESSION['user'] = hydrate_user_context($account);
    return true;
}
function active_company_id(): ?int { $id = (int)(user()['active_company_id'] ?? 0); return $id > 0 ? $id : null; }
function accessible_client_company_ids(): array
{
    $pdo = db(); $current = user();
    if (!$pdo || !$current) return [];
    $active = active_company_id();
    if (is_master($current)) {
        if (!$active) return array_map('intval', $pdo->query("SELECT id FROM empresas WHERE tipo='cliente' AND ativo=1")->fetchAll(PDO::FETCH_COLUMN));
        if (($current['active_company_type'] ?? '') === 'cliente') return [$active];
        $stmt = $pdo->prepare('SELECT cliente_id FROM empresa_clientes WHERE empresa_vw_id=? AND ativo=1');
        $stmt->execute([$active]);
        return array_map('intval', $stmt->fetchAll(PDO::FETCH_COLUMN));
    }
    if (!$active) return [];
    if (($current['active_company_type'] ?? '') === 'cliente') return [$active];
    $stmt = $pdo->prepare('SELECT cliente_id FROM empresa_clientes WHERE empresa_vw_id=? AND ativo=1');
    $stmt->execute([$active]);
    return array_map('intval', $stmt->fetchAll(PDO::FETCH_COLUMN));
}
function manageable_company_ids(): array
{
    $current = user();
    if (!$current || !(is_master($current) || ($current['can_manage_users'] ?? false))) return [];
    if (is_master($current)) {
        $pdo = db();
        return $pdo ? array_map('intval', $pdo->query('SELECT id FROM empresas WHERE ativo=1')->fetchAll(PDO::FETCH_COLUMN)) : [];
    }
    $ids = active_company_id() ? [active_company_id()] : [];
    if (in_array($current['active_company_type'] ?? '', ['vwco','concessionaria'], true)) $ids = array_merge($ids, accessible_client_company_ids());
    return array_values(array_unique(array_filter(array_map('intval', $ids))));
}
function can(string $resource, string $action = 'view'): bool
{
    $current = user();
    if (!$current) return false;
    if (is_master($current)) return true;
    $permissions = $current['permissions'] ?? [];
    return in_array("{$resource}.{$action}", $permissions, true);
}

function login_user(string $email, string $password, string $demoRole = ''): bool
{
    $pdo = db();
    if ($pdo && database_ready()) {
        $stmt = $pdo->prepare('SELECT u.*, r.nome role_name, r.slug role_slug FROM usuarios u JOIN perfis r ON r.id=u.perfil_id WHERE u.email=? AND u.ativo=1 LIMIT 1');
        $stmt->execute([$email]);
        $found = $stmt->fetch();
        if (!$found || !password_verify($password, $found['senha_hash'])) return false;
        $pdo->prepare('UPDATE usuarios SET ultimo_acesso=NOW() WHERE id=?')->execute([(int)$found['id']]);
        unset($found['senha_hash']);
        $_SESSION['user'] = hydrate_user_context($found);
        return true;
    }

    $serverName = strtolower((string)($_SERVER['SERVER_NAME'] ?? ''));
    $isLocalEnvironment = in_array($serverName, ['localhost', '127.0.0.1', '::1'], true)
        || str_ends_with($serverName, '.local')
        || str_ends_with($serverName, '.test');
    if (!$isLocalEnvironment) return false;

    if (!filter_var($email, FILTER_VALIDATE_EMAIL) || strlen($password) < 4) return false;
    $roles = [
        'administrador' => ['Administrador', 'Fábrica Resende'],
        'assistencia' => ['Assistência Técnica', 'Concessionária Caminho Forte'],
        'cliente' => ['Gestor de Frota', 'Transportes Horizonte'],
    ];
    $slug = isset($roles[$demoRole]) ? $demoRole : 'administrador';
    $_SESSION['user'] = [
        'id' => 1, 'nome' => explode('@', $email)[0], 'email' => $email,
        'role_slug' => $slug, 'role_name' => $roles[$slug][0], 'client_name' => $roles[$slug][1],
        'permissions' => $slug === 'cliente' ? ['dashboard.view','library.view','fleet.view','fleet.create','feedback.create'] : ['dashboard.view','library.view','fleet.view','families.view','models.view','categories.view','subcategories.view','videos.view','clients.view','reports.view'],
    ];
    return true;
}

function demo_data(): array
{
    return [
        'families' => [
            ['id'=>1,'nome'=>'Delivery','descricao'=>'Agilidade, economia e versatilidade para entregas urbanas.','accent'=>'#00b0f0','modelos'=>6,'videos'=>18,'icon'=>'DL'],
            ['id'=>2,'nome'=>'Constellation','descricao'=>'Eficiência, conforto, tecnologia e segurança em qualquer caminho.','accent'=>'#0b5aa6','modelos'=>14,'videos'=>32,'icon'=>'CO'],
            ['id'=>3,'nome'=>'Meteor','descricao'=>'Extrapesados fortes, confortáveis e conectados.','accent'=>'#ef6c35','modelos'=>5,'videos'=>21,'icon'=>'ME'],
            ['id'=>4,'nome'=>'e-Delivery','descricao'=>'Mobilidade elétrica para entregas mais sustentáveis.','accent'=>'#15a06c','modelos'=>2,'videos'=>12,'icon'=>'eD'],
        ],
        'categories' => [
            ['nome'=>'Direção e volante','icon'=>'steering','videos'=>8,'progress'=>72],
            ['nome'=>'Freios e segurança','icon'=>'shield','videos'=>12,'progress'=>45],
            ['nome'=>'Painel e comandos','icon'=>'dashboard','videos'=>15,'progress'=>61],
            ['nome'=>'Motor e desempenho','icon'=>'engine','videos'=>10,'progress'=>28],
            ['nome'=>'Condução econômica','icon'=>'leaf','videos'=>9,'progress'=>80],
            ['nome'=>'Manutenção básica','icon'=>'tools','videos'=>14,'progress'=>34],
        ],
        'videos' => [
            ['id'=>1,'titulo'=>'Como utilizar o piloto automático','categoria'=>'Direção e volante','modelo'=>'Constellation 17.210','duracao'=>'04:32','views'=>128,'status'=>'Publicado'],
            ['id'=>2,'titulo'=>'Modos ECO, POWER e NORMAL','categoria'=>'Condução econômica','modelo'=>'Meteor 29.530','duracao'=>'06:18','views'=>94,'status'=>'Publicado'],
            ['id'=>3,'titulo'=>'Leitura das luzes do painel','categoria'=>'Painel e comandos','modelo'=>'Família Delivery','duracao'=>'05:07','views'=>221,'status'=>'Publicado'],
            ['id'=>4,'titulo'=>'Verificação diária do veículo','categoria'=>'Manutenção básica','modelo'=>'Todas as famílias','duracao'=>'08:45','views'=>76,'status'=>'Rascunho'],
        ],
        'fleet' => [
            ['modelo'=>'Constellation 17.210','familia'=>'Constellation','quantidade'=>12,'videos'=>23],
            ['modelo'=>'Delivery 11.180','familia'=>'Delivery','quantidade'=>8,'videos'=>16],
            ['modelo'=>'Meteor 29.530','familia'=>'Meteor','quantidade'=>4,'videos'=>19],
        ],
    ];
}
