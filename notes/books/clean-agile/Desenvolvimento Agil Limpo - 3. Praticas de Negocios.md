---
dg-publish: true
---
# Desenvolvimento Ágil Limpo - 3. Práticas de Negócios

- Voltar para [[Desenvolvimento Agil Limpo]]

## Principal Aprendizado

- **A finalidade de cada iteração é gerar dados por meio das histórias concluídas.**
- É melhor concluir 5 histórias de 10 do que avançar somente 50% em todas as 10.
- Use INVEST para definir histórias
    - Independente
    - Negociável
    - Valioso/Valorável
    - Estimável
    - *Small*/Pequeno
    - Testável
- É necessário fazer um shift-left no QA.
- *definition of done*: Testes de Aceitação foram aprovados
- [[#Testes de Aceitação]] confundem muita gente pois ele deve especificar os requisitos e quem deve fazer isso é o *stakeholder*. Como o *stakeholder* não conhece linguagens de programação, ficamos numa situação ambígua. Para minimizar isso, alguns frameworks foram criados (Cucumber, RSpec, etc.) e também o conceito de *Behavior Driven Development* (BDD) - por Dan North.

---

[TOC]

---

## Planejamento

Sobre estimativa:

> Queremos que o custo da estimativa seja baixo. Portanto, uma estimativa é, por definição, *imprecisa*. A imprecisão nos possibilita reduzir o tempo necessário para criar a estimativa. Quanto mais imprecisão, menos tempo a estimativa a levará.


## Estimativa de Três Pontos

Compostas de três valores:

1. o melhor cenário
2. o cenário mais provável
3. o pior cenário


[remover isso?]

Isso está relacionado com o método matemático conhecido como [Avaliação do Programa e Técnica da Revisão (PERT)](https://pt.wikipedia.org/wiki/PERT)


## Pontos de História (Storypoints)

O livro usa um exemplo de histórias para um caixa eletrônico.

Serão gerados cartões para cada história.

Exemplo:

- Login
- Logout
- Retirada
- Depósito
- Transferência

Durante a elaboração destes cartões, muitos detalhes são mencionados, mas como ainda não confiamos neles, não os anotamos.

> Essa exclusão de detalhes é uma *disciplina*. E é dificílima. Todos na equipe sentirão a necessidade de registrar todos os detalhes analisados de uma maneira ou de outra. Resista a esse impulso!


### Estimando as Histórias

Todos devem participar da reunião de estimativa desses cartões. Essas reuniões aconteceram muitas outras vezes. Especialmente quando novas histórias forem adicionadas ou algo novo for aprendido baseado nas histórias anteriores.

Escolhemos uma história do grupo que consideramos de complexidade média. Por exemplo *Login*.

Em seguida escolhemos um número de pontos para o *Login*. Nesse exemplo trabalharemos com uma escala de 1 a 6, e portanto o *Login* terá 3 pontos (pois é uma história de complexidade média).

Agora o *Login* é nossa **História de Ouro**. A partir daí usamos essa referência para estimar as outras histórias.

> você pode star se perguntando o que esses pontos estão realmente medindo. (...) É uma unidade de esforço **estimado**, não de tempo real. **Esses pontos não são nem uma estimativa de tempo - são uma estimativa de *esforço***.

Há uma menção à [Lei dos Grandes Números](https://en.wikipedia.org/wiki/Law_of_large_numbers) ("existe algo belo nesse valores indefinidos e confusos").

## Planejando a Iteração Um

IPM - Iteration Planning Meeting - Reunião de Planejamento da Iteração

Quem participa?

- stake holders - partes interessadas
- programadores
- testadores
- gerente de projeto

> A função dos *stakeholders* na IPM é escolher as histórias que serão implementadas pelos programdores e testadores durante a iteração. Para tal elas precisam saber quantos pontos de história os programadores acham que conseguem finalizar.


### ROI

Retorno Sobre o Investimento

|             | custo alto  | custo baixo     |
| ----------- |:-----------:|:---------------:|
| **valor alto**  | faça depois | faça agora      |
| **valor baixo** | nunca faça  | faça por último |

Isso não está escrito no livro, mas acho relevante lembrar:

Uma coisa importante a se levar em conta para atribuir valor a uma determinada história é a Teoria das Restrições. Identificar o gargalo e atuar nele. "Qualquer melhoria fora do gargalo é uma ilusão." (aprendi lendo [[O Projeto Fênix]] e [[Manual de DevOps]])


### Verificação do Ponto Médio

Na metade da iteração deve haver uma checagem de como está o andamento das histórias e fazer ajustes se necessário.

> [!important]
> - O objetivo de uma iteração é gerar dados para os gerentes.
> - O melhor preditor do progresso de uma iteração é a iteração anterior.


### O Final do Projeto

- A **análise contínua dos requisitos** coloca conteúdo na pilha de demandas.
- O **ciclo de iteração** retira conteúdo da pilha de demandas.

Quando analisarmos os cartões de história e nos dermos conta que não há nada que valha a pena fazer, o projeto acabou.

> O projeto não termina quando todas as histórias são implementadas. Ele acaba quando não há mais histórias no baralho que valham a pena ser implementadas.


## INVEST

Histórias devem ser declarações simples, sem detalhes. Os detalhes são registrados na forma de Testes de Aceitação.

Para criar uma história devemos nos lembrar do mnemônico **INVEST**:

  - Independente
  - Negociável
  - Valioso/Valorável
  - Estimável
  - *Small*/Pequeno
  - Testável

Algumas considerações sobre alguns desses pontos

**Independente**

> tentamos separar as histórias de modo que exista a menor dependência possível. Isso nos possibilita implementar as histórias em ordem do valor do negócio.

Acho que também ajuda a tornar a história Testável

**Valorável**

> A história deve apresentar um valor claro e quantificável para o negócio.

A princípio achei essa definição muito vaga. Mas o autor depois fala o seguinte.

> A quantificação do valor do negócio pode ser informal. Algumas equipes podem simplesmente usar alto/médio/baixo como sua escala de valor de negócio; outras podem tentar empregar uma escala de 10 pontos.

Teve uma observação que me chamou atenção e fiquei curioso para saber como será resolvido (p. 75):

> Refatoração *nunca* é uma história. Arquitetura nunca é uma história. Limpeza de código nunca é uma história. **Uma história é sempre alguma coisa que o negócio valoriza**. Não se preocupe, cuidaremos da refatoração, da arquitetura e da limpeza - mas não com histórias.

Uma história muitas vezes atravessa varias camadas do sistema.

**Estimável**

> Um história deve ser concreta o suficiente para permitir que os desenvolvedores a estimem.

- 👎 *O sistema deve ser rápido*
- 👍 *A requisição X deve responder em menos de 50 milissegundos*

Outra forma de pensar é: **a história deve ser concreta o suficiente para ser especificada nos testes.**


**Small / Pequena**

> Uma história não deve ser maior que qualquer coisa que um ou dois desenvolvedores não consigam implementar em uma única iteração.


**Testável**

> A empresa deve conseguir estruturar testes que comprovem que a história foi concluída.

Lembrar do **I**ndependente e do **E**stimável: uma história deve ser independente e concreta o suficiente para ser especificada nos testes.


## Gerenciando a Iteração

Foco deve ser:

- Concluir histórias
- Gerar dados para os gerentes


> **A finalidade de cada iteração é gerar dados por meio das histórias concluídas.** (...)
>
> É bem melhor concluir 80% das histórias do que 80% de cada história. **Foque na conclusão das histórias.**

Outra forma de dizer:

> não queremos encerrar a iteração com duas histórias pela metada quando poderíamos ter sacrificado uma história para concluir a outra.
>
> Não se trata de fazer as coisas rápido. Trata-se de fazer progressos tangíveis e mensuráveis (...) confiabilidade dos dados.

O autor chama atenção para algo interessante sobre atribuição de histórias.

> Gerentes e a liderança ficarão tentados a atribuir histórias aos programadores. Isso deve ser evitado. É melhor deixar os programadores negociarem entre si.


### QA

> Caso a equipe de QA continue perdendo o prazo do ponto médio, uma iteração após a outra, é bem provável que a correlação de engenheiros de QA e desenvolvedores esteja errada.

**Definition of done**: Testes de Aceitação foram aprovados

> básico da teoria de controle: não exerça pressão sobre o que você está calculando.
 
 Isso me lembra a época de Plataforma, onde era comum colocar culpa nos instrumentos. 

### Demo

> A demonstração deve incluir a execução de todos os Testes de Aceitação - incluindo todos os anteriores - e de todos os testes unitários.


## Pequenas Versões

Mesma história dos pequenos lotes mencionado no [[Manual de DevOps]].


## Testes de Aceitação

> A prática dos Testes de Aceitação é uma das menos compreendidas, menos usadas e mais confusas de todas as práticas ágeis. (...)
> 
> A ideia fundamental é bastante simples: *os requisitos devem ser especificados pela empresa*.

Uma especificação é, devido à sua própria natureza, *um teste*.
Exemplo:

*Quando o usuário digitar um username/password válidos e clicar em "login", o sistema apresentará a página "Bem-vindo".

Isso 👆 é uma especificação e um teste

A prática dos Testes de Aceitação diz que, na medida do possível, os requisitos do sistema devem ser escritos como testes automatizados.

Mas quem escreve estes testes? A empresa? Mas ela não entende de linguagens de programação! Mas não é a empresa que deve especificar os requisitos?

Esse 👆 é o motivo da confusão.

Para minimizar esse problema de comunicação entre o business e técnico, foram criadas algumas ferramentas e frameworks como FitNesse, SpecFlow, Cucumber, RSpec, etc.

Também surgiu o conceito de *Behavior Driven Development* (BDD), por Dan North.

> tentativa de formalizar a linguagem dos testes usando três advérbios especiais: *Dado*, *Quando* e *Então*.

[Não notei muita empolgação por parte do Uncle Bob ao falar do BDD]

Mais sobre BDD aqui:
    - <https://dannorth.net/introducing-bdd/>
    - https://youtu.be/6nSwRSbc27g

Me parece que o BDD e o RSpec são boas ferramentas para fazer com que o *business* e o *técnico* se comuniquem melhor.





