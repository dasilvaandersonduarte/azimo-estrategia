# AZIMO | Padrão de criação visual e entrega

## Instrução permanente para o desenvolvimento

Use este documento em toda tarefa de interface do Azimo. Ele define a direção de criação aprovada por Anderson, exemplificada pelo **Menu Mais mobile publicado em outubro de 2026**, e complementa `DESIGN_SYSTEM_PREMIUM_AZIMO.md`, `STATUS.md` e `BACKLOG_MESTRE_AZIMO.md`. Consulte o código atual e esses documentos antes de alterar uma tela. A imagem aprovada de cada tarefa e as instruções específicas de Anderson determinam o resultado daquela tela.

### 1. Identidade e hierarquia

O Azimo deve parecer um produto próprio, sofisticado e coerente. Use a tipografia, a paleta azul profundo, índigo e roxo, o símbolo oficial e os padrões de borda e espaçamento existentes. Luz ambiente, profundidade e camadas devem melhorar a leitura e orientar a atenção, sem virar um efeito repetido em todos os elementos.

Reserve imagens cinematográficas e iluminação mais marcante para pontos de entrada, mensagens e áreas que merecem destaque, como o Foco Nível Azimo e comunicações do Vio. Cards informativos e indicadores cotidianos podem usar gradientes, contornos e sombras sutis, sem imagem temática. Cada cena precisa representar a função do componente e conversar com o restante da aplicação. Não replique a mesma paisagem ou o mesmo planeta em vários cards apenas para uniformizá-los.

### 2. Da referência à implementação

Quando Anderson aprovar uma referência visual, reproduza **a linguagem visual e a composição**, além da estrutura e dos textos. Observe proporções, margens, alinhamentos, hierarquia tipográfica, profundidade, enquadramento, tratamento da imagem, contraste, iluminação e estados de interação.

Se a referência usa uma cena cinematográfica, utilize um asset real, gerado ou produzido para aquela finalidade, integrado por recorte e degradê e otimizado para o navegador. Não substitua a cena por um ícone SVG ampliado, triângulos, montanhas geométricas ou um fundo genérico sem uma decisão explícita de Anderson. Mantenha os ícones funcionais em SVG e preserve os símbolos oficiais. Imagens decorativas não devem bloquear cliques, prejudicar acessibilidade nem dificultar a leitura.

Reutilize tokens, fontes, componentes e assets existentes quando servirem ao resultado aprovado. Valores de cor e medidas citados em referências antigas são aproximações: confira primeiro o projeto real. Evite criar uma nova biblioteca visual paralela ou reconstruir módulos fora do escopo.

### 3. Método de trabalho por tarefa

1. **Entender:** Leia `STATUS.md`, os itens recentes e os relevantes do `BACKLOG_MESTRE_AZIMO.md`, o design system e a implementação atual. Identifique o escopo, as funções e os dados que precisam ser preservados.
2. **Definir a composição:** Para uma mudança visual relevante ainda sem proposta aprovada, prepare uma prévia que represente o conteúdo e o espaço reais. Se Anderson já aprovou a proposta, avance diretamente para a implementação fiel. Liste assets necessários antes de simplificar a proposta por falta deles.
3. **Implementar:** Preserve lógica, navegação, permissões, dados e experiência desktop ou mobile fora do escopo. Use imagens locais otimizadas, camadas de proteção do texto, ícones SVG e estados de toque, foco e teclado. Respeite movimento reduzido.
4. **Comparar:** Abra a implementação real e compare visualmente com a referência aprovada na mesma largura. Verifique também uma tela menor e o desktop quando aplicável. Corrija diferenças perceptíveis em composição, tamanho, imagem, cor e espaçamento antes de dar a tarefa por concluída.
5. **Validar e publicar:** Teste as interações alteradas e as verificações técnicas disponíveis. Faça commit e publique pelo fluxo oficial do projeto. Confira o resultado publicado; se uma verificação depender do aparelho de Anderson, diga exatamente o que não foi possível testar.
6. **Registrar e relatar:** Atualize `STATUS.md` e acrescente um item ao `BACKLOG_MESTRE_AZIMO.md` quando houver mudança relevante. Na resposta, enumere tudo que foi feito, o que foi testado, o commit e o estado da publicação, para Anderson conferir ponto a ponto.

### 4. Critérios de qualidade

- O resultado real mantém a força visual da referência aprovada, com textos legíveis e sem sobreposições.
- As imagens têm função temática, acabamento integrado e peso adequado à experiência mobile. Há fallback legível se falharem.
- Títulos, valores, ícones, botões e espaçamentos seguem a hierarquia do Azimo e permanecem consistentes entre telas relacionadas.
- Todos os controles continuam acessíveis por toque e teclado; conteúdo e barra de navegação não se encobrem; não há rolagem horizontal indevida.
- A versão desktop e os módulos fora do escopo preservam seu comportamento.
- Uma captura ou inspeção da versão publicada sustenta a conclusão visual. Não declare testes ou publicação que não tenham sido verificados.

### 5. Linguagem da interface

Use a grafia oficial **Azimo** e **Vio**, sem emojis, sem travessões nos textos vistos pelo usuário e sem ícones genéricos no lugar das marcas oficiais. Mantenha a tipografia e a capitalização adotadas no produto. O Vio fala como mentor, sem se apresentar como inteligência artificial.

## Referência e atualização

O Menu Mais mobile aprovado é a referência de **acabamento e fidelidade de execução**, não um molde para aplicar imagens em todos os cards. Cada nova área terá composição própria dentro da mesma identidade. Quando Anderson aprovar uma nova decisão visual reutilizável, registre-a no `DESIGN_SYSTEM_PREMIUM_AZIMO.md` e atualize esta fonte se ela alterar alguma regra aqui. Em caso de conflito, prevalecem as instruções específicas e mais recentes de Anderson.
