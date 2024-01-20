---
dg-publish: true
---
# Ignite - NodeJS - Stream

## Principais aprendizados

- `import { Readable, Writable, Transform } from node:stream`
- objetos `Readable` precisam ter `_read()`
- objetos `Writable` precisam ter `_write(chunk, encoding, callback)`
- objetos `Transform` precisam ter `_transform(chunk, encoding, callback)`
- `this.push()` é uma maneira de uma Stream fornecer informações para o consumidor.
- `this.push(null)` é uma maneira de dizer que não temos mais informação para ser enviada.
- o argumento de `.push()` é conhecido como "chunk"
- The "chunk" argument must be of type string or an instance of Buffer or Uint8Array

## Streams no Node.js

Aplicativos de streaming:

- Netflix
- Spotify

Tecnologia de streaming permite que a aplicação comece a processar dados de um arquivo sem que o arquivo esteja completamente disponível.

Pelo papo do Diego, a tecnologia de Streaming é algo que parece ser uma das killer-features do NodeJS. É a capacidade de abrir uma conexão HTTP, começar a processar os dados que estão chegando sem precisar fechar a conexão.

Exemplo:

Subir um arquivo CSV com 1gb com dados de milhares de usuários para serem inseridos no banco de dados. É benéfico começarmos a processar esses dados antes mesmo que o arquivo tenha sido completamente enviado.

No Node toda porta de entrada/saída é automaticamente um stream.

O código a seguir é bacana para visualizar o conceito de Stream acontecendo na prática.

> [!important]
> - objetos `Readable` precisam implementar o método `read`
> - `this.push()` é uma maneira de uma Stream fornecer informações para o consumidor.
> - `this.push(null)` é uma maneira de dizer que não temos mais informação para ser enviada.
> - o argumento de `.push()` é conhecido como "chunk"
> - The "chunk" argument must be of type string or an instance of Buffer or Uint8Array


`streams/fundamentals.js`
```js
// enviar stdin para stdout
// process.stdin
//   .pipe(process.stdout)


import { Readable, Writable, Transform } from 'node:stream'

class CountToHundredStream extends Readable {
  index = 1

  _read() {
    const i = this.index++

    setTimeout(() => {
      if (i > 100) {
        this.push(null)
      } else {
        const buf = Buffer.from(String(i) + '\n')
        this.push(buf)
      }
    }, 1000)
  }
}

// Writable não altera (transforma) o dado original
class MultiplyByTenStream extends Writable {
  _write(chunk, encoding, callback) {
    console.log(Number(chunk.toString()) * 10)
    callback()
  }
}

// Transform altera o dado
class InverseNumberStream extends Transform {
  _transform(chunk, encoding, callback) {
    const transformed = Number(chunk.toString()) * -1

    callback(null, Buffer.from(String(transformed)))
  }
}

new CountToHundredStream()
  .pipe(new InverseNumberStream())
  .pipe(new MultiplyByTenStream())
```


### Aplicando Streams no módulo HTTP

Podemos considerar que:

- `req`é uma ReadableStream
- `res` é uma WritableStream

### Consumindo uma stream completa

[video](https://app.rocketseat.com.br/node/projeto-01-1/group/streams-no-node-js/lesson/consumindo-uma-stream-completa)

Nesse vídeo ele mostra uma técnica de consumir toda a requisição antes de começar a processar.

Útil de utilizar quando estamos processando um JSON, pois precisamos de payload inteiro.

```js
const server = http.createServer(async (req, res) => {
  const buffers = []
  
  for await (const chunk of req)
    buffers.push(chunk)
  }

  // ...
}
```


### Corpo da requisição em JSON (Stream & Buffers)

[vídeo](https://app.rocketseat.com.br/node/projeto-01-1/group/streams-no-node-js/lesson/corpo-da-requisicao-em-json-stream-buffers)

