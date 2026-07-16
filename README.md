# Drive Learn VWCO

MVP responsivo de treinamento para frotas Volkswagen Caminhões e Ônibus, construído em PHP 8, MySQL, HTML, CSS e JavaScript, sem dependências externas.

## Rodar no XAMPP

1. Copie esta pasta para `C:\\xampp\\htdocs\\drive-learn-vw` (ou crie um VirtualHost apontando para ela).
2. Inicie Apache e MySQL no XAMPP.
3. Importe `database/schema.sql` no banco `drive-learn-vw` pelo phpMyAdmin.
4. Execute `C:\xampp\php\php.exe database\migrate_access_control.php` para criar empresas, localidades, vínculos e perfis de acesso.
5. Execute `C:\xampp\php\php.exe database\migrate_fleet.php` para criar o cadastro de normas de emissões e evoluir a frota.
6. Ajuste as credenciais em `config/database.php`, se necessário.
7. Abra `http://localhost/drive-learn-vw/`.

Enquanto o banco não estiver disponível, a aplicação entra automaticamente em **modo demonstração**.

## Acesso inicial após importar o banco

- E-mail: `admin@drivelearn.local`
- Senha: `Admin@123`

Troque essa senha antes de publicar.

## Estrutura

- `app/`: autenticação, autorização, dados e helpers
- `config/`: configurações e conexão PDO
- `database/`: esquema MySQL e carga inicial
- `public/`: ponto de entrada e assets
- `views/`: layout e páginas
- `uploads/`: anexos e imagens enviados pelo sistema

## Módulos do MVP

Dashboard, biblioteca de treinamentos, frota do cliente, famílias, modelos, categorias, subcategorias, vídeos, clientes, usuários, perfis/permissões, histórico e avaliações.
