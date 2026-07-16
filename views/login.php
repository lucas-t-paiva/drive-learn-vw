<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#001e50">
    <title>Entrar · Drive Learn VWCO</title>
    <link rel="icon" type="image/svg+xml" href="<?= url('public/assets/images/favicon.svg') ?>?v=<?= (int)(@filemtime(__DIR__.'/../public/assets/images/favicon.svg') ?: 1) ?>">
    <link rel="shortcut icon" href="<?= url('public/assets/images/favicon.svg') ?>?v=<?= (int)(@filemtime(__DIR__.'/../public/assets/images/favicon.svg') ?: 1) ?>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="<?= url('public/assets/css/main.css') ?>">
    <link rel="stylesheet" href="<?= url('public/assets/css/login.css') ?>">
</head>
<body class="login-page">
<main class="login-shell">
    <section class="login-brand">
        <div class="brand-lockup"><span class="brand-mark">VW</span><span>Drive Learn<small>Caminhões e Ônibus</small></span></div>
        <div class="hero-copy">
            <span class="eyebrow">Conhecimento que move</span>
            <h1>Treinamento sob medida para cada caminho.</h1>
            <p>Conteúdos práticos por veículo, acompanhamento da frota e aprendizado que gera resultados reais.</p>
        </div>
        <div class="login-road" aria-hidden="true"><span></span><span></span><span></span></div>
    </section>
    <section class="login-panel">
        <form method="post" class="login-card">
            <?= csrf_field() ?>
            <div class="mobile-brand brand-lockup"><span class="brand-mark">VW</span><span>Drive Learn<small>Caminhões e Ônibus</small></span></div>
            <span class="eyebrow blue">Área de acesso</span><h2>Boas-vindas</h2><p class="muted">Entre para acessar seus treinamentos e ferramentas.</p>
            <?php if ($error): ?><div class="alert error"><?= e($error) ?></div><?php endif; ?>
            <?php if (!database_ready()): ?><div class="alert demo"><strong>Modo demonstração</strong><br>Use qualquer e-mail e senha com 4+ caracteres.</div><?php endif; ?>
            <label>E-mail<div class="field-control"><i class="bi bi-envelope" aria-hidden="true"></i><input type="email" name="email" placeholder="nome@empresa.com.br" autocomplete="email" required value="<?= e($_POST['email'] ?? '') ?>"></div></label>
            <label>Senha<div class="field-control password"><i class="bi bi-lock" aria-hidden="true"></i><input type="password" name="password" placeholder="Sua senha" autocomplete="current-password" required><button type="button" data-toggle-password aria-label="Mostrar senha"><i class="bi bi-eye" aria-hidden="true"></i></button></div></label>
            <div class="form-row"><label class="check"><input type="checkbox" name="remember"> Lembrar de mim</label><a href="#">Esqueci minha senha</a></div>
            <button class="btn primary wide" type="submit">Entrar na plataforma <i class="bi bi-arrow-right" aria-hidden="true"></i></button>
            <p class="support">Precisa de ajuda? <a href="mailto:suporte@drivelearn.com.br">Fale com o suporte</a></p>
        </form>
    </section>
</main>
<script src="<?= url('public/assets/js/app.js') ?>"></script>
</body></html>
