---
dg-publish: true
---
# learn-golang-with-tdd

- <https://quii.gitbook.io/learn-go-with-tests>

[TOC]

---


## Hello, World

- <https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/hello-world>

### What I learned

- `if` works like other programming languages, without `(`parenthesis`)`
- blocks are defined with `{`curly braces`}`
- variables are ~~assigned~~ declared like this: `varName := value`
    - I [researched](https://stackoverflow.com/a/36513229/6354514) and realized that
        - ` := ` for [short variable declarations](https://go.dev/ref/spec#Short_variable_declarations)
        - ` = ` for [variable declarations](https://go.dev/ref/spec#Variable_declarations) and [assignments](https://go.dev/ref/spec#Assignment_statements).
- `t.Errorf` prints a message when a test fails.
- `%q` means "string surrounded with double quotes", in the string format context
- `func greetingPrefix(language string) (prefix string)` creates a **named return value**
      - this creates a variable called `prefix` in the function
          - it will be assigned the "zero" value. In this case (`string`): `""`
- in Go, public functions start with a capital letter and private ones start with a lowercase.

#### Few rules to writing tests

- file name must be `${something}_test.go`
- the test function must start with `Test`
- test function takes only one argument `t *testing.T`
- in order to use `*testing.T` type you need to `import "testing"`


### godoc and the PATH

```bash
# installing local documentation
go install golang.org/x/tools/cmd/godoc@latest

# after installing the godoc command isn't available
# in the path! I had to call it via:
~/.asdf/installs/golang/1.21.7/packages/bin/godoc -http :8000
```


### Starting a module

create the `hello` module:
```bash
mkdir hello
cd hello
go mod init hello
# check if the "go.mod" file was created
```

`hello.go`:
```go
package main

import "fmt"

// Hello() is a separated function
// to make it testable
func Hello() string {
  return "Hello, world"
}

func main() {
  fmt.Println(Hello())
}
```

`hello_test.go`:
```go
package main

import "testing"

func TestHello(t *testing.T) {
  got := Hello()
  want := "Hello, world"

  if got != want {
    t.Errorf("got %q want %q", got, want)
  }
}
```

Run the test:
```bash
go test
```

