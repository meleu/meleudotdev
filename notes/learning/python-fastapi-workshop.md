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
ipython # terminal
ipdb # debugger
sdb # debugger remoto
pip-tools # lock de dependências
pytest # execução de testes
pytest-order # ordenação dos testes
httpx # requests async para testes
black # auto formatação
flake8 # linter
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
    for line in read(path.split("\n")
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
pip install | grep -i pamps

# mostre mais informações
pip show pamps
```


Abrir diretório no VSCode.

VSCode precisa ter a extensão do python instalada.

Verificar se o VSCode detectou o `.venv`.

Ctrl+Shift+P -> `Python: Select Interpreter`


## containers


