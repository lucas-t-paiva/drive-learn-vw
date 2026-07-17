<?php
declare(strict_types=1);

$values = [
    'host' => trim((string)getenv('DB_HOST')) ?: 'localhost',
    'port' => trim((string)getenv('DB_PORT')),
    'database' => trim((string)getenv('DB_DATABASE')),
    'username' => trim((string)getenv('DB_USERNAME')),
    'password' => (string)getenv('DB_PASSWORD'),
];

if ($values['port'] === '') {
    $values['port'] = '3306';
}

$requiredSecrets = [
    'database' => 'HOSTGATOR_DB_NAME',
    'username' => 'HOSTGATOR_DB_USERNAME',
    'password' => 'HOSTGATOR_DB_PASSWORD',
];

foreach ($requiredSecrets as $field => $secretName) {
    if ($values[$field] === '') {
        fwrite(STDERR, "Secret obrigatório ausente: {$secretName}.\n");
        exit(1);
    }
}

$config = [
    'host' => $values['host'],
    'port' => $values['port'],
    'database' => $values['database'],
    'username' => $values['username'],
    'password' => $values['password'],
    'charset' => 'utf8mb4',
];

$target = dirname(__DIR__) . '/config/database.production.php';
$contents = "<?php\ndeclare(strict_types=1);\n\nreturn " . var_export($config, true) . ";\n";

if (file_put_contents($target, $contents, LOCK_EX) === false) {
    fwrite(STDERR, "Não foi possível criar a configuração de produção.\n");
    exit(1);
}
