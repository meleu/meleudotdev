---
dg-publish: true
---
TARGET DECK: SandiMetz

Q: The reason we cost money...
A: ... is the time we spend reading code.
(valid for humans and AI)
<!--ID: 1744849487081-->




---

Q: Steps for working on a new feature:
A: 1. Improve the tests (if needed)
2. Refactor with Open-Closed principle in mind
3. Implement the new feature
<!--ID: 1744849487084-->




---

Q: Preparing for a new feature
A: - Open-Closed principle in mind
    - Remove code smells (Refactoring book)
    - Repeat until your code is "open" to the new requirement
<!--ID: 1744849487087-->




---

Q: Flocking rules to **create abstractions**
A: 1. Select the things that are most alike
2. Find the smallest difference between them.
3. Make the simplest change that will remove that difference.
<!--ID: 1744849487090-->




---

Q: Tiny steps to remove differences in code
A: 1. parse the new code (e.g.: create the method)
2. parse and execute it (e.g.: call the method)
3. parse, execute and use its result (e.g.: use the returned value)
4. delete unused code
<!--ID: 1744849487092-->




---

Q: Following the flocking rules in small steps
A: - change only one line at a time
- run tests after every change
- if the tests fail, undo and make a better change
(similar to `Test && Commit || Revert`)
<!--ID: 1744849487095-->




---

Q: First steps to start writing tests:
A: - Define the API.
- Write a test for the simplest thing you understand.
- do the minimal to have a green
- Next test: fastest and simplest way to prove current code is wrong.
<!--ID: 1744849487098-->




---

Q: Code is easy to understand when...
A: ... it clearly reflects the problem it's solving.
<!--ID: 1744849487102-->




---

Q: The first thing about the art of test writing...
A: ... is to validate **what** the code does without any knowledge of **how**.
<!--ID: 1744849487105-->




---

Q: The benefits of writing the minimum amount of code to pass the tests:
A: - maximize your understanding of the problem...
- to unearth all available information...
- **before committing to abstractions**.
- (prevent over-engineering with low knowledge about the problem)
<!--ID: 1744849487108-->




---

Q: Open-Closed principle
A: Objects should be open for extension, but closed for modification.
<!--ID: 1744849487111-->




---

Q: When to refactor?
A: When your code is not yet open to the new requirement.
<!--ID: 1744849487114-->




---

Q: It's common to find that hard problems are hard only because...
A: ... the easy ones have not yet been solved.
<!--ID: 1744849487119-->

---

Q: 3 techniques to find a good name
A: 1. what's the responsibility of the method to be created?
2. One layer of abstraction above the concrete code.
3. Not too far away from the domain.
<!--ID: 1744978550377-->



---

Q: The point of Liskov Substitution Principle
A: objects have to be what they say they are.
<!--ID: 1746293635211-->


---

Q: My biggest goals in writing code.
A: I want my code to be understandable and to reduce the cost of the inevitable changes.
<!--ID: 1746293635216-->


---

Q: The essence of factories...
A: Factories don't know what to do, they know how to choose who does.
<!--ID: 1746293635219-->

---

Q: 5 steps to extract class
A: 1. choose a name
2. add `attr_reader`/`initialize`
3. **copy** methods from old to new
4. wire new class into old
5. clean up extra args
<!--ID: 1746897583283-->



---

Q: An object that's hard to test is...
A: ... warning you that it will be difficult to reuse.
<!--ID: 1746897583292-->


---

Q: Experienced OO programmers know that applications most easily adapt to the unknown future if they:
A: - resist giving instance methods knowledge of concrete class names, and...
- seek opportunities to move the object creation towards the edges of the application.
<!--ID: 1746897583297-->


---

Q: 5 precepts of OOP aesthetics
A: 1. Put domain behavior on instances.
2. Be averse to allowing instance methods to know the names of constants.
3. Seek to depend on injected abstractions rather than hard-coded concretions.
4. Push object creation to the edges, expecting objects to be created in one place and used in another.
5. Avoid Demeter violations, using the temptation to create them as a spur to search for deeper abstractions.
<!--ID: 1746897583302-->


