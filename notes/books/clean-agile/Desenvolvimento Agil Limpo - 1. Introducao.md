---
dg-publish: true
---
# Desenvolvimento Agil Limpo - 1. Introducao

## Principal Aprendizado

- Metodologia Ágil serve para **gerenciar times pequenos**
- **Restrição Tripla**: bom, rápido, barato e concluído. Escolha apenas três.
- Times/Sistemas grandes são compostos por muitos times/sistemas pequenos.
    - (**observação**: essas palavras são minhas e não estou muito confiante nessa afirmação)
- Agilidade gera dados.
- Estes dados servem para:
    - Ajudar os gerentes a escolher o que ele quer priorizar (bom, rápido, barato e concluído)
    - Tornar as expectativas de tempo de entrega mais realistas.
        - Mudanças nessas expectativas devem ser informadas o mais cedo possível
        - Se o cronograma não for negociável, decidir exatamente quais features são realmente imprescindíveis.

---

Um constatação em relação a quando um movimento se torna popular (como o movimento ágil) e que no meu entendimento está acontecendo agora (2022) com movimento DevOps.

> Infelizmente, uma vez que um movimento se torna popular, seu nome é corrompido por mal-entendidos e usurpações. Os produtos e métodos que não tem a nada a ver com o movimento em si se aproveitam de seus nomes a fim de lucrar com a popularidade e relevância deles. E assim tem sido com a agilidade.

### Agilidade vs. Taylorismo

Na manufatura e na indústria em geral, o Taylorismo vinha obtendo um considerável sucesso.

> A Administração Científica [ou Taylorismo] é uma abordagem top-down, de comando e controle. Os gerentes usam técnicas científicas a fim de determinar os melhores procedimentos para alcançar uma meta e, em seguida, instruem todos os subordinados a seguirem seu planejamento à risca.

Na década de 70, havia o "pré-ágil" (a metodologia ágil antes de ter esse nome) e o Taylorismo.

- Pré-Ágil:
    - passos breves e reativos,
    - ... calculados e refinados rumo ao escalonamento
    - caminhada aleatória direcionada
    - visando o bom resultado
    - funcionava bem para
        - projetos com **baixo custo de mudança**
        - com **problemas parcialmente definidos**
        - **objetivos especificados de modo informal**
        - (em outras palavras: útil para experimentações)
- Administração Científica (Taylorismo):
    - postergar a ação até que uma análise completa e um planejamento detalhado sejam elaborados
    - funcionava bem para
        - projetos com **alto custo de mudança**
        - com **problemas bem definidos**
        - **objetivos extremamente específicos**


### Método Cascata

Artigo que foi, meio que de maneira equivocada, tido como principal inspiração do método cascata: *Managing the development of large software systems*, por Winston Royce (1970).

> Ainda que Royce não o recomendasse, era o conceito que as pessoas extraíram do trabalho dele e que dominou as próximas três décadas.
> 
> (interpretação contestada no capítulo 7 de Bossavit, *The leprechauns of Software Engineering*)


### Manifesto Ágil - Snowbird

- **Pessoas e interações**, em detrimento de processos e ferramentas.
- **Validação do software**, em vez de uma documentação exaustiva e longa.
- **Colaboração com o cliente**, em detrimento da negociação de contrato.
- **Resposta à mudança**, em vez de seguir um plano cegamente.


### Visão Geral do Ágil

#### Restrição Tripla

Regra irrefutável de projetos de software.

**Restrição Tripla**: escolha somente três dentre

- bom
- rápido
- barato
- concluído

Você não pode ter os quatro.

Um bom gerente de projetos entende que esses quatro atributos têm coeficientes. Ele administra os coeficientes em vez de exigir que todos sejam 100%. **A metodologia ágil se esforça para atingir esse tipo de gerenciamento**.


### Agilidade fornece dados

> Uma das motivações principais para o desenvolvimento de software ágil é **fornecer os dados que os gerentes precisam a fim de decidir como definir os coeficientes na Restrição Tripla** e conduzir o projeto rumou ao melhor resultado possível. (...)
> 
> O desenvolvimento ágil é uma abordagem orientada a feedback. Cada (ação) é orientada pela análise dos resultados das (ações) anteriores e, em seguida, pela realização dos ajustes apropriados. (...) **Sem os dados, o projeto não pode ser gerenciado**.

Por isso 👆 que tem tudo a ver com a DevOps. As ferramentas de DevOps servem exatamente para 1) colocar o código em produção o mais rápido possível e 2) gerar dados de feedback. (ver [OODA loop](https://en.wikipedia.org/wiki/OODA_loop) de John Boyd)


### Primeira coisa que você sabe sobre um projeto: O Prazo

O prazo, uma vez escolhido, é congelado. Imutável.

Seja lá qual for o motivo, é por razões *comerciais*, e isso não mudará apenas porque alguns desenvolvedores acham que talvez não consigam cumprir o prazo.

Simultaneamente os requisitos estão em constante mudança.

> Este é o mundo de uma equipe de desenvolvimento de software. É um mundo em que os prazos são congelados e os requisitos constantemente mudam. E, de alguma forma, nesse contexto, a equipe de desenvolvimento deve fazer com que o projeto tenha um bom resultado.


### Descrição exagerada das fases de um projeto cascata

1. Reunião para determinar o cronograma
2. Fase de Análise
3. Fase do Design
4. Fase de Implementação
5. Fase "Marchando para a Morte"

> O problema da ideia do Método Cascata é que ele **faz todo o sentido**.
> 
> Simples. Direto. Óbvio. E errado.

O principal aprendizado desse cenário descrito abaixo é: seja transparente com os stake holders e forneça informações o mais rápido possível.

#### 1. Reunião

Determina-se um cronograma sem nem saber quais são os requisitos.

#### 2. Fase de Análise

Como fazer análise sem conhecer os requisitos? 🤷

Eis a melhor definição de análise: é o que os analistas fazem.

Não há uma definição clara, no entanto algumas coisas são óbvias:

- cálculos do projeto
- projeções básicas de viabilidade
- projeções de recursos humanos
- garantir que o cronograma seja cumprido
- reuniões com os clientes e usuários
- rascunhos de diagramas legais e até divertidos...

De repente terminamos a análise. Por que? Porque o cronograma dizia que deveríamos acabar nesta data.


#### 3. Fase do Design

> Design de software é quando dividimos o projeto em módulos e projetamos as interfaces entre eles. É também quando determinamos quantas equipes precisamos e quais devem ser as conexões entre essas equipes. (...)
> 
> As coisas mudam de forma inesperada durante essa fase. Acrescentam-se funcionalidades novas. Removem-se ou alteram-se as funcionalidades antigas.

Outro milagre acontece: terminamos o Design! Por que? Porque é o que está no cronograma.

#### 4. Fase de Implementação

> Se pudéssemos também apenas *dizer* que terminamos a implementação... Mas não podemos, porque a questão da implementação é que, na verdade, ela precisa *estar* pronta.

Isso 👆 me lembrou [[Code Complete]], no primeiro capítulo ele diz "construction is the only activity that's guaranteed to happen on every project".

> A implementação tem critérios de conclusão definidos. Não há como fingir que você implementou alguma coisa.

Nessa fase os requisitos ainda estão mudando...

> Ao analisar o código e compará-lo com o design, percebemos que devíamos estar fumando alguma coisa bem forte quando criamos esse design, pois claramente o código não está parecido com aqueles diagramas belos e elegantes que desenhamos.

É nessa fase que percebemos que o tempo para conclusão claramente não é suficiente. E então as partes interessadas são informadas de que pode ocorrer um atraso.

- Vocês não poderiam ter nos informado isso na fase de análise?
    - Que é quando deveriam dimensionar o projeto e comprovar a viabilidade do cronograma.
- Vocês nãao deveriam ter nos informado isso durante a fase de design?
    - Que é quando deveriam dividir o design em módulos, atribuí-los a equipes e fazer as projeções dos recursos humanos.

#### 5. Fase "Marchando para a Morte"

> Todo mundo está chateado e desmotivado. E promtemos a nós mesmos que *nunca* mais faremos outro projeto como este.


### Uma ideia melhor

Uma abordagem ágil é diferente do que o cenário descrito acima 👆.

> Um projeto ágil começa com a análise, no entanto é uma análise que nunca termina.

> Subdividimos o tempo do projeto em incrementos regulares chamados *iterações* ou *sprints*.


#### Iteração Zero

> Algumas pessoas acham que a metodologia ágil é apenas uma série de mini-Métodos Cascata. *Não* é o caso. (...) Não se realiza a análise somente no início da iteração, nem se realiza a implementação apenas no final da iteração. Ao contrário, as atividades de análise, arquitetura, design e implementação de requisitos são constantes durante toda a iteração.


#### Iterações seguintes

**A Agilidade Gera Dados**

> A iteração 1 começa com uma estimativa de quantas histórias serão concluídas. (...) Por enquanto, quais são as possibilidades de a equipe concluir todas as histórias que planejou terminar?
> 
> Praticamente zero, é claro. **Software não é um processo de estimativa confiável**. Nós simplesmente **não sabemos quanto tempo as coisas levarão**. Não temos como saber exatamente o quanto uma tarefa será complicada até que ela esteja em andamento e seja concluída.

Nota pessoal: acredito que quanto mais experiência você tem fazendo o mesmo tipo de software, mais insumos você tem para fazer uma estimativa próxima da realidade.

> No final da iteração, uma parte das histórias que planejamos terminar será concluída. Isso nos fornece nossa primeira avaliação de quanto pode ser concluído em uma iteração. Ou seja, **são dados reais**. (...) Podemos calcular uma nova data final para o projeto.
> 
> É provável que esse cálculo seja bem desanimador. No entanto, essa data nova tem como base os **dados reais**, logo, não deve ser ignorada.


Isso aqui é importante:

> **A agilidade gera dados**. Os gerentes utilizam esses dados para direcionar o projeto rumo ao melhor resultado possível.

Esse gerenciamento deve sempre levar em consideração a Restrição Tripla (escolher 3 entre bom, rápido, barato e concluído)

### Gerenciando a Restrição Tripla

Restrição Tripla: escolha 3 entre bom, rápido, barato e concluído.

Ações que o Gerente pode tomar, e suas consequências relacionadas aos itens da Restrição Tripla:

| ação                   | mexe com...          |
| ---------------------- | -------------------- |
| mudanças no cronograma | rápido               |
| adição de pessoal      | - barato<br>- rápido |
| diminuir a qualidade   | - bom<br>- rápido    |
| mudanças no escopo     | - concluído                     |

Alguns comentários sobre cada ação:

#### mudanças no cronograma

mexe com o "rápido"

**Quanto mais cedo comunicarmos a necessidade de mudanças no cronograma, melhor!**

Será que é possível mexer no cronograma? Na maioria das vezes não. Mas o exemplo dado no livro é interessante:

> talvez aconteça uma feira em novembro em que eles querem exibir o projeto. Talvez ocorra outra feira em março que seria tão boa quanto. Lembre-se: ainda é cedo. Estamos com somente algumas iterações neste projeto. Queremos dizer às partes interessadas que nossa data de entrega será em março *antes* que eles aluguem agora o estande para a feira de novembro.


#### adição de pessoal

mexe com o "rápido" e "barato".

[Lei de Brooks](https://en.wikipedia.org/wiki/Brooks's_law):

> Adicionar pessoas a um projeto de software **atrasado** resulta em um atraso ainda maior.



### conteúdo extra

- Charles Petzold, 2008, *A Guided Tour through Alan Turing's Historic Paper on Computability and the Turing Machine*
- Kent Beck, 2000, *Extreme Programming Explained: Embrace change*, no Brasil: *Programação Extrema (XP) Explicada*. Segundo o Uncle Bob "existe uma segunda edição, de 2005, mas a primeira é a minha favorita e a edição que considero definitiva".
    - [Who's Writing About XP](http://wiki.c2.com/?WhosWritingAboutXp)
- <https://wiki.c2.com> é mencionado como o primeiro wiki a surgir na internet
- John Boyd, [OODA loop](https://en.wikipedia.org/wiki/OODA_loop). (1987) A Discourse on Winning and Losing
    - [The OODA Loop and the Half-Beat](https://thestrategybridge.org/the-bridge/2020/3/17/the-ooda-loop-and-the-half-beat)
