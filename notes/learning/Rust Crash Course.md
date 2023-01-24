---
dg-publish: true
---
# Rust Crash Course

- <https://youtu.be/lzKeecy4OmQ>

## Fundamentals

### Data Types

- Boolean
- Integer
- Double / Float
- Character
- String

### Variables

- assign data to a temporary memory location
    - allows programmer to easily work with memory
- can be set to any value & type (dynamically?)
- immutable by default, but can be mutable

```rust
// notice that no data types are used below
let two = 2;
let hello = "hello";
let j = 'j';
let my_half = 0.5;
let mut my_name = "Bill";
let quit_program = false;
let your_half = my_half;
```


### Functions

```rust
fn add(a: i32, b: i32) -> i32 {
  a + b
}
```

- `fn`: reserved word meaning that we're declaring a function
- `add`: name of the function
- `(a: i32, b: i32)`: parameters - `param: type`
- `-> i32`: return type of the function
- `a + b`: do the math and return the value (just like in Ruby)


### println macro

- macros expand into additional code
- `println` prints information to the terminal

```rust
let life = 42;

// the '!' symbol means that we're calling a macro
println!("hello");

// in "{:?}", the ':?' sequence mean debug print
println!("{:?}", life);
println!("{:?} {:?}", life, life);
println!("the meaning is {:?}", life);

// another notation
println!("{life:?}");

// without the ':?' means it's going to be visible for users
println!("{life}");
```


### Control flow using `if`

```rust
let a = 99;

if a > 200 {
  println!("Huge number");
} else if a > 99 {
  println!("Big number");
} else {
  println!("Small number");
}
```

- parentheses are not mandatory


### Repetition using loops

- types of loops
    - `loop` - infinite loop
    - `while` - conditional loop
 - both types can exit using `break` 

`loop` example:
```rust
let mut a = 0;

loop {
  if a == 5 {
    break;
  }

  println!("{:?}", a);
  a = a + 1;
}
```

`while` example:
```rust
let mut a = 0;

while a != 5 {
  println!("{:?}", a);
  a = a + 1;
}
```


### Tool installation

- rustup: <https://rustup.rs/>
- Visual Studio Code


### practice

Download files from: <https://links.zerotomastery.io/rust-crash-course>

`cargo` commands:

```shell
# run a specific file
# (needs to be at the same directory as Cargo.toml
cargo run --bin ${file}

# run without compiling messages
carg run --bin ${file} -q # or --quiet
```

The exercises a1, a2, a3a and a3b are pretty trivial.

### Match expressions

[Here at 1:17:00](https://youtu.be/lzKeecy4OmQ?t=4620)

- similar to `if..else`
- exhaustive
    - all options must be accounted for
- looks like a "switch case" statement

- `match` vs `if..else`
    - `match` will be checked by the compiler
        - if a new possibility is added, you will be notified when this occurs
    - `if..else` is *not* checked by the compiler
        - if a new possibility is added, your code may contain a bug

**NOTE**: prefer `match` over `if..else` when working with a single variable. It's more robust.

example with boolean:
```rust
fn main() {
  let some_bool = true;
  match some_bool {
    true => println!("it's true"),
    false => println!("it's false"),
  }
}
```

example with int:
```rust
fn main() {
  let some_int = 3;
  match some_int {
    1 => println!("it's 1"),
    2 => println!("it's 2"),
    3 => println!("it's 3"),
    // underscore _ works like 'default' in C
    _ => println!("it's something else"),
  }
}
```
