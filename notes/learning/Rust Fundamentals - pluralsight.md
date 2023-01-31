---
dg-publish: true
---
# Rust Fundamentals - pluralsight

Link: [Rust Fundamentals - pluralsight](https://app.pluralsight.com/library/courses/fundamentals-rust/table-of-contents)


## Intro

Installation instructions from https://rustup.rs

- Install IntelliJ
- Install Rust plugin
- I also installed IdeaVim

### Stack vs. Heap

- Stack: LIFO

![[Rust Fundamentals - pluralsight - Stack vs Heap.png]]


## Data Types

- Numbers vs. Text Data
    - Numbers: can do arithmetic (while text don't)
- Scalar vs. Compound
    - Scalar: single value
    - Compound: multiple values

- Scalar data types:
    - numbers
    - characters
    - booleans
- Compound data types
    - arrays
    - tuples
- Strings

Arrays and Tuples are very fast at runtime, but are fixed size. Later we'll see we'll the concept of Collections, which allows us to have a dynamic size.

```rust
// declaring an array
// explicit type
let location: [f32;2] = [0.0, 0.1];
```


### Strings

- [video](https://app.pluralsight.com/course-player?clipId=962406ba-2b5e-4153-a484-d8efa0fb2ea2)

Strings are complex in Rust as compared to many other languages. This is a trade off that Rust has made to support its core principals:

- Speed
- Concurrency
- Memory Safety

In rust we have 2 types of strings

| `String`           | `&str` (aka String Slice)                                         |
| ------------------ | ----------------------------------------------------------------- |
| vector of u8 data  | vector of u8 data                                                 |
| mutable            | immutable                                                         |
| stored on the heap[^1] | can be stored on the heap, stack or embedded in the compiled code |

[^1]: a String is stored on the heap because it can grow and shrink in size. The size is not constant so it cannot be stored on the stack.

Converting between the two string types:

```rust
fn main() {
  // from &str to String
  let name_slice = "Donald Mallard";
  let name_string = person_name_slice.to_string();
  // it could be:
  // = "Donald Mallard".to_string();
  // = String::from("Donald Mallard");

  // from String to &str
  let name_string = "Donald Mallard".to_string();
  let name_slice1 = &name_string;
  let name_slice2 = name_string.as_str();
}
```


Concatenating strings:

```rust
fn main() {
  let duck = "Duck";
  let airlines = "Airlines";

  // concat() concatenates &str and returns a String
  let airline_name = [duck, " ", airlines].concat();

  // format!() does the same
  let airline_name = format!("{} {}", duck, airlines);
}
```

We'll see this repeatedly: `&str`s being concatenated in a `String`.

> concatenation will always have an immutable string slice appended to a mutable string.

```rust
fn main() {
  let mut slogan = String::new();
  slogan.push_str("We hit the ground");
  slogan.push(' ');
  slogan = slogan + "every time";
}
```


## Variables

```rust
fn main() {
  // explicitly saying data type
  let explicit_type: i32 = 42;
  let inferred_type = 3.14;
}
```


Casting Variable Data Types

```rust
fn main() {
  let float: f32 = 17.2;
  let unsigned_int: u8 = 5;
  // use u8 as f32
  let cast_u8 = unsigned_int as f32;

  // int to char
  let number: u8 = 65;
  let letter = number as char;

  // float to char is an ERROR
  let number: f32 = 65.0;
  let letter = number as char; // ERROR!
}
```

Shadowing:

> Defining a variable with the same name as another variable that's already been declared is called shadowing.

```rust
fn main() {
  let my_var = 123;
  {
    let my_var = 321; // shadowing my_var
    println!("{}", my_var);
  }
}
```

## Operators

### math

- typical `+ - * /` operators
- `%` for the remainder
- for power: 
    - `i32::pow(n, p)`
        - an integer can only have an integer exponent
    - `f32::powi(n, p)` or `f32::powf(n, p)`
        - `powi` for int exponent, and `powf` for float exponent


### logical

- `1 == 1` for equal
