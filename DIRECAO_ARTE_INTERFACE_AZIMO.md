# Azimo | Direção de arte para interfaces

Referência de intenção visual para o Claude ao implementar propostas concebidas pelo GPT. Exemplo concreto: card **Análise Semanal do Vio**, versões `4ac6c92` → `d6af348` → `9483b17` em `Projeto/Empresa/index.html`. Não é pedido para refazer o card nem uma regra para dar o mesmo visual a todas as telas.

## O que Anderson quer preservar dessa abordagem

O objetivo é criar interfaces com personalidade e clareza, sem perder a identidade do Azimo. Ao receber uma proposta visual, desenvolva a composição como uma peça inteira, não como uma soma de caixas funcionais. Escolha o elemento que comunica melhor a ação ou o estado e dê a ele o protagonismo. Use cor, profundidade, ritmo, espaço vazio e detalhes decorativos para conduzir a atenção. O efeito deve apoiar a leitura e o significado dos dados.

No card da Análise Semanal, o percurso Seg → Dom é o protagonista. O marcador do dia atual usa o símbolo existente do Vio, tamanho e brilho suaves para mostrar acompanhamento. O texto à esquerda explica o estado e a contagem real de registros; o bloco à direita anuncia quando a análise estará disponível. As três áreas pertencem ao mesmo card. Estrelas e horizonte dão contexto espacial, mas ficam atrás das informações e nunca competem com elas.

## Como aplicar em uma próxima tela

1. **Entenda a tela real.** Identifique a tarefa da pessoa, o dado ou estado principal, o layout atual, os componentes e tokens existentes, e os estados de vazio, erro, carregamento e conclusão.
2. **Proponha uma ideia visual específica.** Escolha uma metáfora ou um elemento protagonista que faça sentido para aquela tarefa. A liberdade criativa está na composição, hierarquia, ritmo, profundidade e detalhes pertinentes; não em espalhar brilho ou temática cósmica por toda a plataforma.
3. **Reaproveite a linguagem do Azimo.** Mantenha tipografia, cores, radius, ícones SVG e componentes quando servirem à intenção. Adapte a proposta se alguma solução visual conflitar com o padrão vigente; preserve o objetivo e explique a adaptação.
4. **Resolva a experiência inteira.** No desktop, distribua as áreas pela largura disponível. Em telas menores, reorganize a ordem de leitura em vez de comprimir tudo. Trate estados e interações reais, contraste de texto, tema claro/escuro e preferência por movimento reduzido. Dados e números devem vir da lógica existente.
5. **Revise visualmente.** Veja o resultado em desktop e mobile, em claro e escuro quando aplicável. Compare com a referência ou intenção aprovada. Corrija peso visual, alinhamento, escala e contraste antes de encerrar; teste também a funcionalidade afetada.

## Padrão de colaboração GPT → Claude

O GPT entrega um briefing compacto com: objetivo da tela; estrutura e hierarquia; elemento protagonista; componentes/ativos reaproveitados e novos; clima, cor e acabamento; espaçamentos relevantes; desktop/mobile; estados e interações; limites funcionais. Uma imagem pode acompanhar como referência de intenção, sem exigir reprodução pixel a pixel.

O Claude usa esse briefing como direção, examina o código vigente e toma decisões de implementação e acabamento. Pode propor uma solução visual melhor para cumprir a intenção, desde que preserve arquitetura, dados, interações, marca e escopo. Quando houver um conflito material ou escolha de produto ainda não decidida, sinaliza de forma objetiva. Depois da implementação, o GPT pode revisar o resultado visual e apontar diferenças específicas. A alternância de agente continua obedecendo à seção 8bis de `AZIMO_AUTONOMIA_CHATGPT.md`; este documento não executa handoff por si só.

## Referência concreta

- Código: `Projeto/Empresa/index.html`, `renderAnaliseSemanalDash()`, `_asvTimelineHtml()` e estilos `.asv-*`.
- Imagem original de intenção enviada por Anderson: `~/Downloads/Imagem do Codex 24 de set. de 2026, 17_26_10.png`.
- Prévia local do resultado de 26/09/2026: `~/.codex/.chatgpt-projects/g-p-6ab044c3945481919597e618853feacf/entregas/analise-semanal-vio/previa-desktop.png`.
- O site publicado pode conter versões posteriores; sempre conferir o estado real antes de usar esse exemplo.
