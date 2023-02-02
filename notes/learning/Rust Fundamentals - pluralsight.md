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

- equal: `1 == 1`
- not equal: `1 != 2`
- and: `true && true`
- or: `false || true`


### bitwise operators

- and: `&`
- or: `|`
- xor: `^`
- left shift: `<<`
- right shift: `>>`


## Control Flow

### if / else

A string can be compared as other data types:
```rust
if word == "Duck" {
  println!("Quack!");
}
```

### enum

```rust
enum NavigationAids {
  NDB,
  VOR,
  VORDME,
}

fn main() {
  println!("NDB:\t{}", NavigationAids::NDB as u8); // 0
  println!("VOR:\t{}", NavigationAids::VOR as u8); // 1
  println!("VORDME:\t{}", NavigationAids::VORDME as u8); // 2
}
```

If you change a value of a field in an `enum`, the following fields will have a next greater value.

Examples:

![[Rust Fundamentals - pluralsight - enum-value1.png]]

![[Rust Fundamentals - pluralsight - enum-value2.png]]

### Option

> [!important]
> **Rust does not have a 'null' data type.**

Option is an enumeration which has two values: Some and None.

```rust
fn main() {
  let phrase = String::from("Duck Airlines");
  let letter = phrase.chars().nth(15); // out of bound

  let value = match letter {
    Some(character) => character.to_string(),
    None => String::from("No Value")
  };

  println!("{}", value);
}
```


### match

> Rust `match` operator is similar to `switch` statement in other languages.

### loop / while

- `loop` is infinite loop (needs `break`)
- `while` - no secrets here

### for

example
```rust
for index in 1..11 {
  println!("{}", index);
}
```

Note about ranges
- `1..10` - goes from 1 to 9 (the last value is exclusive)
- `1..=10` - goes from 1 to 10 (the equal sign makes last value inclusive)

The `for` is useful to loop through an `Iterator`.

> For now, you can consider a `Trait` as an interface.

```rust
trait Iterator {
  type Item;
  fn next(&mut self) -> Option<Self::Item>;
}
```


We can get an iterator from an array using the `.iter()` method, like here:
```rust
fn main() {
  let duck_aircraft = [
    "Boeing 737",
    "Boeing 767",
    "Boeing 787",
    "Airbus 319",
    "Airbus 320",
  ];

  for aircracft in duck_aircraft.iter() {
    println!("{}", aircraft);
  }
}
```


## Ownership and Borrowing

Keep these points in mind:

- Who owns the data?
- Passing by reference or by value
- Is it mutable?

> [!important]
> Ownership and Borrowing only apply to data on the heap

> [!important]
> In Rust, there can be one and only one owner of data at a time, at any given memory location.

```rust
fn main() {
  let original = String::from("original value");
  println!("original: \t\"{}\"", original);

  let next = original; // original hand over its value to next
  println!("original: \t\"{}\"", original);
}
```

![[Rust Fundamentals - pluralsight - borrow-error.png]]


