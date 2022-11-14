---
dg-publish: true
tags:
  - books
read-timestamp: 2022-11
author: Frederik Brooks
---

# O Mitico Homem-Mes

#books/tech 

## 16. Não Existe Bala de Prata

- Essência e Acidente em Engenharia de Software

> Não há um único desenvolvimento, seja em tecnologia ou em técnica de gestão, que, por si só, prometa sequer uma ordem de grandeza de melhoria dentro de uma década, seja em produtividade, confiabilidade ou simplicidade.

O recado aqui é de que não existe uma única prática que vai trazer ganhos enormes em produtividade/confiabilidade/simplicidade.

Portanto, ao invés de procurar uma única prática milagrosa, devemos aplicar um conjunto de boas práticas em prol desse objetivo.

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





