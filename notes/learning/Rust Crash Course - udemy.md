---
dg-publish: true
---
# Rust Crash Course - udemy

- <https://cloudwalk.udemy.com/course/ultimate-rust-crash-course/>
- <https://github.com/CleanCut/ultimate_rust_crash_course/>


## Cargo

```shell
cargo new hello
cd hello
```

`src/hello.rs`:

```rust
fn main() {
  println!("Hello, world!");
}
```

```shell
# run your code
cargo run

# binary is going to be placed in
./target/debug/hello
# => Hello, world!

# let's release this version
carg run --release
# binary is going to be in
./target/release/hello
```

## Variables

> [!important]
> In Rust, variables are immutable by default!

```rust
// implicitly an int, specifically 'i32'
let bunnies = 2;

// initializing multiple variables
let (bunnies, carrots) = (8, 50);
```

## Constants

- prefix: `const`
- convention: `UPPER_SNAKE_CASE`
- type annotation is required
- value must be a constant expression, determined at compile time

Example:

```rust
const WARP_FACTOR: f64 = 9.9;
```


## Functions

- parameters must be defined with `var_name: type`
- return type defined with `-> type`
- by removing the `;` of the last line, it means you want to return the value of the expression (this is known as "tail expression").

Example:

```rust
fn do_stuff(qty: f64, oz: f64) -> f64 {
  // return qty * oz;
  qty * oz
}
```

Cool command to highlight where you can make your code more idiomatic:
```shell
cargo clippy
```


## Module System

```
hello
├── Cargo.lock
├── Cargo.toml
└── src
    ├── lib.rs        // the hello library
    └── main.rs       // the hello binary
```

`src/lib.rs`

```rust
// 'pub' prefix is necessary to make this function callable
// outside this file.
pub fn greet() {
  println!("Hi!!!");
}
```

`src/main.rs`

```rust
use hello::greet;

fn main() {
  greet();
}
```


<https://crates.io> is like the rubygems.org or npmjs.com

## Scalar Types

4 scalar types:

1. integer
2. float
3. boolean
4. character

### Integers

| Unsigned | Signed            |
| -------- | ----------------- |
| u8       | i8                |
| u16      | i16               |
| u32      | **i32** (default) |
| u64      | i64               |
| u128     | i128              |
| usize    | isize             |

Possible notations (underscores are ignored)

- Decimal: `1_000_000`
- Hex: `0xdead_beef`
- Octal: `0o7754_3211`
- Binary: `0b1111_0011`
- Byte (u8 only): `b'A'`

### Floating Point

- `f32`
- **`f64`** (default)


### Sufix literals

This is especially useful if you want to pass a literal to a generic function that could accept multiple numeric types.

```rust
// explicitly annotating the type of the variable
let x: u16 = 5;
let y: f32 = 3.14;

// specifying the type in the variable sufix
let x = 5u16;
let y = 3.14f32;

// example of how underscores can improve readability
let x = 5_u16;
let y = 3.14_f32;
```


### Booleans

`bool`

`true` or `false`


### Characters

`char`

UTF-32 (accepts emojis, etc.)

4 bytes (32 bits)


## Compound Types

### Tuples

- maximum of 12 items (aka **arity**)

```rust
let info = (1, 3.3, 999)

// accessing items individually
lets jets = info.0
lets fuel = info.1
lets ammo = info.2

// access all at once
let (jets, fuel, ammo) = info;
```

### Arrays

- limited to a size of 32, **"above which they lose most of their functionality"**
- multiple items of the same type

```rust
let buf = [1, 2, 3]

// populate with 3 zeroes
let buf = [0; 3]

// type annotation always use the ';'
let buf: [u8; 3] = [1, 2, 3]

// reference with [square brackets]
buf[0]
```

## Control Flow

- no parenthesis for conditions
- if statements return value

```rust
if num == 5 {
  msg = "five";
} else if num == 4 {
  msg = "four";
} else {
  msg = "other";
}

// more idiomatic
msg = if num == 5 {
  "five"
} else if num == 4 {
  "four"
} else {
  "other"
};
// don't forget the ';' after last closing '}'
```


## loops

### unconditional loops

```rust
// basic syntax
loop { }

// we can continue and break
loop {
  break;
}

loop {
  continue;
}

// loops can be named (useful to break/continue nested loops)
'bob: loop { // that's correct, only an apostrophe as prefix
  loop {
    loop{
      break 'bob;
    }
  }
}

```

### while loops

```rust
while dizzy() {
  // do stuff
}

// actually while loops are just syntactic sugar for:
loop {
  if !dizzy() { break }
  // do stuff
}
```

### for loops

```rust
for num in [7, 8, 9].iter() {
  // do stuff with num
}

// iterating through an array of tuples
let array = [(1, 2), (3, 4)];

for (x, y) in array.iter() {
  // do stuff with x and y
}

// ranges
// from 0 to 49
for num in 0..50 {
  // do stuff with num
}

// from 0 to 50
for num in 0..=50 {
  // do stuff with num
}
```


## Strings

- 6 types of strings in Rust
- 2 are the most used ones:
    - `str` (sometimes used with `&str`)
        - cannot be modified
    - `String`
        - can be modified

> [!important]
> Strings can **NOT** be indexed!
> ```rust
> my_string[3] // INVALID!
> // use nth() instead
> my_string.nth(3);
> ```


## Ownership

3 Rules

1. Each value has an owner
    - There's no value in memory, no data, that doesn't have a variable that owns it.
2. Only one owner.
    - No variables may share ownership. (Other variables may borrow the value)
3. Value gets dropped if its owner goes out of scope.


Example:

```rust
let s1 = String::from("abc");
let s2 = s1;
println!("{}", s1); // Error!
```

When you do `let s2 = s1` you can't use `s1` anymore, the value has moved to `s2`.

If you want to copy, you should use `let s2 = s1.clone();`

### Referencing and Borrowing

<https://udemy.com/course/ultimate-rust-crash-course/learn/lecture/17981905>

> [!important]
> About referencing: You can have **either**:
> 
> - Exactly one mutable reference.
> - Any number of immutable references.

