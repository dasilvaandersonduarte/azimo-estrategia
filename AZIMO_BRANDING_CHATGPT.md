# Azimo — Manual de Marca e Identidade Visual

> **Onde colocar:** nos Arquivos do Projeto "Azimo" no ChatGPT (não precisa anexar direto num chat específico). Uma vez lá, fica disponível automaticamente para qualquer conversa dentro do projeto, incluindo o chat "Desenvolvedor | Layout" e qualquer chat novo que você abrir ali pra gerar imagem, post ou peça visual. Documento único e completo: logo, avatar do Vio, paleta, tipografia e estrutura de Instagram. Não precisa complementar com mais nada nem mandar informação por partes.

Atualizado em: 02/09/2026 — manual fechado, sem pendências em aberto.

---

## 1. Regra número um: a logo não se mexe

A logo do Azimo é um símbolo geométrico de **3 losangos verticais sobrepostos**, formando uma seta/agulha estilizada, dentro de um quadrado com cantos arredondados. É a mesma lógica visual de uma bússola: direção, azimute, ponto de referência. É essa ideia que dá nome à marca.

**Código exato da logo (SVG), não alterar proporção, ângulo, ordem das camadas ou opacidade:**

```svg
<svg width="28" height="28" viewBox="0 0 48 48" fill="none">
  <polygon points="24,4 30,24 24,44 18,24" fill="#6366F1" opacity="0.3"/>
  <polygon points="24,4 30,24 24,34 18,24" fill="#6366F1" opacity="0.7"/>
  <polygon points="24,4 30,18 24,24 18,18" fill="#6366F1"/>
</svg>
```

**Versão para favicon / ícone de app (com fundo):**

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <rect width="100" height="100" rx="20" fill="#6366F1"/>
  <g transform="translate(26,17)">
    <svg width="48" height="66" viewBox="0 0 48 48">
      <polygon points="24,4 30,24 24,44 18,24" fill="white" opacity="0.35"/>
      <polygon points="24,4 30,24 24,34 18,24" fill="white" opacity="0.7"/>
      <polygon points="24,4 30,18 24,24 18,18" fill="white"/>
    </svg>
  </g>
</svg>
```

Regras de uso:
- A cor principal da logo é sempre o roxo/indigo da marca (`#6366F1` em fundo escuro/neutro). Em fundo colorido usa-se a versão em branco sólido, mantendo as 3 camadas com as mesmas opacidades (0.3 / 0.7 / 1).
- Nunca inverter a orientação da forma, nunca trocar por outro símbolo (bússola literal, seta simples, etc). O símbolo é sempre esses 3 losangos concêntricos.
- Nunca adicionar sombra, contorno, gradiente ou efeito 3D na logo. Ela é plana, geométrica, minimalista.
- Espaço de respiro mínimo ao redor: a altura de um dos losangos internos, para qualquer lado.
- Tamanho mínimo recomendado: 24px de altura (abaixo disso perde legibilidade).
- Nome da marca ao lado da logo: "**Azimo**", sempre com A maiúsculo, resto minúsculo, sem acabar em ponto ou símbolo. Fonte do peso do texto acompanha a tipografia do produto (ver seção 4).

**Se a ferramenta de imagem "recriar" a logo do zero a partir de um print, ela vai errar proporção e ângulo.** Sempre que for gerar qualquer peça com a logo, ela deve ser inserida como o código SVG acima (ou como referência vetorial exata), nunca redesenhada por interpretação visual.

---

## 2. Avatar do Vio (mentor de IA) — Rosa dos Ventos

O Vio, mentor de IA dentro do produto, tem um símbolo próprio: uma **rosa dos ventos de 16 pontas**, com a agulha norte iluminada (indicando direção, clareza, orientação). É um símbolo derivado da mesma lógica da logo (bússola/azimute), mas mais elaborado, usado apenas para representar o Vio, nunca como logo institucional do Azimo.

```svg
<svg width="26" height="26" viewBox="-32 -32 64 64" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="vio-n" x1="0" y1="-1" x2="0" y2="1" gradientUnits="userSpaceOnUse">
      <stop offset="0%" stop-color="#e0e7ff"/>
      <stop offset="100%" stop-color="#818CF8"/>
    </linearGradient>
    <radialGradient id="vio-glow" cx="50%" cy="50%" r="50%">
      <stop offset="0%" stop-color="rgba(99,102,241,0.18)"/>
      <stop offset="100%" stop-color="rgba(99,102,241,0)"/>
    </radialGradient>
  </defs>
  <circle cx="0" cy="0" r="30" fill="url(#vio-glow)"/>
  <circle cx="0" cy="0" r="27" fill="none" stroke="rgba(99,102,241,0.3)" stroke-width="0.8"/>
  <polygon points="0,-27 2.2,-8 0,-11 -2.2,-8" fill="url(#vio-n)"/>
  <polygon points="0,27 2.2,8 0,11 -2.2,8" fill="#2d2470"/>
  <polygon points="27,0 8,2.2 11,0 8,-2.2" fill="#2d2470"/>
  <polygon points="-27,0 -8,2.2 -11,0 -8,-2.2" fill="#2d2470"/>
  <polygon points="0,-27 1.8,-14 0,-16 -1.8,-14" fill="#4338ca" transform="rotate(45)"/>
  <polygon points="0,-27 1.8,-14 0,-16 -1.8,-14" fill="#4338ca" transform="rotate(135)"/>
  <polygon points="0,-27 1.8,-14 0,-16 -1.8,-14" fill="#4338ca" transform="rotate(225)"/>
  <polygon points="0,-27 1.8,-14 0,-16 -1.8,-14" fill="#4338ca" transform="rotate(315)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(22.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(67.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(112.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(157.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(202.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(247.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(292.5)"/>
  <polygon points="0,-27 1,-19 0,-20 -1,-19" fill="#6366F1" opacity="0.6" transform="rotate(337.5)"/>
  <circle cx="0" cy="0" r="6" fill="#0f1117" stroke="#4338ca" stroke-width="1"/>
  <circle cx="0" cy="0" r="3.5" fill="none" stroke="rgba(99,102,241,0.4)" stroke-width="0.6"/>
  <polygon points="0,-5.5 1.4,-1.5 0,-2.8 -1.4,-1.5" fill="#A78BFA"/>
  <polygon points="0,5.5 1.4,1.5 0,2.8 -1.4,1.5" fill="#312e81"/>
</svg>
```

Fica dentro de um card com fundo em gradiente indigo/violeta suave (`linear-gradient(135deg, rgba(99,102,241,0.2), rgba(139,92,246,0.12))`) e leve brilho (glow) ao redor. É o símbolo a usar sempre que o Vio for representado como personagem/mentor em peças de conteúdo, nunca uma ilustração de rosto ou robô.

---

## 3. Paleta de cores

O Azimo tem dois modos, escuro (padrão/produto) e claro. Para peças de marca (Instagram, apresentações, anúncios), o modo escuro é a base de identidade principal — é a estética "dark tech premium" que define o produto.

### Modo escuro (identidade principal)

| Uso | Cor | Hex / valor |
|---|---|---|
| Fundo base | Preto azulado | `#0F1117` |
| Superfície elevada (cards) | Branco a 3-6% sobre o fundo | `rgba(255,255,255,0.03–0.06)` |
| Borda sutil | Branco a 8-12% | `rgba(255,255,255,0.08–0.12)` |
| Texto principal | Branco a 90% | `rgba(255,255,255,0.9)` |
| Texto secundário | Branco a 60% | `rgba(255,255,255,0.6)` |
| **Cor de marca (indigo/roxo)** | — | `#6366F1` |
| Indigo texto/destaque | — | `#818CF8` |
| Indigo fundo suave | — | `rgba(99,102,241,0.15)` |

### Modo claro (alternativo, usado na versão light do app)

| Uso | Hex |
|---|---|
| Fundo | `#F8F8FC` (off-white frio/lilás — nunca branco puro) |
| Superfície | `#FFFFFF` |
| Borda | `#E2E2EC` |
| Texto principal | `#171721` (grafite azulado — nunca preto puro) |
| Texto secundário | `#626270` |
| Indigo/marca | `#5754D9` |
| Indigo fundo suave | `#F0EFFF` |

Regra de direção visual (validada com o Anderson): fundo nunca é branco puro nem preto puro. É sempre uma variação fria com leve tom azulado/lilás. Isso vale tanto para o app quanto para qualquer peça de marca.

### Cor por pilar (código de cores fixo, usar sempre nesta correspondência)

| Pilar | Cor | Hex (modo escuro) | Hex (modo claro) |
|---|---|---|---|
| Físico | Vermelho | `#EF4444` | `#DC2626` |
| Intelectual | Indigo (cor de marca) | `#6366F1` | `#5754D9` |
| Emocional | Rosa/pink | `#EC4899` | `#DB2777` |
| Espiritual | Violeta | `#8B5CF6` | `#7C3AED` |
| Empresarial | Âmbar | `#F59E0B` | `#B45309` |

Essas 5 cores só devem ser usadas para representar o pilar correspondente (ex: um gráfico, ícone ou selo do pilar Físico é sempre vermelho, nunca outra cor). Fora desse contexto, a cor de marca dominante em qualquer peça é sempre o indigo/roxo (`#6366F1`).

### Cores de estado (uso funcional, não decorativo)

| Estado | Cor |
|---|---|
| Sucesso / positivo | Verde `#22C55E` |
| Erro / atenção crítica | Vermelho `#EF4444` |
| Alerta | Âmbar `#F59E0B` |
| Informação | Azul `#3B82F6` |

---

## 4. Tipografia

### O que é e por que importa
Tipografia é o desenho e o uso das letras: qual fonte, em qual peso (fino, regular, negrito), em qual tamanho e espaçamento. Não é só "qual fonte bonita" — é o que faz uma marca ser reconhecida instantaneamente antes mesmo de ler o texto, do mesmo jeito que a cor indigo e a logo dos losangos já fazem. Duas peças com cores e logo idênticas, mas fontes diferentes, parecem de marcas diferentes. É o terceiro pilar da identidade visual, junto com cor e símbolo.

Toda marca séria separa a tipografia em pelo menos dois papéis:
- **Fonte de destaque (display/heading):** usada em títulos, capas de post, números grandes. Tem mais personalidade, chama atenção, mas cansa e perde legibilidade se usada em texto corrido.
- **Fonte de texto (body):** usada em parágrafos, legendas, interface. Precisa ser extremamente legível em qualquer tamanho, inclusive pequeno, e não pode competir com a fonte de destaque.

Usar a mesma fonte para as duas coisas é comum e funciona (foi o que o produto faz hoje, por padrão do sistema, sem decisão de marca por trás). Usar duas fontes complementares é o que dá a sensação "de marca" que grandes produtos SaaS têm.

### Decisão de marca (aplicar a partir de agora)

| Papel | Fonte | Por quê |
|---|---|---|
| Destaque / títulos | **Space Grotesk** | Sans-serif geométrica, com um toque técnico/estrutural que conversa direto com o conceito de azimute e coordenadas da marca. Usada por produtos de tecnologia premium. Só pesos fortes (500-700), nunca peso fino em título. |
| Texto / corpo / interface | **Inter** | Feita especificamente para telas e interfaces, extremamente legível em qualquer tamanho, com faixa enorme de pesos (100 a 900) e ótimo suporte a acentuação em português. É a fonte de corpo mais usada por produtos SaaS premium no mundo hoje (GitHub, Figma, Linear, entre outros). |

As duas são **gratuitas** e estão no Google Fonts — não há custo de licença nem restrição de uso comercial. Nomes exatos para buscar: "Space Grotesk" e "Inter".

### Hierarquia de peso (como aplicar)
- Título grande / capa de post: Space Grotesk, peso 600-700 (Semibold/Bold)
- Subtítulo / destaque secundário: Space Grotesk, peso 500 (Medium), ou Inter 600 quando o título já é muito forte
- Corpo de texto / legenda / parágrafo: Inter, peso 400-500 (Regular/Medium)
- Texto pequeno / rodapé / metadado: Inter, peso 400, cor secundária (nunca abaixo do que garante leitura confortável)

Nunca usar itálico decorativo, nunca fonte serifada (com serifa, tipo Times), nunca fonte manuscrita/cursiva — todas fogem do posicionamento premium/tech da marca.

### Como usar na prática
- **No ChatGPT / geração de imagem:** ao pedir uma peça, mencionar pelo nome — "título em Space Grotesk bold, texto de apoio em Inter" — o suficiente para a ferramenta reconhecer e aplicar essas fontes (são fontes muito conhecidas, com alta chance de reconhecimento correto).
- **Em Canva ou outro editor:** buscar "Space Grotesk" e "Inter" diretamente na busca de fontes — ambas já vêm disponíveis nas bibliotecas padrão da maioria dos editores.
- **No site (mudança futura, não é urgente):** hoje o site usa a fonte do sistema operacional por ser mais leve/rápido de carregar. Trocar pela Inter no produto é uma melhoria de marca válida para o futuro (traria consistência total entre app e conteúdo), mas exige carregar a fonte via Google Fonts no código — fica registrado aqui como item de backlog de marca, não como urgência técnica.

---

## 5. Estilo visual e iconografia

- **Estética geral:** "dark tech premium" — fundo escuro, elementos flutuantes com transparência sutil (glassmorphism leve), brilho/glow suave em roxo ao redor de elementos de destaque (como o avatar do Vio), gradientes suaves indigo → violeta, nunca cores saturadas competindo entre si.
- **Ícones:** sempre SVG line/outline (traço, não preenchido), nunca emoji. A biblioteca usada no produto é a **Tabler Icons**. Qualquer ícone gerado para peças de marca deve seguir essa mesma linguagem: traço fino, cantos levemente arredondados, monocromático (geralmente branco ou indigo).
- **Formas:** geometria simples, cantos arredondados (raio consistente, nunca cantos 100% retos nem excessivamente arredondados/pill em tudo). A logo em si é feita de losangos, então formas de diamante/losango podem aparecer como elemento gráfico secundário de marca (padrão de fundo, moldura, divisor).
- **Nunca usar:** emojis como elemento gráfico ou de UI, travessão (—) em qualquer texto de marca, fotos de banco de imagem genéricas de "empreendedor sorrindo com laptop" (foge do tom sério/consultivo da marca), ilustrações fofas/cartoon (o produto é sério, consultivo, não lúdico).

---

## 6. Estrutura recomendada de Instagram

Não existe hoje uma conta de Instagram ativa documentada para o Azimo — o que segue é a estrutura recomendada para construir do zero, seguindo o padrão visual acima.

### Perfil
- **Foto de perfil:** a logo (símbolo dos 3 losangos) centralizada em fundo `#6366F1` sólido ou fundo escuro `#0F1117`, formato quadrado 320×320px (o Instagram exibe em círculo, então manter a logo centralizada com boa margem).
- **Bio:** direta, sem emoji, tom consultivo. Estrutura sugerida: uma linha de posicionamento (sistema de evolução pessoal com mentor de IA), uma linha de prova/benefício, link único (Linktree ou direto para azimo.life).

### Grade do feed (grid)
O Instagram exibe o grid em proporção 3:4 na miniatura — pensar a composição de cada post com a informação principal centralizada, para não cortar em elementos importantes na miniatura do grid.

### Categorias de destaques (Stories Highlights) sugeridas, alinhadas aos 5 pilares
Uma capa de destaque para cada pilar (usando a cor correspondente da tabela da seção 3) + destaques institucionais:
- Físico / Intelectual / Emocional / Espiritual / Empresarial (conteúdo por pilar)
- Sobre o Vio (o mentor de IA)
- Como Funciona (produto)
- Depoimentos

### Tamanhos de imagem (pixels)

| Formato | Dimensão | Proporção |
|---|---|---|
| Foto de perfil | 320 × 320 px | 1:1 |
| Post quadrado (feed) | 1080 × 1080 px | 1:1 |
| Post retrato (feed, recomendado — ocupa mais tela) | 1080 × 1350 px | 4:5 |
| Post paisagem (feed) | 1080 × 566 px | 1.91:1 |
| Carrossel | mesma dimensão da 1ª imagem, todas as lâminas iguais | segue a 1ª imagem |
| Stories | 1080 × 1920 px | 9:16 |
| Reels (capa e vídeo) | 1080 × 1920 px | 9:16 |
| Capa de destaque (Highlights) | 1080 × 1920 px (ou 500×500 se for um ícone simples recortado em círculo) | 9:16 (ou 1:1 para ícone) |

Recomendação prática: usar sempre o formato retrato 4:5 (1080×1350) para posts de feed normais — é o formato que o algoritmo do Instagram mais favorece em espaço de tela hoje, e Stories/Reels sempre em 1080×1920.

Fonte da especificação técnica: [Instagram Post Size Guide 2026 — Buffer](https://buffer.com/resources/instagram-image-size/)

---

## 7. Checklist para o ChatGPT antes de gerar qualquer peça

1. A logo, quando aparecer, é exatamente o SVG da seção 1 — nunca redesenhada, nunca com efeito extra.
2. A cor de marca dominante é sempre `#6366F1` (indigo), fundo nunca em branco puro nem preto puro.
3. Se a peça representar um pilar específico, usar exatamente a cor daquele pilar (seção 3), nunca uma cor livre.
4. Sem emoji em nenhuma peça. Ícones sempre em traço fino, estilo outline.
5. Sem travessão em nenhum texto.
6. Tom visual: sério, premium, consultivo — nunca cartoon, nunca clichê de "influenciador de produtividade".
7. Tipografia sempre Space Grotesk (títulos) + Inter (corpo/texto). Nunca serifada, nunca manuscrita, nunca itálico decorativo.
8. Em caso de dúvida sobre qualquer elemento não coberto aqui, perguntar antes de decidir por conta própria.
