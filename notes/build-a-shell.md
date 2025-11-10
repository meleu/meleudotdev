## Required Language Knowledge 

- get input from user
- strings
- arrays
- split strings in an array
- loops

## Golang

split strings in an array
```go
package main

import (
  "fmt"
  "strings"
)

func main() {
  s := "The quick   brown  fox jumps over the lazy dog"
  words := strings.Fields(s)
  fmt.Println(words)
  // [The quick brown fox jumps over the lazy dog]
}
```

## Ruby

### print a prompt

ignore input and keep printing a prompt like this: `$ `.

### handle any command as invalid

any command gives an output like this:

```
$ xyz
xyz: command not found
```

### loop to get input

first challenging part (for me): how to test this "infinite loop" behavior.

how to deal with `$stdout` and `$stdin`

### implement exit

learning: `exit` method raises `SystemExit`, and it's easy to capture this in tests.

### implement echo

### implement type

design demand: how to DRY the list of builtin commands?

Maybe `public_method_defined?` can help. [here](https://ruby-doc.org/3.4.1/Module.html#method-i-public_method_defined-3F)

### type looks for executable in PATH

challenging part: create temp directories in tests to test arbitrary dirs in PATH.

### actually run an external command

challenge: learn about `Open3.capture2`

---

### ruby topics to study

- ensure (to make sure tmp dir is deleted) - Well-Grounded, Chapter 6.4
- Dir
    - mktmpdir
- FileUtils
- `$stdout` and `$stdin` - WG, Chapter 12
- Open3  - WG, Chapter 14

Meu plano de leitura Well-Grounded Rubyist:

- 4. Modules and program organization
- 6.4. Error handling and exceptions
- 7. Built-in essentials
- 12. File and I/O operations
- 14. Callable and runnable objects
- 15. Callbacks, hooks, and runtime introspection