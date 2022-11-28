---
dg-publish: true
---
# Clean Code - 3. Functions

[TOC]

---

### Chapter 3. Functions - Main Takeaways

Some rules for functions:

- Small
- Do one thing
- One level of abstraction per function
- Read code from top to bottom
- Use descriptive names
- Use as less arguments as you can (ideally zero)
- Have no side effects

> Anything that forces you to check the function signature is equivalent to a double-take. It's a cognitive break and should be avoided.

### Practicing

- <https://github.com/meleu/k8s-mapper/blob/master/k8s-mapper.sh>


---

### Small!

The functions should be small.

> Functions should not be 100 lines long. Functions should hardly ever be 20 lines long.

#### Blocks and Indenting

> [Small functions] implies that the blocks within `if`, `else`, `while` statements should be one line long. Probably that line should be a function call. Not only does this keep the enclosing function small but it also **adds documentary value because the function called within the block can have a nicely descriptive name**.

### Do One Thing

> Functions should do one thing. They should do it well. They should do it only.

> the reason we write functions is to decompose a larger concept (in other words, the name of the function) into a set of steps at the next level of abstraction.

> [one] way to know that a function is doing more than "one thing" is if you can extract another function from it with a name that is not merely a restatement of its implementation.

### One Level of Abstraction per Function

> Mixing levels of abstraction within a function is always confusing. Readers may not be able to tell whether a particular expression is an essential concept or a detail. Worse, like broken windows, once details are mixed with essential concepts, more and more details tend to accrete within the function.


### Reading Code from Top to Bottom: The Stepdown Rule

> We want the code to read like a top-down narrative. We want every function to be followed by those at the next level of abstraction so that we can read the program, descending one level of abstraction at a time as we read down the list of functions.

This part from Chapter 5 (The Newspaper Metaphor) is also related:

> Think of a well-written newspaper article. You read it vertically. At the top you expect a headline that will tell you what the story is about and allows you to decide whether it is something you want to read. The first paragraph gives you a synopsis of the whole story, hiding all the details while giving you the broad-brush concepts. As you continue downward, the details increase until you have all the dates, names, quotes, claims and other minutia.
>
> (...) The topmost parts of the source file should provide the high-level concepts and algorithms. Detail should increase as we move downward, until at the end we find the lowest level functions and details in the source file.


### Use Descriptive Names

> You know you are working on clean code when each routine turns out to be pretty much what you expected.

> Half of the battle to achieving that principle is choosing **good names** for **small functions** that **do one thing**.

> Don't be afraid to make a name long. A long descriptive name is better than a short enigmatic name. A long descriptive name is better than a long descriptive comment.

> Choosing good names for a function can go a long way toward explaining the intent of the function and the order and intent of the arguments.
> 
> (...) For Example, `assertEquals` might be better written as `assertExpectedEqualsActual(expected, actual).` This strongly mitigates the problem of having to remember the ordering of the arguments.



### Function Arguments

> The ideal number of arguments for a function is zero. Next comes one, followed closely by two. Three arguments should be avoided where possible. More than three requires very special justifications - and then shouldn't be used anyway.

Besides the "easy to read and understand" reason, another one that I liked while reading the book is that "the more arguments a function has, the harder it is to write tests for it".

#### Flag Arguments

> Flag arguments are ugly. Passing a boolean into a function is a truly terrible practice. It immediately complicates the signature of the method, **loudly proclaiming that this function does more than one thing**. It does one thing if the flag is true and another if the flag is false!

The solution is to create different functions for each behavior.


#### Output Arguments

> Output arguments are harder to understand than input arguments. When we read a function, we are used to the idea of information going *in* to the function through arguments and *out* through return value. We don't usually expect information to be going out through the arguments. So output arguments often cause us to do a double-take.
> 
> (...) Using an output argument instead of a return value for a transformation is confusing. If a function is going to transform its input argument, the transformation should appear as the return value.


### Have No Side Effects

> Side effects are lies. Your function promises to do one thing, but it also does other *hidden* things.

In the book (p. 44) it shows an example of a `checkPassword()` functions that also does `Session.initialize()`, which is considered a side-effect. A function that promises to check the password should not initialize a session.

### Command Query Separation

> Functions should either **do something** or **answer something**, but not both. Either your function should change the state of an object, or it should return some information about that object. Doing both often leads to confusion.


### Prefer Exceptions to Returning Error Codes

> Returning error codes from command functions is a subtle violation of command query separation.

It encourages situations like this:

```c
if (deletePage(page) == E_OK)
```

This can cause deeply nested structures polluting the logic of the happy path:

```java
if (deletePage(page == E_OK) {
  if (registry.deleteReference(page.name) == E_OK) {
    if (configKeys.deleteKey(page.name.makeKey()) == E_OK) {
      logger.log("page deleted");
    } else {
      logger.log("configKey not deleted");
    }
  } else {
    logger.log("deleteReference from registry failed");
  }
} else {
  logger.log("delete failed");
  return E_ERROR;
}
```

By using exceptions, this 👆 madness could be replaced with:

```java
try {
  deletePage(page);
  registry.deleteReference(page.name);
  configKeys.deleteKey(page.name.makeKey());
} catch (Exception e) {
  logger.log(e.getMessage());
}
```

And this 👆 could be improved even more with this:

```java
public void delete(Page page) {
  try {
    deletePageAndAllReferences(page);
  } catch (Exception e) {
    logError(e);
  }
}

private void deletePageAndAllReferences(Page page) throws Exception {
  deletePage(page);
  registry.deleteReference(page.name);
  configKeys.deleteKey(page.name.makeKey());
}

private void logError(Exception e) {
  logger.log(e.getMessage());
}
```


