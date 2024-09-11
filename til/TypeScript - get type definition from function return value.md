---
dg-publish: true
---
# TypeScript - get type definition from function return value

In #typescript it's possible to get the type definition from the return value of a function using `ReturnType<Type>`.

Example:

```ts
function myFunc() {
  // something cool happens here...
  return {
    "complex": "object",
    "lot_of": "properties",
    // ...
  }
}

type MyFuncType = Return<typeof myFunc>
```

I noticed this to be specially useful when in the process of conversion of a project from JS to TS.

## references

<https://www.typescriptlang.org/docs/handbook/utility-types.html#returntypetype>
