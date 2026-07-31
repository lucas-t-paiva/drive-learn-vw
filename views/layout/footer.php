</main><footer class="footer">Drive Learn · Volkswagen Caminhões e Ônibus <span>© <?= date('Y') ?> Lucas Paiva · Lux Solution · Todos os direitos reservados.</span></footer></div></div>
<?php if(can('library','view')||can('service_desk','view')): $assistantUiConfig=assistant_config(); ?>
<button class="assistant-launcher" type="button" data-assistant-open aria-label="Abrir o assistente Drive Learn"><i class="bi bi-stars"></i><span>Fale comigo :)</span></button>
<div class="assistant-backdrop" data-assistant-close hidden></div>
<aside class="assistant-panel" data-assistant-panel aria-hidden="true" data-endpoint="<?= url('assistente-evento') ?>" data-user-id="<?= (int)(user()['id']??0) ?>">
    <header><div class="assistant-brand"><span><i class="bi bi-stars"></i></span><div><strong>Assistente Drive Learn</strong><small>Conhecimento e voz do cliente</small></div></div><button type="button" data-assistant-close aria-label="Fechar assistente"><i class="bi bi-x-lg"></i></button></header>
    <div class="assistant-notice"><i class="bi bi-shield-check"></i><span>Consulte com o veículo parado. Em caso de dúvida operacional, procure a assistência técnica.</span></div>
    <div class="assistant-messages" data-assistant-messages aria-live="polite"><article class="assistant-message bot"><span><i class="bi bi-stars"></i></span><div>Olá, <?= e(explode(' ',trim((string)(user()['nome']??'Motorista')))[0]) ?>! O que você deseja fazer?<div class="assistant-options"><button type="button" data-assistant-action="start_consult"><i class="bi bi-search"></i> Consultar o Drive Learn</button><button type="button" data-assistant-action="start_report"><i class="bi bi-headset"></i> Reportar problema ou melhoria</button></div></div></article></div>
    <form class="assistant-form" data-assistant-form enctype="multipart/form-data"><?= csrf_field() ?><div class="assistant-status" data-assistant-status>Até <?= (int)$assistantUiConfig['daily_limit'] ?> consultas por dia · relatos não consomem a franquia</div><label class="assistant-input"><textarea name="pergunta" rows="2" maxlength="1000" placeholder="Ex.: Como funciona a velocidade constante no Meteor?"></textarea><button type="button" data-assistant-mic aria-label="Gravar pergunta por voz"><i class="bi bi-mic"></i><span>Falar</span></button></label><div class="assistant-attachment-row"><label class="assistant-attachment"><i class="bi bi-paperclip"></i><span data-assistant-file-label>Anexar evidência</span><input type="file" name="assistant_attachments[]" multiple accept="image/*,video/mp4,video/webm,audio/*,.pdf,.doc,.docx,.xls,.xlsx,.txt" data-assistant-files></label></div><div class="assistant-actions"><label><input type="checkbox" data-assistant-speak checked> Ler a resposta em voz alta</label><button type="submit"><i class="bi bi-send"></i> Enviar</button></div></form>
</aside>
<?php endif; ?>
<div class="modal" id="global-confirm-modal" aria-hidden="true">
    <div class="modal-dialog confirm-dialog global-confirm-dialog">
        <button type="button" class="modal-close" data-global-confirm-close aria-label="Fechar"><i class="bi bi-x-lg"></i></button>
        <div class="modal-content">
            <span class="confirm-icon"><i class="bi bi-exclamation-triangle"></i></span>
            <h2 data-global-confirm-title>Confirmar ação?</h2>
            <p data-global-confirm-message>Revise os dados antes de continuar. Esta ação poderá alterar vínculos e históricos.</p>
            <div class="modal-actions">
                <button type="button" class="btn secondary" data-global-confirm-close>Cancelar</button>
                <button type="button" class="btn danger" data-global-confirm-submit><i class="bi bi-trash"></i> <span>Confirmar</span></button>
            </div>
        </div>
    </div>
</div>
<div class="toast" id="toast"></div><script src="<?= url('public/assets/js/dynamic-tables.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/js/dynamic-tables.js') ?: 1) ?>"></script><script src="<?= url('public/assets/js/app.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/js/app.js') ?: 1) ?>"></script><?php if (($route ?? '') === 'modelos'): ?><script type="module" src="<?= url('public/assets/js/model-sheet-reader.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/js/model-sheet-reader.js') ?: 1) ?>"></script><?php endif; ?><script src="<?= url('public/assets/js/technical-catalog.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/js/technical-catalog.js') ?: 1) ?>"></script><script src="<?= url('public/assets/js/assistant.js') ?>?v=<?= (int)(@filemtime(__DIR__.'/../../public/assets/js/assistant.js') ?: 1) ?>"></script></body></html>
