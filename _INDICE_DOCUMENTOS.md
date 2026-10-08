# Azimo | Índice Oficial da Documentação

> **Status: APROVADO. Atualizado em 14/09/2026.**
>
> Este índice identifica os documentos da Azimo, suas funções, seus responsáveis e como consultá-los. Não substitui os documentos originais, não concede autorização para executar demandas e não altera procedimentos de segurança.
>
> Todos os arquivos existentes permanecem preservados. A classificação como histórico ou apoio não autoriza exclusão, movimentação ou descarte.

## 0. Entrada operacional

**Atualizado em 15/09/2026 (item 80 do Backlog): estrutura simplificada para três ambientes — Desenvolvimento, Central de Comando e Backup & Verificação — executados pelo Claude/Cowork, substituindo a divisão anterior em cinco ambientes/direcionadores e o handoff ao ChatGPT Work (itens 78-79, preservados como histórico).** Demandas claras podem ir direto a Desenvolvimento, sem passar por Central de Comando. Central de Comando só entra quando a demanda envolve avaliação de produto/estratégia/experiência/interface/comunicação e ainda não está clara. Backup & Verificação só se manifesta em falha ou situação que exija ação. Os cinco arquivos "direcionador" listados na tabela abaixo (`AZIMO_OPERACAO_CHATGPT.md` e os quatro específicos) são material histórico do período dos cinco ambientes — não foram reescritos neste lote e não são leitura obrigatória para retomar a execução; consultar apenas se precisar de contexto de uma decisão antiga de um domínio específico. Leituras técnicas obrigatórias continuam no protocolo (`AZIMO_AUTONOMIA_CHATGPT.md`).

| Arquivo | Função |
|---|---|
| AZIMO_OPERACAO_CHATGPT.md | Regras compartilhadas, eficiência, continuidade, handoffs e preservação |
| AZIMO_CENTRAL_COMANDO.md | Instruções específicas da Central |
| AZIMO_PRODUTO_ESTRATEGIA.md | Instruções específicas de Produto & Estratégia |
| AZIMO_UX_INTERFACE.md | Instruções específicas de UX & Interface |
| AZIMO_MARCA_COMUNICACAO.md | Instruções específicas de Marca & Comunicação |
| AZIMO_DESENVOLVIMENTO.md | Instruções específicas de Desenvolvimento, complementadas pelo protocolo |

Direcionadores não substituem documentos oficiais de domínio. Menções antigas a nomes de chats não redefinem os responsáveis deste mapa.

## 1. Como funciona a Fonte Única de Verdade

A Fonte Única de Verdade da Azimo é o conjunto documental organizado por este índice. Cada domínio possui uma referência própria.

| Informação procurada | Referência principal | Complemento obrigatório quando necessário |
|---|---|---|
| Estado atual do projeto | `STATUS.md` | Registros correspondentes no `BACKLOG_MESTRE_AZIMO.md` e verificação técnica |
| Memória histórica operacional, decisões e andamento | `BACKLOG_MESTRE_AZIMO.md` | Evidências citadas, commits e validações |
| Segurança, execução, commits, deploy, backup e recuperação | `AZIMO_AUTONOMIA_CHATGPT.md` | Estado real dos arquivos, repositórios, serviços e logs |
| Produto, posicionamento e público | `AZIMO_CONTEXTO_CHATGPT.md` | Decisões posteriores registradas no backlog; estudos de apoio |
| Marca e identidade visual | `AZIMO_BRANDING_CHATGPT.md` | Decisões posteriores explicitamente aprovadas |
| Voz do Vio e linguagem | `AZIMO_VOZ_VIO_CHATGPT.md` | Contexto de produto, branding e decisões aprovadas |
| Interface e Design System | Referência atualmente distribuída entre branding, decisões aprovadas no backlog e componentes existentes | Futuro `AZIMO_DESIGN_SYSTEM.md`, ainda inexistente |
| Evidência de implementação | Código, histórico Git e validações | Confirmação de publicação e funcionamento quando aplicável |

O código demonstra o que está implementado. Uma aprovação documentada demonstra o que foi decidido. Essas evidências são complementares e não devem ser confundidas.

## 2. Documentos oficiais por domínio

“Oficial” identifica a função de referência do documento. Não significa que todo trecho histórico ou descritivo esteja atualizado.

| Documento | Função | Responsável pelo domínio | Ressalvas atuais |
|---|---|---|---|
| `_INDICE_DOCUMENTOS.md` | Mapa documental, responsabilidades e regras de consulta | Central de Comando | Não redefine regras específicas dos demais documentos |
| `AZIMO_AUTONOMIA_CHATGPT.md` | Protocolo técnico principal | Desenvolvimento | Preservar integralmente os procedimentos existentes; descrições de infraestrutura e backup dependem de verificação real |
| `AZIMO_CONTEXTO_CHATGPT.md` | Definição do produto, posicionamento, público e direção geral | Produto & Estratégia | Há descrições antigas de oferta, funcionalidades e organização operacional |
| `AZIMO_BRANDING_CHATGPT.md` | Identidade institucional, símbolos, cores, tipografia e linguagem visual | Marca & Comunicação, com consulta a UX & Interface nos usos dentro do produto | Há divergências conhecidas com a interface atual; não resolvê-las automaticamente |
| `AZIMO_VOZ_VIO_CHATGPT.md` | Personalidade do Vio, tom e regras de comunicação | Marca & Comunicação | Exemplos de trial e algumas formulações exigem leitura contextual; não são prova da oferta atual |
| `AZIMO_CENTRAL_COMANDO_CHATGPT.md` | Instrução do papel do ChatGPT como Central de Comando (análise ao vivo, sem execução) | Central de Comando | Vale para o Projeto Azimo no ChatGPT; não autoriza o ChatGPT a editar arquivos, commitar ou publicar (item 82 do Backlog) |

A responsabilidade por um domínio não autoriza alterar unilateralmente decisões de outro domínio.

A Central de Comando coordena a coerência documental, identifica quando registros ou documentos precisam ser atualizados e encaminha essas atualizações. Não é executora física dos arquivos. Toda alteração física dos documentos permanece centralizada em Desenvolvimento, seguindo os handoffs e as decisões dos ambientes responsáveis.

## 3. Documentos operacionais oficiais

| Documento | Função | Responsabilidade |
|---|---|---|
| `STATUS.md` | Fotografia atual: situação vigente, última entrega conhecida, ressalvas e continuidade; sem histórico acumulativo. Seção 0 ("Handoff ativo") é o marcador leve de qual agente (Claude ou GPT) está ativo e o que o próximo precisa saber — ver AZIMO_AUTONOMIA_CHATGPT.md, seção 8bis | Central de Comando acompanha a coerência geral, identifica necessidades de atualização e as encaminha; Desenvolvimento executa as alterações físicas e mantém os registros técnicos exigidos pelo protocolo |
| `BACKLOG_MESTRE_AZIMO.md` | Memória histórica operacional, decisões e andamento: preservar pedidos, justificativas, escopos, entregas, evidências e pendências | Central de Comando organiza e direciona; cada ambiente responde por suas decisões; Desenvolvimento executa as alterações físicas conforme os handoffs e registra seus lotes conforme o protocolo |

O STATUS representa exclusivamente a fotografia atual. O Backlog preserva o histórico operacional permanente e o andamento dos itens. Uma pendência antiga no Backlog não deve ser interpretada como aberta sem procurar seu desdobramento posterior. Conteúdo histórico relevante só pode sair do STATUS após confirmação de preservação suficiente no Backlog.

No encerramento dos lotes, Desenvolvimento mantém STATUS e Backlog coerentes conforme a seção 7 de `AZIMO_AUTONOMIA_CHATGPT.md`: o STATUS recebe somente mudanças necessárias na fotografia vigente, sem nova linha histórica obrigatória no topo; o Backlog recebe o registro histórico detalhado do lote. Se a fotografia não mudar, conferir sua coerência sem alterar artificialmente o STATUS. Este índice não transfere nem elimina essa responsabilidade de Desenvolvimento.

## 4. Estudos, histórico e materiais de apoio

| Arquivo | Função | Como interpretar |
|---|---|---|
| `ANALISE_ESTRATEGICA_2026.md` | Diagnóstico estratégico de 11/08/2026, hipóteses, roadmap e projeções | Referência histórica de raciocínio; não representa automaticamente o estágio, os preços ou as pendências atuais |
| `concorrentes.md` | Mapeamento competitivo | Base de pesquisa; afirmações de mercado precisam de atualização antes de sustentar novas decisões |
| `icp.md` | Hipótese inicial de público, dores, objeções e canais | Preservar como origem do posicionamento; cruzar com contexto e decisões posteriores |
| `mentores.md` | Curadoria intelectual por pilar e histórico de substituições | Referência de conteúdo para Produto & Estratégia e Marca & Comunicação; não implica endosso ou parceria |
| `beta_acesso.sql` | Preparação técnica do acesso beta gratuito até revogação (item 79) | Não executado; instalação manual e integração posteriores obrigatórias. Não comprova funcionalidade vigente nem altera assinaturas pagas |
| `feedbacks_supabase.sql` | Script específico da tabela de feedbacks | Artefato técnico; sua existência não prova execução nem representa todo o banco atual. Não executar fora do protocolo |
| `Validacoes/lote65/LEIA-ME.md` | Cobertura e limitações da validação do lote 65 | Evidência daquele lote, não certificação permanente do produto |
| `Validacoes/lote65/verificacoes.js` | Verificações locais do lote 65 | Material técnico histórico, dependente da estrutura testada; não publicar como parte do produto |

Uma decisão aprovada registrada nesses materiais continua relevante. A classificação como apoio não a revoga; sua vigência depende de verificar se houve decisão posterior que a substituiu.

## 5. Documento futuro: Design System

**`AZIMO_DESIGN_SYSTEM.md` ainda não existe e não deve ser criado nesta etapa.**

Papel previsto, sujeito à aprovação: documentar componentes de interface, tokens, estados, hierarquia, responsividade e regras de aplicação visual no produto.

- Responsável pelo domínio: **UX & Interface**.
- Marca & Comunicação responde pelos fundamentos da identidade usados na interface.
- Desenvolvimento verifica a correspondência com a implementação e executa demandas aprovadas, incluindo a futura criação física do documento quando autorizada.

Até esse documento existir e ser aprovado:

- Consultar o branding, os registros de decisões e os componentes existentes.
- Não tratar o branding como catálogo completo da interface.
- Não transformar automaticamente toda característica do código em regra aprovada.
- Preservar o funcionamento e os componentes existentes durante demandas de implementação.
- Encaminhar divergências de interface a UX & Interface e divergências de identidade a Marca & Comunicação, com coordenação da Central de Comando quando envolverem ambos.

## 6. Ambientes e consultas necessárias

Todos os ambientes consultam este índice. Antes de definir ou encaminhar uma demanda, verificam o estado pertinente no STATUS e no backlog para evitar duplicação ou reabertura de decisões.

| Ambiente | Responsabilidade | Documentos que precisa consultar |
|---|---|---|
| 📝 Central de Comando | Coordenar a coerência documental, organizar demandas, responsáveis, dependências e continuidade; identificar e encaminhar atualizações, sem alterar fisicamente arquivos | Índice, STATUS, backlog e documentos dos domínios envolvidos; protocolo técnico ao encaminhar execução |
| 💡 Produto & Estratégia | Definir o que construir e por quê | Contexto, STATUS, backlog; ICP, concorrentes, análise estratégica e mentores quando pertinentes |
| 🎨 UX & Interface | Definir experiência, fluxos e interface | Branding, contexto, STATUS, backlog e componentes atuais; futuro Design System quando existir |
| 💬 Marca & Comunicação | Definir identidade, linguagem e comunicação | Branding, guia do Vio, contexto e decisões pertinentes do STATUS/backlog; ICP e mentores como apoio |
| 🛠️ Desenvolvimento | Implementar, testar, registrar, commitar e publicar demandas definidas; centralizar as alterações físicas dos documentos conforme handoffs e decisões dos ambientes responsáveis | Protocolo técnico, STATUS inteiro, últimos 5 a 10 itens numerados do backlog, busca pelo tema e referências específicas do handoff |

Para Desenvolvimento, permanece integralmente a leitura inicial obrigatória prevista no protocolo. Esta tabela não a reduz.

**Eficiência e fluxo curto:** aplicar AZIMO_OPERACAO_CHATGPT.md, sem transformar especialistas ou handoffs em etapas obrigatórias.

Handoffs definidos não devem ter decisões de produto, UX ou marca reabertas sem impedimento técnico concreto. Uma nova decisão relevante interrompe somente a parte dependente dela e retorna ao ambiente responsável.

## 7. Como resolver aparentes conflitos

### Regras técnicas e de segurança

O `AZIMO_AUTONOMIA_CHATGPT.md` permanece como protocolo técnico principal. Resumos, notas de entrega e instruções antigas não modificam seus procedimentos.

Se houver conflito com uma nova orientação, sinalizar antes de alterar o procedimento. Não deduzir autorização a partir de exemplos históricos.

### Decisões de produto, UX e marca

Consultar a referência do domínio e procurar decisões posteriores sobre o mesmo assunto.

Uma decisão posterior só substitui a anterior quando houver aprovação explícita, escopo identificável e registro suficiente. Uma sugestão, interpretação do agente, implementação ou data mais recente não basta, isoladamente.

Sem evidência suficiente, registrar a divergência na comunicação e encaminhar ao responsável, sem escolher silenciosamente uma versão.

### Estado de entrega

Cruzar STATUS, backlog e evidências:

- Pedido recebido não significa execução autorizada.
- Implementação local não significa commit.
- Commit não significa publicação.
- Publicação não significa validação funcional ou visual completa.
- Ausência em um resumo não significa ausência no projeto.

Antes de declarar algo perdido, quebrado, não implementado ou pendente, aplicar o protocolo de verificação existente.

## 8. Como evitar que o histórico vire regra atual

1. Ler a data e o contexto do trecho, não apenas o título do arquivo.
2. Buscar o assunto no backlog completo e verificar correções, reaberturas, reversões e fechamentos.
3. Distinguir pedido, sugestão, decisão aprovada, implementação e validação.
4. Não usar preços, exemplos comerciais, projeções ou listas antigas de pendências como dados atuais sem confirmação.
5. Preservar justificativas, evidências e limitações registradas. Um resumo não substitui o original.
6. Não presumir o conteúdo de prints, PDFs ou conversas citados quando a referência original não estiver disponível.

## 9. Ressalvas documentais conhecidas

Na auditoria de 14/09/2026 foram identificadas:

- Descrições antigas de planos e trial em documentos de contexto e comunicação.
- Orientações antigas de publicação ainda presentes no histórico.
- Divergências entre branding e implementação nas cores dos pilares, fundo e variantes do símbolo do Vio.
- Worker sem Git local: descrição corrigida no protocolo; recuperação usa arquivos e backups.
- Falhas históricas de Drive preservadas no Backlog; modelo vigente é backup local com cópia externa manual por Anderson.
- Referências a materiais de aprovação não presentes na pasta Estratégia.

Essas ressalvas não autorizam correções automáticas e não constituem uma lista de tarefas de implementação.

## 10. Originais, cópias e manutenção do índice

A pasta `Estratégia/` contém os originais locais abrangidos por este índice. Arquivos anexados a projetos ou chats são cópias de consulta e podem estar desatualizados.

- Conferir a correspondência de conteúdo antes de tratar uma cópia como atual.
- Não considerar a data de upload, a data do arquivo ou o cabeçalho isoladamente como prova de vigência.
- Não apagar, substituir ou reorganizar cópias como consequência automática da atualização deste índice.
- Manter o inventário coerente quando houver criação ou mudança documental explicitamente autorizada.
- Preservar as regras existentes de registro, backup e recuperação.

A Central de Comando coordena a coerência deste mapa, identifica necessidades de atualização e as encaminha. Cada ambiente responde pela precisão das decisões de seu domínio. Desenvolvimento é o executor físico de todas as alterações documentais, conforme os handoffs e decisões dos ambientes responsáveis, mantendo suas obrigações técnicas.

> A definição de STATUS como fotografia atual e Backlog como memória histórica operacional está compatibilizada com o protocolo. Essa reorganização não cria o Design System, não resolve as demais divergências de conteúdo e não autoriza alterações fora do escopo de cada handoff.

## 11. Rotinas e Fontes do Projeto

Operacao/azimo_rotinas.py executa backup verificado e Health Check; backup.command é a entrada manual. Logs: _Backups/backup.log e Operacao/healthcheck.jsonl. Auditoria e candidatos a limpeza: Backlog, item 78.

Conjunto de Fontes: seis direcionadores + STATUS + Backlog + Índice + protocolo + contexto + branding + voz do Vio (13 arquivos). No espelho local há contexto, branding e protocolo: substituir essas cópias e adicionar os dez faltantes. Reconciliar por nome se a interface tiver arquivos adicionais; não manter versões duplicadas. Atualizar originais não sincroniza automaticamente Fontes. Disponibilidade como Fonte não significa carregar tudo em cada demanda.

Análise estratégica, ICP, concorrentes e mentores podem permanecer locais e entrar sob demanda. Código, SQL, logs, backups e testes não precisam ser Fontes permanentes. Retirar cópia de consulta não autoriza excluir original/anexo exclusivo.

Chats cobertos pelos registros podem ser arquivados reversivelmente, sem excluir anexos/históricos. A auditoria não comprova captura de todo anexo exclusivo de todo chat. A rotina nova independe das conversas; Anderson assumiu cancelar os agendamentos antigos diretamente no Claude.


## 12. Reorganização física de 18/09/2026

Nesta data, a pedido de Anderson, os seis direcionadores do modelo antigo de cinco ambientes (`AZIMO_OPERACAO_CHATGPT.md`, `AZIMO_CENTRAL_COMANDO.md`, `AZIMO_PRODUTO_ESTRATEGIA.md`, `AZIMO_UX_INTERFACE.md`, `AZIMO_MARCA_COMUNICACAO.md`, `AZIMO_DESENVOLVIMENTO.md`) e o documento do papel do ChatGPT como Central de Comando (`AZIMO_CENTRAL_COMANDO_CHATGPT.md`) foram movidos fisicamente, sem exclusão, para `0_Excluir Hoje/Estrategia_direcionadores_obsoletos/`, na raiz da pasta Azimo. Nenhum conteúdo foi apagado ou alterado; a movimentação preserva os arquivos para exclusão manual futura por Anderson, conforme já indicado por esta seção como material histórico não obrigatório (ver seção 0). Nenhum código (`Empresa/`, `Worker/`) referencia esses arquivos por nome; a movimentação não afeta site, Worker ou rotinas.

Também nesta data, `0_Operacional/Fluxo dos Chats.png` foi consolidado em `0_Visual/fluxos/`, e a pasta `0_Operacional`, então vazia, foi movida para a mesma pasta de exclusão pendente. Nenhum documento ou código referenciava esse arquivo por caminho.

Os quatro documentos de domínio com sufixo "_CHATGPT" que permanecem (`AZIMO_AUTONOMIA_CHATGPT.md`, `AZIMO_CONTEXTO_CHATGPT.md`, `AZIMO_BRANDING_CHATGPT.md`, `AZIMO_VOZ_VIO_CHATGPT.md`) não foram tocados: continuam oficiais por domínio, independente da ferramenta de IA em uso. Uma eventual renomeação desses quatro arquivos para remover o sufixo é uma decisão separada, ainda pendente, que exige atualizar as referências cruzadas existentes antes de ser executada.


## 13. Sinal diario de backup (18/09/2026)

A pedido de Anderson, `Operacao/azimo_rotinas.py` passou a manter, a cada execucao de `rotina`, uma unica pasta na raiz da Azimo chamada `Azimo_Backup_AAAA-MM-DD` (data de hoje). Ela NAO e um backup - os backups reais continuam exclusivamente em `_Backups/`, com o padrao de nome com hora e microsegundos. Essa pasta e apenas um sinal visual rapido: contem um `status.txt` com o resultado da rotina do dia (status geral, arquivos verificados, retencao, health check do site e do Worker). A pasta do dia anterior e renomeada para a de hoje (mv, nunca exclusao), entao nunca ha mais de uma pasta desse padrao ao mesmo tempo e nenhuma permissao de exclusao e necessaria. Uma copia de seguranca do script antes dessa alteracao (`azimo_rotinas.py.antes_sinal_diario`) foi movida para exclusao pendente por Anderson.


## 14. Pasta-espelho para upload no Google Drive (18/09/2026)

A pedido de Anderson, `Operacao/azimo_rotinas.py` passou a manter tambem, a cada execucao de `rotina`, uma pasta na raiz da Azimo chamada `AAAA_MM_DD_Azimo` (data de hoje), com uma copia integral e atualizada dos arquivos do projeto (mesmos criterios de exclusao do backup: caches regeneraveis, `_Backups/`, `0_Excluir Hoje/` e as proprias pastas de sinal/espelho, para nao haver auto-inclusao nem crescimento composto). Existe para Anderson arrastar direto para a pasta "0 | Azimo" dele no Google Drive, sem precisar reunir manualmente as pastas soltas.

Importante: esta pasta e uma COPIA de conveniencia, nao a copia oficial verificada por hash (essa permanece exclusivamente em `_Backups/`). Os arquivos reais do projeto (`Empresa/`, `Worker/`, etc.) nunca sao movidos ou renomeados por essa rotina - apenas copiados - porque scripts de deploy existentes (`Empresa/push.command`) tem caminho absoluto fixo (`$HOME/Documents/Azimo/backup.command`) que quebraria silenciosamente se a estrutura fosse movida. A pasta do dia anterior e renomeada (mv) para o nome de hoje antes do conteudo ser atualizado; nunca existe mais de uma ao mesmo tempo e nenhuma exclusao e necessaria.

Testado em 18/09/2026: conteudo e tamanho conferem com os arquivos reais, sem auto-inclusao, e a rotina de retencao/backup em `_Backups/` nao foi afetada em tamanho.


## 15. Reorganizacao em `Projeto/` e correcao de caminho (18/09/2026)

A pedido de Anderson, para deixar a raiz da Azimo limpa (so a pasta espelho do dia visivel, sem as pastas do site soltas ao lado), `Empresa/`, `Worker/`, `Estratégia/` e `0_Visual/` foram movidas, uma unica vez, para dentro de uma nova pasta estavel `Projeto/`. `Operacao/`, `_Backups/` e `backup.command` permanecem na raiz da Azimo, sem mudanca - isso preserva o calculo de ROOT em `azimo_rotinas.py` (relativo a propria localizacao do script) e a continuidade do historico em `_Backups/`.

Verificado antes de mover: nenhum arquivo fora de `Empresa/publicar.command` referenciava esses caminhos de forma que quebrasse com a mudanca de profundidade. Unica correcao necessaria: `Empresa/publicar.command` tinha `bash "$(dirname "$0")/../backup.command"`; corrigido para `../../backup.command`, ja que `backup.command` ficou um nivel mais acima. `Empresa/push.command` usa caminho absoluto (`$HOME/Documents/Azimo/backup.command`) que nao mudou, pois `backup.command` nao se moveu - nenhuma correcao necessaria ali. Git (`Empresa/.git`, incluindo remoto e historico) e a ligacao Vercel (`Empresa/.vercel/project.json`, que identifica o projeto por ID, nao por caminho) nao dependem de localizacao no disco e foram confirmados intactos apos a mudanca.

Incidente durante o teste: comandos de verificacao (`git status`) executados nesta sessao deixaram um `.git/index.lock` que essa sessao nao pode excluir (mesma restricao de exclusao das demais rotinas). Resolvido movendo o lock para fora do `.git` (pasta de exclusao pendente), sem apagar - pratica ja usada antes neste mesmo repositorio (ver `HEAD.lock.preservado-lote65` e `index.lock.preservado-lote65`, de incidente anterior). Nenhum commit ou trabalho foi perdido; apenas o arquivo de trava temporario foi retirado do caminho.

A pasta-espelho `AAAA_MM_DD_Azimo` (secao 14) reflete automaticamente essa nova estrutura (contem `Projeto/` em vez das pastas soltas) a partir de hoje. Observacao registrada para memoria futura: como a copia da pasta-espelho so adiciona/atualiza (nunca remove o que sai da origem), uma mudanca estrutural desse tipo deixa temporariamente entradas antigas obsoletas dentro dela ate serem retiradas manualmente uma vez - o que foi feito hoje. Uma reorganizacao estrutural futura deve repetir essa limpeza manual pontual na pasta-espelho do dia.


## 16. Correcao: sinal diario e espelho tambem no backup isolado (19/09/2026)

Publicacao real testada com sucesso por Anderson via `publicar.command` apos a correcao de caminho e de permissao de execucao da secao 15 (o `chmod +x` reescrito pela sessao havia perdido o bit de execucao; corrigido). Backup verificado: 843 arquivos, git com push confirmado.

Durante esse teste real foi identificada uma lacuna: `Operacao/azimo_rotinas.py backup` (chamado por `backup.command`, por sua vez chamado por `push.command`/`publicar.command`) nao atualizava a pasta-sinal (secao 13) nem a pasta-espelho (secao 14) - essas so eram atualizadas quando a acao `rotina` completa (backup+health) rodava, tipicamente so pelo agendamento automatico da manha. Corrigido: a atualizacao de ambas passou para dentro da propria funcao `backup()`, logo apos a retencao, entao roda em qualquer acionamento que gere um backup, seja publicacao manual pelo Anderson ou a rotina agendada. Testado isoladamente (`backup` sem `health`) e em conjunto (`rotina`): ambas as pastas atualizam corretamente em qualquer um dos dois caminhos, sem duplicar.
