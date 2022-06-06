---
dg-publish: true
---
# JavaScript Concurrency

Some lessons learned from <https://www.executeprogram.com/courses/javascript-concurrency>.

## asynchronous functions execute after the current one

```js
// asynchronous functions are executed after the current one
async function timeoutZero() {
  array.push('before');
  for (const i of [1, 2]) {
    // even with a timeout of zero, async funcs will
    // be executed after the current one
    setTimeout(() => array.push('during ' + i), 0);
  }
  array.push('after');
  console.log('inside: ', array);
}

timeoutZero();
setTimeout(() => console.log('Final: ', array), 0);
console.log('outside: ', array);
```

expected output:
```
inside:  [ 'before', 'after' ]
outside:  [ 'before', 'after' ]
Final:  [ 'before', 'after', 'during 1', 'during 2' ]
```


