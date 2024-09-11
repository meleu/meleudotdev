---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2024
author: Kent Beck
---

# Tidy First?

Minirrefatorações para um melhor design de software.

> **O acoplamento e a coesão são medidas de complexidade do código**, não da perspectiva dos computadores e, sim, **da perspectiva dos seres humanos que tentam compreender o código.**


## Tydings

### 1. Cláusulas de Guarda

Guard clauses geralmente são `if`s usadas para validar o input.

Colocar as guard clauses logo no início da função, já retornando falha se houver problema.

Tudo abaixo das guard clauses já deve considerar que o input está válido.

Isso ajuda a evitar muitos `if`s aninhados.

### 2. Código morto

Código morto deve ser deletado. Se achar que precisa dele, pegue no histórico de commits.


### 3. Normalize simetrias (ou mantenha a consistência)

Existem diferentes maneiras de escrever um algoritmo para resolver o mesmo problema.

Se o seu código resolve o mesmo problema porém escrito de forma diferente, isso tem um custo cognitivo desnecessário.

> Como leitor, você espera que diferença signifique mesmo diferença.

Escolha uma forma e mantenha essa consistência na sua base de códigos.


### 4. Interface nova, implementação antiga

> Digamos que precise chamar uma rotina, e a interface faz com que isso seja difícil/complicado/confuso/entediante. Implemente a interface que gostaria de chamar e chame. Basta implementar a interface nova chamando a interface antiga.

Lembro que usei isso pra criar interfaces com o `dialog`.


### 5. Ordem de leitura

Aqui é o conceito de "ler o código como se fosse uma notícia" que é mencionada pelo Robert Martin


### 6. Ordem de coesão

> Reordene o código, de modo que os elementos que você precisa alterar fiquem próximos uns dos outros.


Até entendi o que ele quer dizer, mas a explicação não ficou muito clara pra mim. Talvez um exemplo aqui seria de grande ajuda.


### 7. Mova declaração e inicialização juntas


