<?php
declare(strict_types=1);

function model_xlsx_escape(string $value): string
{
    return htmlspecialchars($value, ENT_XML1 | ENT_QUOTES, 'UTF-8');
}

function model_xlsx_column(int $index): string
{
    $column = '';
    while ($index > 0) {
        $index--;
        $column = chr(65 + ($index % 26)) . $column;
        $index = intdiv($index, 26);
    }
    return $column;
}

function model_xlsx_cell(string $reference, mixed $value, int $style = 0): string
{
    $styleAttribute = $style > 0 ? ' s="' . $style . '"' : '';
    if ($value === null || $value === '') return '<c r="' . $reference . '"' . $styleAttribute . '/>';
    if (is_int($value) || is_float($value)) {
        return '<c r="' . $reference . '"' . $styleAttribute . ' t="n"><v>' . $value . '</v></c>';
    }
    $escaped = model_xlsx_escape((string)$value);
    return '<c r="' . $reference . '"' . $styleAttribute . ' t="inlineStr"><is><t xml:space="preserve">' . $escaped . '</t></is></c>';
}

function model_xlsx_sheet_xml(array $rows, array $widths, array $validations = [], bool $freeze = true): string
{
    $rowXml = '';
    foreach ($rows as $rowIndex => $row) {
        $number = $rowIndex + 1;
        $cells = '';
        foreach (array_values($row) as $columnIndex => $value) {
            $cells .= model_xlsx_cell(model_xlsx_column($columnIndex + 1) . $number, $value, $rowIndex === 0 ? 2 : 0);
        }
        $height = $rowIndex === 0 ? ' ht="24" customHeight="1"' : '';
        $rowXml .= '<row r="' . $number . '"' . $height . '>' . $cells . '</row>';
    }

    $cols = '';
    foreach ($widths as $index => $width) {
        $column = $index + 1;
        $cols .= '<col min="' . $column . '" max="' . $column . '" width="' . (float)$width . '" customWidth="1"/>';
    }

    $validationXml = '';
    if ($validations) {
        foreach ($validations as $validation) {
            $validationXml .= '<dataValidation type="list" allowBlank="1" showErrorMessage="1" errorStyle="stop" errorTitle="Valor inválido" error="Selecione um valor disponível na lista." sqref="' . model_xlsx_escape($validation['range']) . '"><formula1>' . model_xlsx_escape($validation['formula']) . '</formula1></dataValidation>';
        }
        $validationXml = '<dataValidations count="' . count($validations) . '">' . $validationXml . '</dataValidations>';
    }

    $lastColumn = model_xlsx_column(max(1, count($widths)));
    $lastRow = max(1, count($rows));
    $pane = $freeze ? '<pane ySplit="1" topLeftCell="A2" activePane="bottomLeft" state="frozen"/>' : '';
    $autoFilter = $lastRow > 1 ? '<autoFilter ref="A1:' . $lastColumn . $lastRow . '"/>' : '';

    return '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        . '<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
        . '<dimension ref="A1:' . $lastColumn . $lastRow . '"/>'
        . '<sheetViews><sheetView workbookViewId="0" showGridLines="0">' . $pane . '</sheetView></sheetViews>'
        . '<sheetFormatPr defaultRowHeight="18"/><cols>' . $cols . '</cols><sheetData>' . $rowXml . '</sheetData>'
        . $autoFilter . $validationXml
        . '<pageMargins left="0.4" right="0.4" top="0.6" bottom="0.6" header="0.2" footer="0.2"/>'
        . '</worksheet>';
}

function model_xlsx_styles_xml(): string
{
    return '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        . '<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
        . '<fonts count="3"><font><sz val="10"/><name val="Arial"/></font><font><b/><color rgb="FFFFFFFF"/><sz val="10"/><name val="Arial"/></font><font><b/><color rgb="FF001E50"/><sz val="12"/><name val="Arial"/></font></fonts>'
        . '<fills count="4"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill><fill><patternFill patternType="solid"><fgColor rgb="FF001E50"/><bgColor indexed="64"/></patternFill></fill><fill><patternFill patternType="solid"><fgColor rgb="FFEAF6FB"/><bgColor indexed="64"/></patternFill></fill></fills>'
        . '<borders count="2"><border><left/><right/><top/><bottom/><diagonal/></border><border><left style="thin"><color rgb="FFD8E1E8"/></left><right style="thin"><color rgb="FFD8E1E8"/></right><top style="thin"><color rgb="FFD8E1E8"/></top><bottom style="thin"><color rgb="FFD8E1E8"/></bottom><diagonal/></border></borders>'
        . '<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>'
        . '<cellXfs count="3"><xf numFmtId="0" fontId="0" fillId="0" borderId="1" xfId="0" applyBorder="1" applyAlignment="1"><alignment vertical="top" wrapText="1"/></xf><xf numFmtId="0" fontId="2" fillId="3" borderId="0" xfId="0"/><xf numFmtId="0" fontId="1" fillId="2" borderId="1" xfId="0" applyFont="1" applyFill="1" applyBorder="1" applyAlignment="1"><alignment vertical="center" wrapText="1"/></xf></cellXfs>'
        . '<cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>'
        . '</styleSheet>';
}

function model_spreadsheet_export(PDO $pdo): never
{
    if (!class_exists('ZipArchive')) throw new RuntimeException('A extensão ZIP do PHP é necessária para gerar o Excel.');

    $brands = $pdo->query('SELECT id,nome,pais_origem,site_oficial,descricao,ativo FROM marcas ORDER BY nome')->fetchAll();
    $families = $pdo->query('SELECT f.id,ma.nome marca_nome,f.nome,f.descricao,f.ativo FROM familias f JOIN marcas ma ON ma.id=f.marca_id ORDER BY ma.nome,f.nome')->fetchAll();
    $categories = $pdo->query('SELECT id,nome,descricao,icone,ordem,ativo FROM categorias ORDER BY ordem,nome')->fetchAll();
    $subcategories = $pdo->query('SELECT s.id,c.nome categoria_nome,s.nome,s.descricao,s.ordem,s.ativo FROM subcategorias s JOIN categorias c ON c.id=s.categoria_id ORDER BY c.nome,s.ordem,s.nome')->fetchAll();
    $models = $pdo->query("SELECT m.*,ma.nome marca_nome,f.nome familia_nome,
        (SELECT md.url_origem FROM modelo_documentos md WHERE md.modelo_id=m.id AND md.tipo='ficha_tecnica' AND md.ativo=1 LIMIT 1) ficha_url
        FROM modelos m JOIN familias f ON f.id=m.familia_id JOIN marcas ma ON ma.id=f.marca_id
        ORDER BY ma.nome,f.nome,m.nome")->fetchAll();

    $yesNo = static fn(mixed $value): string => (int)$value === 1 ? 'Sim' : 'Não';
    $modelRows = [[
        'ID','Marca','Família','Nome do modelo','Descrição','Motor','Potência','Torque','Transmissão',
        'PBT','PBTC','Relação de redução','Entre-eixos','Tipo de veículo','Energia / propulsão',
        'Configuração / tração','Tipo de carroceria','Norma de emissões','Bateria','Autonomia',
        'Capacidade de passageiros','Comprimento','Carregamento','Mercado / aplicação','URL da ficha técnica','Ativo'
    ]];
    foreach ($models as $model) {
        $specs = json_decode((string)($model['especificacoes'] ?? ''), true);
        if (!is_array($specs)) $specs = [];
        $modelRows[] = [
            (int)$model['id'],$model['marca_nome'],$model['marca_nome'].' · '.$model['familia_nome'],$model['nome'],$model['descricao'],
            $model['motor'],$model['potencia'],$model['torque'],$model['transmissao'],$model['pbt'],$model['pbtc'] ?? '',
            $model['relacao_reducao'] ?? '',$specs['entre_eixos'] ?? '',$specs['tipo_veiculo'] ?? '',$specs['energia'] ?? '',
            $specs['configuracao'] ?? '',$specs['tipo_carroceria'] ?? '',$specs['emissoes'] ?? '',$specs['bateria'] ?? '',
            $specs['autonomia'] ?? '',$specs['capacidade_passageiros'] ?? '',$specs['comprimento'] ?? '',
            $specs['carregamento'] ?? '',$specs['mercado'] ?? '',$model['ficha_url'] ?? '',$yesNo($model['ativo'])
        ];
    }

    $brandRows = [['ID','Nome da marca','País de origem','Site oficial','Descrição','Ativo']];
    foreach ($brands as $brand) $brandRows[] = [(int)$brand['id'],$brand['nome'],$brand['pais_origem'],$brand['site_oficial'],$brand['descricao'],$yesNo($brand['ativo'])];
    $familyRows = [['ID','Marca','Nome da família','Descrição','Ativo']];
    foreach ($families as $family) $familyRows[] = [(int)$family['id'],$family['marca_nome'],$family['nome'],$family['descricao'],$yesNo($family['ativo'])];
    $categoryRows = [['ID','Nome da categoria','Descrição','Ícone Bootstrap','Ordem','Ativo']];
    foreach ($categories as $category) $categoryRows[] = [(int)$category['id'],$category['nome'],$category['descricao'],$category['icone'],(int)$category['ordem'],$yesNo($category['ativo'])];
    $subcategoryRows = [['ID','Categoria','Nome da subcategoria','Descrição','Ordem','Ativo']];
    foreach ($subcategories as $subcategory) $subcategoryRows[] = [(int)$subcategory['id'],$subcategory['categoria_nome'],$subcategory['nome'],$subcategory['descricao'],(int)$subcategory['ordem'],$yesNo($subcategory['ativo'])];

    $brandNames = array_values(array_unique(array_column($brands, 'nome')));
    $familyNames = array_map(static fn(array $family): string => $family['marca_nome'].' · '.$family['nome'], $families);
    $categoryNames = array_values(array_unique(array_column($categories, 'nome')));
    $subcategoryNames = array_map(static fn(array $subcategory): string => $subcategory['categoria_nome'].' · '.$subcategory['nome'], $subcategories);
    $maxListRows = max(count($brandNames), count($familyNames), count($categoryNames), count($subcategoryNames), 2);
    $listRows = [['Marcas','Famílias','Categorias','Subcategorias','Status']];
    for ($index = 0; $index < $maxListRows; $index++) {
        $listRows[] = [$brandNames[$index] ?? '',$familyNames[$index] ?? '',$categoryNames[$index] ?? '',$subcategoryNames[$index] ?? '',$index === 0 ? 'Sim' : ($index === 1 ? 'Não' : '')];
    }

    $brandEnd = max(2, count($brandNames) + 1);
    $familyEnd = max(2, count($familyNames) + 1);
    $categoryEnd = max(2, count($categoryNames) + 1);
    $statusFormula = "'Listas'!\$E\$2:\$E\$3";
    $sheets = [
        ['Modelos', $modelRows, array_fill(0, 26, 18), [
            ['range'=>'B2:B5000','formula'=>"'Listas'!\$A\$2:\$A\${$brandEnd}"],
            ['range'=>'C2:C5000','formula'=>"'Listas'!\$B\$2:\$B\${$familyEnd}"],
            ['range'=>'Z2:Z5000','formula'=>$statusFormula],
        ], false],
        ['Marcas', $brandRows, [10,24,18,34,42,12], [['range'=>'F2:F5000','formula'=>$statusFormula]], false],
        ['Familias', $familyRows, [10,24,28,42,12], [
            ['range'=>'B2:B5000','formula'=>"'Listas'!\$A\$2:\$A\${$brandEnd}"],
            ['range'=>'E2:E5000','formula'=>$statusFormula],
        ], false],
        ['Categorias', $categoryRows, [10,28,44,20,10,12], [['range'=>'F2:F5000','formula'=>$statusFormula]], false],
        ['Subcategorias', $subcategoryRows, [10,28,30,44,10,12], [
            ['range'=>'B2:B5000','formula'=>"'Listas'!\$C\$2:\$C\${$categoryEnd}"],
            ['range'=>'F2:F5000','formula'=>$statusFormula],
        ], false],
        ['Listas', $listRows, [28,40,30,42,12], [], true],
    ];

    $tmpDir = __DIR__ . '/../storage/tmp';
    if (!is_dir($tmpDir)) mkdir($tmpDir, 0775, true);
    $tmp = tempnam($tmpDir, 'modelos_');
    if ($tmp === false) throw new RuntimeException('Não foi possível preparar o arquivo de exportação.');
    $xlsxPath = $tmp . '.xlsx';
    @unlink($tmp);

    $zip = new ZipArchive();
    if ($zip->open($xlsxPath, ZipArchive::CREATE | ZipArchive::OVERWRITE) !== true) throw new RuntimeException('Não foi possível criar o arquivo Excel.');

    $sheetOverrides = '';
    foreach ($sheets as $index => $sheet) $sheetOverrides .= '<Override PartName="/xl/worksheets/sheet'.($index+1).'.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>';
    $zip->addFromString('[Content_Types].xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>'.$sheetOverrides.'<Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/><Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/></Types>');
    $zip->addFromString('_rels/.rels', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/><Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/></Relationships>');

    $workbookSheets = '';
    $workbookRelationships = '';
    foreach ($sheets as $index => $sheet) {
        $sheetId = $index + 1;
        $state = $sheet[4] ? ' state="veryHidden"' : '';
        $workbookSheets .= '<sheet name="' . model_xlsx_escape($sheet[0]) . '" sheetId="' . $sheetId . '"' . $state . ' r:id="rId' . $sheetId . '"/>';
        $workbookRelationships .= '<Relationship Id="rId' . $sheetId . '" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet' . $sheetId . '.xml"/>';
        $zip->addFromString('xl/worksheets/sheet' . $sheetId . '.xml', model_xlsx_sheet_xml($sheet[1], $sheet[2], $sheet[3]));
    }
    $styleRelationshipId = count($sheets) + 1;
    $workbookRelationships .= '<Relationship Id="rId' . $styleRelationshipId . '" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>';
    $zip->addFromString('xl/workbook.xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><bookViews><workbookView xWindow="0" yWindow="0" windowWidth="24000" windowHeight="14000"/></bookViews><sheets>'.$workbookSheets.'</sheets><calcPr calcId="191029" fullCalcOnLoad="1"/></workbook>');
    $zip->addFromString('xl/_rels/workbook.xml.rels', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'.$workbookRelationships.'</Relationships>');
    $zip->addFromString('xl/styles.xml', model_xlsx_styles_xml());
    $timestamp = gmdate('Y-m-d\TH:i:s\Z');
    $zip->addFromString('docProps/core.xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><dc:title>Drive Learn - Importação e exportação</dc:title><dc:creator>Drive Learn</dc:creator><dcterms:created xsi:type="dcterms:W3CDTF">'.$timestamp.'</dcterms:created><dcterms:modified xsi:type="dcterms:W3CDTF">'.$timestamp.'</dcterms:modified></cp:coreProperties>');
    $zip->addFromString('docProps/app.xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties" xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"><Application>Drive Learn</Application></Properties>');
    $zip->close();

    $filename = 'drive-learn-catalogo-' . date('Ymd-His') . '.xlsx';
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment; filename="' . $filename . '"');
    header('Content-Length: ' . filesize($xlsxPath));
    header('Cache-Control: no-store, no-cache, must-revalidate');
    readfile($xlsxPath);
    @unlink($xlsxPath);
    exit;
}

function model_xlsx_read_sheets(string $path): array
{
    if (!class_exists('ZipArchive')) throw new RuntimeException('A extensão ZIP do PHP é necessária para importar o Excel.');
    $zip = new ZipArchive();
    if ($zip->open($path) !== true) throw new RuntimeException('O arquivo XLSX está inválido ou corrompido.');
    try {
        $uncompressedSize = 0;
        for ($index = 0; $index < $zip->numFiles; $index++) {
            $stats = $zip->statIndex($index);
            $entrySize = (int)($stats['size'] ?? 0);
            $uncompressedSize += $entrySize;
            if ($entrySize > 25 * 1024 * 1024 || $uncompressedSize > 60 * 1024 * 1024) {
                throw new RuntimeException('O conteúdo descompactado do Excel ultrapassa o limite permitido.');
            }
        }
        $workbookXml = $zip->getFromName('xl/workbook.xml');
        $relationshipsXml = $zip->getFromName('xl/_rels/workbook.xml.rels');
        if ($workbookXml === false || $relationshipsXml === false) throw new RuntimeException('O Excel não contém a estrutura esperada.');

        $workbook = simplexml_load_string($workbookXml, SimpleXMLElement::class, LIBXML_NONET);
        $relationships = simplexml_load_string($relationshipsXml, SimpleXMLElement::class, LIBXML_NONET);
        if (!$workbook || !$relationships) throw new RuntimeException('Não foi possível ler a estrutura do Excel.');

        $relationshipMap = [];
        foreach ($relationships->children('http://schemas.openxmlformats.org/package/2006/relationships')->Relationship as $relationship) {
            $attributes = $relationship->attributes();
            $relationshipMap[(string)$attributes['Id']] = (string)$attributes['Target'];
        }

        $sharedStrings = [];
        $sharedXml = $zip->getFromName('xl/sharedStrings.xml');
        if ($sharedXml !== false) {
            $shared = simplexml_load_string($sharedXml, SimpleXMLElement::class, LIBXML_NONET);
            if ($shared) {
                foreach ($shared->children('http://schemas.openxmlformats.org/spreadsheetml/2006/main')->si as $item) {
                    $parts = $item->xpath('.//*[local-name()="t"]') ?: [];
                    $sharedStrings[] = implode('', array_map(static fn(SimpleXMLElement $part): string => (string)$part, $parts));
                }
            }
        }

        $result = [];
        $mainNamespace = 'http://schemas.openxmlformats.org/spreadsheetml/2006/main';
        $relationshipNamespace = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships';
        foreach ($workbook->children($mainNamespace)->sheets->sheet as $sheetNode) {
            $sheetAttributes = $sheetNode->attributes();
            $name = (string)$sheetAttributes['name'];
            $relationshipId = (string)$sheetNode->attributes($relationshipNamespace)['id'];
            $target = $relationshipMap[$relationshipId] ?? '';
            if ($target === '') continue;
            $sheetPath = str_starts_with($target, '/') ? ltrim($target, '/') : 'xl/' . ltrim($target, '/');
            $sheetXml = $zip->getFromName($sheetPath);
            if ($sheetXml === false) continue;
            $sheet = simplexml_load_string($sheetXml, SimpleXMLElement::class, LIBXML_NONET);
            if (!$sheet) continue;

            $rows = [];
            foreach ($sheet->children($mainNamespace)->sheetData->row as $rowNode) {
                $row = [];
                foreach ($rowNode->c as $cell) {
                    $cellAttributes = $cell->attributes();
                    $reference = (string)$cellAttributes['r'];
                    if (!preg_match('/^([A-Z]+)\d+$/', $reference, $matches)) continue;
                    $column = 0;
                    foreach (str_split($matches[1]) as $letter) $column = ($column * 26) + (ord($letter) - 64);
                    $type = (string)$cellAttributes['t'];
                    if ($type === 's') $value = $sharedStrings[(int)$cell->v] ?? '';
                    elseif ($type === 'inlineStr') {
                        $parts = $cell->xpath('.//*[local-name()="t"]') ?: [];
                        $value = implode('', array_map(static fn(SimpleXMLElement $part): string => (string)$part, $parts));
                    } else $value = isset($cell->v) ? (string)$cell->v : '';
                    $row[$column - 1] = trim($value);
                }
                if ($row) {
                    $maxColumn = max(array_keys($row));
                    for ($column = 0; $column <= $maxColumn; $column++) if (!array_key_exists($column, $row)) $row[$column] = '';
                    ksort($row);
                    $rows[] = array_values($row);
                }
            }
            $result[$name] = $rows;
        }
        return $result;
    } finally {
        $zip->close();
    }
}

function model_import_header(string $value): string
{
    $value = mb_strtolower(trim($value), 'UTF-8');
    $value = strtr($value, ['á'=>'a','à'=>'a','ã'=>'a','â'=>'a','ä'=>'a','é'=>'e','è'=>'e','ê'=>'e','ë'=>'e','í'=>'i','ì'=>'i','î'=>'i','ï'=>'i','ó'=>'o','ò'=>'o','õ'=>'o','ô'=>'o','ö'=>'o','ú'=>'u','ù'=>'u','û'=>'u','ü'=>'u','ç'=>'c','–'=>'-','—'=>'-','/'=>' ','·'=>' ']);
    return trim((string)preg_replace('/[^a-z0-9]+/', '_', $value), '_');
}

function model_import_rows(array $sheetRows): array
{
    if (!$sheetRows) return [];
    $headers = array_map('model_import_header', array_shift($sheetRows));
    $rows = [];
    foreach ($sheetRows as $index => $values) {
        $row = [];
        foreach ($headers as $column => $header) if ($header !== '') $row[$header] = trim((string)($values[$column] ?? ''));
        if (implode('', $row) !== '') {
            $row['_excel_row'] = $index + 2;
            $rows[] = $row;
        }
    }
    return $rows;
}

function model_import_active(string $value): int
{
    $normalized = model_import_header($value);
    if ($normalized === '') return 1;
    return in_array($normalized, ['sim','s','1','ativo','yes','true'], true) ? 1 : 0;
}

function model_import_require_permission(string $resource, string $operation, string $sheet): void
{
    if (!can($resource, $operation)) throw new RuntimeException("Seu perfil não permite {$operation} registros da aba {$sheet}.");
}

function model_spreadsheet_import(PDO $pdo, array $file): array
{
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) throw new RuntimeException('Selecione um arquivo XLSX válido.');
    if (($file['size'] ?? 0) > 15 * 1024 * 1024) throw new RuntimeException('O arquivo deve ter no máximo 15 MB.');
    $extension = mb_strtolower(pathinfo((string)($file['name'] ?? ''), PATHINFO_EXTENSION));
    if ($extension !== 'xlsx') throw new RuntimeException('Use o arquivo XLSX exportado pelo sistema.');

    $sheets = model_xlsx_read_sheets((string)$file['tmp_name']);
    foreach (['Modelos','Marcas','Familias','Categorias','Subcategorias'] as $required) {
        if (!isset($sheets[$required])) throw new RuntimeException("A aba {$required} não foi encontrada. Exporte um novo modelo de planilha pelo sistema.");
    }

    $rowsBySheet = [];
    foreach (['Marcas','Categorias','Familias','Subcategorias','Modelos'] as $sheet) {
        $rowsBySheet[$sheet] = model_import_rows($sheets[$sheet]);
        if (count($rowsBySheet[$sheet]) > 5000) throw new RuntimeException("A aba {$sheet} ultrapassa o limite de 5.000 registros.");
    }

    $counts = ['criados'=>0,'atualizados'=>0];
    $pdo->beginTransaction();
    try {
        foreach ($rowsBySheet['Marcas'] as $row) {
            $excelRow = (int)$row['_excel_row'];
            $name = trim((string)($row['nome_da_marca'] ?? ''));
            if ($name === '') throw new RuntimeException("Marcas, linha {$excelRow}: informe o nome.");
            $id = (int)($row['id'] ?? 0);
            if ($id > 0) {
                model_import_require_permission('brands','update','Marcas');
                $check=$pdo->prepare('SELECT id FROM marcas WHERE id=?');$check->execute([$id]);if(!$check->fetchColumn())throw new RuntimeException("Marcas, linha {$excelRow}: ID {$id} não existe.");
                $pdo->prepare('UPDATE marcas SET nome=?,pais_origem=?,site_oficial=?,descricao=?,ativo=? WHERE id=?')->execute([$name,$row['pais_de_origem']??'',$row['site_oficial']??'',$row['descricao']??'',model_import_active($row['ativo']??''),$id]);
                $counts['atualizados']++;
            } else {
                $find=$pdo->prepare('SELECT id FROM marcas WHERE nome=?');$find->execute([$name]);$existing=(int)($find->fetchColumn()?:0);
                if($existing){model_import_require_permission('brands','update','Marcas');$pdo->prepare('UPDATE marcas SET pais_origem=?,site_oficial=?,descricao=?,ativo=? WHERE id=?')->execute([$row['pais_de_origem']??'',$row['site_oficial']??'',$row['descricao']??'',model_import_active($row['ativo']??''),$existing]);$counts['atualizados']++;}
                else{model_import_require_permission('brands','create','Marcas');$pdo->prepare('INSERT INTO marcas(nome,slug,pais_origem,site_oficial,descricao,ativo) VALUES(?,?,?,?,?,?)')->execute([$name,slugify($name),$row['pais_de_origem']??'',$row['site_oficial']??'',$row['descricao']??'',model_import_active($row['ativo']??'')]);$counts['criados']++;}
            }
        }

        foreach ($rowsBySheet['Categorias'] as $row) {
            $excelRow=(int)$row['_excel_row'];$name=trim((string)($row['nome_da_categoria']??''));if($name==='')throw new RuntimeException("Categorias, linha {$excelRow}: informe o nome.");
            $id=(int)($row['id']??0);$active=model_import_active($row['ativo']??'');$order=max(0,(int)($row['ordem']??0));$icon=trim((string)($row['icone_bootstrap']??'gear'))?:'gear';
            if($id>0){model_import_require_permission('categories','update','Categorias');$check=$pdo->prepare('SELECT id FROM categorias WHERE id=?');$check->execute([$id]);if(!$check->fetchColumn())throw new RuntimeException("Categorias, linha {$excelRow}: ID {$id} não existe.");$pdo->prepare('UPDATE categorias SET nome=?,descricao=?,icone=?,ordem=?,ativo=? WHERE id=?')->execute([$name,$row['descricao']??'',$icon,$order,$active,$id]);$counts['atualizados']++;}
            else{$find=$pdo->prepare('SELECT id FROM categorias WHERE nome=?');$find->execute([$name]);$existing=(int)($find->fetchColumn()?:0);if($existing){model_import_require_permission('categories','update','Categorias');$pdo->prepare('UPDATE categorias SET descricao=?,icone=?,ordem=?,ativo=? WHERE id=?')->execute([$row['descricao']??'',$icon,$order,$active,$existing]);$counts['atualizados']++;}else{model_import_require_permission('categories','create','Categorias');$pdo->prepare('INSERT INTO categorias(nome,descricao,icone,ordem,ativo) VALUES(?,?,?,?,?)')->execute([$name,$row['descricao']??'',$icon,$order,$active]);$counts['criados']++;}}
        }

        foreach ($rowsBySheet['Familias'] as $row) {
            $excelRow=(int)$row['_excel_row'];$brandName=trim((string)($row['marca']??''));$name=trim((string)($row['nome_da_familia']??''));if($brandName===''||$name==='')throw new RuntimeException("Famílias, linha {$excelRow}: informe marca e família.");
            $brand=$pdo->prepare('SELECT id FROM marcas WHERE nome=?');$brand->execute([$brandName]);$brandId=(int)($brand->fetchColumn()?:0);if(!$brandId)throw new RuntimeException("Famílias, linha {$excelRow}: marca \"{$brandName}\" não encontrada.");
            $id=(int)($row['id']??0);$active=model_import_active($row['ativo']??'');
            if($id>0){model_import_require_permission('families','update','Familias');$check=$pdo->prepare('SELECT id FROM familias WHERE id=?');$check->execute([$id]);if(!$check->fetchColumn())throw new RuntimeException("Famílias, linha {$excelRow}: ID {$id} não existe.");$pdo->prepare('UPDATE familias SET marca_id=?,nome=?,descricao=?,ativo=? WHERE id=?')->execute([$brandId,$name,$row['descricao']??'',$active,$id]);$counts['atualizados']++;}
            else{$find=$pdo->prepare('SELECT id FROM familias WHERE marca_id=? AND nome=?');$find->execute([$brandId,$name]);$existing=(int)($find->fetchColumn()?:0);if($existing){model_import_require_permission('families','update','Familias');$pdo->prepare('UPDATE familias SET descricao=?,ativo=? WHERE id=?')->execute([$row['descricao']??'',$active,$existing]);$counts['atualizados']++;}else{model_import_require_permission('families','create','Familias');$pdo->prepare('INSERT INTO familias(marca_id,nome,descricao,ativo) VALUES(?,?,?,?)')->execute([$brandId,$name,$row['descricao']??'',$active]);$counts['criados']++;}}
        }

        foreach ($rowsBySheet['Subcategorias'] as $row) {
            $excelRow=(int)$row['_excel_row'];$categoryName=trim((string)($row['categoria']??''));$name=trim((string)($row['nome_da_subcategoria']??''));if($categoryName===''||$name==='')throw new RuntimeException("Subcategorias, linha {$excelRow}: informe categoria e subcategoria.");
            $category=$pdo->prepare('SELECT id FROM categorias WHERE nome=?');$category->execute([$categoryName]);$categoryId=(int)($category->fetchColumn()?:0);if(!$categoryId)throw new RuntimeException("Subcategorias, linha {$excelRow}: categoria \"{$categoryName}\" não encontrada.");
            $id=(int)($row['id']??0);$active=model_import_active($row['ativo']??'');$order=max(0,(int)($row['ordem']??0));
            if($id>0){model_import_require_permission('subcategories','update','Subcategorias');$check=$pdo->prepare('SELECT id FROM subcategorias WHERE id=?');$check->execute([$id]);if(!$check->fetchColumn())throw new RuntimeException("Subcategorias, linha {$excelRow}: ID {$id} não existe.");$pdo->prepare('UPDATE subcategorias SET categoria_id=?,nome=?,descricao=?,ordem=?,ativo=? WHERE id=?')->execute([$categoryId,$name,$row['descricao']??'',$order,$active,$id]);$counts['atualizados']++;}
            else{$find=$pdo->prepare('SELECT id FROM subcategorias WHERE categoria_id=? AND nome=?');$find->execute([$categoryId,$name]);$existing=(int)($find->fetchColumn()?:0);if($existing){model_import_require_permission('subcategories','update','Subcategorias');$pdo->prepare('UPDATE subcategorias SET descricao=?,ordem=?,ativo=? WHERE id=?')->execute([$row['descricao']??'',$order,$active,$existing]);$counts['atualizados']++;}else{model_import_require_permission('subcategories','create','Subcategorias');$pdo->prepare('INSERT INTO subcategorias(categoria_id,nome,descricao,ordem,ativo) VALUES(?,?,?,?,?)')->execute([$categoryId,$name,$row['descricao']??'',$order,$active]);$counts['criados']++;}}
        }

        $specificationColumns=['entre_eixos'=>'entre_eixos','tipo_de_veiculo'=>'tipo_veiculo','energia_propulsao'=>'energia','configuracao_tracao'=>'configuracao','tipo_de_carroceria'=>'tipo_carroceria','norma_de_emissoes'=>'emissoes','bateria'=>'bateria','autonomia'=>'autonomia','capacidade_de_passageiros'=>'capacidade_passageiros','comprimento'=>'comprimento','carregamento'=>'carregamento','mercado_aplicacao'=>'mercado'];
        foreach ($rowsBySheet['Modelos'] as $row) {
            $excelRow=(int)$row['_excel_row'];$brandName=trim((string)($row['marca']??''));$familyReference=trim((string)($row['familia']??''));$name=trim((string)($row['nome_do_modelo']??''));
            if($brandName===''||$familyReference===''||$name==='')throw new RuntimeException("Modelos, linha {$excelRow}: informe marca, família e nome.");
            $familyName=str_contains($familyReference,'·')?trim((string)substr($familyReference,strpos($familyReference,'·')+strlen('·'))):$familyReference;
            $family=$pdo->prepare('SELECT f.id FROM familias f JOIN marcas ma ON ma.id=f.marca_id WHERE ma.nome=? AND f.nome=?');$family->execute([$brandName,$familyName]);$familyId=(int)($family->fetchColumn()?:0);if(!$familyId)throw new RuntimeException("Modelos, linha {$excelRow}: família \"{$familyName}\" da marca \"{$brandName}\" não encontrada.");
            $id=(int)($row['id']??0);$currentSpecs=[];$existingId=0;
            if($id>0){$find=$pdo->prepare('SELECT id,especificacoes FROM modelos WHERE id=?');$find->execute([$id]);$existing=$find->fetch();if(!$existing)throw new RuntimeException("Modelos, linha {$excelRow}: ID {$id} não existe.");$existingId=$id;$currentSpecs=json_decode((string)$existing['especificacoes'],true)?:[];}
            else{$find=$pdo->prepare('SELECT id,especificacoes FROM modelos WHERE slug=?');$find->execute([slugify($name)]);$existing=$find->fetch();if($existing){$existingId=(int)$existing['id'];$currentSpecs=json_decode((string)$existing['especificacoes'],true)?:[];}}
            foreach($specificationColumns as $column=>$key)$currentSpecs[$key]=trim((string)($row[$column]??''));
            $specifications=json_encode($currentSpecs,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
            $values=[$familyId,$name,slugify($name),$row['descricao']??'',$row['motor']??'',$row['potencia']??'',$row['torque']??'',$row['transmissao']??'',$row['pbt']??'',$row['pbtc']??'',$row['relacao_de_reducao']??'',$specifications,model_import_active($row['ativo']??'')];
            if($existingId){model_import_require_permission('models','update','Modelos');$pdo->prepare('UPDATE modelos SET familia_id=?,nome=?,slug=?,descricao=?,motor=?,potencia=?,torque=?,transmissao=?,pbt=?,pbtc=?,relacao_reducao=?,especificacoes=?,ativo=? WHERE id=?')->execute(array_merge($values,[$existingId]));$counts['atualizados']++;$modelId=$existingId;}
            else{model_import_require_permission('models','create','Modelos');$pdo->prepare('INSERT INTO modelos(familia_id,nome,slug,descricao,motor,potencia,torque,transmissao,pbt,pbtc,relacao_reducao,especificacoes,ativo) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)')->execute($values);$modelId=(int)$pdo->lastInsertId();$counts['criados']++;}
            $technicalUrl=trim((string)($row['url_da_ficha_tecnica']??''));
            if($technicalUrl!==''){if(!filter_var($technicalUrl,FILTER_VALIDATE_URL))throw new RuntimeException("Modelos, linha {$excelRow}: URL da ficha técnica inválida.");$pdo->prepare("INSERT INTO modelo_documentos(modelo_id,tipo,titulo,url_origem,ativo) VALUES(?,'ficha_tecnica','Ficha técnica completa',?,1) ON DUPLICATE KEY UPDATE url_origem=VALUES(url_origem),ativo=1")->execute([$modelId,$technicalUrl]);}
        }
        $pdo->commit();
        return $counts;
    } catch (Throwable $error) {
        if ($pdo->inTransaction()) $pdo->rollBack();
        throw $error;
    }
}

function handle_model_spreadsheet_request(string $route, string $method): void
{
    if ($route === 'modelos/exportar' && $method === 'GET') {
        if (!can('models','view')) { http_response_code(403); exit('Acesso negado.'); }
        $pdo=db();if(!$pdo||!database_ready())throw new RuntimeException('O banco de dados não está disponível.');
        model_spreadsheet_export($pdo);
    }
    if ($route === 'modelos/importar' && $method === 'POST') {
        verify_csrf();
        try {
            $pdo=db();if(!$pdo||!database_ready())throw new RuntimeException('O banco de dados não está disponível.');
            $counts=model_spreadsheet_import($pdo,$_FILES['arquivo_excel']??[]);
            flash('success',"Importação concluída: {$counts['criados']} registro(s) criado(s) e {$counts['atualizados']} atualizado(s).");
        } catch (Throwable $error) {
            flash('error',$error->getMessage());
        }
        redirect('modelos');
    }
}
