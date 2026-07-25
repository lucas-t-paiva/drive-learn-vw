# Recuperação de senha por e-mail — Drive Learn

Este documento descreve o que precisa ser preparado para implementar a recuperação de senha usando uma conta Gmail exclusiva para os disparos da plataforma.

## 1. Criar a conta de envio

Crie uma conta separada, usada somente pelo sistema. Exemplos:

- `drivelearn.notificacoes@gmail.com`
- `drivelearn.suporte@gmail.com`
- `naoresponda.drivelearn@gmail.com`

Não use a conta pessoal do administrador e não reutilize a senha dessa conta em nenhum outro serviço.

Depois de criar a conta:

1. Cadastre telefone e e-mail de recuperação.
2. Use uma senha longa e exclusiva.
3. Ative a verificação em duas etapas.
4. Guarde os códigos de recuperação em local seguro.

O Google explica a configuração da verificação em duas etapas em:
[Proteger a conta com a verificação em duas etapas](https://support.google.com/accounts/answer/10956730).

## 2. Gerar uma senha de app

A senha normal da conta Gmail não deve ser colocada no sistema.

1. Entre na conta Google criada para o Drive Learn.
2. Abra **Conta do Google > Segurança**.
3. Ative a **Verificação em duas etapas**, caso ainda não esteja ativa.
4. Abra a página **Senhas de app**.
5. Crie uma senha com o nome `Drive Learn HostGator`.
6. Copie a senha de 16 caracteres apresentada pelo Google.
7. Guarde-a temporariamente em um gerenciador de senhas.

O Google informa que senhas de app exigem a verificação em duas etapas e podem ser revogadas quando a senha principal da conta é alterada:
[Criar e usar senhas de app](https://support.google.com/accounts/answer/185833).

> A senha de app não deve ser enviada por WhatsApp, adicionada ao Git ou escrita dentro de arquivos PHP versionados.

## 3. Configuração SMTP planejada

Para uma conta Gmail comum, a configuração inicial será:

```dotenv
MAIL_TRANSPORT=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_ENCRYPTION=tls
MAIL_USERNAME=drivelearn.notificacoes@gmail.com
MAIL_PASSWORD=COLOCAR_A_SENHA_DE_APP_SOMENTE_NA_HOSTGATOR
MAIL_FROM_ADDRESS=drivelearn.notificacoes@gmail.com
MAIL_FROM_NAME="Drive Learn"
MAIL_REPLY_TO=seu-email-de-suporte@dominio.com.br
APP_URL=https://seu-dominio.com.br
```

Essas variáveis deverão ficar no `.env` da hospedagem. O arquivo `.env` não pode ser enviado ao Git.

O Gmail não aceita mais integrações baseadas apenas na senha normal da conta. O Google recomenda autenticação moderna e informa que, quando necessário, uma senha de app pode ser usada com verificação em duas etapas:
[Adicionar o Gmail a outro cliente](https://support.google.com/mail/answer/7126229).

## 4. Verificar a HostGator

Antes da programação final:

1. Confirme que o plano permite conexões SMTP de saída.
2. Confirme que a porta `587` está liberada.
3. Confirme que o PHP possui `openssl`.
4. Confirme que o projeto consegue executar o Composer.
5. Caso a porta `587` esteja bloqueada, solicite a liberação ao suporte da HostGator.

## 5. Biblioteca que será utilizada

O envio deverá ser implementado com **PHPMailer**, evitando montar mensagens SMTP manualmente.

Com o Composer disponível:

```bash
composer require phpmailer/phpmailer
```

O pacote deverá ser instalado localmente e a pasta `vendor` precisa estar disponível na hospedagem, conforme a estratégia usada no deploy.

## 6. Fluxo implementado

O sistema foi implementado com o seguinte funcionamento:

1. O usuário acessa **Esqueci minha senha**.
2. Informa seu e-mail.
3. O sistema sempre mostra uma resposta genérica:
   `Se o e-mail estiver cadastrado, você receberá as instruções.`
4. Para um usuário válido, o sistema gera um token aleatório.
5. Apenas o hash do código é salvo no banco.
6. O usuário recebe um código de seis dígitos com validade de 2 minutos.
7. Depois de validar o código, informa e confirma a nova senha.
8. Depois da redefinição:
   - o token é invalidado;
   - outros tokens de recuperação do usuário são apagados;
   - sessões persistentes de “Lembrar de mim” são revogadas;
   - o evento é registrado na auditoria.

O código possui limite de cinco tentativas, uso único, intervalo mínimo de 60 segundos entre reenvios e armazenamento com `password_hash`.

## 7. Estrutura no banco

A migração `20260725_012_recuperacao_senha_email.sql` cria a tabela utilizada pela recuperação.

```sql
CREATE TABLE usuario_codigos_senha (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT UNSIGNED NOT NULL,
    codigo_hash VARCHAR(255) NOT NULL,
    expira_em DATETIME NOT NULL,
    tentativas TINYINT UNSIGNED DEFAULT 0,
    usado_em DATETIME NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_hash CHAR(64) NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    INDEX idx_token_senha_expiracao (expira_em)
);
```

O código original nunca é gravado no banco.

## 8. Proteções obrigatórias

- Resposta idêntica para e-mails cadastrados e não cadastrados.
- Limite de solicitações por IP e por e-mail.
- Token aleatório gerado com `random_bytes`.
- Armazenamento somente do hash seguro do código.
- Validade de 2 minutos.
- Código de uso único e limite de cinco tentativas.
- Senha nova armazenada com `password_hash`.
- Revogação das sessões persistentes depois da troca.
- Página de redefinição sempre em HTTPS.
- Nenhuma senha ou token registrado em logs.
- Limpeza periódica de tokens expirados.

## 9. Testes antes de publicar

1. Solicitar recuperação para um e-mail existente.
2. Solicitar para um e-mail inexistente e conferir que a resposta é igual.
3. Abrir o link recebido e trocar a senha.
4. Confirmar que o link não funciona uma segunda vez.
5. Confirmar que o link expira.
6. Confirmar que a senha antiga deixa de funcionar.
7. Confirmar que a nova senha funciona.
8. Confirmar que cookies antigos de “Lembrar de mim” são invalidados.
9. Conferir caixa de spam e reputação do remetente.
10. Testar no domínio definitivo com HTTPS.

## 10. Informações necessárias para ativar na hospedagem

Para ativar:

- endereço Gmail criado;
- confirmação de que a verificação em duas etapas foi ativada;
- confirmação de que a senha de app foi gerada e adicionada ao `.env.mail`;
- domínio definitivo da plataforma;
- nome e e-mail que receberão respostas de suporte.

Execute também as migrações `20260725_011_lembrar_login.sql` e `20260725_012_recuperacao_senha_email.sql`. Não envie a senha de app no chat.

## Observação para crescimento

O Gmail atende bem a testes e a um volume inicial pequeno. Se a plataforma crescer ou começar a enviar muitos e-mails, é recomendável migrar para um serviço transacional com métricas de entrega, tratamento de rejeições e melhor reputação de domínio, mantendo o mesmo fluxo interno de recuperação.
