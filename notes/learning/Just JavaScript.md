---
dg-publish: true
---
# Just JavaScript

<https://justjavascript.com>

## The JavaScript Universe

The Abramov's mental model represents primitive values as distant stars, floating farthest form our code. We can point to them, but they will always stay where they are, unchanged.

## Values

- Values
    - Primitive Values
    - Objects and Functions
        - Functions are objects, but with additional features.

- 9 types of values
    1. `undefined`
    2. `null`
    3. Boolean
    4. Numbers
    5. BigInts (uncommon and new)
    6. Strings
    7. Symbols (uncommon)
    8. Objects (`{}`, etc)
    9. Functions (`x => x * 2`, etc)

Note: things like arrays, dates and regular expressions are fundamentally Objects.

Inspect type of something with `typeof`

Expressions return a value.

**Note**: `typeof(null) == 'object'`. It's a known historical bug in the language. Here's an explanation: <https://2ality.com/2013/10/typeof-null.html>


### Values and Variables

**Primitive values are immutable**

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


