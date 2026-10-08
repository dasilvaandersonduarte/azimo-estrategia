window.addEventListener('load',()=>setTimeout(async()=>{
const results=[];const ok=(x,m)=>{if(!x)throw Error(m);results.push(m)};
window.__testResults=results;
try{
STATE=_applyDefaults({nome:'Teste Azimo',onboardingDone:true,perfilNudgeCount:3});
_stateHydrated=false; // Nenhuma persistência local ou remota no teste.
salvarMensagemSB=async()=>{};_pushStateSB=async()=>{};
STATE.habitos.push({id:'custom-teste',label:'Hábito Personalizado',icon:'ti-star',pilar:'intelectual'});
STATE.tarefasHoje[todayKey()]=[{id:'t1',texto:'Preparar o projeto',feito:false,habitoId:null,tipo:null}];
document.getElementById('landing-page').classList.add('hidden');document.querySelector('.app').classList.add('visible');
nav('rotina');
// Conteúdo e controles nas tarefas.
ok(document.getElementById('desc-t1')!==null,'Descrição disponível desde a criação');
for(const sel of ['.tarefa-hab-link','.tarefa-rec-link','.tarefa-prioridade']){const el=document.querySelector(sel);ok(el && getComputedStyle(el).opacity==='1','Controle visível: '+sel)}
toggleEisenAtributo('t1','importante');ok(_calcQuadranteEisenhower(STATE.tarefasHoje[todayKey()][0])==='agendar','Importante sem urgência vai para Agendar');
toggleEisenAtributo('t1','urgente');ok(_calcQuadranteEisenhower(STATE.tarefasHoje[todayKey()][0])==='fazer','Urgente e importante vão para Fazer Agora');
const fakeEvent={stopPropagation(){},target:document.querySelector('.tarefa-hab-link')};abrirPickerHabito('t1',fakeEvent);
ok(document.getElementById('hab-picker').textContent.includes('Hábito Personalizado'),'Vínculo inclui hábito personalizado');document.getElementById('hab-picker').style.display='none';
// Mínimo Diário: confirmação apenas ao desfazer, inclusive NF.
const grid=document.getElementById('tracker-grid');const cells=[...grid.children];const cell=cells.find(x=>x.querySelectorAll('button').length===2);const buttons=cell.querySelectorAll('button');
buttons[0].click();ok(!document.getElementById('modal-confirmar-habito').classList.contains('open'),'Marcar feito não pede confirmação');
buttons[1].click();ok(document.getElementById('modal-confirmar-habito').classList.contains('open'),'NF sobre feito pede confirmação');document.getElementById('confirmar-habito-cancelar').click();
buttons[0].click();ok(document.getElementById('modal-confirmar-habito').classList.contains('open'),'Desmarcar check pede confirmação');document.getElementById('confirmar-habito-confirmar').click();
const task=STATE.tarefasHoje[todayKey()][0];task.habitoId='custom-teste';task.feito=true;STATE.tracker['custom-teste_'+todayKey()]=true;toggleTarefa('t1');
ok(task.feito===true && document.getElementById('modal-confirmar-habito').classList.contains('open'),'Tarefa vinculada protege hábito confirmado');document.getElementById('confirmar-habito-cancelar').click();
// Objetivo, pilar SVG e tarefa sem nome herdado.
openModal('obj');const pillar=document.getElementById('m-obj-pilar');pillar.value='Outro';_objPilarChanged(pillar);
ok(document.querySelectorAll('#m-obj-pilar-outro-icone-grid button svg').length===8,'Oito ícones de pilar em SVG');
document.querySelectorAll('#m-obj-pilar-outro-icone-grid button')[1].click();ok(document.getElementById('m-obj-pilar-outro-icone').value==='casa','Escolha de ícone funciona');
_objMostrarCriarRec();ok(document.getElementById('m-obj-rec-novo-texto').value==='','Tarefa do objetivo inicia vazia');
ok(document.getElementById('m-obj-rec-novo-wrap').textContent.includes('Ação que você fará para conquistar o objetivo.'),'Texto de apoio correto');
closeModal();
// Sexta-feira: 5/7. Domingo: 7/7 (função usa posição e não quantidade de dados).
const wrap=document.createElement('div');wrap.innerHTML=_renderEtapasSemanaisHtml(5);
ok([...wrap.firstElementChild.children].filter(x=>x.style.background==='var(--indigo-text)').length===5,'Sexta-feira tem cinco etapas ativas');
wrap.innerHTML=_renderEtapasSemanaisHtml(7);ok(wrap.firstElementChild.children.length===7,'Semana tem sete etapas');
// Popup maior que tela: medidas limitadas ao viewport.
const picker=document.getElementById('rec-picker');picker.style.display='block';picker.style.width='2000px';picker.style.height='2000px';_posicionarPickerNaViewport(picker,{left:innerWidth-3,top:innerHeight-3,bottom:innerHeight});
const box=picker.getBoundingClientRect();ok(box.left>=0 && box.top>=0 && box.right<=innerWidth && box.bottom<=innerHeight,'Picker grande contido na tela');picker.style.display='none';picker.style.width='';picker.style.height='';
// Minimiza antes de resposta, reabre, sem duplicar.
abrirVioPopupTopbar();addChatMsg('user','Mensagem de teste');const thread=document.getElementById('vio-popup-thread');const n=thread.children.length;minimizarVioPopup();await new Promise(r=>setTimeout(r,360));
addChatMsg('coach','Resposta recebida enquanto minimizado');ok(thread.children.length===n+1,'Resposta recebida minimizado preservada');
mostrarVioPopup({texto:'Aviso intruso'});ok(thread.textContent.includes('Resposta recebida'),'Aviso proativo não substitui conversa');
reabrirVioPopupMinimizado();ok(thread.children.length===n+1,'Reabrir não duplica mensagens');
minimizarVioPopup();reabrirVioPopupMinimizado();await new Promise(r=>setTimeout(r,360));ok(document.getElementById('vio-popup').style.display==='block','Reabertura rápida não desaparece');
const hist=STATE.chatHistory.length;nav('coach');ok(STATE.chatHistory.length===hist && document.getElementById('chat-msgs').textContent.includes('Resposta recebida'),'Conversa preservada ao abrir chat completo');
nav('rotina');abrirVioPopupTopbar();ok(thread.textContent.includes('Resposta recebida'),'Conversa preservada ao voltar ao popup');
fecharVioPopup(false);
results.push('CONCLUÍDO: '+results.length+' verificações passaram');
}catch(e){results.push('FALHOU: '+e.message);console.error(e)}
const panel=document.createElement('details');panel.id='test-results';panel.style='position:fixed;top:4px;left:75px;z-index:99999;background:#162b24;color:white;padding:8px;border-radius:6px;max-width:550px;max-height:80vh;overflow:auto;font:12px system-ui';panel.innerHTML='<summary>'+results.at(-1)+'</summary><pre style="white-space:pre-wrap">'+results.join('\n')+'</pre>';document.body.appendChild(panel);
},300));
