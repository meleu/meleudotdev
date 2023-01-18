---
dg-publish: true
tags:
  - books
read-timestamp: 2023
author: Chad Fowler
---

# O Programador Apaixonado

[TOC]

---

Muita dica útil para a carreira de Desenvolvedor.

## Escolhendo seu mercado

Ver também: [[Pragmatic Programmer]] - programar por coincidência.

Sua carreira é um negócio, e seu produto é o conjunto de serviços que você tem a oferecer.

Perguntas a serem feitas:

- Em quais tecnologias eu devo investir?
- Em qual domínio eu devo me tornar um expert?
- Devemos ampliar nosso leque de conhecimentos ou ir a fundo em algo?
- Quais serviços você oferece?
- Para quem você vai vendê-los?
- A procura pelos seus serviços vai aumentar ou diminuir nos próximos anos?
- Qual o tamanho do risco que você quer correr nessas escolhas?

#### meus comentários

Algumas dessas perguntas são questionamentos que me fizeram querer migrar de DevOps para Dev.

Fico com uma sensação que quanto mais baixo-nível um serviço é oferecido, mais ele tem chances de se tornar uma commodity.

Exemplos

1. Eletrônica é a coisa mais baixo nível da computação. Lá nos anos 90, quando os computadores começaram a se popularizar nas casas das pessoas, saber **montagem e manutenção em computadores** era uma skill valiosa a se ter. Hoje os computadores são tão baratos que quando dá defeito muitas vezes é mais barato trocar.
2. Houve tempo em que saber **montar servidores** em um data center era uma skill interessante. Hoje a maioria dos trabalhos envolve usar recursos oferecidos por cloud providers.
3. Mesma coisa para **administração de sistemas**. É uma área que evoluiu bastante. O conceito de infraestrutura imutável mudou a maneira como administramos nossos servidores e instalamos software. Muito conhecimento foi abstraído por ferramentas como terraform, ansible, docker e kubernetes.
4. Ainda sobre administração de sistemas, hoje em dia temos Function as a Service. Abstraindo todas a camadas inferiores de infraestrutura e fazendo com que você se preocupe apenas com sua lógica de negócio.

Em todos os exemplos listados acima, tais trabalhos ainda são necessários e realizados por alguém. Mas são realizados por pessoas altamente especializadas naquilo, competindo com mais um monte de gente especializada naquilo. Portanto o valor da hora trabalhada dessas pessoas tende a diminuir.

Esse tipo de conversa também me traz perguntas como:

##### Qual linguagem/framework/stack/tecnologia devo estudar?

Algumas coisas são muito incertas, mas existem outras que eu acredito que permanecerão relevantes por muito tempo.

Tentando listar do mais básico do básico até decisões de mais alto nível.

- datilografia
    - meio óbvio né? apesar de saber que existem alternativas de como "inserir código em computador", acredito que o teclado permanecerá o uso mais popular por mais algumas décadas.
- Se sentir confortável na linha de comando.
    - vulgarmente conhecido como "saber usar o Linux"
    - bash / sed / grep / e afins
- vim / neovim
    - pode parecer "opinionated", mas eu observo uma "explosão" na minha produtividade quando uso o vim (e quando vejo colegas realizando algumas tarefas editando texto observo o quanto eles estão se arrastando para fazer algo que no vim eu faria "na velocidade do pensamento")
    - embasando minha opinião: o vim existe há décadas e permanece relevante. O neovim, que tem uma comunidade de desenvolvimento mais ativa, está lentamente tomando o espaço do vim. Portanto aprender a usar vim/neovim não será um tempo desperdiçado.
- docker/containers
    - a tecnologia do containers permanecerá relevante por algumas décadas. Tempo investido estudando containers certamente será um tempo muito bem investido.
- linguagem de programação
    - eu tenho as minhas preferências, mas, seja lá qual for a linguagem, é importante que ela tenha as seguintes características:
    - um linter
    - um formatter (um coding style consagrado também ajuda bastante)
    - um gerenciador de pacotes para usar bibliotecas de terceiros
    - ferramentas/framework de testes
    - uma comunidade open source ativa (onde você pode aprender olhando o código dos outros)

...


### Liderar ou sangrar? - early adopter ou legacy coder?

Sobre curva de adoção de uma tecnologia. Pegar o hype ou fazer manutenção de legados?

> As duas pontas da curva de adoção devem provar serem lucrativas.

Pegar o hype é sempre legal. Paga-se muito bem. Mas também há o risco de investir em uma tecnologia que não vai vingar.

O autor também mencionado que há um papel a ser preenchido por desenvolvedores: **o asilo da tecnologia**. Lidar com sistemas legados, fazer com que eles se comuniquem com sistemas mais modernos, ou até mesmo reescrevê-los...

Achei interessante ao menos tomar ciência desse "nicho de mercado".


#### faça algo

- liste tecnologias recentes, médias e antigas baseada no mercado atual. Antigas à esquerda, mais modernas à direita. Tente mapear aonde você está.


### Oferta e demanda

Capítulo com insights muito bons!

Sobre o trabalho de web designers no início da internet nos anos 90:

> Conforme as pessoas perceberam os valores cobrados por esses web designers, mais e mais pessoas começaram a pegar livros de HTML e aprender a tecnologia por conta própria.

Tenho a impressão que se substituirmos "web designers" por "arquitetos DevOps" e "HTML" por "Kubernetes" teremos um retrato do cenário atual. 😅

Uma coisa que parece óbvia, mas que mesmo assim gostei de perceber é que:

- Alta procura por um serviço que está com baixa oferta faz o preço crescer
- Ao ver o preço crescer, muita gente se interessa em aprender e oferecer aquele serviço.
- Quando há muito gente oferecendo o serviço, o preço vai baixar.
- A medida que o preço abaixa, a procura aumenta (mais empresas querem/podem pagar pelo serviço).
- Esse ciclo vai se repetindo até que oferta/procura/preço atingem um certo ponto de equilíbrio.

O trecho a seguir ilustra isso:

> Em um determinado momento, a inundação de web designers de médio e baixo custo regrediu. Web designers menos talentosos foram substituídos por usuários finais e outro pessoal de TI que não necessariamente dominava HTML. Nesse ponto, a oferta, demanda e o preço de desenvolvimento chegaram a um equilíbrio.



