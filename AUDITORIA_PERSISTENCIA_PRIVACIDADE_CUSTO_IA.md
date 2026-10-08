# Auditoria de Persistência, Privacidade, Acesso Administrativo e Custo de IA

**Data:** 02/10/2026 (atualizado no mesmo dia, após teste ao vivo)
**Pedido:** item 115 do Backlog Mestre (Frente 3)
**Método:** leitura do código real (`index.html`, `Worker/src/index.js`, `wrangler.toml`), o que já havia sido auditado e confirmado ao vivo no painel do Supabase nos itens 107 e 108 (01/10/2026), mais um teste ao vivo completo executado nesta sessão na sua conta real, via Chrome autenticado (ver seção J).

---

## A. Armazenamento — onde cada categoria de dado fica

| Categoria | Onde fica |
|---|---|
| Perfil/Personalização, Rotina, hábitos, objetivos, tarefas, Estudos, Revisões, Finanças completas (controles, responsáveis, receitas, despesas, recorrências, metas, contas), Diário de Produtividade, Foco Pomodoro, flags de onboarding, foto de perfil (base64), link de agenda (iCal) | Um único objeto `STATE`, salvo como JSON na coluna `state` (jsonb) da tabela `user_state` no Postgres do Supabase — uma linha por usuário, chave `user_id` |
| Histórico de conversas com o Vio (inclui qualquer insight gerado na conversa) | Tabela `mensagens` |
| Assinatura/Stripe | Tabela `subscribers` |
| Pedidos de cancelamento | Tabela `cancelamento_solicitacoes` |
| Feedbacks | Tabela `feedbacks` |
| Beta/convites | `azimo_beta_access`, `azimo_beta_invites`, `invite_codes` |
| Push notifications | `push_subscriptions`, `push_enviados` |
| Segredos de produção (chave `service_role` do Supabase, chave da Anthropic, chaves secretas do Stripe, Resend) | Variáveis **secretas** do Cloudflare Worker (`wrangler secret`) — nunca no repositório, nunca no HTML enviado ao navegador |
| Chave pública/anônima do Supabase, chave pública do Stripe | Embutidas no HTML — correto e esperado, são públicas por design |
| Cache local do navegador (`localStorage`, chave `evolucao_anderson`) | Cópia de conveniência do mesmo STATE — **não é fonte de verdade**, ver seção B |

Agenda/integrações: o Azimo usa o link de assinatura iCal (.ics) que o Google fornece, não um login OAuth com token revogável. Esse link fica salvo dentro do próprio STATE (logo, dentro de `user_state`, com a mesma proteção de RLS). Ao buscar os eventos, o link vai pro Cloudflare Worker via corpo de um POST (nunca na URL), que é quem efetivamente consulta a agenda — o link não fica salvo em nenhum outro lugar além do STATE do usuário.

## B. Persistência

Fonte de verdade real = tabela `user_state` no Postgres, **não o navegador**. Fluxo real (confirmado por leitura de `saveState`/`_pushStateSB`/`syncStateOnLogin`, e agora também por teste ao vivo, ver seção J):

1. Qualquer mudança grava no `localStorage` na hora.
2. Espera 800ms sem nova mudança (debounce) e então sincroniza com o Supabase (`upsert` na `user_state`).
3. Ao logar, o app compara o timestamp da última escrita local com o `updated_at` do servidor e usa o mais novo como fonte — já existe inclusive um log de depuração específico pra esse cenário (`syncStateOnLogin: local venceu` / `Supabase venceu`), sinal de que o bug antigo do Dashboard (objetivos sumindo/reaparecendo) já tinha motivado esse cuidado.
4. Existe uma trava extra: o app nunca sobrescreve o Supabase com um estado "vazio" se o servidor já tinha dado real — protege contra apagar por engano com um STATE desatualizado.

Isso cobre: refresh, fechar/abrir navegador, trocar de aparelho, logout/login, virada de dia/mês/ano, deploy do site (deploy só troca o HTML/JS, nunca toca na tabela).

**Janela de risco real, pra ser honesto e não prometer "nunca falha":** se o navegador fechar ou travar dentro dos 800ms entre uma edição e o envio pro Supabase, essa edição específica pode não ter chegado ainda ao servidor. Ela sobrevive no `localStorage` do mesmo navegador/aparelho (reabrindo ali, o dado local mais novo vence e é reenviado) — mas se, nesse intervalo de menos de 1 segundo, a pessoa logar num aparelho diferente antes do reenvio, veria a versão anterior por alguns segundos. É uma fresta de milissegundos, não um buraco estrutural, mas é a resposta tecnicamente correta.

`localStorage` como única fonte: **não é o caso** — ele é só o atalho de velocidade; o Supabase prevalece no login.

**Confirmado ao vivo nesta sessão** (não só por leitura de código): criei um objetivo de teste na sua conta real, aguardei o debounce, fiz hard reload — o dado persistiu corretamente no Supabase e venceu a sincronização, exatamente como o código previa. Detalhe da descoberta associada a esse teste na seção J e no item 116 do Backlog.

## C. Privacidade entre usuários

RLS (Row Level Security) está ativo nas 11 tabelas do schema public. Auditoria 100% já feita em 01/10 (item 108 do Backlog): as 14 policies foram lidas uma a uma (`qual` + `with_check`), todas corretas — cada uma restringe por `auth.uid() = user_id` (dado do próprio usuário) ou pelo seu e-mail fixo (operação administrativa). Nenhum vazamento entre usuários encontrado.

Falha real encontrada e **corrigida** nessa auditoria: a função `get_user_id_by_email` tinha `EXECUTE` liberado pra qualquer pessoa (`PUBLIC`), permitindo descobrir se um e-mail tinha conta no Azimo. Revogado e confirmado fechado.

Nenhuma chave `service_role` vaza no HTML enviado ao navegador — só a chave pública (`anon`), que é esperada e não dá acesso privilegiado.

Isso cobre o acesso usuário-contra-usuário pela API normal do app. É um estado auditado em 01/10 (1 dia atrás), não uma garantia permanente — toda tabela nova precisa entrar na mesma rotina (existe até um gatilho `rls_auto_enable` que liga RLS automaticamente em tabela nova, uma rede de segurança a mais).

## D. Acesso administrativo — a parte que precisa ficar honesta

RLS protege usuário-contra-usuário pela API pública (chave `anon`/`authenticated`) — é o que impede um usuário de ver dado de outro.

**RLS não protege contra quem tem a chave `service_role` ou login de dono do projeto Supabase.** Essa chave e esse login enxergam todas as linhas de todas as tabelas, de qualquer usuário, sem filtro nenhum — por desenho, em qualquer BaaS (Supabase, Firebase etc), não é uma falha do Azimo.

Hoje, quem tem esse nível de acesso:
- Você, com o login de dono do projeto Supabase.
- Qualquer pessoa que tiver a `service_role key` — hoje ela só existe como variável secreta do Cloudflare Worker, não está em nenhum arquivo do repositório.

Não existe painel administrativo dentro do próprio Azimo (nenhuma tela no app que liste "ver dados do usuário X"). O único caminho pra ver dado de outro usuário hoje é entrar direto no painel do Supabase ou escrever uma chamada usando a `service_role key`.

**Privado entre usuários não significa inacessível à infraestrutura** — exatamente como você apontou no pedido. É a natureza de qualquer produto rodando sobre um banco gerenciado.

Logs de acesso: o Supabase mantém logs de API/banco no próprio painel (Logs > Postgres/API). Não auditei retenção nem se está ativo no plano atual — **PENDENTE**.

## E. Backup

Backup do **código** (`index.html`, Worker, documentos da Estratégia): já documentado e funcionando, dois mecanismos paralelos (LaunchAgent local + scheduled task na nuvem, upload pro Google Drive). Isso é backup de arquivo, **não do banco de dados**.

Backup do **banco de dados** (as linhas reais de `user_state`, `mensagens` etc — os dados dos usuários): depende do **plano do Supabase**, não do código do Azimo.

**CONFIRMADO AO VIVO nesta sessão**, direto na tela de Settings > Backups do seu projeto Supabase: o projeto está no **Free Plan**, e a própria página do Supabase declara: *"Free Plan does not include project backups. Upgrade to the Pro Plan for up to 7 days of scheduled backups."*

Ou seja, hoje, **não existe nenhum backup automático do banco de dados** — nem diário, nem point-in-time recovery. Se uma linha for apagada por engano (um bug, um comando errado, uma falha humana), não tem como recuperar pelo Supabase. Isso é diferente de "os dados estão persistidos" (seção B, confirmado) — persistência resolve sumir-ao-dar-refresh, não resolve exclusão ou corrupção em massa.

**Esta era a lacuna mais importante deste relatório — agora está resolvida, no sentido de que você sabe exatamente onde está.** A decisão de contratar o Plano Pro (backups diários + retenção de 7 dias) é sua: antes de colocar dado financeiro real de verdade (Finanças, Frente 1 de importação), recomendo fortemente considerar o upgrade, mas isso tem custo recorrente, então não decidi isso por você.

## F. Integrações — onde ficam tokens/configurações

- **Google Agenda:** link de assinatura iCal (não é OAuth, sem token revogável pelo Google) — dentro do STATE do usuário, mesma RLS do resto. Risco a observar: esse link funciona como uma "senha de leitura" da agenda da pessoa — se vazasse, dava pra ver a agenda sem precisar da senha do Google dela. Hoje não tem proteção adicional além da RLS padrão (sem criptografia à parte).
- **Stripe:** chave pública no código (correto), chave secreta e webhook secret só no Worker (variável secreta).
- **Anthropic (Vio):** chave de API só no Worker — o navegador do usuário nunca vê essa chave, toda chamada ao Claude passa pelo Worker.
- **Resend (e-mails):** mesma lógica, chave só no Worker.

## G. Uploads financeiros — arquitetura (o pipeline em si ainda não foi construído)

Hoje **não existe nenhum mecanismo de upload de arquivo real no Azimo**, nem Supabase Storage em uso. O único "upload" que existe é a foto de perfil, e ela é convertida para base64 e salva **dentro do próprio STATE** (jsonb) — sem bucket de Storage separado. Ou seja: não existe precedente de Storage+RLS pra reaproveitar.

Recomendação técnica para fatura/PDF/foto: **não repetir** o padrão da foto de perfil (base64 dentro do jsonb). Um PDF de fatura ou uma foto em boa resolução é ordens de grandeza maior que uma foto de perfil pequena — incharia a tabela principal e deixaria toda sincronização de STATE mais lenta (o STATE inteiro é reenviado a cada `saveState`). O caminho correto é um **bucket separado no Supabase Storage**, com RLS de Storage restringindo cada usuário à própria pasta (`user_id/arquivo`), seguindo exatamente o fluxo que você pediu no ponto 21: upload → processamento → confirmação → cria os lançamentos → **apaga o arquivo original do Storage** (não precisa ficar guardado depois de confirmado). Isso é infraestrutura nova (bucket, policy, fluxo de upload/exclusão) — ainda não construída.

## H. Custo de IA — estimativa (ênfase: ESTIMATIVA, não fato)

**Importante primeiro esclarecer o que esta seção mede**, porque é uma dúvida razoável: isso é o custo da IA que o produto Azimo usaria em produção (a chamada que o Worker faz pra Anthropic quando o Vio conversa, ou quando a futura importação de fatura ler um PDF), cobrado na conta Anthropic Console do próprio Azimo. **Não tem relação com o custo desta sessão aqui comigo** (Claude/Cowork) — são contas e assinaturas completamente separadas, uma é o produto que seus usuários usam, a outra é a ferramenta que eu uso pra te ajudar a construir o produto.

Baseado no provedor que o Azimo já usa para o Vio — Claude/Anthropic, via o mesmo Worker — preços oficiais vigentes em 02/10/2026:

| Modelo | Entrada | Saída |
|---|---|---|
| Claude Sonnet 5.5 | US$ 2 / milhão de tokens | US$ 10 / milhão |
| Claude Haiku 4.5 | US$ 1 / milhão de tokens | US$ 5 / milhão |

Imagem conta como token de entrada normal, pela fórmula oficial da Anthropic: tokens ≈ (largura px × altura px) / 750.

**Premissas assumidas** (preciso deixar explícito — isso ainda não foi testado com documentos reais, é cálculo, não medição):

| Cenário | Caminho técnico | Entrada (tokens) | Saída (tokens) | Modelo | Custo estimado/documento |
|---|---|---|---|---|---|
| PDF digital com texto extraível (caso principal pedido) | Extrai texto convencional → Haiku estrutura | ~3.000 | ~900 | Haiku 4.5 | ~US$ 0,0075 |
| Print/screenshot de tabela | Imagem (visão) + Sonnet | ~2.800 | ~800 | Sonnet 5.5 | ~US$ 0,0135 |
| Foto de anotação manuscrita (experimental) | Imagem (visão) + margem p/ reprocessar | ~3.600 (c/ margem) | ~1.300 (c/ margem) | Sonnet 5.5 | ~US$ 0,020 |
| PDF sem texto extraível (precisa de visão, 2-3 páginas) | Imagem por página + Sonnet | ~6.450 | ~1.500 | Sonnet 5.5 | ~US$ 0,028 |

Simulação mensal, com um mix assumido de 60% PDF digital / 25% print / 10% PDF visual / 5% manuscrito (custo médio ponderado ≈ US$ 0,0117 por importação):

| Volume/mês | Custo estimado (USD) | Aproximado em BRL* |
|---|---|---|
| 100 importações | ~US$ 1,17 | ~R$ 6-7 |
| 1.000 importações | ~US$ 11,68 | ~R$ 65 |
| 10.000 importações | ~US$ 116,80 | ~R$ 650 |

#ámbio aproximado, só referência.

Não incluído nessa estimativa (tende a ser marginal, mas fica registrado): custo de Cloudflare Workers (plano pago gira em torno de US$ 5/mês de base, cobre volume bem acima disso) e de Supabase Storage (armazenamento + egress, centavos de dólar por GB nessa escala).

**Conclusão honesta:** o custo de IA em si tende a ser baixo mesmo em volume alto — a parte cara dessa frente não é o provedor de IA, é o trabalho de engenharia (parsing de PDF, tela de revisão editável, deduplicação, fluxo de upload/Storage seguro), que não tem preço de API, é tempo de construção.

## I. Riscos e lacunas (resumo pra decisão)

1. **Confirmado: plano Free do Supabase, sem backup diário real do banco.** Decisão pendente é sua: vale o upgrade pro Pro Plan antes de colocar dado financeiro real? (seção E).
2. Acesso administrativo existe tecnicamente (dono do Supabase + quem tiver a `service_role key`) — hoje só você. Sem ação necessária, a menos que queira formalizar isso em política escrita.
3. Logs de acesso do Supabase (retenção, se está ativo) — não auditado (seção D).
4. Link de agenda (iCal) não tem proteção além da RLS padrão — considerar mascarar parcialmente na interface no futuro.
5. Não existe mecanismo de Storage de arquivo no Azimo hoje — a importação de fatura exige construir isso do zero (seção G).
6. **Bug real encontrado e corrigido durante o teste ao vivo** (não era o que estava sendo procurado, apareceu no caminho): a aba Semanal do card Objetivos em Rotina Diária ficava sempre vazia, por um id de HTML errado no container (não relacionado a persistência/sincronização — ver seção J e item 116 do Backlog). Já corrigido e commitado; falta publicar.

## J. O que foi efetivamente testado, e o que não foi

**Feito:**
- Leitura completa do código real de salvamento/sincronização (`saveState`, `_pushStateSB`, `syncStateOnLogin`, `_applyDefaults`), confirmando o mecanismo descrito nas seções A e B.
- (Sessão anterior, 01/10, itens 107/108) leitura de todas as 14 policies de RLS uma a uma no painel do Supabase, confirmando proteção por usuário; teste real de reset de conta (escrita real na tabela, confirmada depois via SQL Editor).
- Leitura do `wrangler.toml` e do Worker, confirmando que nenhuma chave secreta está em texto plano no repositório.
- **Teste ao vivo completo, executado nesta sessão, na sua conta real, via seu Chrome autenticado:** criei um objetivo de teste ("TESTE PERSISTENCIA 02/10 - pode apagar"), aguardei o debounce de 800ms, fiz hard reload da página (não navegação interna). Confirmei por log de console (`syncStateOnLogin: Supabase venceu | objetivos: 1`) e por inspeção direta do STATE em memória que o dado persistiu corretamente no Supabase e sobreviveu ao reload. **No caminho, descobri que esse mesmo objetivo não aparecia visualmente na aba Semanal do card Objetivos** — investiguei, encontrei a causa raiz (id de HTML desatualizado, não um problema de dado), corrigi, commitei (`203d303`) e documentei no item 116 do Backlog. Depois, apaguei o objetivo de teste da sua conta real e confirmei por um segundo reload que a exclusão também persistiu (0 objetivos).
- Confirmado ao vivo, direto na tela do Supabase: o projeto está no Free Plan, sem backups automáticos (seção E).

**Não feito nesta sessão** (fora do escopo do teste rápido, não porque esquecido): logout/login completo (troca de sessão de autenticação), edição de um registro já existente, teste de isolamento criando uma segunda conta de teste. O que foi testado já responde ao ponto central do seu pedido (dado sobrevive a refresh de verdade, contra o histórico do bug do Dashboard) — os demais cenários são exercícios do mesmo mecanismo já confirmado (debounce → Supabase → timestamp na reconciliação), não uma lógica diferente, mas posso rodá-los se você quiser mais confiança antes de usar com Finanças reais.
