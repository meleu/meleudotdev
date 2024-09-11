---
dg-publish: true
---
# API REST em NodeJS com TDD

Link do curso: <https://udemy.com/course/api-rest-nodejs-com-testes/>

Dicas VSCode

- [Dica de como criar Snippets](https://cloudwalk.udemy.com/course/api-rest-nodejs-com-testes/learn/lecture/13047504#overview)
- extensão: [TODO Tree](https://cloudwalk.udemy.com/course/api-rest-nodejs-com-testes/learn/lecture/13047514#overview)

```shell
mkdir seubarriga-api
cd seubarriga-api

npm init -y
# método de instalação do site oficial (diferente da aula)
# https://eslint.org/docs/latest/use/getting-started#quick-start
npm init @eslint/config
# respostas
# enforce
# commonjs
# no framework
# no typescript
# [ ] browser / [x] node
# guide
# airbnb
# JSON

# também diferentemente do curso, adicionei o prettier
npm install --save-dev prettier eslint-config-prettier
```

daí no `.eslintrc.json`:

```json
{
  "extends": [
    "airbnb-base",
    "prettier"
  ]
}
```

### Jest config

```shell
npm instal --save-dev jest

# instalar supertest para asserções HTTP
npm install --save-dev supertest
```

No `package.json`, mudar o `scripts.test` simplesmente para `"jest"`.

No `.eslintrc.json`, adicionar `env: jest: true`.

```js
test('descrição', () => {
  // asserções
});
```


### Principais assertivas

```js
// valor é nulo
expect(number).toBeNull()

// negação
expect(number).not.toBeNull()

// igualdade
expect(number).toBe(10)
expect(number).toEqual(10)

// comparação
expect(number).toBeGreaterThan(9)
expect(number).toBeLessThan(11)

// trabalhando com objetos
// --------------------------------------------------

// tem uma propriedade 'name'
expect(obj).toHaveProperty('name')

// propriedade 'name' com valor 'John'
expect(obj).toHaveProperty('name', 'John')
expect(obj.name).toBe('John')

// verifica se 'obj' e 'obj2' são referências ao mesmo objeto
expect(obj).toBe(obj2)

// verifica se 'obj' e 'obj2' possuem as mesmas propriedaades
expect(obj).toEqual(obj2)
```


### Deve escutar na porta 3001 e retornar http status 200

```shell
npm install -S express
npm install --save-dev supertest
```

`app.test.js`
```js
const request = require('supertest');

const app = require('../src/app');

test('Should reply with return 200 in the root path', () => {
  return request(app)
    .get('/')
    .then((res) => expect(res.status).toBe(200));
});
```

`src/app.js`
```js
const app = require('express')();

app.get('/', (req, res) => {
  res.status(200).send();
});

module.exports = app;
```


### Modo Seguro

Rodar os testes a cada salvamento de arquivo

`package.json`
```json
"scripts": {
  "start": "node src/server.js",
  "jest-watch": "jest --watch --verbose=true"
}
```