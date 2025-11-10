---
dg-publish: true
tags:
  - books
read-timestamp: 2022
author: Kent Beck
---

# eXtreme Programming Explained

#books/tech 

Livro de Kent Beck

[TOC]

---

Observação: Li a versão em português da primeira edição do livro (existe uma 2a. edição não publicada em português)


## XP 04 - Quatro Variaveis

Existem quatro variáveis relacionadas a um projeto de software:

- custo
- tempo
- qualidade
- escopo

Isso também é mencionado pelo Uncle Bob no [[Desenvolvimento Agil Limpo - 1. Introducao#Restrição Tripla]].

### Custo

Dinheiro demais muito cedo cria mais problemas do que resolve.

Pouquíssimo dinheiro pode não ser suficiente para resolver o problema de negócio que o cliente precisa.

Um comentário interessante, sutil e poderoso:

> Outro problema com o custo é que maiores investimentos geralmente alimentam objetivos secundários, como status ou prestígio. "É claro, eu tenho um projeto com 150 pessoas." Isso pode levar a projetos que falham porque o gerente queria impressionar. No fim, que status existe em escalar 10 programadores para o mesmo projeto e entregá-lo na metade do tempo?


### Tempo

Feedback de sistemas em produção tem muito mais qualidade do que especulações. Dar um projeto tempo demais irá prejudicá-lo, pois levará mais tempo para coletar informações valiosas.

Dê ao projeto muito pouco tempo e a qualidade se deteriora...

Solução: trabalhar com iterações curtas, limitadas a pequenas entregas de escopo bem definido.


### Qualidade

> Você pode ter ganhos a curto prazo se deliberadamente sacrificar a qualidade, mas o custo - humano, comercial e técnico - é enorme.

Abrir mão da qualidade gera o *infamous* debito técnico.

Esse tema me faz lembrar de uma coisa que li no [[Code Complete - 3.2. Determine the Kind of Software You're Working On]]. Para cada tipo de software existe uma abordagem mais apropriada. Imagino eu que em Hackathons e construção de MVPs, abrir mão da qualidade para fazer algo muito rápido pode ser uma decisão aceitável. O perigo é querer evoluir a partir de uma versão feita sem qualidade para ser concluída rapidamente.

> Qualidade não é verdadeiramente uma variável livre. Os únicos valores possíveis são "excelente" ou "insanamente excelente", dependendo se vidas estão em jogo ou não. Do contrário você não aprecia o seu trabalho, não trabalha bem e o projeto vai por água abaixo.


### Escopo

Dessas 4, a que temos mais espaço para ajustes é o escopo.



## XP 05 - O Custo das Modificacoes

Se não for usada disciplina alguma, o custo de modificações em projetos de software tende a crescer exponencialmente a medida que o projeto avança.

> Um problema que talvez custe um dólar para ser consertado quando encontrado durante a análise de requisitos pode custar milhares de dólares quando o software estiver em produção.

Isso é um estímulo a tentarmos ao máximo tentar antever problemas precocemente. O problema disso é que normalmente projetos de software se baseiam em muitas incertezas e os requisitos mudam constantemente.

As práticas de XP visam "abraçar as mudanças" e sempre trabalhar com isso em mente. Daí vem a importância das práticas de TDD.

A intenção é fazer com que o custo das modificações ao longo do tempo se estabilize.


## XP 07 - Quatro Valores

- Comunicação
- simplicidade
- feedback
- coragem


### Comunicação

Já testemunhei esse cenário muitas vezes:

> Quando analisamos os problemas que ocorreram nos projetos, vemos que muitos deles foram provocados por alguém que não conversou com outro alguém  sobre uma coisa importante. Algumas vezes, o programador não fala para os outros sobre uma mudança fundamental no projeto. Outras vezes, o programador não faz a pergunta certa para o cliente (...)
> 
> A má comunicação não acontece por acaso. Existem muitas circunstâncias que levam a um colapso nas comunicações. Um programador dá más notícias ao gerente e o gerente pune o programador. O cliente diz algo importante para o programador e ele parece ignorar a informação.


### Simplicidade

> "Qual é a coisa mais simples que poderia funcionar?" (...)
> 
> Simplicidade não é fácil. (...)
>
> Simplicidade e comunicação têm uma maravilhosa relação de suporte mútuo. Quando mais você se comunica, mais claramente você vê o que precisa ser feito e tem mais certeza sobre o que não precisa. Quanto mais simples for o sistema, menos você precisa comunicar sobre ele. O que nos leva a uma comunicação mais completa, especialmente se você pode simplificar o sistema o suficiente para precisar de menos programadores.

Obs.: esse tema me lembra uma coisa que vi no [[Code Complete]]: "uma das funções do Engenheiro de Software é conter a complexidade."

### feedback


### coragem


## XP 08 - Principios Basicos

- feedback rápido
- simplicidade presumida
- mudanças incrementais
- aceitação das mudanças
- alta qualidade

### feedback rápido

Colocar em produção e coletar feedback o mais rápido possível!

### simplicidade presumida

Achei esse trecho bem valioso:

> **Trate cada problema como se pudesse ser resolvido de maneira ridiculamente simples**. O tempo que você economiza nos 98% dos problemas para os quais isso será verdade lhe dará muitos recursos para aplicar nos outros 2%. De certa forma, **esse é o princípio que os programadores têm mais dificuldade em aceitar**.

Opa! Se é uma coisa válida e a maioria tem dificuldade em aceitar, significa que quem aceita se destaca.


### mudanças incrementais

> Grandes modificações feitas de uma vez só simplesmente não funcionam. (...) Qualquer problema é resolvido com uma série das menores mudanças que fazem diferença.

É a mesma pegado do commits com pequenas mudanças muito mencionado pela cultura DevOps.


### aceitação das mudanças

> A melhor estratégia é aquela que preserva o maior número de opções **enquanto resolve o seu problema mais urgente**.

Confesso que essa 👆 afirmação me deixou um pouco dividido. É importante estar atento ao "enquanto resolve seu problema mais urgente", mas quando se fala de "preservar o maior número de opções", isso me assusta um pouco.