<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#001e50">
    <title>Recuperar senha · Drive Learn VWCO</title>
    <link rel="icon" type="image/svg+xml" href="<?= url('public/assets/images/favicon.svg') ?>?v=<?= (int)(@filemtime(__DIR__.'/../public/assets/images/favicon.svg') ?: 1) ?>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="<?= url('public/assets/css/main.css') ?>">
    <link rel="stylesheet" href="<?= url('public/assets/css/login.css') ?>?v=<?= (int)(@filemtime(__DIR__.'/../public/assets/css/login.css') ?: 1) ?>">
    <link rel="stylesheet" href="<?= url('public/assets/css/auth.css') ?>?v=<?= (int)(@filemtime(__DIR__.'/../public/assets/css/auth.css') ?: 1) ?>">
</head>
<body class="login-page">
<main class="login-shell">
    <section class="login-brand">
        <div class="brand-lockup"><span class="brand-mark">VW</span><span>Drive Learn<small>Caminhões e Ônibus</small></span></div>
        <div class="hero-copy"><span class="eyebrow">Acesso protegido</span><h1>Recupere seu acesso com segurança.</h1><p>Confirme sua identidade por e-mail e defina uma nova senha para continuar aprendendo.</p></div>
        <div class="login-road" aria-hidden="true"><span></span><span></span><span></span></div>
    </section>
    <section class="login-panel">
        <div class="login-card password-reset-card">
            <div class="mobile-brand brand-lockup"><span class="brand-mark">VW</span><span>Drive Learn<small>Caminhões e Ônibus</small></span></div>
            <?php if($resetStep==='request'): ?>
                <span class="auth-step-icon"><i class="bi bi-envelope-check"></i></span>
                <span class="eyebrow blue">Recuperação de senha</span><h2>Informe seu e-mail</h2><p class="muted">Enviaremos um código de seis dígitos para o endereço cadastrado.</p>
            <?php elseif($resetStep==='verify'): ?>
                <span class="auth-step-icon"><i class="bi bi-shield-check"></i></span>
                <span class="eyebrow blue">Verificação de segurança</span><h2>Digite o código</h2><p class="muted">O código foi enviado para <strong><?= e(password_reset_mask_email((string)$email)) ?></strong> e expira em 2 minutos.</p>
            <?php else: ?>
                <span class="auth-step-icon"><i class="bi bi-key"></i></span>
                <span class="eyebrow blue">Nova credencial</span><h2>Crie uma nova senha</h2><p class="muted">Escolha uma senha segura, diferente da utilizada anteriormente.</p>
            <?php endif; ?>

            <?php if($notice): ?><div class="login-notice <?= e($notice['type']??'info') ?>"><i class="bi <?= ($notice['type']??'')==='success'?'bi-check-circle':((($notice['type']??'')==='error')?'bi-exclamation-circle':'bi-info-circle') ?>"></i><span><?= e($notice['message']??'') ?></span></div><?php endif; ?>
            <?php if($error): ?><div class="login-notice error"><i class="bi bi-exclamation-circle"></i><span><?= e($error) ?></span></div><?php endif; ?>

            <?php if($resetStep==='request'): ?>
                <form method="post" action="<?= url('recuperar-senha') ?>" class="auth-form"><?= csrf_field() ?>
                    <label>E-mail de acesso<div class="field-control"><i class="bi bi-envelope"></i><input type="email" name="email" autocomplete="email" required autofocus value="<?= e((string)$email) ?>" placeholder="nome@empresa.com.br"></div></label>
                    <button class="btn primary wide" type="submit">Enviar código <i class="bi bi-arrow-right"></i></button>
                </form>
            <?php elseif($resetStep==='verify'): ?>
                <form method="post" action="<?= url('validar-codigo') ?>" class="auth-form"><?= csrf_field() ?>
                    <label>Código de verificação<input class="verification-code" name="codigo" inputmode="numeric" pattern="[0-9]{6}" maxlength="6" autocomplete="one-time-code" required autofocus placeholder="000000"></label>
                    <div class="code-expiration"><i class="bi bi-clock"></i><span>Validade restante</span><strong data-code-countdown data-seconds="<?= (int)$secondsRemaining ?>">02:00</strong></div>
                    <button class="btn primary wide" type="submit">Validar código <i class="bi bi-shield-check"></i></button>
                </form>
                <form method="post" action="<?= url('recuperar-senha') ?>" class="resend-form"><?= csrf_field() ?><input type="hidden" name="email" value="<?= e((string)$email) ?>"><button type="submit">Enviar um novo código</button></form>
            <?php else: ?>
                <form method="post" action="<?= url('redefinir-senha') ?>" class="auth-form"><?= csrf_field() ?>
                    <label>Nova senha<div class="field-control password"><i class="bi bi-lock"></i><input type="password" name="senha" minlength="8" autocomplete="new-password" required autofocus placeholder="Mínimo de 8 caracteres"><button type="button" data-toggle-password aria-label="Mostrar senha"><i class="bi bi-eye"></i></button></div></label>
                    <label>Confirmar nova senha<div class="field-control password"><i class="bi bi-lock-fill"></i><input type="password" name="confirmacao" minlength="8" autocomplete="new-password" required placeholder="Repita a nova senha"><button type="button" data-toggle-password aria-label="Mostrar senha"><i class="bi bi-eye"></i></button></div></label>
                    <button class="btn primary wide" type="submit">Redefinir senha <i class="bi bi-check-lg"></i></button>
                </form>
            <?php endif; ?>
            <a class="back-to-login" href="<?= url('login') ?>"><i class="bi bi-arrow-left"></i> Voltar para o login</a>
            <p class="developer-credit">© <?= date('Y') ?> <strong>Lucas Paiva · Lux Solution</strong><span>Todos os direitos reservados. Proibida a reprodução não autorizada.</span></p>
        </div>
    </section>
</main>
<script src="<?= url('public/assets/js/app.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../public/assets/js/app.js') ?: 1) ?>"></script>
</body></html>
