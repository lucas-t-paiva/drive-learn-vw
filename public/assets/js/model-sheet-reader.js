import * as pdfjsLib from '../vendor/pdfjs/pdf.min.mjs';

pdfjsLib.GlobalWorkerOptions.workerSrc = new URL('../vendor/pdfjs/pdf.worker.min.mjs', import.meta.url).href;

const form = document.querySelector('[data-model-form][data-sheet-reader-endpoint]');
if (form) {
    const fileInput = form.querySelector('[data-model-sheet-file]');
    const readButton = form.querySelector('[data-model-sheet-read]');
    const statusBox = form.querySelector('[data-model-sheet-status]');
    const resultsBox = form.querySelector('[data-model-sheet-results]');
    const fieldsBox = form.querySelector('[data-model-sheet-fields]');
    const overwrite = form.querySelector('[data-model-sheet-overwrite]');
    const csrf = form.querySelector('[name="csrf"]')?.value || '';
    let recognized = {};

    const normalize = value => (value || '')
        .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
        .toLowerCase().replace(/[^a-z0-9]+/g, ' ').trim();

    const setStatus = (message, type = '', icon = 'bi-info-circle') => {
        statusBox.hidden = false;
        statusBox.className = `model-sheet-reader-status ${type}`.trim();
        statusBox.innerHTML = `<i class="bi ${icon}"></i><span></span>`;
        statusBox.querySelector('span').textContent = message;
    };

    const clearResults = (keepStatus = false) => {
        recognized = {};
        fieldsBox.innerHTML = '';
        resultsBox.hidden = true;
        overwrite.checked = false;
        if (!keepStatus) {
            statusBox.hidden = true;
            statusBox.textContent = '';
        }
    };

    const destination = name => {
        if (name === 'familia_sugerida') return form.querySelector('[name="familia_id"]');
        return form.querySelector(`[name="${CSS.escape(name)}"]`);
    };

    const hasCurrentValue = name => {
        const field = destination(name);
        return !!field && String(field.value || '').trim() !== '';
    };

    const renderFields = () => {
        fieldsBox.innerHTML = '';
        Object.entries(recognized).forEach(([name, item]) => {
            if (!destination(name)) return;
            const current = hasCurrentValue(name);
            const label = document.createElement('label');
            label.className = `model-sheet-reader-field${current ? ' current-value' : ''}`;
            const input = document.createElement('input');
            input.type = 'checkbox';
            input.value = name;
            input.checked = !current || overwrite.checked;
            input.disabled = current && !overwrite.checked;
            const content = document.createElement('span');
            const title = document.createElement('strong');
            const value = document.createElement('small');
            title.textContent = item.label || name;
            value.textContent = item.value || '';
            content.append(title, value);
            const confidence = document.createElement('em');
            confidence.textContent = `${Number(item.confidence || 0)}%`;
            confidence.title = item.evidence || 'Confiança da leitura';
            label.append(input, content, confidence);
            fieldsBox.append(label);
        });
        resultsBox.hidden = fieldsBox.childElementCount === 0;
    };

    const extractPdfText = async file => {
        const data = new Uint8Array(await file.arrayBuffer());
        const document = await pdfjsLib.getDocument({ data }).promise;
        const pages = [];
        for (let pageNumber = 1; pageNumber <= document.numPages; pageNumber += 1) {
            setStatus(`Lendo página ${pageNumber} de ${document.numPages}…`, '', 'bi-arrow-repeat');
            const page = await document.getPage(pageNumber);
            const content = await page.getTextContent();
            let pageText = '';
            content.items.forEach(item => {
                const value = String(item.str || '').trim();
                if (value) pageText += `${value} `;
                if (item.hasEOL) pageText += '\n';
            });
            pages.push(pageText.trim());
        }
        return pages.join('\n\n--- PÁGINA ---\n\n');
    };

    const analyze = async () => {
        const file = fileInput?.files?.[0];
        clearResults();
        if (!file) {
            setStatus('Selecione primeiro o PDF em “Ficha técnica completa”, na seção de documentos.', 'error', 'bi-exclamation-circle');
            fileInput?.focus();
            fileInput?.scrollIntoView({ behavior: 'smooth', block: 'center' });
            return;
        }
        if (file.type !== 'application/pdf' && !file.name.toLowerCase().endsWith('.pdf')) {
            setStatus('O leitor aceita somente fichas no formato PDF.', 'error', 'bi-exclamation-circle');
            return;
        }
        if (file.size > 15 * 1024 * 1024) {
            setStatus('O PDF deve ter no máximo 15 MB.', 'error', 'bi-exclamation-circle');
            return;
        }
        readButton.disabled = true;
        readButton.classList.add('is-loading');
        readButton.querySelector('i').className = 'bi bi-arrow-repeat';
        try {
            setStatus('Preparando a leitura local e segura do PDF…', '', 'bi-arrow-repeat');
            const text = await extractPdfText(file);
            const hasSelectableText = text.replace(/\s/g, '').length >= 80;
            setStatus(
                hasSelectableText
                    ? 'Comparando o conteúdo da ficha com os campos do cadastro…'
                    : 'O PDF não possui texto selecionável. Verificando se o modo híbrido está disponível…',
                '',
                'bi-arrow-repeat'
            );
            const payload = new FormData();
            payload.append('csrf', csrf);
            payload.append('texto', text);
            payload.append('arquivo', file.name);
            payload.append('ficha', file, file.name);
            const response = await fetch(form.dataset.sheetReaderEndpoint, {
                method: 'POST',
                body: payload,
                headers: { 'X-Requested-With': 'XMLHttpRequest' },
            });
            const data = await response.json().catch(() => ({ ok: false, message: 'Resposta inválida do servidor.' }));
            if (!response.ok || !data.ok) throw new Error(data.message || 'Não foi possível analisar a ficha.');
            recognized = data.fields || {};
            renderFields();
            const engine = data.paid_ai_used ? 'com complemento da IA configurada' : 'gratuitamente, pelo leitor local';
            setStatus(`${data.message} A leitura foi feita ${engine}.`, 'success', 'bi-check-circle');
        } catch (error) {
            clearResults(true);
            setStatus(error.message || 'Não foi possível ler esta ficha técnica.', 'error', 'bi-exclamation-circle');
        } finally {
            readButton.disabled = false;
            readButton.classList.remove('is-loading');
            readButton.querySelector('i').className = 'bi bi-stars';
        }
    };

    overwrite.addEventListener('change', renderFields);
    readButton.addEventListener('click', analyze);
    fileInput?.addEventListener('change', () => clearResults());
    form.querySelector('[data-model-sheet-clear]')?.addEventListener('click', () => clearResults());
    form.querySelector('[data-model-sheet-apply]')?.addEventListener('click', () => {
        let applied = 0;
        fieldsBox.querySelectorAll('input[type="checkbox"]:checked').forEach(check => {
            const name = check.value;
            const item = recognized[name];
            const field = destination(name);
            if (!item || !field) return;
            if (name === 'familia_sugerida') {
                const wanted = normalize(item.value);
                const option = Array.from(field.options).find(candidate => normalize(candidate.textContent).includes(wanted));
                if (!option) return;
                field.value = option.value;
                field.dispatchEvent(new Event('change', { bubbles: true }));
                field._refreshSearchable?.();
            } else {
                field.value = item.value;
                field.dispatchEvent(new Event('input', { bubbles: true }));
                field.dispatchEvent(new Event('change', { bubbles: true }));
            }
            applied += 1;
        });
        if (!applied) {
            setStatus('Selecione ao menos um campo compatível para preencher.', 'error', 'bi-exclamation-circle');
            return;
        }
        setStatus(`${applied} campo(s) aplicado(s). Revise os valores e salve o modelo quando estiver tudo correto.`, 'success', 'bi-check-circle');
        renderFields();
    });

    document.querySelectorAll('[data-model-create],[data-model-edit]').forEach(button => {
        button.addEventListener('click', () => setTimeout(() => clearResults(), 0));
    });
}
