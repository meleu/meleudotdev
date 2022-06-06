---
dg-publish: true
---
## Capítulo 1: Introdução

### Infraestrutura Imutável

Infraestrutura imutável é um conceito fundamental importante para compreender o que o Kubernetes faz.

Uma vez que um artefato (um container) é criado, ele não é modificado. Se for necessário realizar uma atualização, deve-se construir uma nova imagem de container, e o kubernetes se encarrega de colocar o novo em cima, e matar o antigo. Uma das grandes vantagens é: se o novo estiver bugado, é fácil voltar para a versão anterior.


### Configuração Declarativa

Na configuração declarativa você informa qual é o estado desejado da aplicação (ao contrário da configuração imperativa, onde você executa comandos, passo a passo para alcançar um estado desejado).

No kubernetes usa-se configuração declarativa. Você diz o estado que deseja e o kubernetes se vira para alcançar aquele objetivo.


### Two Pizzas Team

Um parágrafo que resume bem os benefícios do "2 Pizzas Team":

> (...) o tamanho ideal de uma equipe é a "equipe duas pizzas", isto é, grosso modo, de seis a oito pessoas. Esse tamanho de grupo com frequência resulta em um bom compartilhamento de conhecimentos, uma tomada rápida de decisões e um senso comum de propósito. Equipes maiores tendem a sofrer de problemas de hierarquia, visibilidade ruim e rivalidades internas, diminuindo a agilidade e atrapalhando o sucesso.

- Times pequenos:
    - bom compartilhamento de conhecimento
    - tomada de decisões mais rápida
    - senso de propósito compartilhado entre o time
- Times grandes:
    - problemas de hierarquia
    - visibilidade ruim (??)
    - rivalidades internas