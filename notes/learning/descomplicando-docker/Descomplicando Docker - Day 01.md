---
dg-publish: true
---
# Descomplicando Docker - Day 01

- voltar para [[Descomplicando Docker]]


## principais aprendizados

- dá pra limitar CPU e memória usando `--memory` e `--cpus` (lembre-se `cpus`, no plural)
- `stress` é uma ferramentinha maneira para testes de stress
- limite CPU e memória, faça testes com o `stress` dentro do container, e confira com `docker container stats` fora do container.
- faça clean do cache na mesma layer em que o cache foi gerado! Do contrário a layer com o cache continuará existindo, mesmo que a layer seguinte remova os arquivos.



## Observações

- não falou do Docker Hub (container registry) que é de onde vêm as imagens quando fazemos `docker container run ...`
- não falou do `--publish <hostPort>:<containerPort>`


### O que são containers

Containers -> isolamento

- Isolamento lógico:
    - gerenciado pelos namespaces
    - exemplos:
        - processos
        - usuários
        - networking
        - mountpoint
- Isolamento "físico"
    - gerenciado pelo cgroups
    - exemplos:
        - CPU
        - RAM
        - I/O

Docker te ajuda a executar containers.

Histórico:

1. chroot
2. LXC -> inspirou o Docker
3. jails (\*BSD)


### O que é copy on write

Uma imagem de container tem várias camadas.

Ao fazer uma alteração em algum arquivo num container "vivo", o Docker automaticamente cria uma cópia daquele arquivo a partir do original presente na respectiva camada da imagem original.

Cada instrução em um Dockerfile gera uma nova camada.

Quando você instala um pacote e quer remover os arquivos de cache, é importante fazer isso na mesma instrução `RUN`, conectando os comandos com `&&`. Se a remoção do cache for feita em outra instrução, a camada onde o cache foi gerado será persistida, deixando a imagem com um tamanho desnecessário.


### Namespace, cgroups e Netfilter

O container utiliza o kernel do host.


### Prática

- `^p q`:  sai do bash e mantém o container rodando
- `docker container pause <containerId>` pausa o container (duh!)
- `docker container unpause <containerId>` retira da pausa

```bash
# stats
docker container stats


# teste de stress
# NOTA: executar dentro do container
apt update && apt install stress

stress --cpu 1 --vm-bytes 128M --vm 1


# limitando memória
docker container run -d -m 128M nginx
# após instanciar o container, conferir Memory no docker inspect

# limitando CPU
docker container run -d -m 128M --cpus 0.5
# após instanciar o container, conferir NanoCpus no docker inspect

# alocando mais recursos para o container
docker container update --cpus 0.2

```


trick:
```bash

# converter bytes para megabytes

bc
valor_em_bytes / 1024 / 1024


```

Primeiro Dockerfile:

```Dockerfile
FROM debian

LABEL app="giropops"
ENV NAME='meleu'


RUN apt-get update \
  && apt-get install stress \
  && apt-get clean

CMD stress --cpu 1 --vm-bytes 64M --vm 1
```

