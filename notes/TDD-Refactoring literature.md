---
dg-publish: true
---
# TDD/Refactoring literature

While reading [[Desenvolvimento Agil Limpo]] I became interested in a deep dive in refactoring. It requires a strong knowledge about TDD.

In this note I'm trying to list some fundamental books about these topics.

## online courses

- my very first contact was with [[ruby minitest]]
- then I went to [[RSpec - udemy]]
- and got some interesting insights from upcase's [Fundamentals of TDD](https://thoughtbot.com/upcase/fundamentals-of-tdd).
- Rails Testing Exercises (upcase): <https://thoughtbot.com/upcase/rails-testing-exercises>

## must read

- Test-Drive Development: By Example - Kent Beck (iff: B393t / 005.14)
- Understanding the Four Rules of Simple Design - Corey Haines - [link](https://leanpub.com/4rulesofsimpledesign)
- Clean Code - Robert Martin
- Refatoração: Aperfeiçoando o Design de Códigos Existentes - Martin Fowler
- Trabalho Eficaz com Código Legado - Michael Feathers
- [[eXtreme Programming Explained]]: Embrace Change - Kent Beck (iff: B393p / 005.1)


## further reading

- Clean Craftsmanship: Disciplines, Standards, and Ethics - Robert Martin - (in the comments someone says it shows good TDD practices)
- Five Lines of Code: How and when to refactor - Christian Clausen
- [[Effective Software Testing]]: A Developer's Guide - Maricio Aniche (just because it's from Aniche)
- Beyond Legacy Code: Nine Practices to Extend the Life (and Value) of Your Software - David Scott Bernstein
- Growing Object-Oriented Software, Guided by Tests - Steve Freeman, Nat Pryce


## Refactoring and its tooling

- I found this very interesting: <https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/install-go#refactoring-and-your-tooling>

A big emphasis of this book is the importance of refactoring.

Your tools can help you do bigger refactoring with confidence.

You should be familiar enough with your editor to perform the following with a simple key combination:

-   **Extract/Inline variable**. Being able to take magic values and give them a name lets you simplify your code quickly.
-   **Extract method/function**. It is vital to be able to take a section of code and extract functions/methods
-   **Rename**. You should be able to confidently rename symbols across files.
-   **go fmt**. Go has an opinionated formatter called `go fmt`. Your editor should be running this on every file save.
-   **Run tests**. You should be able to do any of the above and then quickly re-run your tests to ensure your refactoring hasn't broken anything.

In addition, to help you work with your code you should be able to:

-   **View function signature**. You should never be unsure how to call a function in Go. Your IDE should describe a function in terms of its documentation, its parameters and what it returns.
-   **View function definition**. If it's still not clear what a function does, you should be able to jump to the source code and try and figure it out yourself.
-   **Find usages of a symbol**. Being able to see the context of a function being called can help your decision process when refactoring.

Mastering your tools will help you concentrate on the code and reduce context switching.