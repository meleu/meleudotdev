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
}
```