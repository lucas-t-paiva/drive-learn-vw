<?php
$sectorData=$sectors??[];$rows=$sectorData['rows']??[];$manageableIds=sector_manageable_company_ids();
$canCreate=can('sectors','create');$canUpdate=can('sectors','update');
?>
<section class="page-heading split">
    <div><span class="eyebrow blue">Controle de usuários</span><h1>Setores e equipes</h1><p>Organize as áreas responsáveis, os integrantes e o direcionamento dos relatos do Service Desk.</p></div>
    <?php if($canCreate): ?><button class="btn primary" type="button" data-sector-create><i class="bi bi-plus-lg"></i> Novo setor</button><?php endif; ?>
</section>
<?php if($flash): ?><div class="alert <?= $flash['type']==='success'?'success':'error' ?>"><?= e($flash['message']) ?></div><?php endif; ?>
<?php if(!($sectorData['ready']??false)): ?>
<section class="empty-state"><i class="bi bi-database-exclamation"></i><h2>Estrutura do Service Desk pendente</h2><p>Execute a migration 017 para criar as tabelas de setores e equipes.</p></section>
<?php else: ?>
<section class="sector-summary">
    <article><i class="bi bi-diagram-3"></i><div><strong><?= (int)$sectorData['total'] ?></strong><span>setores encontrados</span></div></article>
    <article><i class="bi bi-people"></i><div><strong><?= array_sum(array_map(static fn(array $row):int=>(int)$row['integrantes'],$rows)) ?></strong><span>vínculos nesta página</span></div></article>
    <article><i class="bi bi-headset"></i><div><strong><?= array_sum(array_map(static fn(array $row):int=>(int)$row['chamados_abertos'],$rows)) ?></strong><span>chamados em andamento</span></div></article>
</section>

<section class="panel sector-panel">
    <form class="panel-head table-filters sector-filters" method="get" action="<?= url('setores') ?>">
        <div class="search"><span><i class="bi bi-search"></i></span><input type="search" name="q" value="<?= e($sectorData['q']??'') ?>" placeholder="Buscar setor, organização, e-mail..."></div>
        <div class="panel-filters">
            <select name="empresa"><option value="">Todas as organizações</option><option value="global" <?= ($sectorData['company_filter']??'')==='global'?'selected':'' ?>>Setores globais</option><?php foreach($sectorData['companies'] as $company): ?><option value="<?= (int)$company['id'] ?>" <?= (string)($sectorData['company_filter']??'')===(string)$company['id']?'selected':'' ?>><?= e($company['nome_fantasia']) ?></option><?php endforeach; ?></select>
            <select name="status"><option value="">Todas as situações</option><option value="ativo" <?= ($sectorData['status']??'')==='ativo'?'selected':'' ?>>Ativos</option><option value="inativo" <?= ($sectorData['status']??'')==='inativo'?'selected':'' ?>>Inativos</option></select>
            <button class="btn secondary"><i class="bi bi-search"></i> Buscar</button>
        </div>
    </form>
    <div class="table-wrap"><table class="sector-table"><thead><tr><th>Setor</th><th>Organização</th><th>Contato</th><th>Integrantes</th><th>Categorias</th><th>Chamados</th><th>Situação</th><th>Ações</th></tr></thead><tbody>
    <?php if(!$rows): ?><tr><td colspan="8"><div class="table-empty"><i class="bi bi-diagram-3"></i><strong>Nenhum setor encontrado</strong><span>Altere os filtros ou cadastre uma nova área responsável.</span></div></td></tr><?php endif; ?>
    <?php foreach($rows as $row):
        $rowManageable=$canUpdate&&(is_master()||((int)($row['empresa_id']??0)>0&&in_array((int)$row['empresa_id'],$manageableIds,true)));
        $members=$sectorData['members'][(int)$row['id']]??[];
        $sectorJson=json_encode(['id'=>(int)$row['id'],'empresa_id'=>$row['empresa_id']?(int)$row['empresa_id']:'','nome'=>$row['nome'],'email'=>$row['email'],'descricao'=>$row['descricao'],'ativo'=>(int)$row['ativo']],JSON_UNESCAPED_UNICODE);
    ?><tr>
        <td><strong><?= e($row['nome']) ?></strong><small><?= e($row['descricao']?:'Sem descrição cadastrada') ?></small></td>
        <td><span class="sector-company <?= $row['empresa_id']?'':'global' ?>"><i class="bi <?= $row['empresa_id']?'bi-building':'bi-globe-americas' ?>"></i><?= e($row['empresa_nome']?:'Setor global') ?></span></td>
        <td><?= e($row['email']?:'Não informado') ?></td>
        <td><strong><?= (int)$row['integrantes'] ?></strong><small><?= $row['integrantes']==1?'integrante ativo':'integrantes ativos' ?></small></td>
        <td><strong><?= (int)$row['categorias'] ?></strong><small>categoria(s) direcionada(s)</small></td>
        <td><strong><?= (int)$row['chamados_abertos'] ?></strong><small>em andamento</small></td>
        <td><span class="status <?= $row['ativo']?'active':'inactive' ?>"><?= $row['ativo']?'Ativo':'Inativo' ?></span></td>
        <td><div class="row-actions">
            <?php if($rowManageable): ?><button class="action-btn" type="button" data-sector-members data-id="<?= (int)$row['id'] ?>" data-name="<?= e($row['nome']) ?>" data-company="<?= (int)($row['empresa_id']??0) ?>" aria-label="Gerenciar integrantes" title="Gerenciar integrantes"><i class="bi bi-people"></i></button><button class="action-btn" type="button" data-sector-edit data-sector="<?= e($sectorJson) ?>" aria-label="Editar setor" title="Editar setor"><i class="bi bi-pencil"></i></button><?php else: ?><span class="sector-readonly" title="Setor global administrado pelo Administrador Master"><i class="bi bi-lock"></i></span><?php endif; ?>
        </div></td>
    </tr>
    <?php endforeach; ?></tbody></table></div>
    <?php $page=$sectorData['page'];$perPage=$sectorData['per_page'];$offset=$sectorData['offset'];$total=$sectorData['total'];$pages=$sectorData['pages']; ?>
    <div class="pagination sector-pagination"><form method="get" action="<?= url('setores') ?>" class="per-page"><input type="hidden" name="q" value="<?= e($sectorData['q']) ?>"><input type="hidden" name="empresa" value="<?= e((string)$sectorData['company_filter']) ?>"><input type="hidden" name="status" value="<?= e($sectorData['status']) ?>"><label>Mostrar <select name="per_page" onchange="this.form.submit()"><?php foreach([5,10,25,50] as $size): ?><option value="<?= $size ?>" <?= $perPage===$size?'selected':'' ?>><?= $size ?></option><?php endforeach; ?></select> linhas</label></form><span>Mostrando <?= $total?$offset+1:0 ?>–<?= min($offset+$perPage,$total) ?> de <?= $total ?></span><nav class="page-buttons"><?php if($page>1): ?><a href="<?= page_url('setores',['page'=>$page-1]) ?>"><i class="bi bi-chevron-left"></i></a><?php endif; ?><?php for($p=max(1,$page-2);$p<=min($pages,$page+2);$p++): ?><a class="<?= $p===$page?'active':'' ?>" href="<?= page_url('setores',['page'=>$p]) ?>"><?= $p ?></a><?php endfor; ?><?php if($page<$pages): ?><a href="<?= page_url('setores',['page'=>$page+1]) ?>"><i class="bi bi-chevron-right"></i></a><?php endif; ?></nav></div>
</section>
<?php foreach($rows as $row): $members=$sectorData['members'][(int)$row['id']]??[]; ?>
<template data-sector-members-template="<?= (int)$row['id'] ?>">
    <?php if(!$members): ?><div class="sector-members-empty"><i class="bi bi-person-plus"></i><span>Nenhum integrante vinculado.</span></div><?php endif; ?>
    <?php foreach($members as $member): ?><article class="sector-member"><span class="avatar"><?= e(strtoupper(substr($member['nome'],0,2))) ?></span><div><strong><?= e($member['nome']) ?><?php if($member['principal']): ?><em>Principal</em><?php endif; ?></strong><small><?= e($member['email']) ?></small></div><form method="post" action="<?= url('setores') ?>"><?= csrf_field() ?><input type="hidden" name="action" value="unlink_member"><input type="hidden" name="setor_id" value="<?= (int)$row['id'] ?>"><input type="hidden" name="usuario_id" value="<?= (int)$member['usuario_id'] ?>"><button type="submit" class="action-btn danger" aria-label="Desvincular <?= e($member['nome']) ?>" title="Desvincular integrante"><i class="bi bi-person-dash"></i></button></form></article><?php endforeach; ?>
</template>
<?php endforeach; ?>

<?php if($canCreate||$canUpdate): ?>
<div class="modal" id="sector-modal" aria-hidden="true"><div class="modal-dialog"><button class="modal-close" type="button" data-modal-close><i class="bi bi-x-lg"></i></button><div class="modal-content">
    <span class="eyebrow blue">Estrutura organizacional</span><h2 data-sector-modal-title>Novo setor</h2><p>Defina a organização, o contato e a finalidade desta área responsável.</p>
    <form method="post" action="<?= url('setores') ?>" data-sector-form><?= csrf_field() ?><input type="hidden" name="action" value="create"><input type="hidden" name="id">
        <div class="form-grid">
            <label>Organização<select name="empresa_id" <?= is_master()?'':'required' ?>><?php if(is_master()): ?><option value="">Setor global</option><?php else: ?><option value="">Selecione a organização</option><?php endif; ?><?php foreach($sectorData['companies'] as $company): ?><option value="<?= (int)$company['id'] ?>"><?= e($company['nome_fantasia']) ?></option><?php endforeach; ?></select></label>
            <label>Nome do setor<input name="nome" maxlength="120" required placeholder="Ex.: Engenharia de Powertrain"></label>
            <label class="full">Descrição<textarea name="descricao" maxlength="500" rows="3" placeholder="Responsabilidades e tipos de chamados tratados pela área"></textarea></label>
            <label class="full">E-mail da equipe<input type="email" name="email" maxlength="180" placeholder="equipe@empresa.com.br"></label>
            <label class="check"><input type="checkbox" name="ativo" checked> Setor ativo</label>
        </div>
        <div class="modal-actions"><button type="button" class="btn secondary" data-modal-close>Cancelar</button><button class="btn primary">Salvar setor</button></div>
    </form>
</div></div></div>

<div class="modal" id="sector-members-modal" aria-hidden="true"><div class="modal-dialog sector-members-dialog"><button class="modal-close" type="button" data-modal-close><i class="bi bi-x-lg"></i></button><div class="modal-content">
    <span class="eyebrow blue">Equipe responsável</span><h2>Integrantes de <span data-sector-members-title></span></h2><p>Vincule pessoas à área e defina, quando necessário, o setor principal do usuário.</p>
    <form method="post" action="<?= url('setores') ?>" data-sector-member-form><?= csrf_field() ?><input type="hidden" name="action" value="link_member"><input type="hidden" name="setor_id">
        <div class="sector-member-add"><label>Usuário<select name="usuario_id" required><option value="">Selecione o usuário</option><?php foreach($sectorData['users'] as $account): ?><option value="<?= (int)$account['id'] ?>" data-companies=",<?= e(str_replace(',',',',(string)$account['empresa_ids'])) ?>,"><?= e($account['nome'].' · '.$account['email']) ?></option><?php endforeach; ?></select></label><label class="check"><input type="checkbox" name="principal"> Tornar setor principal</label><button class="btn primary"><i class="bi bi-person-plus"></i> Vincular</button></div>
    </form>
    <div class="sector-members-list" data-sector-members-list></div>
    <div class="modal-actions"><button type="button" class="btn secondary" data-modal-close>Fechar</button></div>
</div></div></div>
<?php endif; ?>
<?php endif; ?>
