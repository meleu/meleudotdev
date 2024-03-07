---
dg-publish: true
---
# ignite-nodejs-2-typescript-fastify-knex

voltar para [[ignite-nodejs-2023]]

## preparativos

obs.: testes de requisições são feitos com o httpie: `brew install httpie`

```shell
npm init
mkdir src
touch src/server.ts

npm install -D typescript
npx tsc --init
# cria arquivo tsconfig.json
# edita o "target"

# instala tipos do NodeJS
npm install -D @types/node

# tsx pra executar TypeScript sem precisar converter
npm install -D tsx

npx tsc src/server.ts
# vai criar um arquivo src/server.js
```

### Hello World com fastify

```shell
npm install fastify
```

`server.ts`:

```ts
import fastify from 'fastify'

const app = fastify()

app.get('/hello', () => {
  return 'Hello World!'
})

app.listen({
  port: 3333
}).then(() => {
  console.log('HTTP Server Running!')
})
```

```shell
npx tsx src/sever.ts
``` 

Configurando `tsx` no `package.json`:

```json
{
  "scripts": {
    "dev": "tsx watch src/server.ts"
  }
}
```

Agora é só rodar `npm run dev`.

### ESLint

Instalar ESLint no VSCode

```shell
npm install -D eslint @rocketseat/eslint-config
```

`.eslintrc.json`:

```json
{
  "extends": [
    "@rocketseat/eslint-config/node"
  ]
}
```

Colocar no `setting.json` do VSCode:

```json
{
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```

no `package.json`

```json
{
  "scripts": {
    "lint": "eslint src --ext .ts --fix"
  }
}
```

Depois é só testar com:
```shell
npm run lint
```


### Bancos de Dados e Knex

- [video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/banco-de-dados-2/lesson/configurando-o-knex)

https://knexjs.org/guide/

```shell
npm install knex sqlite3

# criando dir onde ficará o arquivo .db
mkdir tmp
```

`src/database.ts`:

```ts
import { knex as setupKnex, Knex } from 'knex'

export const config: Knex.Config = {
  client: 'sqlite',
  connection: {
    filename: './tmp/app.db'
  },
  useNullAsDefault: true, // necessário para sqlite
  migrations: {
    extension: 'ts',
    directory: './db/migrations'
  }
}

exportt const knex = setupKnex(config)
```

`package.json`:

```json
{
  "scripts": {
    "knex": "node --no-warnings --import tsx ./node_modules/.bin/knex",
    // no Node 18 usava-se --loader ao invés de --import
    // "knex": "node --no-warnings --loader tsx ./node_modules/.bin/knex",
  }
}
```

A partir de agora podemos usar o comando `npm run knex -- ...`

`src/server.ts`:

```ts
import { knex } from './database.ts'

// ...
app.get('/hello', async () => {
  const tables = await knex('sqlite_schema').select()
  return tables
})
```

```shell
http :3333/hello
```

Deve dar o seguinte erro:
```json
{
    "code": "SQLITE_CANTOPEN",
    "error": "Internal Server Error",
    "message": "SQLITE_CANTOPEN: unable to open database file",
    "statusCode": 500
}
```


#### migrations

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/banco-de-dados-2/lesson/criando-tabela-de-transacoes)

`knexfile.ts`

```ts
import { config } from './src/database'

export default config
```

```shell
# mostra todos comandos
npx knex -h

# criando migrations
npm run knex -- migrate:make create-transactions
```

`db/migrations/*_create-transactions.ts`:

```ts
import { Knex } from 'knex'

export async function up(knex: Knex): Promise<void> {
  await knex.schema.createTable('transactions', (table) => {
    table.uuid('id').primary()
    table.text('title').notNullable()
    table.decimal('amount', 10, 2).notNullable()
    table.timestamp('created_at').defaultTo(knex.fn.now()).notNullable()
  })
}

export async function down(knex: Knex): Promise<void> {
  await knex.schema.dropTable('transactions')
}
```

```shell
npm run knex -- migrate:latest

# nesse ponto o /hello já vai retornar uns dados do schema
http :3333/hello

# se for necessário desfazer:
npm run knex -- migrate:rollback
```

adicionando um campo à uma table existente:

```shell
npm run knex -- migrate:make add-session-id-to-transactions
```

`db/migrations/*_add-session-id-to-transactions`

```ts
import { Knex } from 'knex'

export async function up(knex: Knex): Promise<void> {
  await knex.schema.alterTable('transactions', (table) => {
    table.uuid('session_id').after('id').index()
  })
}

export async function down(knex: Knex): Promise<void> {
  await knex.schema.alterTable('transactions', (table) => {
    table.dropColumn('session_id')
  })
}
```

```shell
npm run knex -- migrate:latest
```


#### variáveis de ambiente

checar extensão VSCode: Dotenv

```shell
npm install dotenv
```

Criar um arquivo `.env.sample`


```shell
npm install zod

mkdir -p src/env
touch src/env/index.ts
```

- `src/env/index.ts`

```ts
import 'dotenv/config'
import { z } from 'zod'

const envSchema = z.object({
  NODE_ENV: z.enum([
    'development',
    'test',
    'production'
  ]).default('production'),
  DATABASE_URL: z.string(),
  PORT: z.number().default(3333)
})

const _env = envSchema.safeParse(process.env)

if (!_env.success) {
  throw new Error(`Invalid env variable!\n${_env.error.format()}`)
}

export const env = _env.data
```


- `src/database.ts`

```ts
// ...
import { env } from './env'

export const config: Knex.Config = {
  // ...
  connection: {
    filename: env.DATABASE_URL
  },
  // ...
}
```

## rotas

Salvar essa "todo list" no README:

```markdown
### Requisitos Funcionais

- [ ] o usuário deve poder criar uma nova transação
- [ ] o usuário deve poder obter um resumo da sua conta
- [ ] o usuário deve poder listar todas transações que já ocorreram
- [ ] o usuário deve poder visualizar uma transação única

### Regras de Negócio

- [ ] A transação pode ser do tipo crédito que somará ao valor total, ou débito que subtrairá
- [ ] deve ser possível identificarmos o usuário entre as requisições
- [ ] o usuário só deve visualizar transações que criou

### Requisitos Não Funcionais
```

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/implementando-as-rotas/lesson/criacao-de-transacoes)

`src/routes/transactions.ts` post: 9:25

```ts
// IMPORTANTE: o knex tem que ser importado de ../database
import { knex } from '../database'

export async function transactionRoutes(app: FastifyInstance) {
  app.post('/', async (request, reply) => {
    const createTransactionBodySchema = z.object({
      title: z.string(),
      amount: z.number(),
      type: z.enum(['credit', 'debit']),
    })

    const {
      title,
      amount,
      type
    } = createTransactionBodySchema.parse(request.body)

    await knex('transactions').insert({
      id: randomUUID(),
      title,
      amount: type === 'credit' ? amount : -amount
    })

    return reply.status(201).send()
  })
}
```


`src/server.ts` 1:10

```ts
app.register(transactionsRoutes, {
  prefix: 'transactions'
})
```

- Insomnia:
    - 9:55

Via httpie:
```shell
# observe que amount usa := na atribuição!
# isso serve para não enviar como string
http :3333/transactions \
  title=Freelancing \
  amount:=8000 \
  type=credit
```

### sobrescrição de tipos

> [!important]
> PAREI AQUI

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/implementando-as-rotas/lesson/tipagem-no-knex)

vamos criar uma maneira do knex saber quais campos existem na tabela do banco de dados.

```shell
mkdir -p src/@types
touch src/@types/knex.d.ts
```

Extensão `.d.ts` = definição de tipos.

```ts
// eslint-disable-next-line
import { Knex } from 'knex'

// por que knex/types/tables?
// reposta na documentação:
// https://knexjs.org/guide/#typescript
declare module 'knex/types/tables' {
  export interface Tables {
    transactions: {
      id: string
      title: string
      amount: number
      created_at: sring
      session_id?: string
    }
  }
}
```

### rotas de listar

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/implementando-as-rotas/lesson/listagem-das-transacoes)

Dica interessante:

Retornar dentro de um objeto para dar mais flexibilidade para evoluir o software.

Exemplo:

```ts
const transactions = await knex('transactions').select()

// 👎 bad
return transactions

// 👍 good
return { transactions }
```



```ts
// src/routes/transactions.ts

// ...
// listar tudo
app.get('/', async () => {
  const transactions = await knex('transactions').select()

  return { transactions }
})

// listar uma única transaction
app.get('/:id', async (request) => {
  const getTransactionParamsSchema = z.object({
    id: z.string().uuid()
  })

  const { id } = getTransactionParamsSchema.parse(request.params)

  const transaction = await knex('transactions')
    .where('id', id)
    .first()

  return { transaction }
})

// resumo / somatório
app.get('/summary', async () => {
  const summary = await knex('transactions')
    .sum('amount', { as: 'amount' })
    .first()

  return { summary }
})
```


### utilizando cookies

- [video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/implementando-as-rotas/lesson/utilizando-cookies-no-fastify)

Cookies: formas da gente manter contexto entre as requisições

Como as aplicações web precisam ser *stateless*, esse estado é mantido pelo cliente.

```shell
npm install @fastify/cookie
```

Rotas de cookies precisa vir antes das rotas:

```ts
import cookie from '@fastify/cookie'

// ...

app.register(cookie)

// app.register(transactionsRoutes, ...)
```

`src/routes/transactions.ts`

```ts
app.post('/', async (request, reply) => {
  // ...
  // depois do parse...

  let sessionId = request.cookies.sessionId

  // se não existir, vamos criar
  if(!sessionId) {
    sessionId = randomUUID()

    reply.cookie('sessionId', sessionId, {
      path: '/',
      maxAge: 60 * 60 * 24 * 7 // 7 dias em segundos
    })
  }

  await knex('transaactions').insert({
    // ...
    session_id: sessionId
  })
})
```


### validando cookie

- [video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/implementando-as-rotas/lesson/validando-existencia-do-cookie)

1:25

```shell
mkdir -p src/middlewares
touch src/middlewares/check-session-id-exists.ts
```

`src/middlewares/check-session-id-exists.ts`

```ts
import { FastifyReply, FastifyRequest } from 'fastify'

export async function checkSessionIdExists(
  request: FastifyRequest,
  reply: FastifyReply,
) {
  const sessionId = request.cookies.sessionId

  if (!sessionId) {
    return reply.status(401).send({
      error: 'Unauthorized.'
    })
  }
}
```


`src/routes/transactions.ts`

- import
- adicionar o `preHandler`
- adicionar o `.where('session_id', sessionId)`

```ts
import { checkSessionIdExists } from '../middlewares/check-session-id-exists'

export async function transactionsRoutes(app: FastifyInstance) {
  app.get(
    '/',
    {
      preHandler: [checkSessionIdExists],
    },
    async (request, reply) => {
      const { sessionId } = request.cookies

      const transactions = await knex('transactions')
        .where('session_id', sessionId)
        .select()

      return { transactions }
    }
  )

  // repetir para as outras rotas, exceto no post
}

```


## testes automatizados

Usaremos o vitest: <https://vitest.dev>

```shell
npm install -D vitest supertest @types/supertest
```

`package.json`

```json
{
  "scripts": {
    "test": "vitest"
  }
}
````


### primeiro teste

- [video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/testes-automatizados-3/lesson/testando-criacao-de-transacao)

Primeira etapa é separar o `server.ts` em dois arquivos:

- `app.ts`: contem toda config do app
- `server.ts`: contem o `listen()`

`test/transactions.spec.ts`

```ts
import { it, expect, beforeAll, afterAll, describe } from 'vitest'
import { execSync } from 'node:child_process'
import request from 'supertest'
import { app } from '../src/app'

describe('Transactions routest', () => {
  beforeAll(async () => {
    await app.ready()
  })
  
  afterAll(async () => {
    await app.close()
  })

  // limpar o DB antes de cada teste
  beforeEach(() => {
    execSync('npm run knex migrate:rollback --all')
    execSync('npm run knex migrate:latest')
  })
  
  it('creates a new transaction', async() => {
    await request(app.server)
      .post('/transaction')
      .send({
        title: 'New transaction',
        amount: 5000,
        type: 'credit'
      })
      .expect(201)
  })

  it('lists all transactions', async () => {
    const createTransactionResponse = await request(app.server)
      .post('/transactions')
      .send({
        title: 'New transaction',
        amount: 5000,
        type: 'credit'
      })

    const cookies = createTransactionResponse.get('Set-Cookie')
    const listTransactionResponse = await request(app.server)
      .get('/transactions')
      .set('Cookie', cookies)
      .expect(200)

    expect(listTransactionsResponse.body.transactions)
      .toEqual([
        expect.objectContaining({
          title: 'New transaction',
          amount: 5000
        })
      ])
  })
})
```

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/testes-automatizados-3/lesson/testando-listagem-de-transacoes) - 6:00

### configurando banco de dados de teste

- [video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/testes-automatizados-3/lesson/configurando-banco-de-testes)

`.env.test`
`.env.test.sample`

```
DATABASE_URL='./db/test.db'
```

Alterar o `src/env/index.ts`:

```ts
import { config } from 'dotenv'
// ...

if (process.env.NODE_ENV === 'test') {
  config({ path: '.env.test' })
} else
  config()
}
```

### finalizando testes

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/testes-automatizados-3/lesson/finalizando-testes-da-aplicacao)

