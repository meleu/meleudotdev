---
dg-publish: true
---
# origamid - UI Design

- Curso: <https://www.origamid.com/curso/ui-design-para-iniciantes/>
- Slides: <https://www.origamid.com/slide/ui-design-para-iniciantes/>


## Design para iniciantes

Design é projeto! Plano, pesquisa, prototipagem, testes.

Design é intenção! Por que determinadas decisões foram tomadas?

> [!exercício]
>
> Selecione 3 sites/apps que você utilize e compare suas semelhanças e diferenças.
>
> Exemplo: todos os sites possuem busca no menu, a página de cadastro pede X dados, é possível navegar pelo site através do rodapé e outras características.


### UI Design

UI = User Interface = interface de usuário

Elementos da interface:

- formas
- espaço
- cores
- tipografia
- imagens
- ícones

Boa interface:

- Propósito: existe um motivo claro para a existência do elemento.
- Consistência: Os elementos se comunicam visualmente (cores, espaçamentos, ícones, etc.)
- Necessários: a remoção do elemento tornaria a experiência pior.


### UX Design

UX = User eXperience = experiência de usuário

Design que envolve os usuários impactados pelo projeto.

UX é dividido em duas grandes partes:

- heurísticas: "boas práticas"
- pesquisa: entender necessidades específicas

> Não pense que você (webdesigner) é um usuário!

Vídeo sobre o Mestrado em UX: <https://www.youtube.com/live/ZXapXz6iPKs?feature=share>


### Design e Desenho

Exercício: Selection 10 projetos que você goste em cada um dos sites abaixo:

- <https://dribbble.com/search/ui>
    - <https://dribbble.com/shots/21096397-Realtor-Dark-Theme-Mobile-App-design-iOS-Android-ux-ui-designer>
    - <https://dribbble.com/shots/21331359-Financilux-UX-UI>
    - <https://dribbble.com/shots/20928915-Finmark-home-page-interaction>
    - <https://dribbble.com/shots/21973938-WeStud-Dashboard-sidebar-navigation-for-the-education-platform>
- <https://typewolf.com/>



## Figma
### Firefox: disable show menu with `Alt`

- go to `about:config`
- `[Accept the Risk and Continue]`
- `ui.key.menuAccessKeyFocuses` = `false`

### Atalhos

Para ver lista na tela: `Ctrl`+`Shift`+`?`

- `Esc`: volta pra "mover"
- `k`: redimensionar mantendo o aspect ratio
- `r`: Rectangle. Manter `Shift` pressionado para quadrado perfeito.
- `o`: Ellipse (oval). Manter `Shift` pressionado para círculo perfeito.
- `l`: Line. Manter `Shift` para vertical/horizontal/45graus
- `p`: Pen (weird stuff)
- `t`: Text
- `i`: color picker
- `z`: (manter pressionado): permite selecionar área do zoom
- `Alt`+`click`+move: duplica o elemento.

Outros interessantes:

- `Ctrl`+`Shift`+`k`: choose file
- `Ctrl`+`\`: Hide UI
- `Ctrl`+`k`: open command prompt



## UI Design

### Espaço

Dica: o padding de um botão com texto geralmente é X pra cima e pra baixo, e 2X na esquerda e direita.


#### Referências

Sites mencionados:

- <https://airgarden.com.au/>
- <https://leafshave.com/>
- <https://ramp.com/>

Livro mencionado: "Design para quem não é designer", de Robin Williams

- edição 4 de 2013
- no IFF tem a edição 3, de 2005 (mesmo assim é bom)
    - 686.2252 W726d

### Tipografia

Slide: <https://www.origamid.com/slide/ui-design-para-iniciantes/#/0304-escolha-tipografica/1>

Sites para escolher fontes:
- Google Fonts: <https://fonts.google.com>
- Adobe Fonts: <https://fonts.adobe.com>
- Typewolf (inspiração): <https://www.typewolf.com>

> Web Design is 95% Typography

- <https://ia.net/topics/the-web-is-all-about-typography-period>

Dica: não vale a pena usar tipografias muito semelhantes no seu site. O objetivo de usar tipografias diferentes é gerar contraste. Portanto se você utilizar tipografias muito semelhantes, é como se tivesse carregando uma fonte extra desnecessariamente.


Classificações:

- Serifadas
- Sem serifa
- Monoespaçada
- Cursivas
- Decorativas

#### Serifadas

Estilo:

- formal
- clássico
- luxo
- literário
- trabalho manual

exemplo: <https://every.to/>

#### Sem Serifa

Estilo:

- neutro
- digital
- objetivo
- informal

exemplo: <https://moy.is/en>


#### Monoespaçadas

Estilo:

- digital
- objetivo
- técnico


#### Cursiva

Raramente utilizada na web.

Estilo:

- trabalho manual
- celebrações


#### Decorativa

Usos bastante específicos

exemplo: <https://drinkmonday.co/>


### Usos de tipografia

- Título
    - títulos de páginas/seções
    - nomes de produtos
    - listas (pequenas)
- Corpo
    - artigos
    - descrições de produtoss
    - perguntas e respostas
- Funcional
    - botões
    - links
    - formulárioss
    - notificações
    - etiquetas


#### Funcional

- Neutra
    - sem serifa com foco na legibilidade
- Variações
    - Opte por fontes com variações de pesos e estilos
- Sugestões
    - Arial
    - Open Sans
    - Roboto
    - Source Sans
    - IBM Plex Sans
    - Lato

#### Corpo

Se for conteúdo relacionado com tecnologia: Sem serifa. Se for review de livro: Serifada.

- Leiturabilidadae
    - Serifadas e sem serifas funcionam para o corpo de texto. A escolha depende do estilo do site.
- Familiar
    - Quanto mais familiar a tipografia for, maior facilidade o usuário terá para ler.
- Variações
    - Opte por fontes com variações de pesos e estilos
- Sugestões
    - Arial
    - Open Sans
    - Roboto Slab
    - Alegreya

#### Título

- Estilo
    - A escolha pode ajudar a definir o estilo gráfico do site.
- Consistência
    - As características devem se comunicar com os demais elementos
- Diferente?
    - Não existe **necessidade** de ser diferente, ela pode ser a mesma utilizada no corpo/funcional.


#### Variáveis Tipográficas

- escala
    - entre 6 e 12 variações são suficientes para definir a hierarquia
    - contraste (tamanhos diferentes com significado diferentes)
    - legibilidade (entre 14 e 24 para corpo)
- altura de linha
    - depende da escala e da tipografia
    - corpo: entre 1.3x e 1.5x
        - exemplos: Medium (1.52), Google (1.57), Airbnb (1.5)
    - título: entre 1x e 1.25x
        - exemplos: Medium (1.22), Stripe (1.04), Airbnb (1.2)
- peso
    - geralmente entre 100 e 900
    - podem ser representados com nomes: light, regular, semibold, bold, etc.
- estilo:
    - normal/regular, itálico, oblíquo
    - cuidado com "itálicos falsos", forçados por software
- maiúsculas
    - usar para botões
    - prestar atenção ao kern (no vídeo há um exemplo que ficou muito espaço entre o T e o A
- largura de linha
    - essencial para corpo de texto
    - **dica**: entre 45 e 75 caracteres (13 palavras). Use `max-width`.
- espaçamento
    - geralmente é melhor não mexer (seguir o default da fonte)
    - as vezes é interessante para pequenos títulos
- alinhamento
    - esquerda é o mais comum e recomendado


![[material-design - typography-scale.png]]




### Cores

#### Funções das cores

- Contraste
- Hierarquia
- Informação
- Identidade

#### Paleta de cores

Essa aula é bacana: <https://www.origamid.com/curso/ui-design-para-iniciantes/0310-paleta-de-cores-2>

Ensina que podemos criar variações interessantes mantendo a mesma matiz e variando apenas saturação e brilho.

Dica: ao criar variação na mesma matiz, leve em consideração o seguinte:

- aumentar brilho -> diminuir saturação
- aumentar saturação -> diminuir brilho
- se tiver no limite de saturação, variar a matiz de acordo com a luminosidade dela

#### Luminosidade das cores de acordo com a matiz

![[origamid - luminosidade-matiz.png]]

#### Paleta de tons de cinza

![[origamid - paleta de tons de cinza.png]]

#### Paleta de tons de cinza azulado

![[origamid - paleta cinza-azulado.png]]

#### Cores Funcionais

Achei legal nesse exemplo variações da mesma matiz:

![[origamid - cores funcionais.png]]

- o tom mais claro no background
- um pouco mais escuro pra borda da caixa
- um pouco mais escuro para o ícone
- e o tom mais escuro para o texto

#### Escolha das cores

Dicas

- Escolher primeiro a cor de ênfase para saber se a cor de base será influenciada por ela.

### Ícones

- Material Icons: <https://fonts.google.com/icons>
- Streamline: <https://streamlineicons.com/download/>
- The Noun Project: https://thenounproject.com/>

## Interfaces Digitais

### Componentes

- Menu
- Tabs (abas)
- Breadcrumb
- Footer

### Elementos

- link
- botão
- dropdown

### Exercício de navegação

#### Surfbot

> Surfbot é uma escola de surf que oferece **aulas** em uma **praia** do Rio de Janeiro. Os alunos precisam se **matricular online** para receber as aulas.

Dessa descrição conseguimos extrair informações úteis para criar links na barra de navegação.

- praia (onde acontecerão as aulas)
- aulas (horário)
- **matricule-se**
- contato (pois é site de empresa pequena)


#### Caravan

> Caravan é um site de turismo que oferece viagens para **três cidades diferentes** California, Paris e Dublin.
> 
> Para contratar o site o usuário precisa se **inscrever** em um dos **planos** oferecidos pela empresa.

Se tem inscrição e planos, deve ter também uma tela de login. Portanto devemos ter um link para Login

- Destinos (as 3 cidades mencionadas)
- Planos
- Login
- **Inscreva-se**


#### Handel


> Handel é um comércio eletrônico de moda, especializado em venda de vestuário masculino e feminino. Seus principais produtos são Saias, Bermudas e Camisas. Para efetuar a compra o usuário precisa adicionar um produto ao carrinho e criar/logar na sua conta para finalizar a mesma.

- Ecommerce de roupas
- produtos
    - saias
    - bermudas
    - camisas
- criar conta
- login
- carrinho de compras



### Formulários

#### text / textarea

diferença:

- text: "uma linha"
- textarea: multiplas linhas/parágrafos

Características:

- livre / restrito
    - restrito: requer validação (e.g.: CPF, email)
- label
- placeholder

#### checkbox / radio

- Checkbox: permite múltiplos campos ativos

![[origamid - exemplo-checkbox.png]]

- Radio: permite apenas um item ativo

![[origamid - exemplo-radio.png]]


#### Select

Permite selecionar uma opção da lista. Não permite selecionar múltiplos itens.

![[origamid - exemplo-select.png]]


#### slide

exemplos:

- Slide bar de controle de volume do vídeo youtube
- Slide de buscar trecho do vídeo.


#### date

Geralmente o nativo não funciona muito bem.


### Interfaces Responsivas

- Se adapta ao display

### Sistema de Design

Conjunto de regras/elementos que são definidos para garantir consistência entre interfaces da marca.

Exemplos:

- [Material Design](https://m3.material.io/)
- [Carbon Design](https://carbondesignsystem.com/)
- [Bootstrap](https://getbootstrap.com/)
- [Tailwind](https://tailwindcss.com/)


## Projeto de Site Pessoal

- Problema
    - qual problema estamos resolvendo?
    - qual o objetivo do projeto?
    - entender mais sobre o projeto
- Pesquisa
    - com usuários
    - com concorrentes
    - especialistas
    - referências
- Conteúdo
    - arquitetura da informação do site
    - quais informações estarão disponíveis
    - organização
- Protótipo
    - papel e caneta
    - wireframe


### Problema

Criar um curriculo online para iniciar uma presença digital

- linux
- bash
- devops
- docker / containers
- kubernetes
- Ruby
- HTTP
- TDD

Possivelmente:

- JavaScript/TypeScript
- Golang
- Rust
Gosto de Linux, bash, ruby, JavaScript/TypeScript, Golang, Rust


### Pesquisa

- <https://www.redhat.com/en/command-line-heroes/season-3>


### Conteúdo

- Texto inicial sobre o que faço
- avatar
- menu
    - experiência
    - trabalhos
    - projetos
    - formação
    - contato


Experiência:

- nome do projeto
- quando o projeto foi feito
- tecnologias utilizadas

Formação

Idiomas

Contato


### Protótipo

#### tipografia

Como é site de desenvolvedor, escolher uma tipografia neutra, sem serifa...

Ir no Google fonts e pesquisar fonts sem serifa, com mais de 8 estilos, digitar o texto que você vai usar e ver se vai ficar legal

Minhas primeiras escolhas:

- Título
    - Ubuntu
    - REM
    - Kanit
    - Prompt
    - Saira


#### cores

- paleta de tons de cinza
- destaque (inspiração do Command Line Heroes
    - `#261a4c`
    - `#0e0e23` 
