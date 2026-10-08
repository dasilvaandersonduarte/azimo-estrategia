# Azimo — Contexto Geral do Projeto

> **Onde colocar:** nos Arquivos do Projeto "Azimo" no ChatGPT (junto com o manual de marca, `AZIMO_BRANDING_CHATGPT.md`). Assim que estiver lá, fica disponível automaticamente pra qualquer chat dentro do projeto, incluindo o novo chat de estratégia/ideias que você for abrir. Este documento dá contexto completo e atualizado sobre o Azimo, para que o ChatGPT possa pensar junto com o Anderson sobre ideias, ferramentas, features e direção estratégica do produto. Não é um manual técnico de desenvolvimento (isso já existe em outro lugar, sendo tocado por outra IA). Aqui o papel é de sócio de raciocínio: brainstorm, avaliação crítica de ideias, benchmark de mercado, direção de produto.

Atualizado em: 02/09/2026.

---

## 1. O que é o Azimo

Azimo é uma plataforma web de evolução pessoal com um mentor de IA chamado **Vio**, feita para **empreendedores solo brasileiros**.

Não é um app de hábitos. Não é um planner. Não é um coach genérico de IA. É um sistema que trata a vida como um organismo integrado, estruturado em **5 pilares**:

- **Físico** (energia, sono, treino, saúde)
- **Intelectual** (aprendizado, clareza de raciocínio)
- **Emocional** (autorregulação, consciência, padrões)
- **Espiritual** (presença, propósito, sentido)
- **Empresarial** (negócio, execução, dinheiro)

A tese central: quando um pilar vai mal, os outros sentem o impacto. Ninguém consegue performar no empresarial se o físico e o emocional estão quebrados, e vice-versa. O produto existe para dar clareza e sistema onde hoje o empreendedor solo só tem intenção dispersa.

**Vio**, o mentor de IA dentro do produto, nunca se apresenta como IA. Ele fala como um mentor humano, que conhece o contexto real do usuário (perfil, desafios, foco da semana, dados reais da rotina) e usa esse contexto para conversar, desafiar e orientar, não só responder.

---

## 2. O problema real que o Azimo resolve

O público não sofre de falta de informação. Sofre de excesso.

O empreendedor solo brasileiro consome podcast, curso, livro, newsletter sem parar. Ele sabe o que precisa fazer. O problema é execução: começa hábito e abandona em dias, tem ideia todo dia e não termina nada, procrastina decisão importante, oscila entre hiperprodutividade e paralisia. Ele já tentou Notion, Trello, planilha, apps de hábito (Fabulous, Streaks, Habitica), coaching pontual e caro, cursos de produtividade. Nada resolve porque são ferramentas genéricas, e o problema dele não é falta de ferramenta. É falta de sistema que fale com a realidade dele.

O Azimo entrega isso: menos de 10 minutos de input por dia, o Vio organiza o resto.

---

## 3. Perfil do Cliente Ideal (ICP)

Empreendedor solo brasileiro, sem sócio, cuidando sozinho de produto, vendas, marketing, operação, finanças e desenvolvimento pessoal ao mesmo tempo.

- Idade: 28 a 45 anos
- Predominantemente masculino, mas não exclusivo
- Maior concentração geográfica: SP, SC, MG, PR
- Renda: R$5.000 a R$30.000/mês
- Tipo de negócio: infoprodutos, marketing digital, serviços, clínicas, imóveis, agências, e-commerce

A comunicação do produto (landing page, Vio, convite) hoje foi ampliada para falar com qualquer pessoa buscando evolução pessoal, não só quem se identifica como "empreendedor". O foco em empreendedor solo continua existindo como núcleo, mas a porta de entrada é mais ampla, com o lado empresarial mais profundo reservado para uma futura Área Business paga à parte.

---

## 4. Mapa competitivo (visão do Anderson sobre o mercado)

Nenhum concorrente direto cobre os 5 pilares de forma integrada com um mentor de IA que raciocina com o usuário, em português, para esse avatar.

- **Apps de hábito** (Fabulous, Habitica, Streaks): genéricos, sem inteligência contextual, sem pilar empresarial, sem sistema, só ferramenta.
- **Coaching humano**: R$500 a R$3.000 por sessão, semanal ou quinzenal, indisponível às 23h quando o empreendedor mais precisa.
- **Plataformas de curso** (Hotmart, Eduzz, Kiwify): entregam mais conteúdo passivo, que é exatamente o problema, não a solução.
- **Ferramentas de organização** (Notion, Evernote, Obsidian): exigem setup, viram projeto para organizar o projeto, não têm direção nem pilares de vida.
- **IA genérica** (ChatGPT, Claude usados diretamente, Pi da Inflection): sem contexto persistente de vida, sem identidade de mentor, sem viés de execução.
- **Concorrentes nacionais emergentes** (ex: Serena, bem-estar mental com IA): cobrem só saúde mental, não o sistema completo.

Posicionamento: o Azimo ocupa o quadrante de alta profundidade intelectual + sistema integrado personalizado, quadrante hoje vazio no Brasil.

---

## 5. Base intelectual do Vio (mentores de referência)

O Vio raciocina com base em pensadores e profissionais reais, um conjunto por pilar (referência intelectual apenas, sem endosso, parceria ou citação como produto oficial):

- **Físico**: Andrew Huberman, Peter Attia, Laercio Refundini, Tulio Starling
- **Intelectual**: Naval Ravikant, Charlie Munger, Leandro Karnal, Rogério Primi
- **Emocional**: Brené Brown, Gabor Maté, Augusto Cury, Monja Coen
- **Espiritual**: Eckhart Tolle, Viktor Frankl, Mário Sérgio Cortella, Padre Fábio de Melo (em avaliação de troca por Luiz Felipe Pondé)
- **Empresarial**: Alex Hormozi, Flávio Augusto, Conrado Adolpho, Thiago Nigro

---

## 6. O que já existe e está no ar hoje (azimo.life)

Produto em produção, não é conceito. Principais blocos funcionais já entregues:

- **Dashboard** com pilares, streak, objetivos, tarefas do dia, checklist, emoções e integração com Google Calendar
- **Rotina Diária**: tracker de hábitos, Intenção do Dia e Reflexão do Dia com auto-save, análise do Vio ao salvar o dia
- **Vio (chat)**: histórico de conversas, personalização via perfil do usuário, mensagens proativas contextuais (com anti-spam)
- **Meu Perfil**: personalização em cascata (tipo de usuário, desafios, focos da semana, estilo do Vio, contexto livre) que alimenta o system prompt do Vio dinamicamente
- **Finanças v2**: separação Pessoal/Empresarial, dashboard com gráficos, parcelamento, recorrência
- **Onboarding**: tour guiado, briefing matinal do Vio, revisão semanal guiada aos domingos, streak shield (perdão automático de 1 falha por mês)
- **Modelo de assinatura**: trial de 14 dias, planos mensal (R$47) e anual (R$397), Stripe + Supabase + Cloudflare Worker, cancelamento self-service, portal de gerenciamento de cartão
- **Painel administrativo interno (Azimo Command)**: estado operacional da infraestrutura, assinantes, cancelamentos, feedbacks, análise estratégica

**Stack técnica** (contexto, não é o foco desta conversa): frontend em HTML/JS único hospedado na Vercel, autenticação e banco no Supabase, proxy de API num Cloudflare Worker, IA rodando em Claude Sonnet, pagamentos via Stripe, emails transacionais via Resend.

---

## 7. Regras permanentes do produto (não negociáveis)

- Vio nunca se refere a si mesmo como inteligência artificial. Fala sempre como mentor humano.
- Nenhum uso de travessão (—) em qualquer texto do produto, seja copy, seja fala do Vio.
- Ícones sempre em SVG. Nunca emoji na interface.
- Entrega de produto é sempre completa, nunca pela metade.
- Comunicação humanizada, sem padrões perceptíveis de texto gerado por IA.

---

## 8. Onde o Azimo está agora (visão de estágio)

Produto em fase de validação inicial: infraestrutura de pagamento, autenticação e retenção já funcionando de ponta a ponta, ainda sem base relevante de assinantes pagantes (early stage, pré-tração). O foco atual do Anderson é destravar os últimos bloqueadores técnicos (ex: login com Google), fechar a experiência de onboarding e paywall, e então validar aquisição com os primeiros usuários reais antes de escalar investimento em marketing.

Decisões estratégicas em aberto: separar de vez Financeiro pessoal de Empresarial (viraria um sexto pilar), e lançar uma Área Business paga como add-on quando a base ativa passar de 100 assinantes.

---

## 9. Como o Anderson trabalha (contexto sobre o fundador)

Anderson é fundador não técnico do Azimo. Ele já tem um outro chat de IA dedicado a design visual e UI de dashboards SaaS premium (nomeado "Desenvolvedor | Layout"), e outra IA cuidando da execução técnica (código, deploy, infraestrutura) do produto. Este chat aqui tem um papel diferente dos outros dois: não é para desenhar tela nem para escrever código. É para pensar estrategicamente junto, trazer ideias novas, avaliar ferramentas e funcionalidades que podem entrar no roadmap, discutir posicionamento, mercado e direção de produto.

Ao trazer uma ideia nova aqui, o mais útil é: qual problema real ela resolve para o empreendedor solo brasileiro descrito acima, como ela se encaixa (ou não) nos 5 pilares e na filosofia do Vio como mentor humano, o que empresas de referência no mundo estão fazendo de parecido, e qual seria o trade-off real de construir isso agora versus depois.

---

## 10. Papel deste chat

Este espaço serve para: brainstorm de novas ideias e ferramentas para o Azimo, discussão de posicionamento e estratégia de produto, avaliação crítica de features antes de irem para o roadmap de desenvolvimento, benchmark do que os melhores produtos SaaS e de evolução pessoal do mundo estão fazendo. Decisões de execução técnica e visual continuam nos outros dois chats dedicados; aqui o output esperado é direção e clareza, não código nem layout.
