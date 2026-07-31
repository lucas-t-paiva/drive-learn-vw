<?php
declare(strict_types=1);

/**
 * Leitor de fichas técnicas de modelos.
 *
 * A extração do texto do PDF ocorre no navegador com PDF.js. Assim o modo
 * local não depende de executáveis, extensões ou serviços pagos no servidor.
 * Quando MODEL_SHEET_READER_MODE for "hybrid" ou "openai", a mesma rota pode
 * complementar o resultado por meio da API configurada em .env.ai.
 */

function model_sheet_reader_config(): array
{
    if (function_exists('assistant_load_env')) assistant_load_env();
    $mode = strtolower(trim((string)(getenv('MODEL_SHEET_READER_MODE') ?: 'local')));
    if (!in_array($mode, ['local', 'hybrid', 'openai'], true)) $mode = 'local';
    return [
        'mode' => $mode,
        'model' => trim((string)(getenv('MODEL_SHEET_READER_MODEL') ?: (getenv('OPENAI_TEXT_MODEL') ?: 'gpt-5.6-luna'))),
        'key' => trim((string)(getenv('OPENAI_API_KEY') ?: '')),
        'timeout' => max(15, min(120, (int)(getenv('OPENAI_TIMEOUT') ?: 45))),
        'max_chars' => max(10000, min(150000, (int)(getenv('MODEL_SHEET_READER_MAX_CHARS') ?: 80000))),
        'pdf_detail' => in_array(strtolower((string)getenv('MODEL_SHEET_READER_PDF_DETAIL')), ['low', 'high'], true)
            ? strtolower((string)getenv('MODEL_SHEET_READER_PDF_DETAIL'))
            : 'auto',
    ];
}

function model_sheet_reader_normalize_text(string $text): string
{
    $text = str_replace(["\r\n", "\r", "\u{00A0}"], ["\n", "\n", ' '], $text);
    $text = preg_replace('/[ \t]+/u', ' ', $text) ?: $text;
    $text = preg_replace('/\n{3,}/u', "\n\n", $text) ?: $text;
    return trim($text);
}

function model_sheet_reader_clean_value(string $value): string
{
    $value = trim(preg_replace('/\s+/u', ' ', $value) ?: $value, " \t\n\r\0\x0B:;-");
    return mb_substr($value, 0, 255);
}

function model_sheet_reader_match(string $text, array $patterns): ?array
{
    foreach ($patterns as $pattern) {
        if (preg_match($pattern, $text, $match) && trim((string)($match[1] ?? '')) !== '') {
            return [
                'value' => model_sheet_reader_clean_value((string)$match[1]),
                'evidence' => model_sheet_reader_clean_value((string)($match[0] ?? $match[1])),
            ];
        }
    }
    return null;
}

function model_sheet_reader_add(array &$fields, string $name, string $label, ?array $match, int $confidence = 82): void
{
    if (!$match || ($match['value'] ?? '') === '') return;
    $fields[$name] = [
        'label' => $label,
        'value' => (string)$match['value'],
        'confidence' => max(1, min(100, $confidence)),
        'evidence' => (string)($match['evidence'] ?? ''),
    ];
}

function model_sheet_reader_number_kg(string $value): string
{
    $value = trim($value);
    if (preg_match('/^(\d{1,3}(?:[.\s]\d{3})+|\d{4,6})$/', $value, $match)) {
        $number = (int)preg_replace('/\D/', '', $match[1]);
        return number_format($number, 0, ',', '.') . ' kg';
    }
    if (preg_match('/^(\d+(?:[,.]\d+)?)\s*t(?:on(?:eladas?)?)?$/iu', $value, $match)) {
        $number = (float)str_replace(',', '.', $match[1]) * 1000;
        return number_format($number, 0, ',', '.') . ' kg';
    }
    return model_sheet_reader_clean_value($value);
}

function model_sheet_reader_infer_family(string $modelName): string
{
    $compact = strtoupper(preg_replace('/[^A-Z0-9]/', '', iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $modelName) ?: $modelName));
    if (str_starts_with($compact, 'EO500')) return 'Ônibus Elétricos Urbanos';
    if (preg_match('/^O500(R|RS|RSD|RSDD)/', $compact)) return 'O 500 Rodoviários';
    if (str_starts_with($compact, 'O500')) return 'O 500 Urbanos';
    if (str_starts_with($compact, 'OF')) return 'OF Urbanos e Fretamento';
    if (str_starts_with($compact, 'LO')) return 'LO Micro-Ônibus e Escolar';
    return '';
}

function model_sheet_reader_local(string $rawText): array
{
    $text = model_sheet_reader_normalize_text($rawText);
    $flat = preg_replace('/\s+/u', ' ', $text) ?: $text;
    $fields = [];

    $name = model_sheet_reader_match($flat, [
        '/^\s*((?:e?O\s*500|O500|OF|LO)\s*[A-Z0-9\/ .-]{2,28}?)(?=\s+(?:4x2|6x2|8x2|Piso|Dados|Chassi))/iu',
        '/^\s*([A-Z][A-Z0-9 -]{1,28}\d[A-Z0-9\/ .-]{0,18}?)(?=\s+(?:4x2|6x2|8x2|Dados))/u',
    ]);
    if ($name) {
        $name['value'] = preg_replace('/\b(e?)O\s*500\b/iu', '$1O 500', $name['value']) ?: $name['value'];
    }
    model_sheet_reader_add($fields, 'nome', 'Nome do modelo', $name, 94);

    $motor = model_sheet_reader_match($flat, [
        '/\bMotor\s+Modelo\s+(.{3,100}?)(?=\s+(?:Cilindros|Volume|Sist\.?|Sistema|Pot.ncia))/iu',
        '/\bModelo\s+do\s+motor\s*:?\s*(.{3,100}?)(?=\s+(?:Cilindros|Pot.ncia|Torque|Volume))/iu',
    ]);
    model_sheet_reader_add($fields, 'motor', 'Motor', $motor, 92);

    $power = model_sheet_reader_match($flat, [
        '/\bPot.ncia\s+m.xima\s*:?\s*(.{3,90}?)(?=\s+(?:Torque|Rota..o|Unidades|Sistema|Transmiss.o))/iu',
        '/\bPot.ncia\s*:?\s*(\d{2,4}\s*(?:cv|hp|kW).{0,55}?)(?=\s+(?:Torque|Transmiss.o|Motor))/iu',
    ]);
    model_sheet_reader_add($fields, 'potencia', 'Potência', $power, 92);

    $torque = model_sheet_reader_match($flat, [
        '/\bTorque\s+m.ximo\s*:?\s*(.{3,90}?)(?=\s+(?:Unidades|Sistema|Transmiss.o|Emiss.es))/iu',
        '/\bTorque\s*:?\s*(\d[\d.,\s]*Nm.{0,55}?)(?=\s+(?:Transmiss.o|Motor|Pot.ncia))/iu',
    ]);
    model_sheet_reader_add($fields, 'torque', 'Torque', $torque, 92);

    $transmission = model_sheet_reader_match($flat, [
        '/\bTransmiss.o\s+(?:Autom.tica\s+)?(?:Modelo\s+)?(.{4,150}?)(?=\s+(?:i\s*=|Rela..o|Acionamento|Eixos|Embreagem))/iu',
        '/\bC.mbio\s+(?:Modelo\s+)?(.{4,150}?)(?=\s+(?:i\s*=|Rela..o|Acionamento|Eixos))/iu',
    ]);
    model_sheet_reader_add($fields, 'transmissao', 'Transmissão', $transmission, 86);

    $pbt = null;
    if (preg_match('/\bTotal(?:\s*\(PBT\))?.*?\bPeso\s+.{0,55}?(?:\[kg\]|\(kg\))\s+(.{3,100}?)(?=\s+(?:Motor|Carroceria|Chassi|Suspens.o))/iu', $flat, $weightBlock)) {
        preg_match_all('/\b\d{1,3}(?:[.\s]\d{3})+\b|\b\d{4,6}\b/u', $weightBlock[1], $weightValues);
        $values = $weightValues[0] ?? [];
        if ($values) {
            $value = (string)end($values);
            $pbt = ['value' => $value, 'evidence' => 'Total (PBT): ' . $value . ' kg'];
        }
    }
    if (!$pbt) $pbt = model_sheet_reader_match($flat, [
        '/\bPBT\b[^\d]{0,45}(\d{1,3}(?:[.\s]\d{3})+|\d{4,6}|\d+(?:[,.]\d+)?\s*t(?:on(?:eladas?)?)?)/iu',
    ]);
    if ($pbt) $pbt['value'] = model_sheet_reader_number_kg($pbt['value']);
    model_sheet_reader_add($fields, 'pbt', 'PBT homologado', $pbt, 88);

    $pbtc = model_sheet_reader_match($flat, [
        '/\bPBTC\b[^\d]{0,45}(\d{1,3}(?:[.\s]\d{3})+|\d{4,6}|\d+(?:[,.]\d+)?\s*t(?:on(?:eladas?)?)?)/iu',
        '/\bPeso\s+Bruto\s+Total\s+Combinado[^\d]{0,30}(\d{1,3}(?:[.\s]\d{3})+|\d{4,6})/iu',
    ]);
    if ($pbtc) $pbtc['value'] = model_sheet_reader_number_kg($pbtc['value']);
    model_sheet_reader_add($fields, 'pbtc', 'PBTC homologado', $pbtc, 88);

    $reduction = model_sheet_reader_match($flat, [
        '/\bRedu..o\b.{0,90}?=>\s*(\d{1,2}[,.]\d{1,4}\s*:?\s*1)/iu',
        '/\bRedu..o\s+(?:no\s+eixo\s+)?(?:i\s*=\s*)?(\d{1,2}[,.]\d{1,4}\s*:?\s*1)(?=\s|$)/iu',
        '/\bRela..o\s+de\s+redu..o\s*:?\s*(\d{1,2}[,.]\d{1,4}\s*:?\s*1)/iu',
    ]);
    if ($reduction) {
        $reduction['value'] = preg_replace_callback(
            '/^(\d{1,2})[.,](\d{1,4})\s*:?\s*1$/u',
            static fn(array $match): string => $match[1] . ',' . $match[2] . ':1',
            $reduction['value']
        ) ?: $reduction['value'];
    }
    model_sheet_reader_add($fields, 'relacao_reducao', 'Relação de redução', $reduction, 91);

    $wheelbaseMatches = [];
    if (preg_match_all('/\b(?:Dist[aâ]ncia\s+)?entre[- ]?eixos?\b[^\d]{0,60}(\d(?:[.\s]?\d){3,5})\s*(mm|m)?/iu', $flat, $matches, PREG_SET_ORDER)) {
        foreach ($matches as $match) {
            $number = preg_replace('/\s/', '', $match[1]);
            if (($match[2] ?? '') === 'm' && !str_contains($number, ',')) $number .= ' m';
            elseif (!str_contains($number, 'mm')) $number .= ' mm';
            $wheelbaseMatches[] = $number;
        }
    }
    $wheelbaseMatches = array_values(array_unique($wheelbaseMatches));
    if (!$wheelbaseMatches && $name && preg_match_all('/\/(30|42|48|52|55|59|60)\b/', $name['value'], $codes)) {
        $knownWheelbases = ['30'=>'3.000 mm','42'=>'4.200 mm','48'=>'4.800 mm','52'=>'5.200 mm','55'=>'5.500 mm','59'=>'5.950 mm','60'=>'6.000 mm'];
        foreach ($codes[1] as $code) if (isset($knownWheelbases[$code])) $wheelbaseMatches[] = $knownWheelbases[$code];
        $wheelbaseMatches = array_values(array_unique($wheelbaseMatches));
    }
    if ($wheelbaseMatches) model_sheet_reader_add($fields, 'entre_eixos', 'Entre-eixos', [
        'value' => implode(' / ', array_slice($wheelbaseMatches, 0, 5)),
        'evidence' => 'Entre-eixos: ' . implode(' / ', array_slice($wheelbaseMatches, 0, 5)),
    ], 78);

    $length = model_sheet_reader_match($flat, [
        '/\bComprimento\s+encarro[cç]ado\s*\[m\]\s*(.{2,60}?)(?=\s+(?:Capacidade|Quantidade|Pesos|Largura))/iu',
        '/\bComprimento\s+(?:m[aá]ximo|total)\s*:?\s*(\d+(?:[,.]\d+)?\s*(?:m|mm))/iu',
    ]);
    model_sheet_reader_add($fields, 'comprimento', 'Comprimento', $length, 85);

    $passengers = model_sheet_reader_match($flat, [
        '/\b(?:Capacidade|Quantidade)\s+de\s+passageiros\s*:?\s*(.{2,110}?)(?=\s+(?:Quantidade|Pesos|Motor|Assentos|Carroceria))/iu',
        '/\bQuantidade\s+de\s+assentos\s*:?\s*(.{2,80}?)(?=\s+(?:Pesos|Motor|Carroceria))/iu',
    ]);
    model_sheet_reader_add($fields, 'capacidade_passageiros', 'Capacidade de passageiros', $passengers, 82);

    $emissions = model_sheet_reader_match($flat, [
        '/\b(Proconve\s+P-?\s*8\s*\/?\s*Euro\s*VI)\b/iu',
        '/\b(Proconve\s+P-?\s*\d+)\b/iu',
        '/\b(Euro\s*(?:VI|6|V|5))\b/iu',
    ]);
    model_sheet_reader_add($fields, 'emissoes', 'Norma de emissões', $emissions, 94);

    $configuration = model_sheet_reader_match($flat, [
        '/^\s*(?:.{2,35}?)\s+((?:4x2|6x2|8x2).{0,75}?)(?=\s+Dados\s+B[aá]sicos)/iu',
        '/\b((?:4x2|6x2|8x2)(?:\s+(?:articulado|superarticulado|rodovi[aá]rio|urbano|piso\s+(?:alto|baixo)|entrada\s+baixa))?)/iu',
    ]);
    model_sheet_reader_add($fields, 'configuracao', 'Configuração / tração', $configuration, 83);

    $vehicleType = ['value' => 'Ônibus', 'evidence' => 'Ficha técnica de chassi para ônibus'];
    model_sheet_reader_add($fields, 'tipo_veiculo', 'Tipo de veículo', $vehicleType, 86);

    $normalized = mb_strtolower($flat, 'UTF-8');
    $bodyParts = [];
    foreach (['superarticulado', 'articulado', 'piso baixo', 'piso alto', 'entrada baixa', 'rodoviário', 'urbano', 'fretamento', 'escolar', 'rural'] as $term) {
        if (str_contains($normalized, $term)) $bodyParts[] = ucfirst($term);
    }
    if ($bodyParts) model_sheet_reader_add($fields, 'tipo_carroceria', 'Tipo de carroceria', [
        'value' => implode(' · ', array_slice(array_values(array_unique($bodyParts)), 0, 4)),
        'evidence' => implode(', ', array_slice(array_values(array_unique($bodyParts)), 0, 4)),
    ], 76);

    $electric = str_contains($normalized, '100% elétric') || str_contains($normalized, '100% eletric') || preg_match('/\beO\s*500/iu', $flat);
    model_sheet_reader_add($fields, 'energia', 'Energia / propulsão', [
        'value' => $electric ? '100% elétrico' : 'Diesel',
        'evidence' => $electric ? 'Propulsão elétrica identificada na ficha' : 'Motor de combustão identificado na ficha',
    ], $electric ? 92 : 78);

    if ($electric) {
        model_sheet_reader_add($fields, 'bateria', 'Bateria', model_sheet_reader_match($flat, [
            '/\bBateria(?:s)?\s*:?\s*(.{3,140}?)(?=\s+(?:Autonomia|Carregamento|Recarga|Pot[eê]ncia|Motor))/iu',
            '/\b(\d{2,4}\s*kWh.{0,80}?)(?=\s+(?:Autonomia|Carregamento|Recarga))/iu',
        ]), 82);
        model_sheet_reader_add($fields, 'autonomia', 'Autonomia', model_sheet_reader_match($flat, [
            '/\bAutonomia\s*:?\s*(.{2,100}?)(?=\s+(?:Carregamento|Recarga|Bateria|Motor|Dimens[oõ]es))/iu',
        ]), 86);
        model_sheet_reader_add($fields, 'carregamento', 'Carregamento', model_sheet_reader_match($flat, [
            '/\b(?:Carregamento|Recarga)\s*:?\s*(.{3,140}?)(?=\s+(?:Autonomia|Bateria|Motor|Dimens[oõ]es))/iu',
        ]), 80);
    }

    if ($name) {
        $family = model_sheet_reader_infer_family($name['value']);
        if ($family !== '') $fields['familia_sugerida'] = [
            'label' => 'Família sugerida',
            'value' => $family,
            'confidence' => 88,
            'evidence' => 'Família inferida pela nomenclatura do modelo',
        ];
    }

    return [
        'fields' => $fields,
        'characters' => mb_strlen($text),
        'engine' => 'local-rules',
    ];
}

function model_sheet_reader_pdf_upload(array $file): ?array
{
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) return null;
    if (($file['error'] ?? UPLOAD_ERR_OK) !== UPLOAD_ERR_OK) {
        throw new RuntimeException('Não foi possível receber o PDF para análise.');
    }
    if ((int)($file['size'] ?? 0) > 15 * 1024 * 1024) {
        throw new RuntimeException('O PDF deve ter no máximo 15 MB.');
    }
    $path = (string)($file['tmp_name'] ?? '');
    $name = trim((string)($file['name'] ?? 'ficha-tecnica.pdf'));
    if ($path === '' || !is_uploaded_file($path)) {
        throw new RuntimeException('O arquivo temporário da ficha é inválido.');
    }
    $signature = file_get_contents($path, false, null, 0, 5);
    if ($signature !== '%PDF-') {
        throw new RuntimeException('O arquivo enviado não é um PDF válido.');
    }
    return ['path' => $path, 'name' => mb_substr($name, 0, 180)];
}

function model_sheet_reader_openai(string $text, array $local, array $config, ?array $pdf = null): array
{
    if ($config['key'] === '' || !function_exists('curl_init')) return $local;
    $allowed = ['nome','motor','potencia','torque','transmissao','pbt','pbtc','relacao_reducao','entre_eixos','tipo_veiculo','energia','configuracao','tipo_carroceria','emissoes','bateria','autonomia','capacidade_passageiros','comprimento','carregamento','mercado','familia_sugerida'];
    $instructions = 'Extraia dados técnicos do texto de uma ficha de veículo. Responda SOMENTE com JSON válido no formato {"fields":{"campo":{"value":"valor","confidence":0-100,"evidence":"trecho curto"}}}. Não invente. Omita campos sem evidência. PBT e PBTC devem ficar em kg (ex.: 23.000 kg), entre-eixos em mm e redução como x,xx:1. Campos permitidos: ' . implode(', ', $allowed) . '.';
    $prompt = "RESULTADO LOCAL:\n"
        . json_encode($local['fields'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
        . "\n\nTEXTO EXTRAÍDO DA FICHA:\n"
        . mb_substr($text, 0, $config['max_chars']);
    $input = $prompt;
    if ($pdf && is_file($pdf['path'])) {
        $bytes = file_get_contents($pdf['path']);
        if (!is_string($bytes)) throw new RuntimeException('Não foi possível preparar o PDF para a análise com IA.');
        $input = [[
            'role' => 'user',
            'content' => [
                [
                    'type' => 'input_file',
                    'filename' => $pdf['name'],
                    'file_data' => 'data:application/pdf;base64,' . base64_encode($bytes),
                    'detail' => $config['pdf_detail'],
                ],
                ['type' => 'input_text', 'text' => $prompt],
            ],
        ]];
    }
    $payload = [
        'model' => $config['model'],
        'instructions' => $instructions,
        'input' => $input,
        'max_output_tokens' => 1800,
    ];
    $curl = curl_init('https://api.openai.com/v1/responses');
    curl_setopt_array($curl, [
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES),
        CURLOPT_HTTPHEADER => ['Authorization: Bearer ' . $config['key'], 'Content-Type: application/json'],
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => $config['timeout'],
    ]);
    $raw = curl_exec($curl);
    $status = (int)curl_getinfo($curl, CURLINFO_RESPONSE_CODE);
    curl_close($curl);
    if (!is_string($raw) || $status < 200 || $status >= 300) return $local;
    $response = json_decode($raw, true);
    $output = trim((string)($response['output_text'] ?? ''));
    if ($output === '') {
        foreach ($response['output'] ?? [] as $item) foreach ($item['content'] ?? [] as $content) {
            if (($content['type'] ?? '') === 'output_text') $output .= (string)($content['text'] ?? '');
        }
    }
    $output = preg_replace('/^```(?:json)?\s*|\s*```$/i', '', trim($output)) ?: $output;
    $decoded = json_decode($output, true);
    if (!is_array($decoded['fields'] ?? null)) return $local;
    foreach ($decoded['fields'] as $name => $item) {
        if (!in_array($name, $allowed, true) || !is_array($item) || trim((string)($item['value'] ?? '')) === '') continue;
        $local['fields'][$name] = [
            'label' => $local['fields'][$name]['label'] ?? ucfirst(str_replace('_', ' ', $name)),
            'value' => model_sheet_reader_clean_value((string)$item['value']),
            'confidence' => max(1, min(100, (int)($item['confidence'] ?? 75))),
            'evidence' => model_sheet_reader_clean_value((string)($item['evidence'] ?? '')),
        ];
    }
    $local['engine'] = 'openai+' . $config['model'];
    return $local;
}

function handle_model_sheet_reader_event(string $route, string $method): void
{
    if ($route !== 'modelos/analisar-ficha') return;
    if ($method !== 'POST') {
        http_response_code(405);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(['ok' => false, 'message' => 'Método não permitido.'], JSON_UNESCAPED_UNICODE);
        exit;
    }
    try {
        verify_csrf();
        if (!can('models', 'create') && !can('models', 'update')) throw new RuntimeException('Seu perfil não permite preencher modelos por ficha técnica.');
        $config = model_sheet_reader_config();
        $text = model_sheet_reader_normalize_text((string)($_POST['texto'] ?? ''));
        $pdf = model_sheet_reader_pdf_upload($_FILES['ficha'] ?? []);
        $paidMode = in_array($config['mode'], ['hybrid', 'openai'], true) && $config['key'] !== '';
        if (mb_strlen($text) < 80 && !$paidMode) {
            throw new RuntimeException('O PDF não possui texto selecionável. No modo local, use uma ficha com texto ou preencha manualmente; PDFs digitalizados podem ser lidos ao ativar o modo híbrido com uma chave de API.');
        }
        if (mb_strlen($text) > $config['max_chars']) $text = mb_substr($text, 0, $config['max_chars']);
        $result = model_sheet_reader_local($text);
        if ($paidMode) {
            $usePdf = $config['mode'] === 'openai' || mb_strlen($text) < 500 || count($result['fields']) < 6;
            $result = model_sheet_reader_openai($text, $result, $config, $usePdf ? $pdf : null);
        }
        if (!$result['fields']) throw new RuntimeException('Nenhum campo técnico reconhecido. Você ainda pode preencher o formulário manualmente.');
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode([
            'ok' => true,
            'message' => count($result['fields']) . ' campo(s) reconhecido(s). Revise antes de aplicar.',
            'fields' => $result['fields'],
            'engine' => $result['engine'],
            'characters' => $result['characters'],
            'paid_ai_used' => str_starts_with((string)$result['engine'], 'openai+'),
        ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    } catch (Throwable $e) {
        http_response_code(422);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode(['ok' => false, 'message' => $e->getMessage()], JSON_UNESCAPED_UNICODE);
    }
    exit;
}
