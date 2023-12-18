---
dg-publish: true
---
# Just JavaScript

<https://justjavascript.com>

## The JavaScript Universe

The Abramov's mental model represents primitive values as distant stars, floating farthest form our code. We can point to them, but they will always stay where they are, unchanged.

### Values

- Values
    - Primitive Values
    - Objects and Functions
        - Functions are objects, but with additional features.

- 9 types of values
    1. `undefined`
    2. `null`
    3. Boolean
    4. Numbers
    5. Strings
    6. BigInts (uncommon and new)
    7. Symbols (uncommon)
    8. Objects (`{}`, etc)
    9. Functions (`x => x * 2`, etc)

From 1 to 7, they are the **primitive values**.

Note: things like arrays, dates and regular expressions are fundamentally Objects.

Inspect type of something with `typeof`

**Note**: `typeof(null) == 'object'`. It's a known historical bug in the language. Here's an explanation: <https://2ality.com/2013/10/typeof-null.html>

I like to look the image below and think "the further a type is from the center, the less manipulable it is"

![[Just JavaScript - celestial spheres.png]]

Expressions always return a value.


### Values and Variables

**Primitive values are immutable** (objects and functions are mutable).

Code where the results is not what is expected:
```js
let reaction = 'yikes'
reaction[0] = 'l'
console.log(reaction) // "yikes"
```

Variables are not values. **Variables point to values**.
```js
let pet = 'Narwhal';
pet = 'The Kraken';
console.log(pet); // "The Kraken"
```

In JavaScript variables don't have types, only values do.
#### Rules of Assignment

**The right side of an assignment must be an expression, so it always result in a value.**

```js
// "connects" x with 10
let x = 10;

// x is evaluated to 10
// connects y with 10
let y = x;

// connects x with 0
x = 0;

// x is connected with 0
// y is connected with 10
```

Note that `y = x` did not mean point `y` to `x`. We can’t point variables to each other! Variables always point to _values_.

When we call a function, we're always passing the value.
```js
function double(x) {
  x = x * 2;
}

let money = 10;

// money is an expression resulting in 10
// therefore we're passing the value 10 to the function
double(money);

console.log(money); // 10
```

If the the value being passed is a **primitive value**, it can't be changed. **However**, if it's a mutable value (like an array, which is an Object) it can be changed!




### Primitive Values

#### undefined

`undefined` is a type and a value.

It represents the concept of an *unintentionally* missing value.

When you declare a variable and don't assign any value to it, then it points to the `undefined` value, by default.

#### null

`null` is also a type and a value.

> [!note]
> `null` is the only value of its own type, but it's also a liar, as it pretends to be an `object`:
> 
> ```js
> console.log(typeof(null)); // "object"
> ```
> 
> You **must** understand that it's a lie! `null` is a primitive value, and is NOT an object at all.
> 
> Unfortunately, `typeof(null)` is a historical accident that we'll have to live with forever. 🙁

`null` is used for *intentionally* missing values.


#### booleans

Only two boolean values: `true` and `false`.

#### numbers

```js
console.log(0.1 + 0.2 === 0.3); // false
console.log(0.1 + 0.2 === 0.30000000000000004); // true
```

As we move from `0` in either direction, we start losing precision. At some point, even two closes JavaScript numbers stay further apart than by `1`:
```js
onsole.log(Number.MAX_SAFE_INTEGER);     // 9007199254740991
console.log(Number.MAX_SAFE_INTEGER + 1); // 9007199254740992
console.log(Number.MAX_SAFE_INTEGER + 2); // 9007199254740992 (again!)
console.log(Number.MAX_SAFE_INTEGER + 3); // 9007199254740994
console.log(Number.MAX_SAFE_INTEGER + 4); // 9007199254740996
console.log(Number.MAX_SAFE_INTEGER + 5); // 9007199254740996 (again!)
```

[learn more about floating-point math](https://floating-point-gui.de/formats/fp/)

##### special numbers

- `NaN`
- `Infinity`
- `-Infinity`
- `-0`

examples
```js
let scale = 0;
let a = 1 / scale; // Infinity
let b = 0 / scale; // NaN
let c = -a; // -Infinity
let d = 1 / c; // -0

// fun-fact
console.log(typeof(NaN)); // "number"
```


#### BigInt

Not much used...

```js
let alot = 9007199254740991n; // n at the end makes it a BigInt!
console.log(alot + 1n); // 9007199254740992n
console.log(alot + 2n); // 9007199254740993n
console.log(alot + 3n); // 9007199254740994n
console.log(alot + 4n); // 9007199254740995n
console.log(alot + 5n); // 9007199254740996n
```


#### Strings

Three ways to write strings: "double quotes", 'single quotes', \`backticks\`.

```js
console.log(typeof("こんにちは")); // "string"
console.log(typeof('こんにちは')); // "string"
console.log(typeof(`こんにちは`)); // "string"
```

**Strings are NOT objects.**

All strings have a few built-in properties, but that doesn't mean they are objects!

```js
let cat = 'Cheshire'
console.log(cat.length)
console.log(cat[0])
console.log(cat[1])
```

You can't assign anything to `cat[0]`. Strings are primitives, and all primitives are immutable.

### Objects and Functions

Non-primitive types: types that let us make our own values.

Object are not primitive values, it means they're mutable.

Every time we use the `{}` object literal, we create a brand new object value:

```js
let shrek = {};
let donkey = {};
```

![[Just JavaScript - new objects.png]]

Note how this 👆 is different from what happens with primitive values.

**An object literal creates a brand new distinct object value**

```js
// in this loop we're passing the very
// same value, `2`, to console.log
for (let i = 0; i < 5; i++) {
  console.log(2)
}

// in this loop we're passing a completely
// distinct object value in each iteration
for (let i = 0; i < 5; i++) {
  console.log({}) // <-- creates a brand new object
}
```


> Technically, functions _are_ objects in JavaScript. We’ll keep treating them as a separate fundamental type because they have unique capabilities compared to regular objects. But, generally speaking, if you can do something to an object, you can also do that to a function too. They are very special objects


> [!important]
> Primitive values (strings, numbers, etc...) have always existed in our universe. **For example, writing `2` or `"hello"` always “summons” the same number or a string value. Objects and functions behave differently and allow us to generate our own values. Writing `{}` or `function() {}` always _creates_ a brand new, different value.** This idea is crucial to understanding equality in JavaScript.

### Equality of Values

