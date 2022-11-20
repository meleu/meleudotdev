---
dg-publish: true
tags:
  - books
read-timestamp: 2022
author: Frederik Brooks
---

# O Mitico Homem-Mes

#books/tech 

## 16. Não Existe Bala de Prata

- Essência e Acidente em Engenharia de Software

> Não há um único desenvolvimento, seja em tecnologia ou em técnica de gestão, que, por si só, prometa sequer uma ordem de grandeza de melhoria dentro de uma década, seja em produtividade, confiabilidade ou simplicidade.


### Principais aprendizados

Existem duas categorias de problemas em desenvolvimento de software:

- os essenciais, inerentes ao software.
- e os colaterais, no texto chamado de acidentais.

O texto alega que os problemas "colaterais" já estão sendo muito bem endereçados por linguagens de alto-nível, computadores mais poderosos, ferramentas mais inteligentes, etc.

No entanto, os problemas colaterais representam apenas 1/10 dos desafios de engenharia de software. Os outros 9/10 dos desafios são relacionados aos problemas essenciais. E poucos avanços estão sendo vistos em relação a estes problemas.

**Observação**: essa relação de 9/10 é mencionada pelo autor sem apresentação de nenhum fato para justificar esse número.

#### O que fazer com esse aprendizado?

- Ter sempre em mente que **Gestão da Complexidade** deve ser o imperativo técnico primário do software (ver também: [[Code Complete]]).
    - Tenho exemplos que reais em que observei que ter esse imperativo em mente me ajudou a não me satisfazer com a primeira solução e continuar tentando soluções mais simples.

- Estudar técnicas para criar protótipos rapidamente (exemplo: Ruby on Rails para backend, Bootstrap para UI)


- Alguns livros que acredito que podem me ajudar a me tornar um melhor projetista de sotware (sotware designer):
    - Practical Object-Oriented Design in Ruby, Sandi Metz
    - Beautiful Code (pt_br: Código Maravilhoso)
    - Padrões de Projeto, "Gang of Four"
    - [99 Bootles of OOP](https://sandimetz.com/99bottles-sample-ruby), Sandi Metz
    - Design It, Pragmatic Programmer library



### Essência vs. Acidente

Em desenvolvimento de software existem problemas **essenciais**, inerente ao software, e também existem os problemas que o autor chama de **acidentais** (no sentido de colaterais).

### Propriedades inerentes ao desenvolvimento de software (essência)

Quatro propriedades inerentes dessa irredutível essência do desenvolvimento de software:

- complexidade
- conformidade
- flexibilidade
- invisibilidade


#### Complexidade

Dessas 4, a que acredito ser mais importante atacar e ter sempre em mente, é a complexidade (ideia influenciada pelo [[Code Complete]]).

Da complexidade vem:

- a dificuldade de comunicação entre os membros da equipe, que leva a deficiências no produto, aumento dos custos, atrasos de cronograma.
- a dificuldade de enumerar, e muito menos entender, todos os estados possíveis de um programa, e daí vem a falta de confiabilidade.
- a dificuldade de ampliar os programas com novas funções sem, com isso, criar efeitos colaterais.

> Tanto problemas técnicos como os gerenciais advêm da complexidade. A complexidade torna difícil a visão integral do sistema, impedindo, assim, sua integridade conceitual. Ela torna difícil de encontrar e controlar todos os problemas. Isso cria o enorme fardo de aprendizagem e compreensão que torna a rotatividade de pessoal um desastre.


#### Conformidade

Se refere à relação entre o software e o que ele está representando do mundo real. Se está tradução do "problema do mundo real" para o software é bem feita, dizemos que está em **conformidade**.

Neste trecho do ensaio tem uma comparação interessante com a Física.

> o físico trabalha na firme crença de que existem princípios unificantes a serem encontrados, sejam nos quarks ou na teoria dos campos unificados. Einstein repetia o argumento de que deve haver explicações simples para a natureza, uma vez que Deus não é caprichoso nem arbitrário.
> 
> Não há crença assim que dê conforto ao engenheiro de software. A maior parte da complexidade que ele deve dominar é arbitrária, imposta sem rima ou razão por muitos sistemas e instituições humanas às quais suas interfaces devem estar em conformidade. Isso muda de interface para interface e de tempos em tempos, não em função de necessidade, mas apenas porque elas são projetadas por pessoas diferentes e não por Deus.

Tentando falar com as minhas palavras, eu diria que a física tem a vantagem de que todos os envolvidos tem essa crença de que existe uma maneira simples de descrever fenômenos naturais. Eles estão há séculos tentando encontrar fórmulas matemáticas para descrever fenômenos complexos de maneira simples. E estes fenômenos existem há milhares de milênios na natureza e são virtualmente imutáveis.

Já no software, estamos tentando representar com nossas linhas de código, problemas do mundo real que foram criados pelo homem. Além de imperfeitos, este problemas mudam com frequência.


#### Mutabilidade

> A entidade de software é constantemente sujeita a pressões em prol de uma mudança.
> 
> (...) o software pode ser modificado com mais facilidade - é pura matéria de pensamento, infinitamente maleável. Prédios são, de fato, modificados, mas os custos altos dessas mudanças, compreendidos por todos, servem para frear o ímpeto dos modificadores.


#### Invisibilidade

> Software é invisível e é impossível criar uma boa representação visual para ele. (...) Essa lacuna não prejudica apenas o processo de projeto dentro de uma mente, mas também impede severamente a comunicação entre as mentes.

Na época que o ensaio foi escrito ainda não existia o UML, mas pelo que vejo hoje (2022), os diagramas UML **não** se tornaram padrão de mercado.

### Ataques promissores na Essência

- Comprar vs. Construir
- Refinamento de Requisitos e Prototipagem Rápida
- Desenvolvimento Incremental
- Excelentes Projetistas

#### Prototipagem Rápida

> um dos atuais esforços tecnológicos mais promissores, um que ataca a essência - não os acidentes - do problema de software, é o desenvolvimento de abordagens e ferramentas para a prototipagem rápida de sistemas como parte da especificação iterativa de requisitos
>
> (...) Protótipos tipicamente realizam as principais tarefas da aplicação, mas não fazem nenhuma tentativa de tratamento de exceções, respondem corretamente a entradas inválidas, terminam de forma limpa, etc. O propósito desse protótipo é tornar real a estrutura conceitual especificada, de forma que o cliente possa testá-la em sua consistência e facilidade de uso.

Esse trecho me faz crer que é importante conhecer técnicas para se criar rapidamente um protótipo de uma aplicação. Em se tratando de aplicações web, acredito que pode ser valioso conhecer uma linguagem consagrada e um framework que permita desenvolver rapidamente (exemplos: PHP/Laravel, Ruby on Rails para backend, Bootstrap para interfaces).

Uma prototipagem rápida permite mostrar ao cliente uma versão mínima do software e coletar feedback. Um pensamento bastante alinhado com o [Agile Manifesto](https://agilemanifesto.org/) e com os princípios do [[DevOps]].

#### Desenvolvimento Incremental

**Expanda, não construa, o software.**

Também bastante alinhado com as metodologias ágeis, e com os princípios de DevOps (entrega contínua).

> Cada funcionalidade adicionada e a nova provisão para dados ou circunstâncias mais complexas crescem organicamente a partir do que já existe.
> 
> Os efeitos no moral são surpreendentes. O entusiasmo aumenta quando há um sistema funcional, mesmo que simples. Os esforços redobram quando a primeira imagem de um novo sistema gráfico aparece na tela, mesmo que seja apenas um retângulo. **Sempre se tem, a cada estágio do processo, um sistema que funciona.**


#### Excelentes Projetistas

> Sucessivas pesquisas demonstram que os melhores projetistas produzem, com menor esforço, estruturas mais rápidas, menores, mais simples, mais limpas. Esse fator diferencia o enfoque ótimo do médio em ordens de grandeza.

Acredito que para me aperfeiçoar nesse ponto preciso praticar mais, desenvolver mais aplicações, nem que seja apenas por exercício.

Alguns livros que acredito que podem ajudar nesse quesito:

- Padrões de Projeto, "Gang of Four"
- Practical Object-Oriented Design in Ruby, Sandi Metz
- [99 Bootles of OOP](https://sandimetz.com/99bottles-sample-ruby), Sandi Metz
- Beautiful Code (pt_br: Código Maravilhoso)
- Design It, Pragmatic Programmer library


### Citações

> A dificuldade em se construir um software está em decidir o que dizer, não em dizer.

> O abismo entre a melhor prática de engenharia de software e uma prática mediana é muito grande - talvez maior do que em qualquer outra disciplina de engenharia.

O trecho a seguir me lembrou o GitHub Copilot

> uso de sistemas integrados de bases de dados para manter o registro de miríades de detalhes que devem ser buscados minuciosamente pelo programador individual e mantidos atualizados para um grupo de colaboradores em um único sistema.

> O custo do software sempre foi o de seu desenvolvimento, não o de sua replicação.

A citação acima 👆 pode ser diferente atualmente, com muito software rodando "nas nuvens" e tendo que ser mantidos como um *Software as a Service* por um time de operações.