---
dg-publish: true
---
# ignite - nodejs - projeto 1

[[ignite-nodejs-1.2-stream]]

## Iniciando com Node.js

### intro

Instale node (recomendo usar asdf-vm).

Instale httpie.

### Criando um projeto

[video](https://app.rocketseat.com.br/node/projeto-01-1/group/iniciando-com-node-js/lesson/criando-um-projeto-node)

```shell
mkdir -p ~/src/github/ignite-node/01-fundamentos
cd ~/src/github/ignite-node/01-fundamentos

# cria o arquivo package.json
npm init -y

mkdir src
cd src

touch server.js
```

Importação CommonJS (usando `require`) está caindo em desuso. O mais comum atualmente é usar o padrão ESModules (usando `import/export`).

Para ser possível usar o padrão ESModules, vamos no `package.json` e adicionamos:
```json
{
  "type": "module"
}
```

`src/server.js`:
```js
import http from 'node:http'

const server = http.createServer((request, response) => {
  return response.end('Hello World')
})

server.listen(3333)
```

Run it with:
```shell
node src/server.js

# para ficar observando mudanças nos arquivos
node --watch src/server.js
```

Adicionar isso no `package.json`:
```json
{
  "scripts": {
    "dev": "node --watch src/server.js"
  }
}
```

E aí basta executar o servidor com o `npm run dev`.

## Estrutura da aplicação

### Rotas

Criar rotas de usuários para:

- criar
- listar
- editar
- remover

| verbo HTTP | ação            |
| ---------- | --------------- |
| POST       | criar           |
| GET        | listar          |
| PUT        | editar "tudo"   |
| PATCH      | editar um campo |
| DELETE     | remover         |


### Salvando dados na memória

[video](https://app.rocketseat.com.br/node/projeto-01-1/group/estrutura-da-aplicacao-7/lesson/salvando-usuarios-em-memoria-headers)

Nessa aula ele explica o conceito de stateful vs. stateless.

- Stateful: a aplicação se comporta de maneira diferente de acordo com dados que ela pode ter em memória.
- Stateless: a aplicação se comporta de maneira uniforme ao longo do seu ciclo de vida.

Na "vida real" o ideal é usar aplicações stateless. Neste exemplo temos uma aplicação stateful, pois estamos salvando dados em memória.

```js
const users = []

const server = http.createServer((request, response) => {
  const { method, url } = req

  if (method === 'GET' && url === '/users') {
    return response
      .setHeader('Content-type', 'applicaton/json')
      .end(JSON.stringify(users))
  }

  if (method === 'POST' && url === '/users') {
    users.push({
      id: 1,
      name: 'John Doe',
      email: 'johndoe@example.com',
    })

    return response.end('Criação de usuário')
  }

  return response.end('Hello World')
}
```


Neste 👆 exemplo estamos retornando JSON. Como que o frontend saberá que está lidando com conteúdo JSON?

Através dos cabeçalhos.

Cabeçalhos são metadatados.

Nesse caso usaremos
```js
response.setHeader('Content-type', 'application/json')
```

### HTTP Status codes

good reference: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status

Para enviar um status code usamos um nome não muito descritivo:
```js
response.writeHead(201)
```

Por que `writeHead`? 🤷


