---
dg-publish: true
---
## Capítulo 2: Criando e executando contêineres

- voltar para [[Kubernetes Basico]]

[TOC]

---

> O Kubernetes é uma plataforma para criação, implantação e gerenciamento de __aplicações distribuídas__.


### Otimizando os tamanhos das imagens (de container)

#### Armadilha 1: arquivos não são realmente apagados

**Importante**: arquivos que são removidos por camadas subsequentes no sistema, na verdade continuam presentes nas imagens; elas apenas se tornam inacessíveis.

Exemplo:
```
- camada A: contém um 'ArquivoMuitoGrande'
  - camada B: remove 'ArquivoMuitoGrande'
    - camada C: faz alguma outra coisa...
```

Mesmo que `ArquivoMuitoGrande` não esteja acessível na imagem final, ele continua presente na camada A, o que significa que sempre que você fizer o upload/download da imagem, o `ArquivoMuitoGrande` continuará sendo transmitido pela rede (apesar de não ser mais possível acessá-lo).

#### Armadilha 2: cada camada é um "delta" em relação a camada anterior

Sempre que você modificar uma camada intermediária, toda camada que vier depois dela será modificada. Modificar as camadas anteriores implica que elas devem ser reconstruídas, reenviadas e readquiridas para que a imagem seja implantada novamente.

Exemplo:
```
IMAGEM-1
- camada A: contém SO base
  - camada B: acrescenta código server.js
    - camada C: instala o pacote 'nodejs'
```
vs.
```
IMAGEM-2
- camada A: contém SO base
  - camada B: instala o pacote 'nodejs'
    - camada C: acrescenta código server.js
```

Na primeira vez que baixarmos, ambas imagens serão as mesmas. Mas no caso da `IMAGEM-1`, após cada atualização do `server.js` as camadas B e C serão ambas diferentes de suas versões anteriores. Enquanto na `IMAGEM-2`, apenas a camada C será diferente das versões anteriores.


#### Construção de imagens em várias etapas

Para evitar que a imagem final fique cheia de ferramentas de desenvolvimento que não são necessárias para rodar a aplicação, podemos construir uma imagem em duas etapas.

O `Dockerfile` a seguir gera duas imagens, a imagem de `build` e imagem de implantação (que será tagueada na linha de comando).

```Dockerfile
# ETAPA 1: build do projeto
FROM golang:1.11-alpine AS build

# instala node e npm
RUN apk update \
  && apk upgrade \
  && apk add --no-cache git nodejs bash npm

# obtém as dependências para construir o código Go
RUN go get -u github.com/jteeuwen/go-bindata/
RUN go get github.com/tools/godep

WORKDIR /go/src/github.com/kubernetes-up-and-running/kuard

# copia todos os códigos fontes
COPY . .

# variáveis esperadas pelo script de build
ENV VERBOSE=0
ENV PKG=github.com/kubernetes-up-and-running/kuard
ENV ARCH=amd64
ENV VERSION=test

# executa o build
RUN build/build.sh

# ETAPA 2: implantação propriamente dita
FROM alpine

USER nobody:nobody
COPY --from=build /go/bin/kuard /kuard

CMD [ "/kuard" ]

```

Para construir:
```sh
docker build -t kuard .
```

### Segurança

Senhas e imagens **jamais** devem ser misturadas.

Isso vale para qualquer camada do sistema de arquivos. Mesmo que a senha tenha sido removido em uma camada posterior, uma pessoa com as ferramentas corretas conseguirá acessar a camada onde a senha está disponível.


### Limitando o uso de recursos

```
--memory        - limita uso de RAM
--memory-swap   - limita espaço de swap
--cpu-shares    - limita uso de CPU
```

Exemplo:
```sh
docker container run \
  -d \
  --name kuard \
  --publish 8080:8080 \
  --memory 200m \
  --memory-swap 1G \
  --cpu-shares 1024 \
  gcr.io/kuar-demo/kuard-amd64:blue
```


### Limpeza

```sh
docker system prune
```

Há uma menção a uma ferramenta chamada `docker-gc` (garbage collector): <https://github.com/spotify/dockergc> (link quebrado).