---
dg-publish: true
---
# Desenvolvimento Agil Limpo - 5. Praticas Tecnicas

- Voltar para [[Desenvolvimento Agil Limpo]]

---

## Principais Aprendizados

Basicamenete. Estudar as práticas XP:

- TDD
- Refatoração
- Design Simples
- Programação em Dupla

> Sem o TDD, a Refatoração, o Design Simples e, sim, até mesmo sem a Programação em Dupla, a agilidade se torna uma sombra inexpressiva e estéril do que deveria ser.
>
> Qualquer tentativa de utilizar as práticas ágeis sem as práticas técnicas está condenada ao fracasso. (...) A agilidade é um mecanismo eficiente que pode instaurar uma bagunça generalizada muito rápido.

Para me aprofundar nessas práticas, eu montei uma lista de livros a serem conferidos: [[TDD-Refactoring literature]].

---

## TDD

### As 3 Regras do TDD

1. Não escreva nenhum código de produção antes de elaborar um teste que falhou devido à falta desse mesmo código.
2. Não escreva mais tetes do que o suficiente para identificação da falha - e falhas na compilação ainda contam como falhas.
3. **Não escreva mais códigos de produção do que o suficiente para passar nos testes.**

> Quando o teste passa, é possível tomar uma decisão. Essa decisão é *fazer o deploy*.

### Principais vantagens do TDD

- 🏆 Coragem (segurança) para implementar mudanças sem quebrar a aplicação
- menos debugging
- redução da documentação
- diversão
- completude
- desacoplamento


### Coverage

> não é necessário 100% de completude para tomar a decisão de implementação. Uma abrangência de 85% é possivelmente tudo que precisamos.

Existe uma nuance na questão de cobertura de código que eu vejo como problemática...

O Uncle Bob alega que

> [!warning] Aviso
> 1. A cobertura de teste é uma métrica da equipe, **não uma métrica de gerenciamento**. (...) *Gerentes não devem usar essa métrica como meta ou objetivo.*
> 2. **Não falhe em executar o build com base em uma cobertura insatisfatória**.


Acho que a premissa básica para o Uncle Bob afirmar estas coisas é que o time técnica entende a importância da cobertura de testes. Na minha (curta) experiência profissional eu não vi muita empolgação nos desenvolvedores por esse tipo de prática. De forma que se não for uma coisa cobrada pela gerência, dificilmente haverá adesão a esta prática.

Em relação ao item 2, isso me lembrou o SonarQube quebrando a pipeline no meu primeiro trampo... Lembro que era uma coisa que pelo menos alguns devs gostavam. Mas aqui o Uncle Bob afirma que não deveríamos usar cobertura de código como um quesito para quebrar a pipeline.


### Design

> Como fazer com que as funções sejam fáceis de testar? Usando o desacoplamento. Na realidade, a testabilidade é apenas um sinônimo de desacoplamento.

Achei interessante isso 👆. É como se a prática de TDD, e a "arquitetura desacoplada" fossem coisas que se complementam e se fortalecem.

### Coragem

Vou repetir essa história exatamente como está no livro. Quero ter ela a mão pois é algo que é sempre bom lembrar como um cenário que eu devo fugir:

> Imagine que você esteja analisando um código antigo em sua máquina e ele está uma zona. Você pensa consigo mesmo: "Eu deveria limpá-lo". Em seguida, pensa: "Não vou pôr a mão nisso!", porque sabe que , se pôr a mão no código, vai quebrá-lo; e se quebrá-lo, esse código passará a ser seu. Então, você vira as costas para o código, deixando-o apodrecer e se deteriorar.
> 
> É uma reação medrosa. Você tem medo do código (..) do que acontecerá com você se quebrá-lo. Logo não consegue fazer a única coisa que pode melhorar o código: não consegue limpá-lo.
> 
> Se todo mundo na equipe se comportar dessa forma, o código apoderece. Ninguém o limpará. Ninguém fará melhorias. Cada funcionalidade adicionada será acrescentada de forma a minimizar o risco imediato para os programadores. Acoplamentos e duplicações serão adicionados porque atenuam o risco imediato, ainda que corrompam o design e a integridade do código.
> 
> **Mais cedo ou mais tarde, ele se tornará um código espaguete tão denso e insustentável que será quase impossível fazer algum progresso.** As estimativas crescerão exponencialmente. Os gerentes entrarão em desespero. Cada vez mais programadores serão contratados na esperança de aumentar a produtividade, só que ela nunca aumentará.

O antídoto para isso 👆 é uma suíte de testes completa, onde você pode fazer mudanças sem medo.


## Refatoração

> A prática da refatoração casa perfeitamente com o TDD. Para refatorar o código sem medo, precisamos de uma suíte de testes que nos passe bastante confiança de que não estaremos quebrando nada.

Tem uma coisa que Uncle Bob destaca como algo a não ser feito: **Refatoração nunca deve aparecer em um planejamento**, a refatoração simplesmente faz parte da nossa abordagem diária para escrever software.

Eu já tive que fazer isso em dois trabalhos que ingressei. O código era tão insuportável que não havia como não refatorar (se bem que o que fiz foi mais reescrita do que refatoração). Devo mencionar que estou me referindo a código de pipeline, criado por "pessoal de DevOps" (não são pessoas com background de programação).

Uncle Bob diz:

> Não reservamos tempo no cronograma para refatorações tão grandes. Ao contrário, fazemos a migração do código um passinho de cada vez, ao mesmo tempo que prosseguimos com o acréscimo das funcionalidades novas durante o ciclo ágil de costume.


## Design Simples

Confesso que não pesquei muito bem o que esse tal de "Design Simples" significa, mas acredito que o livro [Understanding the Four Rules of Simple Design](https://leanpub.com/4rulesofsimpledesign) pode ajudar.

> As regras de Kent Beck para o Design Simples são:
>
> 1. Execute todos os testes
> 2. Expresse a intenção
> 3. Elimine a duplicação
> 4. Reduza os elementos


## Programação em Dupla

Resumo: é bom, é custoso, depende da vontade dos programadores.

Apenas dois? Ver também *mob programming*.

> jamais peça permissão para a programação em dupla. Ou para testar. Ou para refatorar... Você é o especialista. Você decide.



