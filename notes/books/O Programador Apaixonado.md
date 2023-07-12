---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2023
author: Chad Fowler
---

# O Programador Apaixonado

[TOC]

---

Muita dica útil para a carreira de Desenvolvedor.

## Escolhendo seu mercado

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

Em todos os exemplos listados acima, tais trabalhos ainda são necessários e realizados por alguém. Mas são realizados por pessoas altamente especializadas naquilo, competindo com mais um monte de gente especializada naquilo cobrando muito pouco (geralmente indianos). Portanto o valor da hora trabalhada dessas pessoas tende a diminuir.

Esse tipo de conversa também me traz perguntas como:


##### Qual linguagem / framework / stack / tecnologia devo estudar?

Algumas coisas são muito incertas, mas existem outras que eu acredito que permanecerão relevantes por muito tempo.

Tentando listar do mais básico do básico até decisões de mais alto nível.

- datilografia
    - meio óbvio né? apesar de saber que existem alternativas de como "inserir código em computador", acredito que o teclado permanecerá sendo o método mais popular por mais algumas décadas.
- Se sentir confortável na linha de comando.
    - vulgarmente conhecido como "saber usar o Linux"
    - bash / sed / grep / e afins
- vim / neovim
    - pode parecer "opinionated", mas eu observo uma "explosão" na minha produtividade quando uso o vim (e quando vejo colegas realizando algumas tarefas editando texto observo o quanto eles estão se arrastando para fazer algo que no vim eu faria "na velocidade do pensamento")
    - embasando minha opinião: o vim existe há décadas e permanece relevante. O neovim, que tem uma comunidade de desenvolvimento mais ativa, está lentamente tomando o espaço do vim. Portanto aprender a usar vim/neovim não será um tempo desperdiçado.
- git
- docker/containers
    - a tecnologia de containers permanecerá relevante por algumas décadas. Tempo investido estudando containers certamente será um tempo muito bem investido.
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

Pegar o hype é sempre legal. Paga-se muito bem. Mas você precisa estar pronto para atuar quando a tecnologia realmente vingar e começarem a surgir vagas. Portanto há o risco de investir tempo para aprender uma tecnologia que não vai vingar.

Se esperar aparecer vagas para começar a aprender, você terá que competir com outras pessoas que também estão aprendendo para preencher tais vagas, portanto você não terá uma vantagem competitiva.

Por isso a importância de aprender rapidamente (ver [[aprendendo a aprender]] e [[ztm-efficient-learning]]).

O autor também mencionado que há um papel a ser preenchido por desenvolvedores: **o asilo da tecnologia**. Lidar com sistemas legados, fazer com que eles se comuniquem com sistemas mais modernos, ou até mesmo reescrevê-los...

Achei interessante ao menos tomar ciência desse "nicho de mercado".


#### faça algo

- liste tecnologias recentes, médias e antigas baseada no mercado atual. Antigas à esquerda, mais modernas à direita. Tente mapear aonde você está.

---

### Oferta e demanda

Capítulo com insights muito bons!

Sobre o trabalho de web designers no início da internet nos anos 90:

> Conforme as pessoas perceberam os valores cobrados por esses web designers, mais e mais pessoas começaram a pegar livros de HTML e aprender a tecnologia por conta própria.

Tenho a impressão que se substituirmos "web designers" por "arquitetos DevOps", e "HTML" por "Kubernetes", teremos um retrato do cenário atual. 😅

Uma coisa que parece óbvia, mas que mesmo assim gostei de perceber é que:

- Alta procura por um serviço que está com baixa oferta faz o preço crescer
- Ao ver o preço crescer, muita gente se interessa em aprender e oferecer aquele serviço.
- Quando há muito gente oferecendo o serviço, o preço vai baixar.
- A medida que o preço abaixa, a procura aumenta (mais empresas querem/podem pagar pelo serviço).
- Esse ciclo vai se repetindo até que oferta/procura/preço atingem um certo ponto de equilíbrio.

O trecho a seguir ilustra um cenário onde ocorreu esse "equilíbrio":

> Em um determinado momento, a inundação de web designers de médio e baixo custo regrediu. Web designers menos talentosos foram substituídos por usuários finais e outro pessoal de TI que não necessariamente dominava HTML. Nesse ponto, a oferta, demanda e o preço de desenvolvimento chegaram a um equilíbrio.


Outra coisa interessante a se pensar sobre oferta/demanda é que pode ser que tenhamos uma impressão que perderemos nossos empregos quando uma determinada tecnologia for dominada pelo mercado *offshore* (aka indianos).

Na verdade a consequência desse influxo de profissionais vai fazer aumentar a oferta, consequentemente, baixar o preço, e consequentemente **aumentar** a demanda. Ocorre que teremos mais vagas, e não menos! No entanto essas vagas pagarão pouco!

> Programadores Java e .NET são baratos e existem aos montes na Índia, junto dos DBAs Oracle. Tecnologias menos populares são pouco adotadas pelas empresas de offshore. **Durante a escolha de um conjunto de tecnologias para focar em sua carreira, você deve entender os efeitos da oferta crescente e menores preços.**

Esse raciocínio foi o que me deu o empurrãozinho que faltava para eu começar a estudar [[Rust]].

Um questionamento importante para se ter em mente:

Quando você está se candidatando para um trabalho, **você quer que o seu diferencial seja o seu preço menor ou sua maior habilidade?**

Se você usa uma tecnologia amplamente difundida você estará competindo com empresas *offshore* que possuem um batalhão de pessoas com esse conhecimento. Daí que para competir com eles provavelmente o seu diferencial será o preço.

> focar em tecnologias de nicho é uma estratégia que, embora não necessariamente torne a competição menos feroz (há menos empregos para ir atrás), muda o foco da concorrência de preço para habilidade.

Há uma outra maneira de competir por habilidade...

> Para que o *offshore* funcione bem, muitas empresas percebem a necessidade de manter uma quantidade de desenvolvedores de alto nível, que definam os padrões da empresa, garantam a qualidade e provenham liderança técnica.

Portanto você tem que dar um jeito de demonstrar que você é extremamente habilidoso naquela tecnologia, a ponto de liderar a massa de profissionais *offshore*. É importante criar essa reputação de ser uma autoridade no assunto.

Um problema disso, que eu já vivenciei, é você ir trabalhar em uma empresa de tecnologia que não é gerida por pessoas que entendem a importância das boas práticas.

É o caso de um empreendedor, com alguma (mesmo que pequena) experiência com tecnologia começa a vender o serviço de tecnologia (portanto, uma empresa que oferece serviços *offshore*). Se você trabalhar nessa empresa, vai querer que os managers tenham um background técnico e entendam a importância da aplicação de boas práticas. Isso nem sempre é comum.

Isso me lembra uma coisa mencionada por Paul Graham em [Great Hackers](http://www.paulgraham.com/gh.html).

> Hackers like to work for people with high standards. But it's not enough just to be exacting. You have to insist on the right things. Which usually means that you have to be a hacker yourself. I've seen occasional articles about how to manage programmers. Really there should be two articles: one about what to do if you are yourself a programmer, and one about what to do if you're not. And the second could probably be condensed into two words: give up.


---

### Escrever código não é suficiente

O argumento aqui é que não devemos simplesmente escrever código, precisamos nos aprofundar em uma determinada área de negócio.

Se você se tornar, por exemplo, o programador de referência para desenvolver softwares para o setor imobiliário, isso será um grande diferencial.

Eu acredito que eu tenho uma grande oportunidade de me aprofundar na área de logística, já que tenho grandes amigos atuando e com bastante experiência nessa área.

> Você pode ser "apenas um programador", mas ser capaz de falar com seus clientes do negócio na linguagem de seu domínio de negócio é uma habilidade única.

Eu também pensei em outros tópicos que eu poderia ser um especialista sem precisar subir tanto para a camada de negócios, mas sim no tipo de aplicação desenvolvida. Exemplos:

- chatbots (já fiz o RABot e o logbots)
    - [teloxide](https://docs.rs/teloxide/latest/teloxide/) - Rust framework to build telegram bots
- conversão de dados para planilhas Excel para o logbots.app (não me lembro de muita coisa, apenas listando algo que eu poderia me aprofundar)
    - [Rust Excel reader](https://docs.rs/office/latest/office/)

> Se você é um músico, quando adicionar algo ao seu repertório, não significa apenas que você tocou a música uma vez. Significa que você finalmente conhece a música.

É importante pensar em quais domínios eu devo investir meu tempo. Eis algumas divagações:

- Games?
    - Eu até curto, mas percebo que não tenho a mesma vibe das comunidades gamers. Existe muita negatividade e bullshitagem.
- Healthcare?
    - Acredito ser bastante relevante, duradoura e lucrativa, mas nem sempre divertido...
- Finanças?
    - Também pare ser bastante relevante, duradoura e lucrativa. Também não parece ser muito divertido, mas muito útil! Saber lidar com dinheiro sempre é útil! 🤑
- Logística?
    - Eu teria um excelente consultor/mentor sobre essa área. Pode ser uma boa!

Seja lá qual for a área que escolher, fique antenado no que acontece nesses mercados/nichos. Leia os sites, revistas, vídeos sobre o tema.


---


### Seja o pior

Isso já é o meu lema há muito tempo, mas ainda assim consegui pescar alguns insights valiosos nesse capítulo.

Uma dica muito boa de procurar projetos open source com pessoas que estejam em um nível acima do seu:

> Encontre uma situação para você ser o pior. Você pode não se dar ao luxo de mudar de equipe, ou até mesmo de empresa, só porque quer trabalhar com pessoas melhores. Em vez disso, encontre um projeto para trabalhar como voluntário em que você possa trabalhar com outros desenvolvedores, que vão torná-lo melhor por osmose.
> 
> (...) Escolha um projeto *open source* de que você goste e cujos desenvolvedores parecem estar em um nível acima do seu. Vá até a lista de tarefas do projeto ou o histórico da lista de discussão, escolha uma funcionalidade ou uma correção de bug importante e escreva o código!

---

### Invista em sua inteligência

Basicamente um encorajamento a experimentar tecnologias novas.

Meu resumo prático: vá em exercism.org e escolha uma linguagem que desperte sua curiosidade. Comece a resolver os desafios e interaja com a comunidade.

Realmente isso é valioso e enriquecedor, mesmo que você não chegue a utilizar a tecnologia no seu trabalho "oficial", você ficará mais inteligente.

Eu pessoalmente acredito que esse valor é mais percebido internamente, pela própria pessoa. Ou seja, não é algo muito "propagandeável" (a não ser que o seu possível futuro empregador seja técnico o suficiente para saber o valor de você ter passado um tempo estudando Assembly, Lua ou Vim Script).

> Minha explicação é que, ou as pessoas boas buscam a diversidade, pois elas amam aprender coisas novas, ou ser forçado em experiências e ambientes mais exóticos criava programadores mais maduros e preparados. Eu acredito que seja um pouco dos dois. (...)
> 
> Para mim, como um gerente de contratação, a primeira razão é que isso mostra que você está interessado. Se eu sei que você aprendeu alguma coisa por causa do autodesenvolvimento e (melhor ainda) pura diversão, eu sei que você está animado e motivado sobre a sua profissão.


---


https://medium.com/@chadfowler/clone-yourself-the-step-by-step-guide-to-finding-freedom-at-work-11fdccf2f50b