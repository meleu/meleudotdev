# Sql\*Plus

## Imagem da Oracle com o Sql\*Plus

A Oracle disponibiliza suas imagens docker no github: <https://github.com/orgs/oracle/packages>

```sh
# imagem com oraclelinux7-slim e sqlplus
docker pull ghcr.io/oracle/oraclelinux7-instantclient:19

# versão mais atual
docker pull ghcr.io/oracle/oraclelinux7-instantclient:19
```

## Criando um container com sqlplus

No meu trampo estava precisando me conectar a um banco de dados Oracle via container (a conexão aconteceria durante a execução de uma esteira de CI/CD no GitLab CI). Observei que não existe no Docker Hub uma imagem pública oficial da Oracle com o `sqlplus` (cliente utilizado para acessar o banco de dados).

Por sorte cheguei [nesse artigo](https://relentlesscoding.com/posts/oracle-sqlplus-in-a-small-docker-container/) com instruções sobre como criar uma imagem com o sqlplus. 

