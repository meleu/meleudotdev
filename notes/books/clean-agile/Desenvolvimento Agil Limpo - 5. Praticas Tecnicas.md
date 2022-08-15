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


