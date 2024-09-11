---
dg-publish: true
---
# Refactoring tooling

> [!note]
> I found this very interesting: <https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/install-go#refactoring-and-your-tooling>

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