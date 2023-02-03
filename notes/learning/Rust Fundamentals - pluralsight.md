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

[video](https://app.pluralsight.com/course-player?clipId=25963a31-b1f2-435b-95d9-329b798057d5)

Keep these points in mind:

- Who owns the data?
- Passing by reference or by value
- Is it mutable?

> [!important]
> Ownership and Borrowing only apply to data on the heap


### Ownership

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

When we do `let next = original`, then `original` no longer exist.

> [!important]
> This is the reason Rust code is both safe and fast. All analysis can be done at compile time rather than runtime.


### Borrowing

[video](https://app.pluralsight.com/course-player?clipId=1d08434f-b5ba-4d6c-9b86-dd8e49c5f2f2)

Borrowing allows another variable to take temporary ownership of data without deallocating the original variable.

We can borrow a value using the `&` ampersand.

```rust
let next = &original;
```

There's more about borrowing in the video...


## Functions

[video talking about how to use functions with ownership & borrowing](https://app.pluralsight.com/course-player?clipId=4fb4df39-d5e3-4c58-a3dd-08c7d0ffc31c).

```rust
fn function_name(arg1: type, argN: type) -> return_type {
  // body of the function
}
```

Passing arguments to a function:

- Pass by value
    - pass the actual value
    - value is on the stack
- Pass by reference
    - pass a pointer to the value
    - value is on the heap

```rust
fn main() {
  let mut original = String::from("original value");
  println!("main(): \t\"{}\"", original);
  
  print_original(&original);
  change_original(&mut original);
}

// remember String is on the heap,
// then you need to pass by reference (with '&')
fn print_original(original: &String) {
  println!("print_original: \t\"{}\"", original);
}

fn change_original(original: &mut String) {
  let next = original; // original no longer owns the memory
  *next = String::from("next value");
  println!("change_original: \t\"{}\"", next);  
}
```

### Closure

Closure is a function that doesn't have a name (aka anonymous function).

Closure with no arguments:
```rust
fn main() {
  // two pipes defines a closure (anonymous function)
  || {
    println!("Hey. This is the closure.");
  }; // <-- don't forget the ';'
  // this 👆 is actually useless, as we don't
  // have a way to call that closure.

  // -----

  // assign a closure to a variable
  let hello = || {
    println!("Hello World!");
  };
  hello();
  // prints "Hello World!"

  // -----

  // passing arguments to a closure
  let hello_name = |name: String| {
    println!("Hello {}!", name);
  };
  hello(String::from("meleu");

  // -----

  // returning data from a closure
  let hellof = |name: String| -> String {
    format!("Hello {}", name)
  };
  let phrase = hello(String::from("meleu");
  println!("{}", phrase);
}
```


### Error Handling

[video](https://app.pluralsight.com/course-player?clipId=ded50bea-7c70-4dd4-8c87-c8ff7564efe2)

Recoverable vs. Unrecoverable Errors

Two options to handle errors:

1. Handle the error
2. Propagate the error


## More resources

- [SOLID: The First 5 Principles of Object Oriented Design](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)
- [The DRY Principle: Benefits and Costs with Examples](https://thevaluable.dev/dry-principle-cost-benefit-example/)


## Data Structures and Traits

### struct

```rust
struct Waypoint {
  name: String,
  latitude: f64,
  longitude: f64,
}

fn main() {
  let kcle = Waypoint {
    name: "KCLE".to_string(),
    latitude: 41.4075,
    longitude: -81.851111,
  };

  let kslc = Waypoint {
    // copy from the kcle, but overwrite
    // the name
    name: "KSLC".to_string(),
    ..kcle
  }
}
```


### impl

Object Oriented encapsulation: data and methods are contained within a class.

Rust Associated methods: methods are separate from the data that the methods use.

```rust
struct Waypoint {
  name: String,
  latitude: f64,
  longitude: f64,
}

// this is the data
struct Segment {
  start: Waypoint,
  end: Waypoint,
}

// this is the implementation of the methods
impl Segment {
  fn new(start: Waypoin, end: Waypoint) -> Self {
    Self { start, end }
  }

  fn distance(&self) -> f32 {
    // add logic to calculate the distance
    // between 'start' and 'end'
  }
}

fn main() {
  // ...
  let point1 = Waypoint {
    // ...
  }
  let point2 = Waypoint {
    // ...
  }

  // calling new from 'impl Segment'
  let point1_2 = Segment::new(point1, point2);
  // now 'point1_2' is an implementation of Segment
  // and has access to its methods
  let distance = point1_2.distance(); // note: no args
  
}
```


### Traits

Traits define a shared behavior among structs.

Traits are analogous to interfaces in object-oriented languages.

```rust
struct Boeing {
  required_crew: u8,
  range: u16,
}

struct Airbus {
  required_crew: u8,
  range: u16
}

// trait acts like an interface
trait Flight {
  fn is_legal(
    &self,
    required_crew: u8,
    available_crew: u8,
    range: u16,
    distance: u16
  ) -> bool;
}

// implementation of the "interface" Flight
// for the Boeing struct
impl Flight for Boeing {
  fn is_legal(
    &self,
    required_crew: u8,
    available_crew: u8,
    range: u16,
    distance: u16
  ) -> bool {
    // actual implementation of the method
    // goes here...
  }
}


// implementation of the "interface" Flight
// for the Airbus struct
impl Flight for Airbus {
  fn is_legal(
    &self,
    required_crew: u8,
    available_crew: u8,
    range: u16,
    distance: u16
  ) -> bool {
    // actual implementation of the method
    // goes here...
  }
}
```
