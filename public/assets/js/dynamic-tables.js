(()=>{
 const filterFormSelector='form.table-filters,form.service-filters,form.sector-filters,form.family-table-filters,form.model-table-filters,form.video-filters,form.fleet-filters,form.report-filters';
 const defaultBatchSize=250,maxPages=40;
 const normalize=value=>(value||'').normalize('NFD').replace(/[\u0300-\u036f]/g,'').toLowerCase().replace(/\s+/g,' ').trim();
 const signature=table=>Array.from(table?.tHead?.rows?.[0]?.cells||[]).map(cell=>normalize(cell.textContent)).join('|');
 const tableTargets=Array.from(document.querySelectorAll('.panel .table-wrap')).filter(wrapper=>{
  const table=wrapper.querySelector(':scope > table'),panel=wrapper.closest('.panel');
  return table?.tBodies?.[0]&&panel?.querySelector('.pagination')&&!table.closest('.modal')&&!table.hasAttribute('data-dynamic-table-disabled');
 });
 const hydrate=async wrapper=>{
 const table=wrapper.querySelector(':scope > table'),body=table.tBodies[0],panel=wrapper.closest('.panel'),tableSignature=signature(table);
  const pagination=panel.querySelector('.pagination'),sizeField=pagination?.querySelector('select[name]'),sizeParam=sizeField?.name||'per_page';
  const pageLinks=Array.from(pagination?.querySelectorAll('a[href]')||[]),pageParam=pageLinks.map(link=>{
   const url=new URL(link.href,location.href);
   return Array.from(url.searchParams.keys()).find(key=>key!==sizeParam&&/page|pagina/i.test(key));
  }).find(Boolean)||(sizeParam==='per_page'?'page':sizeParam.replace(/por_pagina$/,'pagina'));
  const batchSize=sizeParam==='per_page'?defaultBatchSize:50;
  const filterForm=panel.querySelector(filterFormSelector),baseUrl=new URL(location.href);
  baseUrl.searchParams.delete(pageParam);baseUrl.searchParams.delete(sizeParam);
  filterForm?.querySelectorAll('[name]').forEach(field=>{
   if(!['route','id','tab'].includes(field.name))baseUrl.searchParams.delete(field.name);
  });
  const rows=[];
  for(let page=1;page<=maxPages;page++){
   const requestUrl=new URL(baseUrl);requestUrl.searchParams.set(pageParam,String(page));requestUrl.searchParams.set(sizeParam,String(batchSize));requestUrl.searchParams.set('dynamic_table','1');
   const response=await fetch(requestUrl,{headers:{'X-Requested-With':'XMLHttpRequest','X-Drive-Learn-Table':'1'}});
   if(!response.ok)throw new Error(`Falha ao carregar a página ${page} da tabela.`);
   const parsed=new DOMParser().parseFromString(await response.text(),'text/html');
   const fetchedTable=Array.from(parsed.querySelectorAll('.panel .table-wrap > table')).find(candidate=>signature(candidate)===tableSignature);
   if(!fetchedTable)throw new Error('A tabela retornada não corresponde à estrutura atual.');
   const pageRows=Array.from(fetchedTable.tBodies[0]?.rows||[]).filter(row=>!row.querySelector('.table-empty'));
   pageRows.forEach(row=>rows.push(document.importNode(row,true)));
   if(pageRows.length<batchSize)break;
  }
  if(rows.length){
   body.replaceChildren(...rows);
   panel.dataset.dynamicTableLoaded='1';
  }
 };
 window.driveLearnTablesReady=Promise.all(tableTargets.map(wrapper=>hydrate(wrapper).catch(error=>{
  wrapper.closest('.panel')?.setAttribute('data-dynamic-table-partial','1');
  console.warn('[Drive Learn] A tabela permaneceu com os dados da página atual.',error);
 }))).then(()=>undefined);
})();
