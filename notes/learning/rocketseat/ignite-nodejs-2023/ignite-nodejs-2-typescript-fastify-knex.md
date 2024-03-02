---
dg-publish: true
---
# ignite-nodejs-2-typescript-fastify-knex

voltar para [[ignite-nodejs-2023]]

## preparativos

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

Configurando `tsx` nop `package.json`:

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



### Bancos de Dados e Knex

- [video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/banco-de-dados-2/lesson/configurando-o-knex)

https://knexjs.org/guide/

```shell
npm install knex sqlite3
```

`src/database.ts`:

```ts
import { knex as setupKnex, Knex } from 'knex'

export const config: Knex.Config = {
  client: 'sqlite',
  connection: {
    filename: './tmp/app.db'
  },
  useNullAsDefault: true // necessário para sqlite
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
// ...
app.get('/hello', async () => {
  const tables = await knex('sqlite_schema').select()
  return tables
})
```

> [!important]
> PAREI AQUI


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


### sobrescrição de tipos

[video](https://app.rocketseat.com.br/classroom/criando-api-restful-com-node-js/group/implementando-as-rotas/lesson/tipagem-no-knex)

```shell
mkdir -p src/@types
touch src/@types/knex.d.ts
```

Extensão `.d.ts` = definição de tipos.

```ts
import { Knex } from 'knex'

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
    .first

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