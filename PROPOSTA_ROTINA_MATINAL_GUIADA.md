# Proposta: Rotina Matinal Guiada (opcional) — Item 85, Parte B

> Documento de análise, SEM implementação. Responde ao pedido do Anderson (19/09) de
> mapear o que já existe no Azimo antes de decidir se cria uma experiência agrupada
> de preparação matinal, inspirada nos princípios de "O Milagre da Manhã" (sem copiar
> texto, nomenclatura ou estrutura do livro — só os princípios gerais de produto).

## 1. Achado central: as 6 práticas já existem no Azimo, escondidas dentro do Mínimo Diário

Antes de desenhar qualquer coisa nova, o primeiro passo era checar se isso já existe.
E existe — quase 1:1:

| Prática (referência conceitual) | Já existe no Azimo como... | Onde mora hoje |
|---|---|---|
| Silêncio | Hábito `silencio` (pilar Espiritual) | Mínimo Diário (checkbox) |
| Afirmações | Hábito `afirmacoes` (pilar Emocional) **+** card "Afirmações" (biblioteca de textos criados com o Vio) | Mínimo Diário (checkbox) + Rotina Diária (card) |
| Visualização | Hábito `visualizacao`, rotulado "Mentalizações" (pilar Emocional) **+** card "Mentalizações" (biblioteca) | Mínimo Diário (checkbox) + Rotina Diária (card) |
| Escrita | Hábito `escrita-intencao` (Intenção do Dia) e `escrita-reflexao` (Reflexão do Dia) | Já embutida em Início do Dia e Fim do Dia |
| Leitura | Hábito `leitura` (pilar Intelectual) | Mínimo Diário (checkbox); conteúdo real fica em Estudos, que é outro módulo |
| Exercício | Hábito `exercicios` (pilar Físico) | Mínimo Diário (checkbox) |

Ou seja: **não faltam componentes, falta costura.** As 7 hábitos-padrão do Azimo (os 6
da referência + a Reflexão do Dia, que é a versão noturna da Escrita) já cobrem o
território inteiro. O que não existe é uma forma de fazer isso **em sequência, num
momento só, de forma guiada e opcional** — hoje são 7 checkboxes soltos numa grade,
sem ordem nem ritmo.

## 2. Dois sistemas hoje desconectados (isso importa pra proposta)

Vale registrar essa distinção, porque ela muda o desenho:

- **Hábito (`STATE.tracker`)**: é só um "fiz / não fiz" binário por dia, alimenta o
  streak e o painel de pilares. Marcar "Afirmações" no Mínimo Diário não exige ter
  lido ou escrito nada — é uma auto-declaração.
- **Conteúdo (`STATE.mentalizacoesAfirmacoes`)**: os cards "Afirmações" e
  "Mentalizações" na Rotina Diária guardam textos reais, criados só via conversa com
  o Vio (`pedirVioMentalizacaoAfirmacao`). Não têm campo de digitação direta.

Hoje eles não se falam: dá pra marcar o hábito "Afirmações" como feito sem nunca ter
aberto o card, e vice-versa. Uma rotina guiada é a oportunidade natural de conectar
os dois — ao passar pela etapa "Afirmações" na sequência, mostrar a mais recente
salva (ou sugerir criar uma na hora com o Vio) **e** marcar o hábito como feito no
mesmo gesto.

## 3. Estrutura proposta

**Onde mora:** dentro do card Início do Dia (que acabou de virar full-width e a
abertura visual da página — ver Parte A deste mesmo item). Um botão/link opcional
tipo "Fazer minha preparação guiada" abre um modal ou tela dedicada com os passos em
sequência, sem sair do fluxo de Início do Dia.

Isso conversa direto com a decisão já tomada no item 83: quando Início do Dia está
pendente, o Vio já prioriza isso como o próximo passo da pessoa. A rotina guiada vira
uma forma mais rica de completar esse mesmo passo, não um destino novo e concorrente.

**Sequência proposta (ordem lógica, nomes a definir com identidade própria do
Azimo — os nomes abaixo são só pra referência interna, não pra produto):**

1. Silêncio/respiração (30-60s, tela simples com timer, nada de áudio guiado no início)
2. Intenção do dia (reaproveita literalmente o campo que já existe — não duplica)
3. Afirmação (mostra a última salva, com atalho "criar outra com o Vio" e "quero pular")
4. Visualização/Mentalização (mesmo padrão da Afirmação)
5. Nível de energia (reaproveita o seletor que já existe em Início do Dia)

Deixei **Leitura** e **Exercício** fora da sequência guiada nesta primeira proposta —
ver seção 6 (por quê).

**Reaproveitamento técnico:** o Azimo já tem um componente de cronômetro pronto (o
Foco/Pomodoro) que serve de base técnica direta pro passo de Silêncio com timer, sem
construir nada do zero. O modal de onboarding (`_onbRenderStep`, o tour de boas-vindas
passo-a-passo) já resolve o problema de "sequência com avançar/pular/progresso" —
mesmo padrão de interação pode ser adaptado aqui, em vez de inventar um novo.

## 4. O que acontece com os cards atuais de Afirmações e Mentalizações

Não removê-los agora (conforme pedido). Proposta pra depois de validar a rotina
guiada:

- Os cards continuam existindo como a "biblioteca" de afirmações/mentalizações já
  criadas — isso é útil independente da rotina guiada existir ou não.
- A pergunta real do Anderson ("devem ficar permanentemente na cara de todo mundo?")
  se resolve sozinha se a rotina guiada for pra frente: quem usa a rotina guiada
  encontra Afirmações/Mentalizações *dentro* dela, sem precisar de um card fixo na
  página. Isso abre caminho pra, numa fase 2, tornar os cards de Afirmações e
  Mentalizações minimizáveis por padrão (ou movidos pra dentro de um "ver mais" da
  Rotina Diária) — sem nunca esconder o conteúdo em si, só a exposição permanente.
- Ninguém perde dado: a biblioteca de textos é a mesma, só muda de onde é acessada.

## 5. Como tornar isso opcional (sem forçar ninguém)

- Botão no Início do Dia é sempre opt-in — quem não clica, nunca vê a sequência.
- Cada passo tem "pular" — nenhum é obrigatório dentro da sequência.
- Fechar a sequência a qualquer momento não perde o que já foi preenchido (intenção e
  energia, por ex., já ficam salvas em tempo real, igual hoje).
- Uma pessoa que nunca abre a rotina guiada continua tendo Início do Dia funcionando
  exatamente como hoje (energia + intenção), sem fricção nova.

## 6. Todas as 6 práticas ou só as que já têm relação direta?

Recomendação: **começar só com Silêncio, Afirmação e Visualização** (3 passos, mais
Intenção do Dia que já é obrigatória hoje) — não as 6.

Por quê:
- Leitura já tem um módulo próprio (Estudos), com sua própria lógica de progresso e
  revisão espaçada. Puxar "Leitura" pra dentro da rotina guiada duplicaria uma
  experiência que já existe e é mais completa lá.
- Exercício não tem hoje nenhum dado estruturado além do checkbox (sem duração, tipo,
  intensidade) — incluir na rotina guiada sem um componente de verdade por trás vira
  só mais um "pular" na sequência, sem valor real agregado.
- Uma sequência de 3-4 passos cabe em ~2-3 minutos, mantém a promessa de "rápido" que
  o Anderson colocou como restrição (item 9 do pedido). Seis passos arrisca virar
  processo longo, o oposto do que foi pedido.
- É mais fácil validar se a mecânica funciona com poucos passos e expandir depois, do
  que construir os 6 e descobrir que 2 não emplacam.

## 7. Impacto no fluxo e nos dados existentes

- **Nenhuma migração de dados necessária.** A rotina guiada só orquestra campos e
  hábitos que já existem (`STATE.emocoes`, `STATE.intencoes`,
  `STATE.mentalizacoesAfirmacoes`, `STATE.tracker`) — não cria uma nova fonte de
  verdade paralela.
- Streak e painel de pilares continuam funcionando sem alteração, porque a rotina
  guiada só marcaria os mesmos hábitos que já existem no tracker.
- Risco principal a testar: se marcar "Afirmação" dentro da rotina guiada também deve
  marcar automaticamente o hábito correspondente no Mínimo Diário, ou se isso deve
  continuar sendo uma ação separada — decisão de produto que vale confirmar com você
  antes de qualquer código, porque muda a lógica de streak (marcar automático de mais
  hábitos de uma vez pode inflar a sequência sem a pessoa ter, de fato, decidido
  marcar cada um).

## 8. Recomendação direta

Vale a pena ir em frente com uma versão enxuta: 3 passos (Silêncio, Afirmação,
Visualização) plugados dentro do Início do Dia, reaproveitando 100% do que já existe
(dados, cards, cronômetro do Pomodoro como base técnica). Não mexer em Afirmações e
Mentalizações como cards autônomos nesta rodada — só reavaliar a exposição deles
depois que a rotina guiada estiver rodando de verdade e você tiver visto o uso real.

**Antes de eu implementar, preciso da sua decisão em 3 pontos:**
1. Confirma a sequência reduzida (Silêncio → Intenção → Afirmação → Visualização), ou
   quer incluir Leitura/Exercício mesmo sem componente próprio ainda?
2. Marcar um passo na rotina guiada deve marcar automaticamente o hábito equivalente
   no Mínimo Diário, ou fica separado?
3. O acesso é um botão dentro do card Início do Dia (visão simples), ou você imagina
   algo mais destacado, tipo um card próprio "Preparação Guiada" acima do Início do
   Dia?
