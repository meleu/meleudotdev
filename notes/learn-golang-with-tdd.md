---
dg-publish: true
---
# learn-golang-with-tdd

- <https://quii.gitbook.io/learn-go-with-tests>

[TOC]

---

## Few rules to writing tests

- file name must be `${something}_test.go`
- the test function must start with `Test`
- test function takes only one argument `t *testing.T`
- in order to use `*testing.T` type you need to `import "testing"`


## Hello, World


### What I learned

- `if` works like other programming languages, without `(`parenthesis`)`
- blocks are defined with `{`curly braces`}`
- variables are assigned like in Pascal: `varName := value`
    - I noticed that there's no type definition when assigning variables
- `t.Errorf` prints a message when a test fails.
- `%q` means "string surrounded with double quotes", in the string format context 

### Didn't work

```bash
# installing local documentation
go install golang.org/x/tools/cmd/godoc@latest

# after installing this command still don't work
godoc -http :8000
# ERROR: 'godoc' command not found
```


### Code

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

