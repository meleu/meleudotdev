---
dg-publish: true
---
# Aprenda Rust - Bruno Rocha

Playlist: <https://youtube.com/playlist?list=PLjSf4DcGBdiGCNOrCoFgtj0KrUq1MRUME>


## Introdução à linguagem Rust

<https://youtu.be/zWXloY0sslE>

`hello.rs`:
```rust
fn main() {
  println!("Hello World!");
}
```

Compilar:
```shell
# isso vai gerar um binário chamado 'hello'
rustc hello.rs
```

Compilar desta 👆 forma só é utilizado para coisinhas rápidas.

Normalmente usamos o `cargo` para gerenciar pacotes e outras coisas relacionadas ao projeto.

Iniciando um novo projeto:
```shell
cargo new my_project
# isso vai criar um dir com essa estrutura:
# my_project
# ├── Cargo.toml
# └── src
#     └── main.rs
```

**NOTA**: sempre que um diretório tiver um `Cargo.toml` válido, podemos dizer que é um workspace do Rust.

Fazer build do projeto:
```shell
# faz o build do projeto:
cargo build
# isso vai criar o dir 'target/'
# o binário vai para 'target/debug/my_project'

# executa o projeto
cargo run

# formatar o código
cargo fmt
```

## Variáveis e Constantes

<https://youtu.be/GYhTFLdHNQI>

Ferramenta útil:
```shell
cargo install cargo-watch

# agora conseguimos usar
cargo watch -x run
```

- Tipagem forte.
- Na declaração ocorre inferência de tipo.
- Por padrão as variáveis são imutáveis
    - Se quiser variável mutável, use `mut`
- Coding style: snake_case

```rust
// hours será do tipo inteiro
let hours = 30;

// se quiser mutável, precisa usar 'mut'
let mut counter = 0;
```

É possível recriar uma variável sem problema algum:
```rust
fn main() {
  let hours = 30;
  // do something...
  
  let hours = "quarenta";
  // this 👆 is perfectly fine
}
```

Definindo constantes:
```rust
// coding convention: ALL_CAPS_SNAKE_CASE
const SECONDS_IN_MINUTES: u32 = 60
```

Observações sobre constantes:

- precisa definir o tipo
- não pode ser definida novamente


## Tipos Primitivos em Rust

<https://youtu.be/IEFrj4znVIU>

Tipos primitivos são divididos em dois tipos:

- Escalares
- Compostos

Detalhando:

- Escalares
    - representam um único valor contido dentro de uma escala conhecida
    - permitem a comparação direta entre valores.
    - são eles:
        - inteiro
        - ponto flutuante
        - booleano
        - caractere
- Compostos
    - servem para agregar multiplos valores
    - são eles:
        - matriz (array)
            - Coleção de tipos iguais
            - ex.: `[1, 2, 3, 4, 5]`
        - tupla (tuple)
            - Coleção de tipos diferentes
            - ex.: `(5, true, 42.1, 'a')`

### Escalares

#### Inteiros

| bits | signed | unsigned |
| ---- | ------ | -------- |
| 8    | i8     | u8       |
| 16   | i16    | u16      |
| 32   | i32    | u32      |
| 64   | i64    | u64      |
| 128  | i128   | u128     |
| arch | isize  | usize    |

**Observação**: se não for definido, o compilador irá inferir um inteiro como `i32`.

Existem duas formas de definir o tipo na declaração da variável:
```rust
let x: u8 = 5;
let y = 5_u8;
```

Também é possível usar `_underline_` para melhorar a legibilidade:
```rust
let price = 112_899;
```

Números em diferentes bases:
```rust
let hexadecimal = 0xff;
let octal = 0o77;
let binario = 0b1111_0000;
let byte = b'A'; // NOTA: isso é diferente de char!
```


#### Ponto-flutuante

**Observação**: se não for definido, o compilador irá inferir um ponto-flutuante como `f64`.


#### Booleano

```rust
let isSomething = true;
let isCorrect: bool = false;
```


#### Caracter

Qualquer caracter Unicode, ou seja, aceita emojis!


### Compostos

<https://youtu.be/IEFrj4znVIU?t=920>
