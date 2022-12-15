---
dg-publish: true
---
# python-fastapi-workshop

- curso: <https://www.linuxtips.io/course/criando-site-api-python>
- repo: <https://github.com/rochacbruno/fastapi-workshop>

[TOC]

---

## intro

### pre-requisitos

- Linux
- Python 3.10
- docker


### preparando a estrutura do projeto

```shell
mkdir python-fastapi-workshop
cd python-fastapi-workshop
git init
# criar o gitignore

python -m venv .venv
source .venv/bin/activate
# IMPORTANTE: usar o comando acima sempre
# que trabalhar no projeto!!
```

`requirements-dev.txt`:
```
ipython      # terminal
ipdb         # debugger
sdb          # debugger remoto
pip-tools    # lock de dependências
pytest       # execução de testes
pytest-order # ordenação dos testes
httpx        # requests async para testes
black        # auto formatação
flake8       # linter
```

```shell
pip install --upgrade pip
pip install -r requirements-dev.txt
```

criando estrutura de arquivos/diretórios:
```shell
touch \
  setup.py \
  settings.toml \
  .secrets.toml \
  requirements.in \
  MANIFEST.in \
  Dockerfile.dev \
  docker-compose.yaml
  
mkdir postgres
touch \
  postgres/Dockerfile \
  postgres/create-database.sh

mkdir -p pamps/{models,routes}
touch \
  pamps/default.toml \
  pamps/{__init__,cli,app,auth,db,security,config}.py \
  pamps/models/{__init__,post,user}.py \
  pamps/routes/{__init__,auth,post,user}.py

touch test.sh
mkdir tests
touch \
  tests/{__init__,conftest,test_api}.py
```

diferença entre `requirements.in` e `.txt`:

> no `.in` usamos o nome das dependências sem especificar a versão.

Aos 15:45 ele explica a necessidade de cada biblioteca a seguir

`requirements.in`:
```
# framework para aplicações web
fastapi

# webserver asgi
# async server gateway interface
uvicorn

# classes do python para tabelas SQL
sqlmodel

# administrar o projeto via CLI
typer

# gerenciamento de configs
dynaconf

# templates
jinja2

# encriptação de tokens (necessária para usar JWT)
python-jose[cryptography]

# criar hash do password
passlib[bcrypt]

# receber upload de imagem
python-multipart

# driver pra se conectar com postgresql
psycopg2-binary

# database migration
alembic

# terminal sugar
rich
```

criando o `requirements.txt` baseado no `requirements.in`:
```shell
# isso vai gerar o requirements.txt
pip-compile requirements.in
```

### código inicial

`pamps/app.py`
```py
from fastapi import FastAPI

app = FastAPI(
  title="Pamps",
  version="0.1.0",
  description="Pamps is a posting app",
)
```


`MANIFEST.in`:
```
graft pamps
```

`
Quando usarmos `pip install pamps`, é isso aqui 👇 que será executado

`setup.py`:
```py
from setuptools import find_packages, setup


def read(*paths, **kwargs):
  content = ""
  with io.open(
    os.path.join(os.path.dirname(__file__), *paths),
    encoding=kwargs.get("encoding", "utf8"),
  ) as open_file:
    content = open_file.read().strip()
  return content


def read_requirements(path):
  return [
    line.strip()
    for line in read(path).split("\n"))
    if not line.startswith(('"', "#", "-", "git+"))
  ]


setup(
  name="pamps",
  version="0.1.0",
  description="Pamps is a social posting app",
  url="pamps.io",
  python_requires=">=3.8",
  long_description="Pamps is a social posting app",
  long_description_content_type="text/markdown",
  author="Melon Husky",
  packages=find_packages(exclude=["tests"]),
  include_package_data=True,
  install_requires=read_requirements("requirements.txt"),
  entry_points={
    "console_scripts": ["pamps = pamps.cli:main"]
  }
)
```

```shell
# -e : instalar de forma editável
# . : procura um setup.py neste diretório 
pip install -e .

# verifique se foi instalado
pip list | grep -i pamps

# mostre mais informações
pip show pamps
```


Abrir diretório no VSCode.

VSCode precisa ter a extensão do python instalada.

Verificar se o VSCode detectou o `.venv`.

Ctrl+Shift+P -> `Python: Select Interpreter`


## containers

`Dockerfile.dev`:
```Dockerfile
FROM python:3.10

ENV APP_HOME=/home/app/api
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN groupadd app && useradd -g app app \
  && pip install -r requirements-dev.txt \
  && pip install -e . \
  && chown -R app:app $APP_HOME

USER app

CMD ["uvicorn", "pamps.app:app", "--host=0.0.0.0", "--port=8000", "--reload"]
```

```shell
# criando a imagem do container
docker build -f Dockerfile.dev -t pamps:latest .

# rodando o container:
docker container run \
  --rm -it \
  -v $PWD:/home/app/api \
  -p 8000:8000 \
  pamps:latest 
```


Colocar isso aqui no `app.py` só para teste (mas depois apague):
```py
@app.get("/")
async def index():
  return {"hello": "world"}
```

Observações:

- Confira o `/docs` e o `/redoc`
- possivelmente você terá problemas de permissões na hora de executar o container montando um volume do seu sistema host (`-v $PWD:/home/app/api`). Não consegui resolver isso, apenas executei o comando do `uvicorn` localmente, fora do container.

Portanto utilizei este `Dockerfile.dev`:
```Dockerfile
FROM python:3.10

ENV APP_HOME=/home/app/api
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN pip install -r requirements-dev.txt \
  && pip install -e .

CMD ["uvicorn", "pamps.app:app", "--host=0.0.0.0", "--port=8000", "--reload"]
```


## postgres e docker compose

`postgres/create-databases.sh`:
```bash
#!/usr/bin/env bash

set -Eeo pipefail

createUserAndDatabase() {
  local database="$1"
  echo "Creating user and database '${database}'"
  psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" <<- EoSQL
    CREATE USER ${database} PASSWORD '${database}';
    CREATE DATABASE ${database};
    GRANT ALL PRIVILEGES ON DATABASE ${database} TO ${database};
EoSQL
}

main() {
  local db

  [[ -z "${POSTGRES_DBS}" ]] && return

  echo "Creating DBs: ${POSTGRES_DBS}"
  for db in $(tr ',' ' ' <<< "${POSTGRES_DBS}"); do
    createUserAndDatabase "${db}"
  done

  echo "Finished creating DBs"
}

main "$@"
```

```shell
chmod a+x postgres/create-databases.sh
```

Inserindo o script na imagem do postgres...

`postgres/Dockerfile`
```Dockerfile
FROM postgres:alpine3.14
COPY create-databases.sh /docker-entrypoint-initdb.d/
```

`docker-compose.yaml`:
```yaml
version: '3.9'

services:
  api:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "8000:8000"
    environment:
      PAMPS_DB__uri: "postgresql://postgres:postgres@db:5432/${PAMPS_DB:-pamps}"
      PAMPS_DB__connect_args: "{}"
    volumes:
      - .:/home/app/api
    depends_on:
      - db
    stdin_open: true
    tty: true
  db:
    build: postgres
    image: pamps_postgres-13-alpine-multi-user
    volumes:
      - $HOME/.postgres/pamps_db/data/postgresql:/var/lib/postgresql/data
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_DBS=pamps, pampts_test
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
```

```shell
# faz o build das imagens
docker-compose build

# executa os containers
docker-compose up
```


## modelagem e conexão ao BD

![[python-fastapi-workshop - modelagem db.png]]

`pamps/models/user.py`:
```py
from typing import Optional
from sqlmodel import Field, SQLModel


class User(SQLModel, table=True):
    """Represents the User Model"""

    id: Optional[int] = Field(
        default=None,
        primary_key=True
    )

    email: str = Field(
        unique=True,
        nullable=False
    )

    username: str = Field(
        unique=True,
        nullable=False
    )

    avatar: Optional[str] = None

    bio: Optional[str] = None

    password: str = Field(nullable=False)


```


Colocando o objeto User no contexto:

`pamps/models/__init__.py`:
```py
from sqlmodel import SQLModel
from .user import User

__all__ = ["SQLModel", "User"]
```

 > ![note]
> Instalando um cliente de SQL.

Instalando o Antares a partir [destas instruções aqui](https://github.com/antares-sql/antares-ppa):
```shell
curl https://antares-sql.github.io/antares-ppa/key.gpg \
  | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/antares.gpg
  
sudo curl -s --compressed \
  -o /etc/apt/sources.list.d/antares.list \
  https://antares-sql.github.io/antares-ppa/list_file.list
  
sudo apt update
sudo apt install antares
```


`pamps/default.toml`:
```toml
[default]

[default.db]
uri = ""
connect_args = {check_same_thread=false}
echo = false
```

`pamps/config.py`
```py
import 
```

`pamps/db.py`:
```py
from sqlmodel import create_engine
from .config import settings

engine = create_engine(
  settings.db.uri,
  echo=settings.db.echo,
  connect_args=settings.db.connect_args,
)
```



## migrations

rodando `alembic`:
```shell
alembic init migrations
```

editar o arquivo `migrations/env.py`, colocando o seguinte conteúdo:
```py
# no topo do arquivo
from pamps import models
from pamps.db import engine
from pamps.config import settings

# ...
# editar o target_metadata
target_metadata = models.SQLModel.metadata

# ...
def run_migrations_offline() -> None:
  # ...
  url = settings.db.uri

# ...
def run_migrations_online() -> None:
  # ...
  connectable = engine
```


e no arquivo `migrations/script.py.mako`, logo abaixo da linha com `import sqlalchemy as sa` adicionar o seguinte:
```py
import sqlmodel
```


Entrando no container `api` para rodar o `alembic`
```shell
docker compose exec api /bin/bash

# uma vez dentro do container...
alembic revision --autogenerate -m initial
# verifique o arquivo 'migrations/versions/${hash}_initial.py'

# criando as tabelas
alembic upgrade head
```

Verificar no cliente de SQL se a tabela foi criada

Ainda de dentro do container, executar o comando `ipython`, e no prompt do ipython:
```py
from sqlmodel import Session, select
from pamps.db import engine
from pamps.models import User

with Session(engine) as session:
  print(list(session.exec(select(User))))
```



