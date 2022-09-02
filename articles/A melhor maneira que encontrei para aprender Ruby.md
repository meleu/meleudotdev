---
dg-publish: true
---
# A melhor maneira que encontrei para aprender Ruby

Neste artigo listo a melhor maneira que encontrei para aprender Ruby.

Preciso reforçar que essa é uma lista de coisas que funcionaram muito bem **para mim**, e isso não significa que funcionará para qualquer pessoa.

Eu vou listar a sequência que eu recomendo caso você atenda algumas premissas. Ao final do artigo eu listo outros conteúdos que tentei antes de chegar na lista atual.


## Não quero ler isso tudo, me diz logo o que tenho que fazer

- Premissas:
    - saber ler em inglês.
    - já ter alguma noção de programação.
    - saber pelo menos os conceitos básicos de programação orientada a objetos.

- Leia [Ruby in 100 Minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html) para ter uma boa noção inicial da sintaxe.
- Faça os desafios da [trilha Ruby no exercism](https://exercism.org/tracks/ruby).
- Brinque com os [Ruby Koans](https://github.com/edgecase/ruby_koans) para ir fixando os conceitos mais fundamentais da linguagem.


## Premissas

Os conteúdos listados aqui estão em inglês, portanto é importante saber ler nesse idioma.

Para fazer os exercícios dos links que listo aqui, é muito conveniente que você se sinta confortável na linha de comando (se você é completamente novato, recomendo [esse conteúdo gratuito e em português produzido pelo Blau Araujo](https://youtube.com/playlist?list=PLXoSGejyuQGqJEEyo2fY3SA-QCKlF2rxO))

O meu objetivo aqui **não** é aprender a programar, estou assumindo que você já tenha alguma noção de programação. O objetivo aqui é adquirir fluência na linguagem Ruby.

Um conhecimento dos fundamentos de programação orientada a objetos pode ajudar, mas acredito não ser tão necessário pra começar.


## Por que eu decidi aprender Ruby

Depois de alguns anos atuando como DevOps Engineer, resolvi migrar para área de desenvolvimento web (em algum outro artigo eu falo sobre minhas motivações).

Passei um bom tempo pesquisando qual seria a maneira mais rápida de fazer essa migração e cheguei a conclusão que seria cursando um *coding bootcamp*. Após muitos dias de pesquisa observei que o mais bem avaliado é o [curso de Web Development do Le Wagon](https://www.lewagon.com/rio/web-development-course/full-time). E nesse curso a linguagem usada no backend é o Ruby.

Existem outros motivos que me fizeram gostar ainda mais da linguagem, exemplos:

- é uma linguagem realmente "gostosa" de usar
- a biblioteca padrão é rica
- a comunidade Ruby tem uma forte cultura em prol do TDD

Porém, mesmo com esses pontos positivos, o verdadeiro motivo pelo qual resolvi mergulhar no Ruby foi pra fazer o curso.


## Contato inicial com a linguagem

Se estiver com 1 hora e 20 minutos disponível, pode ser legal assistir o vídeo [Fábio Akita](https://www.akitaonrails.com/) sobre [A História do Ruby on Rails](https://youtu.be/oEorhw5r2Do). Eu gostei bastante do vídeo e acabei conhecendo alguns conteúdos que parecem ser bem bacanas (mas que ainda não explorei a fundo).

Se já quer partir pra ação, leia o [Ruby in 100 minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html). Aqui você vai conhecer a sintaxe básica da linguagem.

Uma coisa que pra mim foi bem legal, foi entender o conceito de [Blocks](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html#6.-blocks). Descobrir que blocos são passados para métodos foi meio que 🤯 *mindblowing* pra mim. Algumas engrenagens clickaram na minha cabeça e comecei a ter aquela apreciação pela beleza da linguagem.

Exemplo:
```ruby
# podemos fazer for desse jeito (meio parecido com bash)
for i in 0..5 do
  puts i
end

# e também tem esse jeito aqui, que a meu ver fica com
# uma leitura mais "natural".
5.times do |i|
  puts i
end
```


## Desafios do exercism

Uma vez que já conhecemos o vocabulário básico da linguagem, vamos começar a botar a mão na massa e praticar.

A minha recomendação é fazer os desafios presentes na [trilha de Ruby do exercism.org](https://exercism.org/tracks/ruby). Os exercícios começam bem simples e vão progredindo lentamente em complexidade.

Recomendo sempre ficar atento a pegar os exercícios marcados como Easy. Mesmo que você resolva os problemas lógicas de maneira trivial, o objetivo aqui é ir pegando fluência na linguagem.

Por mais que os exercícios iniciais possam parecer fáceis de resolver, o fato de estar escrevendo em Ruby vai criando aquela fluência que faz com que você comece a pensar diretamente usando a linguagem. Isso pra mim é um ganho gigantesco.

Uma coisa que eu gosto de fazer é colocar as minhas soluções em um [repositório no git](https://github.com/meleu/exercism/), e ainda vou fazendo algumas anotações das coisas que aprendo em cada exercício. Você pode ver um [exemplo das minhas anotações aqui](https://github.com/meleu/exercism/blob/master/ruby/README.md).

A seguir falo um pouco sobre o exercism. Se você já conhece a plataforma, pode pular essa parte...

### Por que o exercism é tão bom

O [exercism.org](https://exercism.org) é uma plataforma maravilhosa para adquirir fluência em qualquer linguagem (atualmente eles têm trilhas para 61 linguagens).

Eu não conheço nenhuma alternativa de aprendizado de uma nova linguagem de programação que seja melhor do que o exercism.

Eu sou um grande fã de aprender lendo livros, e continuo achando que livros são uma excelente fonte de referência. Mas digo que o exercism é melhor pra aprender e ganhar fluência, pelos seguintes motivos:

**Os exercícios são do tipo *Test-Driven Development* (TDD).**

Isso significa que você vai resolver o problema proposto no desafio e vai rodar um teste que vai te dizer na hora se você conseguiu resolver o problema.

Você pode ir aperfeiçoando (refatorando) seu código e ir executando os testes novamente para conferir novas maneiras de resolver o problema. Sem precisar ficar testando "na mão". Isso é muito maravilhoso! 

**Você vai aprender muito vendo as soluções submetidas por outras pessoas**

Uma excelente maneira de aprender os "macetes" de uma determinada linguagem é você ver como que pessoas mais experientes naquela linguagem fazem.

No exercism, uma vez que você submete a sua solução, você tem acesso às soluções das outras pessoas. E essa é uma excelente maneira de você ir aprendendo aquelas soluções idiomáticas, que fazem um bom uso das características específicas da linguagem.

Eu recomendo muito que após submeter sua solução você gaste alguns minutinhos dando uma olhada no código das outras pessoas e tentar entender o que elas estão fazendo.

Lembra que eu falei que estamos usando TDD? Pois então! Você pode pegar trechos de código dos colegas, testar na sua solução e rodar os testes novamente.

Se você não entender o que o colega fez, você vai dar uma olhada na documentação oficial da linguagem e vai passar a entender.

Repito: não conheço maneira mais efetiva de ganhar fluência numa linguagem de programação.


## Ruby Koans - Reforçando os fundamentos da linguagem

FALAR SOBRE O Ruby Koans!!!

- <https://github.com/edgecase/ruby_koans>



## Coisas que tentei antes de chegar aqui

- [Ruby in 20 minutes](https://www.ruby-lang.org/en/documentation/quickstart/) - não achei as explicações muito boas...
- [codewars.com](https://codewars.com) - a proposta até que é legalzinha, mas o exercism é melhor.
- [The Well-Grounded Rubyist, 3rd Edition](https://www.manning.com/books/the-well-grounded-rubyist-third-edition) - comecei lendo o livro, mas achei meio "devagar". Continuo lendo devagarinho para fixar alguns conceitos, pois ele explica com profundidade. Mas pra ganhar fluência de forma mais rápida, eu já pulei pro exercism.
