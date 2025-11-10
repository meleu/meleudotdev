---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: "2024"
author: "Saleem Saddiqui"
---
# Learning Test-Driven Development

The book examples are written in Go, JavaScript and Python. I wrote a Ruby version for each chapter and published in this repository: <https://github.com/meleu/tdd-book-code-ruby>

### Conventional Commits

[semantic commit messages](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)

### Depending on testing code

> #### Unidirectional Dependency
>
> Test code has to depend on production code - at least on those parts of production code that it tests. However, there should be no dependencies in the other direction.

### When to remove a test

> To make our decision more objective, here's a check list:
> - [ ] Would we have the same code coverage if we delete a test?
> - [ ] Does one of the tests verify a significant edge case?
> - [ ] Do the different tests provide unique value as living documentation?


### Why write a test when the feature is likely already there?

> What could a new test possibly drive, if the development has already been done?
>
> 1. To repeat: a new test would _increase your confidence_ in this feature, even if no new production code is necessary.
> 2. The new test would serve as _executable documentation_ of this feature.
> 3. The test may expose _inadvertent interactions_ between existing tests, thereby prompting us to address them.

