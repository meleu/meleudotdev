# ignite-nodejs-1.4-rotas

## input do cliente

TODO-anki

- 3 maneiras
    - query parameters
    - route parameters
    - request body

### query parameters

Usadas quando precisamos de uma URL "stateful".

Importante que os parâmetros sejam opcionais e não sejam dados sensíveis.

Exemplos: filtros, paginação.

OBS.: muito fácil de ser interceptado

### route parameters

identificação de recurso.

OBS.: muito fácil de ser interceptado

### request body

Envio de informações de um formulário.

Possível de ser encriptado, usando HTTPS


## RegExp trick

```js
export function buildRoutePath(path) {
  const routeParametersRegex = /:([a-zA-Z]+)/g;
  const pathWithParams = path.replaceAll(
    routeParametersRegex,
    "(?<$1>([a-z0-9-_]+))"
  );

  const pathRegex = new RegExp(`^${pathWithParams}`);

  return pathRegex;
}
```

No código acima, o RegEx `?<$1>([a-z0-9-_]+)` é bem útil para nomear o conteúdo capturado no segundo RegEx!

O `$1` é uma referência ao conteúdo capturado no RegEx anterior.

Exemplo:

- input: `/users/:id`
- `$1` valerá `id`
- segundo RegEx: `?<id>...`
`