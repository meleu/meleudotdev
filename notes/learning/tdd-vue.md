---
dg-publish: true
---
# Vue with TDD


<https://udemy.com/course/vue-with-test-driven-development/>


### starting a project

```bash
# in this example source is the name of the app
npm create vue@latest source

# typescript no
# jsx no
# SPA yes
# pinia yes
# vitest yes
# e2e no
# eslint yes
# prettier yes

cd source

code .
# install recommended extensions

npm install
npm run dev
```


files to take a look:

- `vite.config.js`
- `vitest.config.js` (note: references `vite.config.js`)
- `index.html`
    - `<script type="module" src="/src/main.js"></script>`

### other dependencies

```
# http requests
npm install axios

# internationalization
npm install --save-exact vue-i18n@9.1.10

# testing tools
npm install -D \
  @testing-library/vue \
  @testing-library/user-event \
  @testing-library/jest-dom

# API mocking
npm i -D msw

# bootstrap
npm install bootstrap

# CSS
npm install -D sass
```


### final setup

[video](https://cloudwalk.udemy.com/course/vue-with-test-driven-development/learn/lecture/41625872#overview)

`package.json` rename `test:unit` to just `test`

test code example at 5min / 8min 
- 9min vitest.config.js
- 10min .eslintrc.cjs - vitest
- 10:40 setup files

12min writing the first test

```js
// src/views/sign-up/SignUp.spec.js

describe('Sign Up', () => {
  it('has Sign Up header', () => {
    render(SignUp)
    const header = screen.getByRole('heading', { name: 'Sign Up' })
    expect(header).toBeInTheDocument()
  })
})
```

code to pass the test:
```html
<!-- src/views/sign-up/SignUp.vue -->
<template>
  <h1>Sign Up</h1>
</template>
```


16:10 cleanup the `App.vue`

19min explains the `@` in the path

20min `jsconfig.json`
```json
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```