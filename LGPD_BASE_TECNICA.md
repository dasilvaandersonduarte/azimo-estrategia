---
name: lgpd_base_tecnica
description: Base técnica (não jurídica) para o advogado redigir os Termos de Uso e a Política de Privacidade do Azimo -- o que o sistema de fato coleta, guarda, processa e compartilha, levantado por auditoria direta do código e do banco em 01/10/2026.
sources: [claude]
---

# Base técnica para Termos de Uso e Política de Privacidade do Azimo

**Isto NÃO é um parecer jurídico nem um rascunho de texto legal.** É um levantamento técnico, feito por auditoria direta do código-fonte e do banco de dados (Supabase) do Azimo em 01/10/2026, para o advogado usar como insumo na redação formal dos dois documentos exigidos: Termos de Uso e Política de Privacidade (LGPD).

## 1. Identificação

Controlador dos dados: Azimo Sistemas de Evolução Pessoal Ltda (razão social usada no rodapé do site). CNPJ e endereço: a preencher pelo Anderson -- não constam no código.

## 2. Categorias de dado pessoal coletadas, e onde ficam

| Categoria | Exemplos | Tabela/campo | Observação |
|---|---|---|---|
| Identificação | nome completo, email | `user_state.state->nomeCompleto`, `auth.users.email` | Email gerenciado pelo Supabase Auth |
| Foto | foto de perfil (upload do usuário) | `user_state.state->fotoPerfil` (base64) | Fica dentro do próprio registro de estado |
| Financeiro | transações, contas, metas, orçamento (Finanças Pessoal e Empresarial) | `user_state.state->financasV2` / `financasEmpresa` | Dado sensível sob a ótica de risco, mesmo não estando na lista de "dado sensível" da LGPD (art. 5º, II) |
| Rotina e hábitos | intenção/reflexão diária, tracker de hábitos, tarefas | `user_state.state` (vários campos) | |
| Saúde mental/emocional, indiretamente | conversas com o mentor de IA (Vio), registros de emoção | `user_state.state->chatHistory/chatSessions`, `mensagens`, `state->emocoes` | Pode conter relato espontâneo de saúde mental dentro das conversas -- recomendo o advogado avaliar se isso eleva a classificação para dado sensível (art. 11) |
| Estudos e produtividade | registros de estudo, diário de produtividade, pomodoro | `user_state.state` | |
| Agenda | 4 agendas do Google Agenda sincronizadas (URL pública do feed iCal) | `user_state.state->gcalCalendarios` | Não há credencial OAuth armazenada, só a URL do feed que o próprio usuário cola |
| Pagamento/assinatura | email, id de cliente Stripe, id de assinatura, status (ativo/trial/cancelado) | `subscribers` | O número do cartão em si nunca passa pelo Azimo -- fica só no Stripe |
| Convite/indicação | código de convite, quem convidou, quem resgatou | `azimo_beta_invites`, `azimo_beta_access` | |
| Notificação push | token/endpoint do navegador para push | `push_subscriptions`, `push_enviados` | |
| Feedback enviado pelo usuário | texto do feedback, email de quem enviou | `feedbacks` | |
| Cancelamento | solicitação de cancelamento de assinatura | `cancelamento_solicitacoes` | |

## 3. Para que cada dado é usado

- Prestar o serviço contratado (o próprio produto: acompanhamento de rotina, estudo, finanças, mentoria do Vio).
- Processar pagamento e manter a assinatura ativa (via Stripe).
- Enviar notificação por email de eventos da conta (via Resend) e notificação push (navegador).
- Gerar as respostas do mentor Vio: para isso, o conteúdo relevante da conta da pessoa (perfil, hábitos, objetivos, estudos, intenção/reflexão do dia, mensagens anteriores) é enviado para a Anthropic (fornecedora do modelo de IA que gera as respostas do Vio) a cada interação, via um proxy no Cloudflare Worker.
- Suporte e melhoria do produto, quando a pessoa envia feedback.

## 4. Com quem o dado é compartilhado (terceiros / operadores)

Esta lista já existe informalmente dentro do próprio Azimo Command (aba Produto & Vio), reaproveitada aqui:

- **Vercel**: hospeda o site e a landing page.
- **Cloudflare (Worker)**: processa as chamadas de API do Vio, pagamentos (webhook do Stripe) e disparo de email.
- **Supabase**: autenticação, banco de dados (todas as tabelas acima), armazenamento do estado da conta.
- **Anthropic**: recebe o conteúdo necessário pra gerar as respostas do Vio (ver seção 3) a cada mensagem/análise -- é o compartilhamento mais sensível e precisa estar explícito na política.
- **Stripe**: processamento de pagamento e dados de assinatura. Número de cartão nunca passa pelo Azimo.
- **Resend**: envio de email transacional (confirmação de assinatura, etc).
- **Hostinger**: domínio e DNS, sem acesso a dado de usuário.

Nenhum desses dados é vendido ou compartilhado para fins de publicidade. Não há rastreamento de terceiros (nenhuma tag de analytics ou pixel de anúncio foi encontrada no código).

## 5. Base legal sugerida (a confirmar com o advogado)

- Dado necessário pra prestar o serviço (nome, email, conteúdo da conta): execução de contrato (art. 7º, V).
- Dado de pagamento: execução de contrato + cumprimento de obrigação legal/regulatória (fiscal).
- Conteúdo enviado ao Vio que possa revelar estado emocional/saúde mental: se o advogado classificar como dado sensível, a base legal muda para consentimento específico (art. 11), e aí o Azimo precisaria de uma tela de consentimento explícita antes da primeira conversa com o Vio -- hoje não existe.

## 6. Retenção

Hoje não existe política de retenção automática -- o dado fica guardado indefinidamente até a pessoa pedir exclusão pelo botão "Excluir minha conta" (Perfil), publicado em 01/10/2026. Precisa de decisão do Anderson + validação do advogado sobre prazo de retenção pós-cancelamento de assinatura (por exemplo: manter dado fiscal por X anos mesmo após a pessoa cancelar, conforme obrigação legal, mas excluir o resto).

## 7. Direitos do titular, e como são exercidos hoje

- **Acesso e correção**: a pessoa edita nome e foto diretamente no Perfil. Não existe ainda uma forma de a pessoa baixar uma cópia completa dos próprios dados (portabilidade) -- hoje só o Anderson, manualmente, conseguiria extrair isso do Supabase se pedido.
- **Exclusão (direito ao esquecimento)**: implementado em 01/10/2026 -- botão "Excluir minha conta" dentro de Perfil, com confirmação explícita, que apaga os dados em todas as tabelas listadas na seção 2 e a conta de login. Executa via Edge Function publicada no Supabase (`delete-account`), que só age sobre a própria conta de quem está pedindo (confirmado pelo próprio login da sessão, nunca por um id enviado de fora).
- **Canal de contato pro titular exercer os direitos dele / tirar dúvida sobre dado pessoal**: ainda não existe um email ou canal formal declarado. Precisa ser definido.

## 8. Segurança (resumo do que já existe hoje, auditado em 01/10/2026)

- Controle de acesso por linha (RLS) ativo nas 11 tabelas do banco, isolando o dado de cada usuário; auditado item por item nesta mesma data, sem vazamento encontrado entre contas.
- Acesso administrativo (ler assinantes, ler feedback) restrito ao email do Anderson, verificado dentro do próprio banco.
- Corrigida nesta data uma falha que permitia descobrir se um email tinha conta no Azimo (função `get_user_id_by_email` com acesso público indevido).
- Chave de serviço (acesso irrestrito ao banco) nunca é exposta ao navegador -- só existe no lado do servidor (Edge Functions).

## 9. Cookies

O Azimo não usa cookie de rastreamento. Usa `localStorage` do navegador (guarda uma cópia local do estado da conta) e o mecanismo de sessão do Supabase Auth -- tecnicamente, nenhum dos dois é "cookie" para fins de exigência de banner de consentimento sob a LGPD. Recomendo o advogado confirmar se isso dispensa mesmo o banner, ou se basta uma frase informativa na política.

## 10. Pontos em aberto que precisam de decisão (Anderson) + validação (advogado)

1. CNPJ, endereço e contato formal do controlador.
2. Classificação do conteúdo das conversas com o Vio como dado sensível (saúde mental) -- muda a base legal e pode exigir tela de consentimento específica.
3. Prazo de retenção pós-cancelamento.
4. Canal oficial de contato para exercício de direitos (email de privacidade/DPO).
5. Idade mínima para uso do Azimo -- não há nenhuma restrição ou verificação de idade no cadastro hoje.
6. Portabilidade de dados (exportar os próprios dados) -- ainda não existe, só a exclusão.
