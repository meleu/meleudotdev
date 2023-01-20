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

Stopped at 33:45 here: <https://youtu.be/lzKeecy4OmQ?t=2025>
