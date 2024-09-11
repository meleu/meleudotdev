---
dg-publish: true
---
# learn-golang-with-tdd

Notes about the things I learnt while reading/practicing with [Learn Go with Tests](https://quii.gitbook.io/learn-go-with-tests).

[TOC]

---


## Hello, World

- <https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/hello-world>

### What I learned

- `if` works like other programming languages, without `(`parenthesis`)`
- blocks are defined with `{`curly braces`}`
- variables are ~~assigned~~ declared like this: `varName := value`
    - I [researched](https://stackoverflow.com/a/36513229/6354514) and realized that
        - ` := ` for [short variable declarations](https://go.dev/ref/spec#Short_variable_declarations) (type inference)
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



## integers

- https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/integers

### Testable Examples

[official docs](https://go.dev/blog/examples)

- resides in the `_test.go` file
- starts with `Example`
- the `// Output: ` part is mandatory
- run `go test -v` to see it being executed

```go
func ExampleAdd() {
	sum := Add(1, 5)
	fmt.Println(sum)
	// Output: 6
}
```


## iterations

- <https://quii.gitbook.io/learn-go-with-tests/go-fundamentals/iteration>

### for loops

- for is the only way to loop in Golang
- it can be used in some different ways: [examples of for](https://gobyexample.com/for)

### benchmarking

- [official docs](https://pkg.go.dev/testing#hdr-Benchmarks)

This goes in the `repeat_test.go` file:
```go
func BenchmarkRepeat(b *testing.B) {
  for i := 0; i < b.N; i++ {
    Repeat("a")
  }
}
```

The code is very similar to a test.

The `testing.B` gives you access to the cryptically named `b.N`.

When the benchmark code is executed, it runs `b.N` times and measures how long it takes.

The amount of times the code is run shouldn't matter to you, the framework will determine what is a "good" value for that to let you have some decent results.

To run the benchmarks do `go test -bench=.`

```
$ go test -bench=.
goos: darwin
goarch: arm64
pkg: iteration
BenchmarkRepeat-8       15226100                79.48 ns/op
PASS
ok      iteration       2.719s
```

The test was executed 15,226,100 times. Each execution took on average 79.42 nanoseconds to run.


