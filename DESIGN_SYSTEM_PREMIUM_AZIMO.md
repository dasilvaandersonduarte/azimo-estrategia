# Azimo | Padrão Visual Premium

Atualizado em 26/10/2026. Referência aprovada: `Menu Mais do Azimo em Neon(1).png`, enviada por Anderson. Aplicação inicial: menu Mais mobile. Demais telas exigem aprovação individual.

## Direção visual

O Azimo combina fundo azul-marinho profundo, índigo e roxo, iluminação ambiental discreta, camadas de profundidade e cenas cinematográficas ligadas à função de cada área. A interface precisa continuar clara, rápida e acessível. Não basta reproduzir a estrutura do mockup com ícones ampliados.

Paleta de referência aproximada: fundo `#050B1C`, painel `#0A1531`, card `#101E42`, roxo `#7774FF`, azul `#478AFF`, texto `#F4F6FF`, texto secundário `#AAB7D5`, verde administrativo `#00D5A0`. Reutilizar tokens existentes antes de criar novos.

## Composição de cards

1. Base azul-marinho com variação suave de luz.
2. Cena temática realista à direita, integrada ao fundo.
3. Degradê escuro por cima da imagem, protegendo título e descrição.
4. Ícone funcional SVG, título, descrição e seta acima das camadas decorativas.
5. Borda fina, reflexo interno, sombra difusa e brilho moderado.

Alturas, alinhamentos e áreas de toque devem ser consistentes. Imagens não podem atravessar a leitura. Na largura pequena, recortar a cena e priorizar o texto. Ícones em contêiner índigo/roxo com traço branco uniforme; Command usa verde e azul-petróleo.

## Menu Mais mobile aprovado

Painel escuro com título `Mais`, subtítulo, X circular, seções Conhecimento, Produtividade, Sistema, Pessoal e Empresa. Conteúdo rola dentro do painel; página de fundo permanece parada; barra inferior permanece visível. Mais fica ativo enquanto o painel está aberto. Fechar pelo X, toque fora, Escape e Voltar. Cards reutilizam os destinos existentes. Command só aparece para administrador.

Cenas produzidas para esta entrega como WebP de 800 × 267 px, qualidade 76, entre 10,9 e 22,4 KB cada. Nesta arquitetura de HTML único, os oito WebP estão incorporados como data URI em `azimo-site/index.html` com identificadores `data-asset`:

| Card | Asset | Cena |
|---|---|---|
| Estudos | `menu-estudos` | Livro aberto com luz quente |
| Revisão | `menu-revisao` | Pilha de livros sob luminária |
| Diário de Produtividade | `menu-diario` | Caderno aberto e caneta |
| Foco Nível Azimo | `menu-foco` | Montanhas, floresta, lua e água |
| Sobre o Azimo | `menu-sobre` | Bússola metálica sobre mapa |
| Meu Perfil | `menu-perfil` | Pessoa diante de horizonte montanhoso |
| Dar Feedback | `menu-feedback` | Comunicação tridimensional azul e roxa |
| Azimo Command | `menu-command` | Arquitetura tecnológica verde |

As cenas são decorativas (`alt=""`), e o conteúdo funcional permanece em texto e SVG. Não há dependência de imagens externas. Os WebP incorporados aumentam o HTML em cerca de 160 KB e não têm cache individual; se o projeto passar a publicar assets binários versionados diretamente, estes podem ser extraídos sem mudar a composição.

## Cabeçalho e navegação

Manter a logo oficial, nome, frase e foto reais do usuário no cabeçalho mobile. O cabeçalho fica ao fundo do menu e não é duplicado no painel. Preservar o botão central do Vio com bússola oficial, brilho próprio e destaque diferente do indicador da aba Mais.

## Produção para futuras telas

Analisar a função e os dados reais; criar mockup fiel; obter aprovação de Anderson; especificar composição, assets, tipografia, responsividade e estados; implementar; comparar captura real e referência na mesma largura; corrigir diferenças; testar navegação, desempenho, acessibilidade, mobile menor e desktop. Não aplicar este visual automaticamente às demais áreas.

Não usar emojis ou travessões em textos de interface. Manter fonte e tokens oficiais. Respeitar `prefers-reduced-motion`, teclado e leitor de tela. Fallback legível deve existir se uma cena não carregar.

## Verificação e limites desta entrega

Menu publicado em `www.azimo.life` no commit `e75687d`; oito cenas carregadas em 390 × 844; rolagem e último card conferidos em 320 × 568; sem largura horizontal excedente. Navegação dos destinos e Voltar já haviam sido testados na versão estrutural anterior. Desktop preservado. Não houve teste em iPhone/Android físico ou sessão não administrativa. A captura real de 390 px foi comparada com o mockup: imagens temáticas e profundidade agora correspondem à direção, embora as dimensões do mockup sejam conceituais e o painel real role em vez de mostrar todos os cards de uma vez.
