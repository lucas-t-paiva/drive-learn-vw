<?php
$desk=$serviceDesk??[];
$statuses=service_desk_statuses();$types=service_desk_types();
$selected=$desk['selected']??null;$internal=service_desk_internal_user();
?>
<?php if(!($desk['ready']??false)): ?>
<section class="empty-state service-migration"><i class="bi bi-database-exclamation"></i><h2>Estrutura do Service Desk pendente</h2><p>Execute a migração <strong>20260729_017_service_desk_relato_setores_sla.sql</strong> no banco da HostGator e atualize esta página.</p></section>
<?php else: ?>
<section class="service-hero">
    <div><span class="eyebrow">Voz do cliente</span><h1><?= $internal?'Service Desk de produto':'Meus relatos' ?></h1><p><?= $internal?'Centralize falhas, sugestões e melhorias com responsáveis, SLA e histórico completo.':'Acompanhe o retorno dos relatos enviados para nossos times de assistência e produto.' ?></p></div>
    <button type="button" class="primary-button" data-assistant-open><i class="bi bi-mic"></i> Novo relato pelo assistente</button>
</section>

<section class="service-kpis">
    <?php foreach(['novo','transferido','em_tratamento','possivel_solucao','finalizado'] as $key): ?><article class="<?= e($key) ?>"><span><?= (int)($desk['counts'][$key]??0) ?></span><small><?= e($statuses[$key]) ?></small></article><?php endforeach; ?>
</section>

<section class="panel service-list">
    <form class="service-filters" method="get"><input type="hidden" name="route" value="service-desk">
        <label><i class="bi bi-search"></i><input name="q" value="<?= e($_GET['q']??'') ?>" placeholder="Buscar protocolo, título ou relato"></label>
        <select name="status"><option value="">Todos os status</option><?php foreach($statuses as $value=>$label): ?><option value="<?= e($value) ?>" <?= ($_GET['status']??'')===$value?'selected':'' ?>><?= e($label) ?></option><?php endforeach; ?></select>
        <select name="tipo"><option value="">Todos os tipos</option><?php foreach($types as $value=>$label): ?><option value="<?= e($value) ?>" <?= ($_GET['tipo']??'')===$value?'selected':'' ?>><?= e($label) ?></option><?php endforeach; ?></select>
        <?php if($internal): ?><select name="setor"><option value="">Todos os setores</option><?php foreach($desk['sectors'] as $sector): ?><option value="<?= (int)$sector['id'] ?>" <?= (int)($_GET['setor']??0)===(int)$sector['id']?'selected':'' ?>><?= e($sector['nome']) ?></option><?php endforeach; ?></select><?php endif; ?>
        <button type="submit"><i class="bi bi-funnel"></i> Filtrar</button>
    </form>
    <div class="table-wrap"><table><thead><tr><th>Protocolo</th><th>Relato</th><?php if($internal): ?><th>Cliente</th><?php endif; ?><th>Veículo</th><th>Categoria</th><th>SLA</th><th>Status</th><th></th></tr></thead><tbody>
    <?php if(!$desk['reports']): ?><tr><td colspan="<?= $internal?8:7 ?>"><div class="table-empty"><i class="bi bi-inbox"></i><strong>Nenhum relato encontrado</strong><span>Altere os filtros ou registre um novo relato pelo assistente.</span></div></td></tr><?php endif; ?>
    <?php foreach($desk['reports'] as $report):
        $overdue=!in_array($report['status'],['finalizado','cancelado'],true)&&$report['sla_resolucao_em']&&strtotime($report['sla_resolucao_em'])<time();
        $vehicle=implode(' · ',array_filter([$report['marca_nome'],$report['familia_nome'],$report['modelo_nome']]));
    ?><tr>
        <td><strong><?= e($report['protocolo']) ?></strong><small><?= date('d/m/Y H:i',strtotime($report['criado_em'])) ?></small></td>
        <td><span class="service-type <?= e($report['tipo']) ?>"><?= e($types[$report['tipo']]??$report['tipo']) ?></span><strong><?= e($report['titulo']) ?></strong><small><?= e(mb_strimwidth($report['relato_original'],0,105,'…')) ?></small></td>
        <?php if($internal): ?><td><?= e($report['empresa_nome']?:'Sem empresa') ?><small><?= e($report['usuario_nome']) ?></small></td><?php endif; ?>
        <td><?= e($vehicle?:'Não identificado') ?></td>
        <td><?= e($report['categoria_nome']?:'A classificar') ?><small><?= e($report['setor_nome']?:'Triagem') ?></small></td>
        <td class="<?= $overdue?'sla-overdue':'' ?>"><i class="bi <?= $overdue?'bi-exclamation-triangle':'bi-clock' ?>"></i> <?= $report['sla_resolucao_em']?date('d/m H:i',strtotime($report['sla_resolucao_em'])):'—' ?></td>
        <td><span class="service-status <?= e($report['status']) ?>"><?= e($statuses[$report['status']]??$report['status']) ?></span></td>
        <td><a class="icon-btn" href="<?= url('service-desk?id='.(int)$report['id']) ?>" aria-label="Abrir relato"><i class="bi bi-chevron-right"></i></a></td>
    </tr><?php endforeach; ?></tbody></table></div>
</section>

<?php if($selected): ?>
<div class="service-detail-backdrop"><section class="service-detail-modal service-detail">
    <header><div><span class="eyebrow"><?= e($selected['protocolo']) ?></span><h2><?= e($selected['titulo']) ?></h2><p><?= e(($selected['empresa_nome']?:'Sem empresa').' · '.$selected['usuario_nome']) ?></p></div><a class="modal-close" href="<?= url('service-desk') ?>" aria-label="Fechar"><i class="bi bi-x-lg"></i></a></header>
    <div class="service-detail-body">
        <div class="service-detail-main">
            <article class="service-report-text"><h3>Relato confirmado</h3><p><?= nl2br(e($selected['relato_original'])) ?></p><div><span><?= e($selected['categoria_nome']?:'A classificar') ?></span><span><?= e(implode(' · ',array_filter([$selected['marca_nome'],$selected['familia_nome'],$selected['modelo_nome']]))?:'Veículo não identificado') ?></span></div></article>
            <section class="service-timeline"><h3>Histórico e conversas</h3>
                <?php foreach($desk['messages']??[] as $message): ?><article class="<?= e($message['origem']) ?>"><i class="bi <?= $message['origem']==='usuario'?'bi-person':'bi-chat-left-text' ?>"></i><div><strong><?= e($message['usuario_nome']?:ucfirst($message['origem'])) ?></strong><p><?= nl2br(e($message['mensagem'])) ?></p><small><?= date('d/m/Y H:i',strtotime($message['criado_em'])) ?></small></div></article><?php endforeach; ?>
                <?php foreach($desk['history']??[] as $history): ?><article class="history"><i class="bi bi-arrow-repeat"></i><div><strong><?= e($history['usuario_nome']?:'Sistema') ?></strong><p><?= e(($history['status_novo']?'Status: '.($statuses[$history['status_novo']]??$history['status_novo']):'Atualização').($history['observacao']?' · '.$history['observacao']:'')) ?></p><small><?= date('d/m/Y H:i',strtotime($history['criado_em'])) ?></small></div></article><?php endforeach; ?>
            </section>
        </div>
        <aside>
            <div class="service-current"><small>Status atual</small><span class="service-status <?= e($selected['status']) ?>"><?= e($statuses[$selected['status']]??$selected['status']) ?></span><dl><dt>Responsável</dt><dd><?= e($selected['responsavel_nome']?:'Não atribuído') ?></dd><dt>Setor</dt><dd><?= e($selected['setor_nome']?:'Triagem') ?></dd><dt>SLA de solução</dt><dd><?= $selected['sla_resolucao_em']?date('d/m/Y H:i',strtotime($selected['sla_resolucao_em'])):'Não definido' ?></dd></dl></div>
            <?php if($internal&&can('service_desk','update')): ?><form class="service-treatment" method="post" action="<?= url('service-desk') ?>"><?= csrf_field() ?><input type="hidden" name="action" value="update_report"><input type="hidden" name="id" value="<?= (int)$selected['id'] ?>"><h3>Tratar chamado</h3>
                <label>Status<select name="status"><?php foreach($statuses as $value=>$label): ?><option value="<?= e($value) ?>" <?= $selected['status']===$value?'selected':'' ?>><?= e($label) ?></option><?php endforeach; ?></select></label>
                <label>Setor<select name="setor_id"><option value="">Triagem</option><?php foreach($desk['sectors'] as $sector): ?><option value="<?= (int)$sector['id'] ?>" <?= (int)$selected['setor_id']===(int)$sector['id']?'selected':'' ?>><?= e($sector['nome']) ?></option><?php endforeach; ?></select></label>
                <label>Responsável<select name="responsavel_id"><option value="">Não atribuído</option><?php foreach($desk['users'] as $account): ?><option value="<?= (int)$account['id'] ?>" <?= (int)$selected['responsavel_id']===(int)$account['id']?'selected':'' ?>><?= e($account['nome']) ?></option><?php endforeach; ?></select></label>
                <label>Possível solução<textarea name="solucao_proposta" rows="3"><?= e($selected['solucao_proposta']) ?></textarea></label><label>Solução final<textarea name="solucao_final" rows="3"><?= e($selected['solucao_final']) ?></textarea></label><label>Ação tomada / observação<textarea name="observacao" rows="3"></textarea></label><button class="primary-button">Salvar andamento</button>
            </form><?php elseif($selected['status']==='finalizado'&&!($desk['satisfaction']??null)&&(int)$selected['usuario_id']===(int)(user()['id']??0)): ?><form class="service-treatment" method="post" action="<?= url('service-desk') ?>"><?= csrf_field() ?><input type="hidden" name="action" value="satisfaction"><input type="hidden" name="id" value="<?= (int)$selected['id'] ?>"><h3>Avalie a solução</h3><label>Nota<select name="nota"><?php for($i=5;$i>=1;$i--): ?><option value="<?= $i ?>"><?= $i ?> estrela<?= $i>1?'s':'' ?></option><?php endfor; ?></select></label><label class="check-row"><input type="checkbox" name="resolvido" value="1" checked> Minha necessidade foi resolvida</label><label>Comentário<textarea name="comentario" rows="3"></textarea></label><button class="primary-button">Enviar avaliação</button></form><?php endif; ?>
        </aside>
    </div>
</section></div>
<?php endif; ?>
<?php endif; ?>
