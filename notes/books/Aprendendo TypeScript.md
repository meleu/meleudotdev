---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2024
author: Josh Goldberg
---

# Aprendendo TypeScript

Website que acompanha o livro (tem exercícios): <https://learningtypescript.com>

## Parte 1 - Conceitos

### 1. Do JavaScript ao TypeScript

- praticar snippets: <https://www.typescriptlang.org/play>
- instalar typescript localmente:
```shell
npm install --global typescript

# agora temos o TypeScript Compiler
tsc --version
```

- Usamos o `tsc` pra converter arquivo `.ts` para arquivo `.js`.
- `tsc --init` cria um arquivo `tsconfig.json` (explicado no Capítulo 13)


### 2. O sistema de tipos

- tipos primitivos:
    - null
    - undefined
    - boolean
    - string
    - number
    - bigint
    - symbol

- inferência de tipo:

```ts
let firstName = "Tina"; // type: string
firstName = 42;
// Error: Type 'number' is not assignable to type 'string'.

// se não atribuir um valor, será inferido o tipo 'any'
let rocker; // type: any

rocker = "Joan Jett"; // type: string
rocker.toUpperCase(); // ok

rocker = 19.58;        // type: number
rocker.toPrecision(1); // ok

rocker.toUpperCase();
//     ~~~~~~~~~~~
// Error: 'toUpperCase' does not exist on type 'number'.
```

- anotações de tipo (deixam explícito que queremos um determinado tipo)

```ts
let rocker: string;
rocker = "Joan Jett"

rocker = 19.58;
// Error: Type 'number' is not assignable to type 'string'.
```

- módulo:
    - um arquivo com uma instrução `export` ou `import`
- script:
    - qualquer arquivo que não seja um módulo
    
> De acordo com a especificação ECMAScript, se você precisar que um arquivo seja um módulo sem uma instrução `export` ou `import`, pode adicionar `export {};` em algum local para forçá-lo a ser um módulo.

> [!danger]
> O TypeScript não reconhece os tipos de importações e exportações em arquivos TypeScript escritos com o uso de sistemas de módulo mais antigos como o CommonJS. Geralmente ele considera os valores retornados de funções `require` no estilo CommonJS como de tipo `any`.

### 3. Uniões e literais

#### Uniões

- O tipo união é usado para permitir mais de um tipo primitivo. Exemplo:

```ts
let thinker: string | null = null;
```

- O tipo inferido na declaração a seguir é `string | undefined`:

```ts
let mathematician = Math.random() > 0.5
  ? undefined
  : "Mark Goldberg";
```

- Propriedades da união:

```ts
let physicist = Math.random() > 0.5
  ? "Marie Curie"
  : 84;

// 👍 método disponível em 'string | number'
physicist.toString(); // ok

// 👎 método disponível apenas em 'string'
physicist.toUpperCase();
// Error: Property 'toUpperCase' does not exist on type 'string | number'
//  Property 'toUpperCase' does not exist on type 'number'

// 👎 método disponível apenas em 'number'
physicist.toFixed();
// Error: Property 'toFixed' does not exist on type 'string | number'
//  Property 'toFixed' does not exist on type 'string'

// atribuindo uma string
physicist = "Albert Einstein";

// agora o TypeScript sabe que o método está disponível
physicist.toUpperCase(); // ok
```

#### Tipos literais

```ts
// para o TypeScript, a variável a seguir é de um tipo
// mais específico do simplesmente 'string'
const philosopher = "Plato";
```

Para o TS a variável `philosopher` é do tipo `"Plato"`, que é um tipo específico de `string`.

Consequências disso:

```ts
// anotação explicitando o tipo
let specificallyAda: "Ada";

specificallyAda = "Ada"; // ok

specificallyAda = "Byron";
// Error: Type '"Byron"' is not assignable to type '"Ada"'.
```

> Um tipo primitivo é o conjunto de todos os valores literais possíveis desse tipo.

Outra feature interessante do TypeScript é a verificação estrita de nulos:

```ts
let nameMaybe = Math.random() > 0.5
  ? "Tony Hoare"
  : undefined;

nameMaybe.toLowerCase();
// Error: 'nameMaybe' is possibly 'undefined'

if (nameMaybe) {
  // só entra aqui se não for 'undefined'
  nameMaybe.toLowerCase(); // ok
}

// equivalentes:
nameMaybe && nameMaybe.toLowerCase(); // ok
nameMaybe?.toLowerCase(); // ok
```

#### Aliases de tipo

```ts
type RawData = boolean | number | string | null | undefined;

let RawDataFirst: RawData;
let RawDataSecond: RawData;
let RawDataThird: RawData;
```

**Obs.:** aliases de tipo não são JavaScript (na transpilação eles são simplesmente ignorados).

