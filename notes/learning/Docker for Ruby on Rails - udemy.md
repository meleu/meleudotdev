---
dg-publish: true
---
# Docker for Ruby on Rails - udemy

- <https://cloudwalk.udemy.com/course/docker-rails>

Curso bem básico sobre docker. Vou aqui apenas anotar algumas coisas...

```shell
# listar processos
docker container top

# muito detalhado
docker container inspect <container-id> # JSON output

# estatísticas de consumo de CPU/RAM/network/etc...
docker container stats

# reconectar a um container em execução
docker container attach <container-id>

# executar comandos sem "entrar" no container
docker container exec <container-id> <comando>

# renomear container
docker container rename <old-name> <new-name>

# remover containers parados
docker container prune
```


### Cloud9

No curso ele menciona o [Cloud9](https://c9.github.io/core/). Percebi que é um produto que foi adquirido pela [Amazon](https://c9.io).

### Volumes

A aula "14. Entendendo Volumes" é bacaninha.

[docs](https://docs.docker.com/storage/volumes/)

Minhas palavras:

> Uma imagem especifica o volume, que é um diretório onde dados serão persistidos. Cabe ao usuário do container especificar qual diretório do sistema hospedeiro ele quer montar no volume.

```shell
# exectuar o inspect e procurar or Volumes e Mounts
docker image inspect <image-id>

# listar volumes
docker volume ls
# inspecionar um volume
docker volume inspect <volume-id>
```

### docker container commit

eu não conhecia esse comando: `docker container commit`

[docs](https://docs.docker.com/engine/reference/commandline/commit/)

Cria uma nova imagem a partir do container.

```shell
# exemplo
docker container commit -m "mensagem de commit" <container-id>
```

### mapeando portas

Além do tradicional `-p <host-port>:<container-port>`, existe também a opção `-P`.

From the [docs](https://docs.docker.com/engine/reference/commandline/container_run/)
```
--publish-all, -P    Publish all exposed ports to random ports
```

E aí pra ver qual foi a porta aleatório que o docker pegou:
```shell
docker port <container-id>
```


### formatando o output

[docs](https://docs.docker.com/config/formatting/)

Ao executar `docker <command> inspect` o output já JSON. Podemos observar a estrutura e filtrar apenas o que queremos. Exemplo:

```shell
# obter apenas a portas expostas
docker image inspect --format '{{json .Config.ExposedPorts}}' <image-id>

# listar diretórios onde os volumes são montados
docker image inspect --format '{{json .Config.Volumes}}' <image-id>
```

### docker network

[docs](https://docs.docker.com/network/)

```shell
# launch 3 containers

for i in {1..3} do
  docker container run --rm -d -it --name alpine${i} alpine
done

# listar redes
docker network ls
# by default os containers se conectam a rede 'bridge'

# nesse inspect dá pra ver quais containers estão na rede
docker network inspect bridge
docker network inspect --format '{{ json .Containers }}' bridge

# podemos [des]plugar um container da red
# docker network connect <network> <container>
# docker network disconnect <network> <container>

# desconectando...
docker network disconnect bridge alpine1

# criar uma rede
docker network create mynet
docker network ls

# conectando em 'mynet'
docker network connect mynet alpine1

# apagar uma network
docker network rm mynet
# isso vai dar erro!
# antes de destruir uma rede é necessário
# desconectar todos os containers

# criar um container já conectando em uma rede específica
docker container run ... --network mynet <image>
```


## Usando a imagem do PostgreSQL

```shell
# o -v determina o dir no host que vai armazenar os dados
docker container run \
  --name my-postgres \
  -v $PWD/postgres:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=SeCrEt \
  -d \
  -P \
  postgres
```

OBS.: Se estiver no Linux e trabalhando com rails, pode ser necessário instalar o pacote `libpq-dev`.