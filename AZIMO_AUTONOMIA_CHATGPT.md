# Azimo | Protocolo técnico de execução e continuidade

Vigente em 14/09/2026. Consultar AZIMO_OPERACAO_CHATGPT.md e AZIMO_DESENVOLVIMENTO.md. Este arquivo concentra procedimentos técnicos e segurança.

## 0. Responsabilidade operacional

**Atualizado em 15/09/2026 (item 80 do Backlog): a construção técnica do Azimo voltou para o Claude/Cowork, em organização simplificada de três ambientes — Desenvolvimento, Central de Comando e Backup & Verificação — substituindo a divisão anterior em cinco ambientes/direcionadores e o handoff completo ao ChatGPT Work (item 78).** Desenvolvimento (Claude/Cowork) responde por execução, registros, commits, publicação e resolução técnica. Central de Comando recebe ideias e prioriza demandas quando necessário, sem ser etapa obrigatória. Backup & Verificação acompanha backup/disponibilidade/recuperação e só comunica falhas. Menções neste e nos demais documentos a "ChatGPT"/"Codex" como responsável técnico, ou aos cinco ambientes antigos, são histórico do período do handoff (itens 78-79 do Backlog) e não refletem mais a responsabilidade vigente — não redefinem produto, marca ou procedimentos de segurança, que continuam os mesmos. Cancelamento dos agendamentos antigos no Claude confirmado nesta sessão (`list_triggers` vazio, ver item 80). O provedor de IA do Vio não foi alterado.

## 1. O que é o Azimo (resumo executivo)

Plataforma web de evolução pessoal com mentor de IA chamado **Vio**, para empreendedores solo brasileiros. Estrutura em 5 pilares (Físico, Intelectual, Emocional, Espiritual, Empresarial). Produto em produção, em fase de validação inicial, pré-tração. Contexto completo de mercado, ICP, concorrência e posicionamento está em `AZIMO_CONTEXTO_CHATGPT.md` — não repetido aqui para não duplicar. Este documento cobre o que aquele não cobre: como o produto é construído e mantido tecnicamente.

---

## 2. Stack técnica

| Camada | Tecnologia | Onde vive |
|---|---|---|
| Frontend | HTML/JS único (`index.html`) | Vercel, domínio azimo.life |
| API Proxy / lógica de servidor | Cloudflare Worker (`azimo-proxy`) | `Worker/src/index.js` |
| Banco de dados + Auth | Supabase, projeto `yvikqakjdjsyiqrkyoze`, região sa-east-1 | supabase.com |
| Mentor de IA (Vio) | Claude Sonnet, chamado a partir do Worker | — |
| Pagamentos | Stripe, conta "Azimo" | Payment Links + Subscriptions |
| Email transacional | Resend, domínio azimo.life verificado (DKIM/SPF/DMARC via Hostinger) | — |

## 3. Arquivos críticos e onde encontrar cada coisa

```
~/Documents/Azimo/
├── Empresa/                         (repositório git: azimo-site)
│   ├── index.html                   ← TODO o app: landing page + app logado + Azimo Command (painel admin interno)
│   ├── push.command                 ← duplo clique: git add + commit + push → dispara deploy automático na Vercel
│   └── vercel.json
├── Worker/                          (pasta local sem .git verificada em 14/09)
│   ├── src/index.js                 ← Cloudflare Worker: proxy da API do Vio, webhooks Stripe, envio de email, rotas de assinatura
│   ├── wrangler.toml                ← variáveis de ambiente do Worker (cuidado: variável de texto sobrepõe fallback do código, já causou bug real, ver seção 6)
│   └── deploy_azimo.command         ← duplo clique: publica o Worker no Cloudflare
├── Estratégia/
│   ├── STATUS.md                    ← FONTE DA VERDADE do estado atual do produto. Ler sempre no início de qualquer sessão de trabalho.
│   ├── BACKLOG_MESTRE_AZIMO.md      ← backlog vivo, item por item, numerado sequencialmente, com data/pedido/decisão/entrega/pendência
│   ├── ANALISE_ESTRATEGICA_2026.md  ← roadmap de fases (A/B/C), mercado, horizonte financeiro
│   ├── AZIMO_CONTEXTO_CHATGPT.md    ← contexto de produto/mercado/ICP (chat Estrategista)
│   ├── AZIMO_BRANDING_CHATGPT.md    ← manual de marca (chat Layout)
│   ├── AZIMO_VOZ_VIO_CHATGPT.md     ← guia de voz e copy (chat Copy)
│   ├── AZIMO_AUTONOMIA_CHATGPT.md   ← este arquivo
│   ├── concorrentes.md / icp.md / mentores.md
└── _Backups/                        ← gerado automaticamente pelo backup diário
```

**Regra permanente:** nenhuma sessão de trabalho técnico no Azimo começa sem ler `STATUS.md` inteiro e dar uma olhada nos últimos 5 a 10 itens numerados de `BACKLOG_MESTRE_AZIMO.md`. O `STATUS.md` fica desatualizado com frequência (o trabalho real segue no Backlog Mestre item por item, e nem sempre alguém volta para atualizar o resumo). Antes de dizer que algo "não foi feito" ou "se perdeu", checar os dois arquivos primeiro — já aconteceu de um item ser marcado erroneamente como perdido quando na verdade estava documentado no Backlog Mestre.

## 4. Deploy: como publicar de verdade

**Atualizado em 09/09/2026 — fluxo mudou de novo, ler com atenção antes de assumir que ainda é preview obrigatório.**

Entre 02/09 e 09/09/2026 o fluxo exigia preview + aprovação explícita do Anderson antes de qualquer publicação em produção (criado depois de um incidente real, ver Backlog, item 61). Anderson decidiu voltar a publicar direto, por escolha dele: o "Instant Rollback" da Vercel é rápido o suficiente pra sustentar esse ritmo, e ele prefere resolver problemas revertendo do que esperar aprovação a cada lote.

1. **Pode publicar direto:** `Empresa/publicar.command` publica de fato em `main` / `azimo.life` assim que o lote estiver pronto, testado localmente e com sintaxe validada. Não é preciso esperar aprovação do Anderson antes de publicar — avise ele depois, com um resumo do que mudou.
2. **`Empresa/preview.command`** (branch de teste, `files-git-preview-anderson-duarte-s-projects.vercel.app`, sem afetar `azimo.life`) continua existindo e vale usar por iniciativa própria em mudanças grandes/estruturais onde vale a pena conferir visualmente antes — mas não é mais uma etapa obrigatória nem depende de aprovação prévia pra seguir pro `publicar.command`.
3. Worker: `Worker/deploy_azimo.command`, sem etapa de preview (o Worker não tem ambiente de teste separado hoje).
4. **Rollback de emergência:** Vercel tem "Instant Rollback" nativo no dashboard do projeto (vercel.com → files → Overview) — reverte produção para o deploy anterior em segundos, sem precisar mexer em git. É a rede de segurança principal desse fluxo agora, use sem hesitar se algo quebrar.
5. **Limite real do rollback, não ignorar:** ele desfaz o código publicado, mas não desfaz efeitos colaterais que já rodaram enquanto a versão quebrada estava no ar (gravação errada no Supabase, e-mail disparado, cobrança no Stripe). Pra mudanças que mexem em fluxo de pagamento ou dados de usuário, vale mais cuidado na validação local antes de publicar, mesmo sem preview obrigatório.

Repositório: `https://github.com/dasilvaandersonduarte/azimo-site` (privado, branch `main`, Vercel conectado com deploy automático a cada push).

## 5. Tabelas Supabase

| Tabela | Função |
|---|---|
| `mensagens` | Histórico do chat com Vio por usuário |
| `user_state` | STATE completo do app por usuário (hábitos, tracker, finanças etc.), com RLS |
| `subscribers` | Assinantes Stripe (status, plano, período). RLS ativo, RPC `get_user_id_by_email` com SECURITY DEFINER |
| `cancelamento_solicitacoes` | Pedidos de cancelamento |
| `feedbacks` | Feedbacks enviados pelos usuários |

Qualquer alteração de permissão de banco (GRANT, RLS) no Supabase **exige que o Anderson rode manualmente no SQL Editor** — nenhum agente de IA com acesso ao Mac dele consegue executar isso sozinho, por bloqueio de segurança do próprio sistema. Isso já aconteceu (bug real: tabela `subscribers` sem GRANT básico, zero assinantes gravados por meses até ser corrigido em 24/08/2026).

## 6. Armadilhas reais já vividas (não repetir)

Estes são erros de raciocínio que já aconteceram trabalhando no Azimo. Servem para calibrar como investigar antes de agir:

- **Verificação ao vivo sempre vence leitura estática de código.** Ler o `index.html` com busca de texto pode indicar "quebrado" algo que na verdade já funciona (CSS/JS dinâmico não aparece numa leitura estática). Sempre que possível, testar ao vivo no navegador em azimo.life antes de reportar algo como pendente ou quebrado.
- **Variável de ambiente pode sobrepor fallback do código sem avisar.** `Worker/wrangler.toml` tinha `STRIPE_PRICE_ANUAL` apontando para um price ID antigo/arquivado, mesmo com o código já corrigido — porque `env.VAR || 'fallback'` sempre usa a env var quando ela existe. Bug silencioso que só aparece testando uma cobrança de verdade.
- **Link do Stripe "quebrado" pode ser erro de digitação, não de configuração.** Um "I" maiúsculo no lugar do número "1" no meio de uma URL derrubou o checkout mensal inteiro. Antes de mandar mexer no Stripe Dashboard, comparar caractere a caractere a URL do código com a URL real do Payment Link.
- **`STATUS.md` pode estar desatualizado mesmo com trabalho real acontecendo.** O Anderson às vezes roda os `.command` de deploy sem avisar a sessão. Antes de recomendar uma ação baseada em "está pendente de deploy", checar `git log --oneline -10` no repositório para confirmar o estado real.
- **Nunca fechar um item do Backlog Mestre como "perdido/irrecuperável" sem antes dar um grep completo no arquivo pelo tema.** Já aconteceu de um pedido de alinhamento inteiro (10 pontos) estar registrado desde o início, só não ter sido encontrado numa sessão que compactou o histórico da conversa.
- **Alteração de permissão de banco de dados (GRANT, RLS) e ações de conta de terceiros (deletar usuário de outra pessoa, trocar segredo OAuth) nunca são feitas por um agente de IA sozinho** — são sempre passadas para o Anderson executar manualmente, mesmo quando o agente já está logado/autenticado e tecnicamente conseguiria clicar. É uma linha vermelha de segurança, não uma limitação técnica.

## 7. Encerramento de lotes e eficiência

Responsabilidades, fluxo curto, handoffs e eficiência compartilhados estão em AZIMO_OPERACAO_CHATGPT.md. Desenvolvimento executa fisicamente os documentos.

1. Ao encerrar cada lote, manter STATUS e Backlog coerentes:
   - STATUS recebe somente mudanças necessárias na fotografia atual, última entrega, ressalvas e continuidade; não acumula histórico nem exige linha nova no topo. Sem mudança da fotografia, conferir coerência sem alteração artificial.
   - Backlog recebe registro detalhado em novo item numerado: pedido/escopo, decisões, justificativas, alterações, evidências, commits quando aplicáveis, publicação e limites de validação. Preservar registros anteriores; correções e complementos explicitam a relação com eles.
   - Distinguir confirmado localmente, publicação registrada e validação sem fechamento. Antes de retirar histórico do STATUS, confirmar preservação suficiente no Backlog.
   - Backup/Health Check rotineiros sem mudança ficam nos logs; incidentes, decisões e alterações exigem Backlog e atualização do STATUS quando afetarem a fotografia.
2. Cada lote de mudança vira um commit git com mensagem descritiva antes de publicar (seção 4 explica o fluxo de deploy atual, direto, sem aprovação prévia obrigatória). Isso é o que torna a seção 11 (resgate) possível: sem commits organizados, não tem o que restaurar com precisão.

Em escopo documental fora de Git, preservar cópia anterior, diferenças e registro do lote; não declarar commit inexistente nem introduzir documentos no repositório do produto só para publicá-los. Eficiência não dispensa leituras iniciais, segurança, testes necessários, registro, backup ou recuperação.

**Priorização entre itens pendentes (regra confirmada por Anderson, 22/09):** quando houver mais de uma frente aberta e nenhuma ordem explícita do Anderson, o agente ativo decide a sequência sozinho, otimizando melhor resultado x custo de tokens necessário x não desperdício. Na prática: agrupar itens pequenos e já escopados (bugs, UX, copy) num lote só antes de abrir uma frente grande e nova (feature com desenho próprio, mudança de arquitetura); evitar alternar entre duas frentes grandes na mesma janela de trabalho, porque isso multiplica releitura de contexto e retrabalho, sem ganho real de velocidade (o agente não paraleliza de verdade, então "fazer os dois ao mesmo tempo" custa mais token pelo mesmo resultado). Anderson pode sempre sobrepor essa ordem pedindo prioridade específica; na ausência de pedido, essa é a lógica padrão.

## 8. Início e retomada técnica

Ler arquivo geral e direcionador de Desenvolvimento, STATUS inteiro e últimos 5 a 10 itens do Backlog. Reaproveitar leituras válidas da mesma sessão; buscar depois somente tema e evidências pertinentes.

Conferir acesso aos originais e ferramentas necessárias. Antes de declarar perda, quebra, ausência ou pendência, verificar Backlog e estado real. Git de Empresa, arquivos Worker, serviços e logs são evidências distintas.

Executar handoff definido e autorizado sem pedir novamente objetivo/aprovação. Se faltar acesso essencial, explicar bloqueio e ação mínima em linguagem simples. Não presumir permissão nem contornar segurança. Preview é opcional conforme seção 4; salvaguardas de dados, pagamentos, segredos, contas e recuperação permanecem.

## 8bis. Alternância entre agentes (GPT ⇄ Claude) — handoff leve

Fluxo criado no item 87 do Backlog. Nunca há dois agentes trabalhando ao mesmo tempo — Anderson decide qual ambiente está usando; o mecanismo abaixo é a convenção que os dois seguem, não um controle automático de concorrência.

**Onde mora o handoff:** seção 0 de `STATUS.md` ("Handoff ativo"). Não existe arquivo HANDOFF separado — evita duplicar e dessincronizar informação com o restante do STATUS. Essa seção guarda só o necessário para o próximo agente continuar: quem está ativo, e as alterações/decisões/pendências/alertas desde o último handoff. Não é histórico — o histórico completo continua no Backlog.

**Os 3 comandos:**
- `ASSUMIR CLAUDE` (dito ao Claude): ler a seção 0 do STATUS; se "Agente ativo" já for CLAUDE, só prosseguir. Se for GPT, isso indica handoff sem passagem formal — sinalizar isso a Anderson antes de assumir. Antes de começar a tarefa, sincronizar o repositório (`git fetch`/`git pull` em `Empresa/`) para trazer qualquer alteração que o GPT possa ter enviado diretamente ao remoto. Atualizar "Agente ativo" para CLAUDE.
- `ASSUMIR GPT` (dito ao GPT, no projeto/ambiente do GPT): ler a seção 0 do STATUS. Se o GPT estiver rodando como ChatGPT Work com acesso concedido à pasta do projeto no Mac (mesmo mecanismo já usado no item 78 do Backlog), lê direto do disco, como o Claude faz. Se for o projeto "Central de Comando" (item 82 — só análise/voz, sem acesso a arquivo), depende da cópia mais recente que Anderson enviou às Fontes desse projeto (ver nota abaixo). Atualizar "Agente ativo" para GPT.
- `HANDOFF` (dito ao agente ativo, ao encerrar): o agente ativo atualiza a seção 0 do STATUS com o bloco compacto (data; de → para; alterações relevantes; arquivos afetados; decisões importantes; pendências; alertas) e para por ali — não inicia nova tarefa.

**Enquanto o mesmo agente segue ativo em tarefas sucessivas, não é necessário reler o projeto inteiro a cada uma** (STATUS completo, Índice, Backlog) — isso vale para o início de uma sessão nova ou para quando o handoff (seção 0) sinalizar algo que exija mais contexto. Ao trocar de agente, ler primeiro a seção 0 do STATUS e, depois, somente os arquivos necessários para a tarefa pendente — não o STATUS inteiro nem o Backlog completo, a menos que a tarefa em si exija histórico.

**Nota sobre sincronização — dois GPTs diferentes, não confundir:** (1) **ChatGPT Work**, com acesso concedido à pasta do projeto no Mac (o mesmo tipo de ponte que o Claude usa aqui): lê e escreve os arquivos ao vivo, sem depender de Anderson colar nada — é o ambiente que pode de fato implementar código, como no item 78. (2) **Projeto "Central de Comando"** no ChatGPT (item 82): sem acesso a arquivo por desenho — só analisa/conversa e devolve um "PEDIDO PARA O CLAUDE"; depende das Fontes que Anderson mantém atualizadas manualmente. Se o handoff for para o ChatGPT Work, o `ASSUMIR GPT` não exige passo manual de Anderson além de conceder a pasta uma vez. Se for para a Central de Comando, Anderson precisa reenviar `STATUS.md` às Fontes antes. Em qualquer um dos sentidos (Claude→GPT ou GPT→Claude), o passo de `git fetch`/`git pull` do lado do Claude cobre o que foi alterado via Git; alterações documentais fora do Git (ex.: Estratégia, que não tem `.git`) feitas pelo ChatGPT Work aparecem direto no disco, sem sincronização adicional, já que os dois leem/escrevem a mesma pasta física.

**Retomada quando não houve HANDOFF limpo (créditos/tokens acabaram no meio de uma tarefa):** isso vai acontecer — não depende de disciplina, só de acabar o limite antes de dar tempo de rodar HANDOFF. Regra: **todo ASSUMIR reconfere o estado real antes de continuar, nunca confia só na memória da própria conversa** — vale tanto para o mesmo agente retomando depois quanto para o outro assumindo no meio. Nesse ASSUMIR "não limpo": ler a seção 0 do STATUS; rodar `git log --oneline -10` em `Empresa/` (e, se o GPT tiver acesso de pasta, também olhar `Estratégia/BACKLOG_MESTRE_AZIMO.md`, últimos itens) e comparar com o que a própria memória acha que foi o último passo. Se o estado real (commits, seção 0, último item do Backlog) já foi além do que a memória indica — ou seja, o outro agente já deu sequência nesse meio-tempo — seguir a partir do estado real, tratando a tarefa como já concluída/avançada até ali, sem refazer nem duplicar o que já foi feito. Isso vale nos dois sentidos (Claude retomando depois do GPT, ou vice-versa) e também quando o mesmo agente que sumiu é quem volta primeiro — não presumir que ninguém mexeu em nada só porque "sumiu por pouco tempo".

**Backup e Health Check continuam rodando sozinhos, sem depender de qual agente está ativo:** é uma scheduled task própria da conta Claude (seção 10), dispara sozinha todo dia às 08h locais numa sessão independente, nunca dentro da conversa de handoff. Não precisa de nenhuma ação do GPT nem existe algo equivalente a "criar" do lado do GPT — já está configurado e roda igual, esteja o Claude ou o GPT como agente ativo do dia a dia.

**Especificação de implementação (quando o GPT propõe algo visual para o Claude implementar):** entregar, junto da proposta visual, um bloco compacto nestes campos — estrutura/layout; componentes (novos vs. reaproveitados do design system); hierarquia visual; espaçamentos relevantes; responsividade (mobile/desktop); estados e interações (hover, clique, loading, erro, vazio); elementos do design system a reutilizar (cores, tipografia, componentes já existentes no `index.html`). Isso é a intenção visual, não uma ordem de implementação literal: se conflitar com o design system ou a arquitetura existente da Azimo, o Claude preserva o padrão vigente e adapta a proposta sem descaracterizar sua intenção, sinalizando o ajuste a Anderson.

## 9. Regras de produto e de comunicação (aplicam a qualquer agente, ChatGPT incluído)

- Vio nunca se refere a si mesmo como IA — fala sempre como mentor humano.
- Nunca usar travessão (—) em nenhum texto voltado ao usuário final (UI, copy, e-mails, system prompt do Vio).
- Ícones sempre em SVG, nunca emoji, em qualquer parte da interface.
- Entrega é sempre completa, nunca pela metade.
- Botões e labels de interface em Title Case (ex.: "Zerar Meus Dados de Teste"), replicando o padrão que o Anderson usa ao escrever.
- Toda ideia nova ou melhoria identificada durante o trabalho vai para `BACKLOG_MESTRE_AZIMO.md` como item novo status "RECEBIDO", antes de começar a trabalhar nela — nunca só numa lista de tarefas que some entre sessões.
- Mudança pequena e de baixo risco (bug pontual, ajuste visual, extensão de algo que já existe): construir e entregar na hora, no mesmo lote, sem perguntar "posso fazer depois?". Mudança grande/estrutural ou que depende de decisão de produto: nomear como próxima fase, registrar no Backlog Mestre, e ser direto sobre por que não entrou no lote atual.
- Ao final de qualquer entrega com pendência ou algo para o Anderson conferir, terminar com uma lista numerada (1, 2, 3...) do que ele precisa fazer, sempre como último elemento da mensagem, sem nada depois.

## 10. Backup local e Health Check

Responsável: automação própria, independente de qual agente (Claude ou GPT) está ativo no momento — ver correção abaixo. Google Drive não é dependência nem backup automático vigente. Anderson fará cópia externa/manual da pasta completa em alguns dias da semana; só registrar como realizada quando confirmada.

`backup.command` chama `/usr/bin/python3 Operacao/azimo_rotinas.py backup`. A opção `rotina` combina backup/Health Check; `verificar CAMINHO` confere manifesto SHA-256. **Correção de 20/09/2026 (item 87 do Backlog):** o texto anterior descrevia isso como "agendamento independente Codex" — checado ao vivo em 20/09 e não é isso. É uma scheduled task da própria conta Claude (`Azimo | Backup e Health Check`, trigger `trig_01CjddYNqDgGrWrfNafHWwh8`), cron diário `0 11 * * *` UTC (= 08h em horário local do Anderson), que dispara sozinha numa sessão nova a cada execução — não depende de nenhuma conversa aberta, nem do Claude Cowork nem do GPT estarem "ativos" no handoff da seção 8bis. Continua rodando igual estando o GPT como agente ativo do dia a dia. Requer só o Mac ligado e o app Claude desktop com a ponte deste dispositivo disponível no horário. Não prometer execução com Mac desligado ou aplicativo fechado. Última execução confirmada com sucesso em 20/09.

Backup inclui arquivos locais e histórico Git; exclui _Backups e caches/dependências regeneráveis. Não exporta banco Supabase, Stripe ou segredos remotos. Cada cópia recebe manifesto e verificação; falha ou mudança durante a cópia nunca vira sucesso. Logs cumulativos em _Backups/backup.log. Política autorizada: duas cópias completas verificadas (anterior de segurança e vigente); não excluir a anterior se a nova falhar. Conteúdo histórico exclusivo exige preservação antes da limpeza. Cópias excedentes, inclusive legadas, só têm seus diretórios retirados após preservação integral no arquivo historico_preservado.zip, com hashes conferidos. O ZIP mantém objetos por hash e mapas snapshots/NOME.json para reconstruir caminhos; não é uma cópia operacional corrente e nunca entra na limpeza automática.

Health Check faz somente GET no site e no /config público do Worker, exige HTTP 200 e formato esperado; repete uma vez em falha, com timeout. Log em Operacao/healthcheck.jsonl. Não chama modelo, cobrança, webhook, cancelamento ou e-mail. Não comprova login, banco ou funcionamento integral; distinguir falha de rede local de indisponibilidade confirmada.

O LaunchAgent antigo life.azimo.backup apontava para script inexistente (erro 78); foi desativado, preservando configuração. Anderson cancelará diretamente os dois agendamentos antigos no Claude; a rotina nova não depende deles. Consultar item 78 para transição e limites.

## 11. Recuperação sob Desenvolvimento

1. Em incidente de produção, avaliar Instant Rollback da Vercel (seção 4). Reverte código publicado, não dados, cobranças ou e-mails; respeitar permissões e limites.
2. Ler STATUS e Backlog pertinente, conferir Git de Empresa, arquivos Worker, publicações e logs para estabelecer o último estado bom. Worker não tem Git local; usar cópias/evidências sem inventar commits.
3. Preservar estado atual antes de restaurar; escolher cópia, conferir manifesto e inspecionar em diretório separado. Comparar diferenças e identificar trabalho posterior que seria perdido. Não executar scripts só por constarem da cópia.
4. Restauração com sobrescrita de dados/trabalho ou risco de perda exige explicar impacto e obter confirmação. Nunca reverter às cegas ou interpretar autorização de backup como autorização genérica de exclusão.
5. Banco, pagamentos, permissões, segredos e contas de terceiros seguem as seções 5–6, com ações manuais de Anderson quando exigidas. Backup local não substitui recuperação dos provedores.
6. Validar o restaurado, registrar causa/versão/resultado/limites no Backlog e atualizar STATUS. Reconstruir lacunas por evidências reais, sem depender de memória do Claude ou de chats antigos.

