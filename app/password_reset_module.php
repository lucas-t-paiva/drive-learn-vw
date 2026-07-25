<?php
declare(strict_types=1);

const PASSWORD_RESET_CODE_TTL_SECONDS = 120;
const PASSWORD_RESET_MAX_ATTEMPTS = 5;

function password_reset_load_mail_env(): void
{
    static $loaded=false;
    if($loaded)return;
    $loaded=true;
    $path=dirname(__DIR__).'/.env.mail';
    if(!is_file($path))return;
    foreach(file($path,FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES)?:[] as $line){
        $line=trim($line);
        if($line===''||str_starts_with($line,'#')||!str_contains($line,'='))continue;
        [$name,$value]=explode('=',$line,2);$name=trim($name);$value=trim($value);
        if(!preg_match('/^[A-Z_][A-Z0-9_]*$/',$name))continue;
        $length=strlen($value);
        if($length>=2&&(($value[0]==='"'&&$value[$length-1]==='"')||($value[0]==="'"&&$value[$length-1]==="'")))$value=substr($value,1,-1);
        if(getenv($name)===false){putenv("{$name}={$value}");$_ENV[$name]=$value;}
    }
}

function password_reset_mail_config(): array
{
    password_reset_load_mail_env();
    return [
        'host'=>trim((string)(getenv('MAIL_HOST')?:'')),
        'port'=>(int)(getenv('MAIL_PORT')?:587),
        'encryption'=>strtolower(trim((string)(getenv('MAIL_ENCRYPTION')?:'tls'))),
        'username'=>trim((string)(getenv('MAIL_USERNAME')?:'')),
        'password'=>str_replace(' ','',(string)(getenv('MAIL_PASSWORD')?:'')),
        'from_address'=>trim((string)(getenv('MAIL_FROM_ADDRESS')?:getenv('MAIL_USERNAME')?:'')),
        'from_name'=>trim((string)(getenv('MAIL_FROM_NAME')?:'Drive Learn')),
        'reply_to'=>trim((string)(getenv('MAIL_REPLY_TO')?:'')),
        'timeout'=>max(5,min(30,(int)(getenv('MAIL_TIMEOUT')?:15))),
    ];
}

function password_reset_smtp_read($socket): array
{
    $response='';
    while(($line=fgets($socket,515))!==false){
        $response.=$line;
        if(strlen($line)>=4&&$line[3]===' ')break;
    }
    return [(int)substr($response,0,3),trim($response)];
}

function password_reset_smtp_command($socket,string $command,array $expected): string
{
    if($command!==''&&fwrite($socket,$command."\r\n")===false)throw new RuntimeException('Falha ao comunicar com o servidor de e-mail.');
    [$code,$response]=password_reset_smtp_read($socket);
    if(!in_array($code,$expected,true))throw new RuntimeException("O servidor de e-mail recusou a operação ({$code}).");
    return $response;
}

function password_reset_header_value(string $value): string
{
    return trim(str_replace(["\r","\n"],' ',$value));
}

function password_reset_send_mail(string $recipient,string $recipientName,string $code): void
{
    $config=password_reset_mail_config();
    if($config['host']===''||$config['username']===''||$config['password']===''||!filter_var($config['from_address'],FILTER_VALIDATE_EMAIL)){
        throw new RuntimeException('O serviço de e-mail ainda não está configurado.');
    }
    $host=$config['host'];$transport=in_array($config['encryption'],['ssl','smtps'],true)?'ssl':'tcp';
    $socket=@stream_socket_client("{$transport}://{$host}:{$config['port']}",$errorNumber,$errorMessage,$config['timeout'],STREAM_CLIENT_CONNECT);
    if(!$socket)throw new RuntimeException('Não foi possível conectar ao serviço de e-mail.');
    stream_set_timeout($socket,$config['timeout']);
    try{
        password_reset_smtp_command($socket,'',[220]);
        $hostname=preg_replace('/[^a-z0-9.-]/i','',(string)($_SERVER['SERVER_NAME']??'drivelearn.local'))?:'drivelearn.local';
        password_reset_smtp_command($socket,"EHLO {$hostname}",[250]);
        if($config['encryption']==='tls'){
            password_reset_smtp_command($socket,'STARTTLS',[220]);
            $crypto=@stream_socket_enable_crypto($socket,true,STREAM_CRYPTO_METHOD_TLS_CLIENT);
            if($crypto!==true)throw new RuntimeException('Não foi possível iniciar a conexão segura com o e-mail.');
            password_reset_smtp_command($socket,"EHLO {$hostname}",[250]);
        }
        password_reset_smtp_command($socket,'AUTH LOGIN',[334]);
        password_reset_smtp_command($socket,base64_encode($config['username']),[334]);
        password_reset_smtp_command($socket,base64_encode($config['password']),[235]);
        password_reset_smtp_command($socket,'MAIL FROM:<'.$config['from_address'].'>',[250]);
        password_reset_smtp_command($socket,'RCPT TO:<'.$recipient.'>',[250,251]);
        password_reset_smtp_command($socket,'DATA',[354]);

        $safeName=e($recipientName?:'Usuário');
        $safeCode=e($code);
        $html='<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"></head><body style="margin:0;background:#f2f5f7;font-family:Arial,sans-serif;color:#172235">'
            .'<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background:#f2f5f7;padding:32px 12px"><tr><td align="center">'
            .'<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="max-width:600px;background:#fff;border:1px solid #dfe6eb;border-radius:16px;overflow:hidden">'
            .'<tr><td style="padding:26px 34px;background:#001e50;color:#fff"><table role="presentation" cellspacing="0" cellpadding="0"><tr><td style="width:44px;height:44px;border:2px solid #fff;border-radius:50%;text-align:center;font-size:12px;font-weight:bold">VW</td><td style="padding-left:13px"><strong style="font-size:20px">Drive Learn</strong><br><span style="font-size:10px;letter-spacing:1.5px;text-transform:uppercase;color:#cfe4ee">Caminhões e Ônibus</span></td></tr></table></td></tr>'
            .'<tr><td style="padding:34px"><p style="margin:0 0 10px;color:#0068a9;font-size:11px;font-weight:bold;letter-spacing:1.5px;text-transform:uppercase">Recuperação de acesso</p>'
            .'<h1 style="margin:0 0 18px;font-size:24px;color:#172235">Redefinição de senha</h1>'
            .'<p style="margin:0 0 14px;line-height:1.65;color:#536071">Olá, '.$safeName.'.</p>'
            .'<p style="margin:0 0 22px;line-height:1.65;color:#536071">Recebemos uma solicitação para redefinir sua senha no Drive Learn. Use o código abaixo para continuar:</p>'
            .'<div style="padding:20px;text-align:center;background:#edf7fb;border:1px solid #c7e2ee;border-radius:10px"><span style="display:block;margin-bottom:8px;color:#6d7888;font-size:11px;text-transform:uppercase;letter-spacing:1px">Código de verificação</span><strong style="font-size:34px;letter-spacing:9px;color:#001e50">'.$safeCode.'</strong></div>'
            .'<p style="margin:18px 0 0;text-align:center;color:#c14652;font-size:13px;font-weight:bold">Este código expira em 2 minutos.</p>'
            .'<div style="margin-top:26px;padding-top:20px;border-top:1px solid #e5eaee"><p style="margin:0;color:#7b8794;font-size:12px;line-height:1.6">Se você não solicitou a alteração, ignore esta mensagem. Sua senha continuará a mesma. Nunca compartilhe este código com outras pessoas.</p></div>'
            .'</td></tr><tr><td style="padding:18px 34px;background:#f7f9fa;color:#89939d;font-size:11px;text-align:center">© '.date('Y').' Lucas Paiva · Lux Solution · Todos os direitos reservados.</td></tr>'
            .'</table></td></tr></table></body></html>';
        $plain="Olá, {$recipientName}.\n\nSeu código de recuperação do Drive Learn é: {$code}\n\nO código expira em 2 minutos. Se você não solicitou esta alteração, ignore esta mensagem.";
        $boundary='dl_'.bin2hex(random_bytes(12));
        $subject='=?UTF-8?B?'.base64_encode('Código para redefinir sua senha · Drive Learn').'?=';
        $fromName='=?UTF-8?B?'.base64_encode(password_reset_header_value($config['from_name'])).'?=';
        $headers=[
            'Date: '.date(DATE_RFC2822),
            'From: '.$fromName.' <'.$config['from_address'].'>',
            'To: '.($recipientName!==''?'=?UTF-8?B?'.base64_encode(password_reset_header_value($recipientName)).'?= ':'').'<'.$recipient.'>',
            'Subject: '.$subject,
            'Message-ID: <'.bin2hex(random_bytes(12)).'@'.$hostname.'>',
            'MIME-Version: 1.0',
            'Content-Type: multipart/alternative; boundary="'.$boundary.'"',
        ];
        if(filter_var($config['reply_to'],FILTER_VALIDATE_EMAIL))$headers[]='Reply-To: '.$config['reply_to'];
        $body="--{$boundary}\r\nContent-Type: text/plain; charset=UTF-8\r\nContent-Transfer-Encoding: base64\r\n\r\n".chunk_split(base64_encode($plain),76,"\r\n")
            ."--{$boundary}\r\nContent-Type: text/html; charset=UTF-8\r\nContent-Transfer-Encoding: base64\r\n\r\n".chunk_split(base64_encode($html),76,"\r\n")
            ."--{$boundary}--\r\n";
        $message=implode("\r\n",$headers)."\r\n\r\n".$body;
        if(fwrite($socket,$message."\r\n.\r\n")===false)throw new RuntimeException('Não foi possível transmitir a mensagem.');
        [$dataCode]=password_reset_smtp_read($socket);
        if($dataCode!==250)throw new RuntimeException("O servidor de e-mail não aceitou a mensagem ({$dataCode}).");
        password_reset_smtp_command($socket,'QUIT',[221]);
    }finally{fclose($socket);}
}

function password_reset_ip_hash(): string
{
    return hash('sha256',(string)($_SERVER['REMOTE_ADDR']??'unknown'));
}

function password_reset_mask_email(string $email): string
{
    [$local,$domain]=array_pad(explode('@',$email,2),2,'');
    if($domain==='')return $email;
    $visible=mb_substr($local,0,min(2,mb_strlen($local)),'UTF-8');
    return $visible.str_repeat('•',max(3,mb_strlen($local)-mb_strlen($visible))).'@'.$domain;
}

function password_reset_render(string $step,array $data=[]): never
{
    $resetStep=$step;$notice=$data['notice']??pull_flash();$email=$data['email']??($_SESSION['password_reset_email']??'');$error=$data['error']??null;
    $secondsRemaining=PASSWORD_RESET_CODE_TTL_SECONDS;
    if($step==='verify'&&filter_var($email,FILTER_VALIDATE_EMAIL)){
        try{$pdo=db();$stmt=$pdo?->prepare('SELECT GREATEST(0,TIMESTAMPDIFF(SECOND,NOW(),r.expira_em)) FROM usuario_codigos_senha r JOIN usuarios u ON u.id=r.usuario_id WHERE u.email=? AND r.usado_em IS NULL ORDER BY r.id DESC LIMIT 1');$stmt?->execute([$email]);$remaining=$stmt?->fetchColumn();if($remaining!==false)$secondsRemaining=max(0,(int)$remaining);}catch(Throwable $e){}
    }
    require dirname(__DIR__).'/views/password_reset.php';
    exit;
}

function handle_password_reset_route(string $route,string $method): bool
{
    if(!in_array($route,['recuperar-senha','validar-codigo','redefinir-senha'],true))return false;
    if(user())redirect('dashboard');
    $pdo=db();
    if(!$pdo||!database_ready())password_reset_render('request',['error'=>'O serviço de recuperação está temporariamente indisponível.']);

    if($route==='recuperar-senha'){
        if($method==='POST'){
            verify_csrf();$email=strtolower(trim((string)($_POST['email']??'')));
            if(!filter_var($email,FILTER_VALIDATE_EMAIL))password_reset_render('request',['error'=>'Informe um endereço de e-mail válido.','email'=>$email]);
            $generic='Se o e-mail estiver cadastrado, enviaremos um código de verificação. Confira também a caixa de spam.';
            try{
                $ipHash=password_reset_ip_hash();
                $ipLimit=$pdo->prepare('SELECT COUNT(*) FROM usuario_codigos_senha WHERE ip_hash=? AND criado_em>DATE_SUB(NOW(),INTERVAL 10 MINUTE)');
                $ipLimit->execute([$ipHash]);
                if((int)$ipLimit->fetchColumn()>=10){$_SESSION['password_reset_email']=$email;flash('info',$generic);redirect('validar-codigo');}
                $userStmt=$pdo->prepare('SELECT id,nome,email FROM usuarios WHERE email=? AND ativo=1 LIMIT 1');$userStmt->execute([$email]);$account=$userStmt->fetch();
                if($account){
                    $limit=$pdo->prepare('SELECT criado_em FROM usuario_codigos_senha WHERE usuario_id=? ORDER BY id DESC LIMIT 1');$limit->execute([(int)$account['id']]);$last=$limit->fetchColumn();
                    if($last&&strtotime((string)$last)>time()-60){
                        $_SESSION['password_reset_email']=$email;flash('info','Aguarde 60 segundos antes de solicitar outro código.');redirect('validar-codigo');
                    }
                    $pdo->prepare('UPDATE usuario_codigos_senha SET usado_em=COALESCE(usado_em,NOW()) WHERE usuario_id=? AND usado_em IS NULL')->execute([(int)$account['id']]);
                    $code=(string)random_int(100000,999999);$hash=password_hash($code,PASSWORD_DEFAULT);
                    $insert=$pdo->prepare('INSERT INTO usuario_codigos_senha(usuario_id,codigo_hash,expira_em,ip_hash) VALUES(?,?,DATE_ADD(NOW(),INTERVAL 2 MINUTE),?)');
                    $insert->execute([(int)$account['id'],$hash,$ipHash]);$resetId=(int)$pdo->lastInsertId();
                    try{password_reset_send_mail($account['email'],$account['nome'],$code);}
                    catch(Throwable $mailError){$pdo->prepare('UPDATE usuario_codigos_senha SET usado_em=NOW() WHERE id=?')->execute([$resetId]);error_log('Drive Learn password email: '.$mailError->getMessage());}
                }
                $_SESSION['password_reset_email']=$email;flash('success',$generic);redirect('validar-codigo');
            }catch(Throwable $e){error_log('Drive Learn password reset request: '.$e->getMessage());password_reset_render('request',['error'=>'Não foi possível processar a solicitação agora. Tente novamente em alguns instantes.','email'=>$email]);}
        }
        password_reset_render('request');
    }

    $email=strtolower(trim((string)($_SESSION['password_reset_email']??'')));
    if(!filter_var($email,FILTER_VALIDATE_EMAIL)){flash('info','Informe seu e-mail para iniciar a recuperação.');redirect('recuperar-senha');}

    if($route==='validar-codigo'){
        if($method==='POST'){
            verify_csrf();$code=preg_replace('/\D/','',(string)($_POST['codigo']??''));
            if(strlen($code)!==6)password_reset_render('verify',['error'=>'Informe o código de seis dígitos.','email'=>$email]);
            $stmt=$pdo->prepare('SELECT r.id,r.usuario_id,r.codigo_hash,r.tentativas,r.expira_em,(r.expira_em>NOW()) valido FROM usuario_codigos_senha r JOIN usuarios u ON u.id=r.usuario_id AND u.ativo=1 WHERE u.email=? AND r.usado_em IS NULL ORDER BY r.id DESC LIMIT 1');
            $stmt->execute([$email]);$reset=$stmt->fetch();
            if(!$reset||!(int)$reset['valido']){if($reset)$pdo->prepare('UPDATE usuario_codigos_senha SET usado_em=NOW() WHERE id=?')->execute([(int)$reset['id']]);password_reset_render('verify',['error'=>'O código expirou. Solicite um novo código.','email'=>$email]);}
            if((int)$reset['tentativas']>=PASSWORD_RESET_MAX_ATTEMPTS)password_reset_render('verify',['error'=>'O limite de tentativas foi atingido. Solicite um novo código.','email'=>$email]);
            if(!password_verify($code,(string)$reset['codigo_hash'])){
                $pdo->prepare('UPDATE usuario_codigos_senha SET tentativas=tentativas+1 WHERE id=?')->execute([(int)$reset['id']]);
                password_reset_render('verify',['error'=>'Código incorreto. Verifique e tente novamente.','email'=>$email]);
            }
            session_regenerate_id(true);$_SESSION['password_reset_authorized']=['id'=>(int)$reset['id'],'user_id'=>(int)$reset['usuario_id'],'expires'=>time()+300];
            redirect('redefinir-senha');
        }
        password_reset_render('verify',['email'=>$email]);
    }

    $authorization=$_SESSION['password_reset_authorized']??null;
    if(!is_array($authorization)||($authorization['expires']??0)<time()){unset($_SESSION['password_reset_authorized']);flash('info','Valide um novo código para redefinir sua senha.');redirect('validar-codigo');}
    if($method==='POST'){
        verify_csrf();$password=(string)($_POST['senha']??'');$confirmation=(string)($_POST['confirmacao']??'');
        if(strlen($password)<8)password_reset_render('reset',['error'=>'A nova senha deve ter pelo menos 8 caracteres.','email'=>$email]);
        if($password!==$confirmation)password_reset_render('reset',['error'=>'As senhas informadas não são iguais.','email'=>$email]);
        try{
            $pdo->beginTransaction();
            $check=$pdo->prepare('SELECT id FROM usuario_codigos_senha WHERE id=? AND usuario_id=? AND usado_em IS NULL FOR UPDATE');
            $check->execute([(int)$authorization['id'],(int)$authorization['user_id']]);
            if(!$check->fetchColumn())throw new RuntimeException('A autorização expirou. Solicite um novo código.');
            $pdo->prepare('UPDATE usuarios SET senha_hash=? WHERE id=? AND ativo=1')->execute([password_hash($password,PASSWORD_DEFAULT),(int)$authorization['user_id']]);
            $pdo->prepare('UPDATE usuario_codigos_senha SET usado_em=NOW() WHERE usuario_id=? AND usado_em IS NULL')->execute([(int)$authorization['user_id']]);
            $pdo->prepare('DELETE FROM usuario_tokens_lembrar WHERE usuario_id=?')->execute([(int)$authorization['user_id']]);
            $pdo->commit();
            unset($_SESSION['password_reset_email'],$_SESSION['password_reset_authorized']);clear_remember_cookie();
            flash('success','Senha redefinida com sucesso. Entre usando sua nova senha.');redirect('login');
        }catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();password_reset_render('reset',['error'=>$e instanceof RuntimeException?$e->getMessage():'Não foi possível atualizar sua senha. Tente novamente.','email'=>$email]);}
    }
    password_reset_render('reset',['email'=>$email]);
}
