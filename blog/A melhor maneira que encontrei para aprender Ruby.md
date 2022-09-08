---
dg-publish: true
title: A melhor maneira que encontrei para aprender Ruby
subtitle: Veja o que fiz para adquirir fluência na linguagem Ruby.
slug: aprenda-ruby
tags: 
  - ruby
domain: meleu.hashnode.dev
---

# A melhor maneira que encontrei para aprender Ruby

Esse artigo contem uma lista de coisas que estão funcionando muito bem para o meu aprendizado da linguagem Ruby. Estou compartilhando aqui pois acredito que também possa ter alguma valia para pessoas que tenham um perfil parecido.

Reforço que o objetivo aqui **NÃO** é aprender programação (muito básico), e nem aprender a desenvolver aplicações web usando Ruby (muito avançado).

O material que indico aqui tem o objetivo bem específico de **ganhar fluência na linguagem Ruby o mais rápido possível**.


## Versão Resumida

- Premissas:
    - saber ler em inglês.
    - já ter alguma noção de programação.
    - saber pelo menos os conceitos básicos de programação orientada a objetos.

- Leia [Ruby in 100 Minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html) para ter uma boa noção inicial da sintaxe.
- Faça os desafios da [trilha Ruby no exercism.org](https://exercism.org/tracks/ruby).
- Brinque com os [Ruby Koans](https://github.com/edgecase/ruby_koans) para ir fixando os conceitos mais fundamentais da linguagem.



## Premissas

Os conteúdos listados aqui estão em inglês, portanto é importante saber ler nesse idioma.

Para fazer os exercícios dos links que listo aqui, é muito conveniente que você se sinta confortável na linha de comando (se você é completamente novato, recomendo [esse conteúdo gratuito e em português produzido pelo Blau Araujo](https://youtube.com/playlist?list=PLXoSGejyuQGqJEEyo2fY3SA-QCKlF2rxO))

O meu objetivo aqui **não** é aprender a programar, estou assumindo que você já tenha alguma noção de programação. O objetivo aqui é adquirir fluência na linguagem Ruby.

Algum conhecimento dos fundamentos de programação orientada a objetos pode ajudar, mas acredito não ser tããão necessário pra começar.



## Contato inicial com a linguagem

Se estiver com 1 hora e 20 minutos disponível, pode ser legal assistir o vídeo [Fábio Akita](https://www.akitaonrails.com/) sobre [A História do Ruby on Rails](https://youtu.be/oEorhw5r2Do). Eu gostei bastante do vídeo e acabei conhecendo alguns conteúdos que parecem ser bem bacanas (mas que ainda não explorei a fundo).

Se já quer partir pra ação, leia o [Ruby in 100 minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html). Aqui você vai conhecer a sintaxe básica da linguagem.

Uma coisa que pra mim foi bem legal, foi entender o conceito de [Blocks](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html#6.-blocks). Descobrir que blocos são passados para métodos foi meio que 🤯 *mindblowing* pra mim. Algumas engrenagens clickaram na minha cabeça e comecei a ter aquela apreciação pela beleza da linguagem.

Exemplo:
```ruby
# podemos fazer "for" desse jeito (meio parecido com bash)
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

De acordo com a [Wikipedia](https://pt.wikipedia.org/wiki/Koan):

> Um *koan* é uma narrativa, diálogo, questão ou afirmação do budismo zen que contém aspectos que são inacessíveis a razão. Desta forma, o *koan* tem, como objetivo, propiciar a iluminação espiritual do praticante do budismo zen.

OK, isso parece viajação demais... Vamos abstrair essa parte filosófica e nos concentrar no aspecto técnico.

Os Ruby Koans são testes que estão "quebrados" e que você terá que corrigir. E a medida que você vai corrigindo você vai aprendendo/fixando alguns conceitos mais fundamentais da linguagem Ruby.

Eu achei uma abordagem muito bacana e me ajudou a enxergar facilmente algumas coisas sutis. Exemplo: o operador `<<` "shovel" muda a string original quando fazemos algo desse tipo:
```ruby
original_string = "Hello, "
hi = original_string
there = "World"
# o operador << "shovel" aqui vai alterar
# ambos, 'hi' e 'original_string'
hi << there
puts hi
# => "Hello, World"
puts original_string
# => "Hello, World"
```

O site dos Ruby Koans é o <http://rubykoans.com/>, mas eu recomendo que você vá pelo repositório: <https://github.com/edgecase/ruby_koans>

Aqui coloco um bizu bem direto ao ponto, mas recomendo que você consulte o README do repositório:

```bash
# clonando o repositório
git clone git@github.com:edgecase/ruby_koans.git
cd ruby_koans

# checando se o ruby está instalado
# se não tiver, recomendo que use o asdf-vm
ruby --version
rake --version

# gerando os koans
rake gen

# se no futuro você precisar/quiser gerar os
# koans novamente para estudar desde o início,
# use esse comando:
rake regen

# para executar todos os testes na ordem sugerida:
rake
# que é a mesma coisa que executar isso:
ruby path_to_enlightenment.rb

# você também pode executar um koan específico
# exemplo:
ruby about_symbols.rb
```

Grande parte do processo de aprendizado com os Ruby Koans, é você ir iterando nos seguintes passos

1. executar o teste no terminal e ver aonde está falhando
2. editar o arquivo para concertar o teste
3. voltar ao passo 1

Cedo ou tarde você vai ficar entendiado de ficar alternando entre o terminal pra testar e o editor de código pra ajeitar os testes.

Para ajudar nessa tarefa, pidemos usar o `observr`, desse jeito:
```
# instalar o observr gem
gem install observr

# rodar os testes a cada alteração
# em qqr um dos koans
observr ./koans/koans.watchr
```

Pronto, agora vc pode deixar uma janela com o editor e outra com observr executando os testes a cada vez q vc salvar o arquivo.


## Coisas que tentei antes de chegar aqui

- [Ruby in 20 minutes](https://www.ruby-lang.org/en/documentation/quickstart/) - não achei as explicações muito coesas. Por isso preferi o "Ruby in 100 minutes".
- [codewars.com](https://codewars.com) - a proposta até que é legalzinha, mas achei o exercism bem mais amigáve e sem propagandas.
- [The Well-Grounded Rubyist, 3rd Edition](https://www.manning.com/books/the-well-grounded-rubyist-third-edition) - comecei lendo o livro, mas achei meio "devagar". Continuo lendo devagarinho para fixar alguns conceitos, pois ele explica com profundidade. Mas pra ganhar fluência rápida, eu já pulei pro exercism.


## Coisas que quero tentar depois que estiver fluente

Material que me foi recomendado por rubyistas já calejados:

- [[Practical Object-Oriented Design]] - livro de Sandi Metz
- [Confident Ruby](https://pragprog.com/titles/agcr/confident-ruby/) - livro de Avdi Grimm
- [Metaprogramming Ruby 2](https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/) - livro de Paolo Perrotta