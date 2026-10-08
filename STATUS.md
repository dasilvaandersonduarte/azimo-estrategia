# Azimo | Estado Atual

> Atualizado em 15/09/2026. Última publicação: reorganização do Command e interface de última sincronização, item 79, commit 6236f7b. Worker de metadados publicado: fecc3ff4-43fc-492e-ac23-c7905d3c2a95.
>
> Ler integralmente no início da sessão técnica, junto dos últimos 5 a 10 itens do Backlog. O histórico operacional permanente está no [BACKLOG_MESTRE_AZIMO.md](BACKLOG_MESTRE_AZIMO.md); responsabilidades e precedência documental estão no [_INDICE_DOCUMENTOS.md](_INDICE_DOCUMENTOS.md). Este resumo não substitui o [protocolo técnico](AZIMO_AUTONOMIA_CHATGPT.md).

## 0. Handoff ativo

> Coordenação entre agentes (Claude ⇄ GPT). O próximo agente deve conferir este bloco, Git e últimos itens do Backlog antes de assumir, conforme a seção 8bis de `AZIMO_AUTONOMIA_CHATGPT.md`.

**Agente ativo:** CLAUDE (29/09/2026: item 95 -- Worker publicado com sucesso (conta Cloudflare corrigida), rota /gcal-events confirmada ao vivo. Anderson testou e mandou lote de 12 ajustes; 7 implementados e commitados (`e6db898`): renomeia Sua Agenda Azimo, Agenda Semanal como padrao, corrige BUG CRITICO de sincronizacao do Google Calendar (eventos nao apareciam no Semanal/Mensal), renomeia Matriz de Eisenhower com gradiente de cor por urgencia, botao Adicionar Tarefa fixo no cabecalho, confirmacao antes de minimizar secao. AGUARDANDO Anderson publicar (`publicar.command`) e testar ao vivo. Itens 5/7/8/9/10 do lote ficam pra proxima rodada -- ver item 95.1 do Backlog)

**Último handoff**
- Data: 26/09/2026
- De → Para: GPT → CLAUDE
- Alterações relevantes: card “Análise Semanal do Vio” ajustado à referência visual, commit `9483b17` em `Empresa/index.html`, publicado em `origin/main`; HTML público conferido. Três áreas integradas, hierarquia reforçada, timeline com Vio, horizonte sutil e organização vertical em telas menores. A lógica de semana, registros e liberação permaneceu. Item 89 do Backlog traz escopo, validação e limites.
- Arquivos afetados: `Empresa/index.html`; `Estratégia/STATUS.md` seção 0; `Estratégia/BACKLOG_MESTRE_AZIMO.md` itens 89–90; novo `Estratégia/DIRECAO_ARTE_INTERFACE_AZIMO.md` (guia documental, fora do Git do produto).
- Decisões importantes: Anderson quer que as próximas interfaces implementadas pelo Claude sigam a direção de arte concebida pelo GPT, com criatividade dentro da identidade do Azimo. O guia registra o princípio e usa o card como exemplo, sem pedir reimplementação dele ou impor estética espacial a outras telas. Para cada novo pedido visual, consultar o guia e o briefing específico, conferir o código vigente e preservar arquitetura, dados e funcionalidades. GPT não iniciou outra tarefa.
- Pendências: receber o próximo pedido visual específico e, se Anderson desejar, avaliação final do card publicado. Não há pendência técnica conhecida no lote 89. Claude deve executar `ASSUMIR CLAUDE` antes de trabalhar e reconferir Git/Backlog; `main` e `origin/main` locais estavam em `9483b17` neste handoff.
- Alertas: alteração local preexistente em `Empresa/publicar.command` corrige o caminho do backup (`../../backup.command`), ainda não commitada; preservar. Estratégia não pertence ao repositório Git de Empresa. Backup diário é automação separada e não requer ação na troca.

## 1. Situação geral

Azimo é uma plataforma web de evolução pessoal com o mentor Vio, em fase de validação e refinamento do produto. Há publicações registradas em azimo.life; o Health Check de 14/09 confirmou HTTP 200 no site e no /config do Worker, sem teste autenticado ou certificação integral do produto.

Command reorganizado e publicado: Produto & Vio reúne infraestrutura/curadoria; onboarding em Estratégia; fases, saldo API e rotinas corrigidos. Navegação e mobile testados em prévia isolada. Beta gratuito ainda não ativado. Última sincronização tem interface e Worker publicados; listagem validada na sessão admin. Registro consultado retornou indisponível, sem data presumida. Sem alteração de pagamentos. Ver item 79.

Arquitetura pronta: arquivo geral e cinco direcionadores específicos; especialistas disponíveis sem etapas obrigatórias. Desenvolvimento responde por backup local, Health Check e recuperação. Histórico preservado no Backlog, incluindo item 78. Anderson assumiu cancelar os agendamentos antigos diretamente no Claude; conclusão dessa ação externa ainda não confirmada.

## 2. Base técnica e última entrega conhecida

| Evidência | Fotografia atual |
|---|---|
| **Confirmado localmente** | `Empresa/` está na branch `main`, em `6236f7b`, enviado ao remoto; HTML público confirmado com nova organização. Worker de metadados publicado na versão fecc3ff4-43fc-492e-ac23-c7905d3c2a95 após conexão à conta correta. |
| **Base técnica** | Frontend em `Empresa/index.html`; API e lógica de servidor em `Worker/src/index.js`, com configuração em `Worker/wrangler.toml`. Integrações: Vercel, Cloudflare, Supabase, Stripe e Resend. A pasta local `Worker/` não possui `.git`, conforme a descrição corrigida no protocolo. |
| **Última entrega publicada registrada** | Item 76, parte 21: Análise Semanal do Vio em duas colunas, ajuste de centralização de Objetivos/Consistência/Metas Financeiras, retirada do aviso semanal duplicado e saudação contextual do Vio com encaminhamento para a próxima ação. Implementação presente no código local. |
| **Publicação registrada** | Frontend 6236f7b publicado em 15/09 e confirmado por leitura do HTML público. Como entrega anterior, o item 76 registra `3544364` publicado em azimo.life, sintaxe de nove blocos de script e tags validadas, além de backup local. São evidências da entrega de 13/09, sem nova certificação de produção nesta etapa. |
| **Validação sem fechamento** | Ainda não há fechamento registrado para o desenho do fluxo SVG da Análise Semanal, os destinos da saudação contextual e o resultado visual da centralização dos três cards. Isso não confirma defeito nem autoriza redesenho. |

## 3. Principais capacidades implementadas

Síntese conferida no código local e nos registros de entrega, sem equivaler a teste integral dos serviços em produção:

- **Dashboard e Vio:** indicadores, consistência dos hábitos, objetivos por horizonte, metas financeiras, análise semanal, chat contextual e popup que preserva a conversa ao minimizar.
- **Rotina e Foco:** hábitos personalizáveis, início/fim do dia, afirmações e mentalizações, tarefas com recorrência e priorização, diário de produtividade, agenda e Pomodoro em tela própria.
- **Estudos e Revisão:** registros por categoria, conteúdo do estudo nos cards de revisão, reagendamento, calendário e progresso com dados reais dos ciclos de revisão.
- **Finanças:** receitas, despesas, contas, categorias, recorrências, orçamento, comparações e metas. A antiga separação Pessoal/Empresarial não deve ser inferida dos registros da sessão 8.
- **Conta e operação:** perfil e autenticação, interface de assinatura, integração de pagamentos/e-mails, Azimo Command e interface de feedback. A existência dessas implementações não confirma configuração externa ou fechamento dos testes descritos na seção 4.
- **Experiência:** temas Claro/Escuro/Sistema, tours guiados, blocos compactáveis, adaptações mobile e instalação pelo navegador (PWA). O item 71 documenta o alcance da auditoria mobile; não constitui certificação visual de todas as telas.

A oferta exibida no frontend local é plano anual de R$478,80 (12x R$39,90), com comunicação de reembolso em sete dias. Isso não verifica preços ativos no Stripe nem execução de reembolso. Histórico comercial e correção do Price ID: itens 14 e 57.

## 4. Pendências e ressalvas vigentes

- **Revisão da última entrega:** obter o fechamento dos três pontos do item 76 identificados na seção 2, preservando a distinção entre interpretação visual, código implementado e aprovação do usuário.
- **Google no preview:** `loginComGoogle()` ainda usa retorno fixo para `https://www.azimo.life`, coerente com a limitação registrada no item 67. Não confundir com falha atual do login em produção.
- **Validações externas sem fechamento documental:** teste da Priscila de cadastro/cancelamento/reembolso/recadastro (item 57), confirmação de execução do SQL de feedbacks (item 55) e cobertura completa de pagamentos/e-mails. A ausência de fechamento não prova falha atual; investigar antes de reabrir trabalho ou repetir ações.
- **Beta gratuito (item 79/80/81):** SQL executado no Supabase em 15/09 (confirmado). Integração de convites/resgate/revogação construída localmente no Worker e no `index.html`, validada por sintaxe, ainda não publicada nem testada ao vivo — falta rodar `push.command` e `Worker/deploy_azimo.command` e testar o fluxo de ponta a ponta.
- **Backup e Health Check:** rotina local testada com cópia verificada por hash e site/Worker HTTP 200. **Correção de 20/09:** não é Codex — é scheduled task da própria conta Claude (`Azimo | Backup e Health Check`, diário 08h locais), independente de qual agente (Claude/GPT) está ativo no handoff; continua rodando sozinha mesmo com o GPT como agente ativo do dia a dia. Confirmada ativa e com sucesso em 20/09. Requer Mac/app disponíveis no horário. Cópia externa manual por Anderson, sem dependência de Drive. Política: duas cópias novas verificadas; preservar integralmente excedentes no arquivo histórico ZIP verificado antes de retirar diretórios antigos. Não exporta banco/segredos remotos. Ver protocolo, seção 10.
- **Evoluções separadas:** publicação nas lojas oficiais permanece no roadmap, dependente de contas e materiais (itens 71–72); o tratamento dedicado do popup Vio no mobile foi adiado (item 70). Não são bugs confirmados nem novas autorizações de implementação.
- **Referências visuais:** `AZIMO_DESIGN_SYSTEM.md` ainda não existe. Consultar branding, decisões do Backlog e componentes atuais conforme o Índice; sua criação não faz parte desta etapa. Divergências de identidade/interface continuam sujeitas aos respectivos responsáveis.

## 5. Continuidade documental e preservação

O detalhamento retirado deste resumo está nos registros correspondentes do Backlog, especialmente itens 1, 8, 14, 18–22, 27, 31–32, Fase A, 51–57 e 61–77. Consultar desdobramentos posteriores antes de usar um status antigo como situação atual. Relatos retrospectivos preservam contradições e limitações de evidência; não são novas execuções.

No encerramento dos lotes, Desenvolvimento mantém os dois registros coerentes: atualiza o STATUS somente quando houver mudança necessária na fotografia vigente e registra o histórico detalhado no Backlog, conforme a seção 7 do protocolo. O STATUS não acumula relatos de execução nem exige nova linha no topo a cada lote. Histórico de incidentes e publicação: consultar o Backlog, especialmente item 61.

## 6. Próximo passo operacional

A Central de Comando coordena a coerência documental e encaminha atualizações; Desenvolvimento executa fisicamente os arquivos conforme as decisões dos responsáveis. Produto & Estratégia, UX & Interface e Marca & Comunicação mantêm seus domínios definidos no Índice.

Fontes atualizadas por Anderson em 14/09, conforme confirmação. Conexão Cloudflare Azimo concluída e Worker publicado, sem alterar a conexão da Priscila. Próximo passo em Desenvolvimento: receber o resultado da execução manual do SQL de beta para concluir integração e testes. Beta gratuito aprovado até revogação; beta_acesso.sql preparado para execução manual no Supabase, conforme seção 5 do protocolo. Após confirmação, integrar e testar o fluxo de beta sem tocar assinantes pagos. Após este lote, atualizar nas Fontes as cópias de STATUS, Backlog e protocolo. Cancelamento dos agendamentos antigos no Claude permanece sob responsabilidade de Anderson.

Consultar arquivo geral + direcionador do ambiente + domínios necessários. Aplicar eficiência conforme o arquivo geral e seção 7 do protocolo: usar o menor contexto e esforço suficientes para execução segura, reutilizando evidências válidas e agrupando alterações relacionadas quando não aumentar o risco, sem reduzir segurança, preservação histórica ou qualidade.

Para retomar produto, conferir o item 76 e o handoff vigente, sem presumir que solicitações antigas continuam abertas. Manter a verificação mobile no mesmo lote das mudanças de desktop, conforme item 71. Segurança, commits, publicação, backups e recuperação continuam regidos pelo protocolo; esta atualização documental não autoriza código, deploy ou mudança de procedimento.

## Teste de sincronizacao (08/10/2026, 17:5x horario local)

Teste automatico pra confirmar que o push continua funcionando depois de recriar o token. Pode ignorar/remover esta linha depois.
