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
import os

from dynaconf import Dynaconf

HERE = os.path.dirname(os.path.abspath(__file__))

settings = Dynaconf(
    envvar_prefix="pamps",
    preload=[os.path.join(HERE, "default.toml")],
    settings_files=["settings.toml", ".secrets.toml"],
    environments=["development", "production", "testing"],
    env_switcher="pamps_env",
    load_dotenv=False
)


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
```

> [!note]
> Ao executar o comando acima eu recebi um erro dizendo que o DB `pamps` não existia. Tive que entrar no container do db e executar o `create-databases.sh` manualmente.

```shell
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



## interface CLI

`pamps/cli.py`
```py
import typer
from rich.console import Console
from rich.table import Table
from sqlmodel import Session, select

from .config import settings
from .db import engine
from .models import User

main = typer.Typer(name="Pamps CLI")


@main.command()
def shell():
    """Opens interactive shell"""
    _vars = {
        "settings": settings,
        "engine": engine,
        "select": select,
        "session": Session(engine),
        "User": User,
    }
    typer.echo(f"Auto imports: {list(_vars.keys())}")
    try:
        from IPython import start_ipython

        start_ipython(
            argv=["--ipython-dir=/tmp", "--no-banner"], user_ns=_vars
        )
    except ImportError:
        import code

        code.InteractiveConsole(_vars).interact()


@main.command()
def user_list():
    """Lists all users"""
    table = Table(title="Pamps users")
    fields = ["username", "email"]
    for header in fields:
        table.add_column(header, style="magenta")

    with Session(engine) as session:
        users = session.exec(select(User))
        for user in users:
            table.add_row(user.username, user.email)

    Console().print(table)
```

Conectar no container e testar os comandos
```shell
# certifique-se de que os containers estão em cima
docker compose up

docker compose exec api /bin/bash

# uma vez dentro do container...
# testar o comando pamps
pamps --help
pamps user-list
```


## password hash

`pamps/default.toml`:
```toml
[default.security]
# set secret key in .secrets.toml
# SECRET_KEY = ""
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30
REFRESH_TOKEN_EXPIRE_MINUTES = 600
```

`.secrets.toml`:
```toml
[development]
dynaconf_merge = true

[development.security]
# command para gerar uma chave:
# openssl rand -hex 32
SECRET_KEY = "995f7bbc6c825e936be096cee21f97bcbd8076881a13ef43b2205c53ad370937"
```

`pamps/security.py`:
```py
from passlib.context import CryptContext

from pamps.config import settings

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

SECRET_KEY = settings.security.secret_key
ALGORITHM = settings.security.algorithm


def verify_password(plain_password, hashed_password) -> bool:
    """Verifies a hash against a password"""
    return pwd_context.verify(plain_password, hashed_password)


def get_password_hash(password) -> str:
    """Generates a hash from plain text"""
    return pwd_context.hash(password)


class HashedPassword(str):
    """Takes a plain text password and hashes it.
    use this as a field in your SQLModel
    class User(SQLModel, table=True):
        username: str
        password: HashedPassword
    """

    @classmethod
    def validate(cls, v):
        """Accepts a plain text password and returns a hashed password."""
        if not isinstance(v, str):
            raise TypeError("string required")

        hashed_password = get_password_hash(v)
        return cls(hashed_password)
```

Voltamos ao `pamps/models/user.py` para alterar a definição do `password`:
```py
# adicionar esse import
from pamps.security import HashedPassword


class User(SQLModel, table=True):
    # ...
    password: HashedPassword
```


Vamos no `pamps/cli.py` adicionar uma função para criar um novo usuário:
```py
@main.command()
def create_user(email: str, username: str, password: str):
    """Create user"""
    with Session(engine) as session:
        user = User(email=email, username=username, password=password)
        session.add(user)
        session.commit()
        session.refresh(user)
        typer.echo(f"created {username} user")
        return user
``` 


Volta ao terminal conectado ao container:
```shell
pamps --help
# confira se a opção create-user foi adicionada

# ver o help do create-user
pamps create-user --help

# criando um usuário
pamps create-user admin@admin.com admin 1234
```

## API de usuários


### `pamps/models/user.py`

```py
from typing import Optional
from sqlmodel import Field, SQLModel
from pamps.security import HashedPassword
from pydantic import BaseModel


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


class UserResponse(BaseModel):
    """Serializer for User Response"""
    
    username: str
    avatar: Optional[str] = None
    bio: Optional[str] = None


class UserRequest(BaseModel):
    """Serializer for User request payload"""
    
    email: str
    username: str
    password: str
    avatar: Optional[str] = None
    bio: Optional[str] = None
```


PAREI em 4 minutos




## token jwt

### `pamps/auth.py`:

```py
"""Token absed auth"""
from datetime import datetime, timedelta
from typing import Callable, Optional, Union

from fastapi import Depends, HTTPException, Request, status
from fastapi.security import OAuth2PasswordBearer
from jose import JWTError, jwt
from pydantic import BaseModel
from sqlmodel import Session, select

from pamps.config import settings
from pamps.db import engine
from pamps.models.user import User
from pamps.security import verify_password

SECRET_KEY = settings.security.secret_key
ALGORITHM = settings.security.algorithm


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")


class Token(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str


class RefreshToken(BaseModel):
    refresh_token: str


class TokenData(BaseModel):
    username: Optional[str] = None


def create_access_token(
    data: dict, expires_delta: Optional[timedelta] = None
) -> str:
    """Creates a JWT Token from user data"""
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire, "scope": "access_token"})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


def create_refresh_token(
    data: dict, expires_delta: Optional[timedelta] = None
) -> str:
    """Refresh an expired token"""
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire, "scope": "refresh_token"})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


def authenticate_user(
    get_user: Callable, username: str, password: str
) -> Union[User, bool]:
    """Authenticate the user"""
    user = get_user(username)
    if not user:
        return False
    if not verify_password(password, user.password):
        return False
    return user


def get_user(username) -> Optional[User]:
    """Get user from database"""
    query = select(User).where(User.username == username)
    with Session(engine) as session:
        return session.exec(query).first()


def get_current_user(
    token: str = Depends(oauth2_scheme), request: Request = None, fresh=False
) -> User:
    """Get current user authenticated"""
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )

    if request:
        if authorization := request.headers.get("authorization"):
            try:
                token = authorization.split(" ")[1]
            except IndexError:
                raise credentials_exception

    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")

        if username is None:
            raise credentials_exception
        token_data = TokenData(username=username)
    except JWTError:
        raise credentials_exception
    user = get_user(username=token_data.username)
    if user is None:
        raise credentials_exception
    if fresh and (not payload["fresh"] and not user.superuser):
        raise credentials_exception

    return user


async def get_current_active_user(
    current_user: User = Depends(get_current_user),
) -> User:
    """Wraps the sync get_active_user for sync calls"""
    return current_user


AuthenticatedUser = Depends(get_current_active_user)


async def validate_token(token: str = Depends(oauth2_scheme)) -> User:
    """Validates user token"""
    user = get_current_user(token=token)
    return user
```


### `pamps/routes/auth.py`

```py
from datetime import timedelta

from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm

from pamps.auth import (
    RefreshToken,
    Token,
    User,
    authenticate_user,
    create_access_token,
    create_refresh_token,
    get_user,
    validate_token,
)
from pamps.config import settings

ACCESS_TOKEN_EXPIRE_MINUTES = settings.security.access_token_expire_minutes
REFRESH_TOKEN_EXPIRE_MINUTES = settings.security.refresh_token_expire_minutes

router = APIRouter()


@router.post("/token", response_model=Token)
async def login_for_access_token(
    form_data: OAuth2PasswordRequestForm = Depends(),
):
    user = authenticate_user(get_user, form_data.username, form_data.password)
    if not user or not isinstance(user, User):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": user.username, "fresh": True},
        expires_delta=access_token_expires,
    )

    refresh_token_expires = timedelta(minutes=REFRESH_TOKEN_EXPIRE_MINUTES)
    refresh_token = create_refresh_token(
        data={"sub": user.username}, expires_delta=refresh_token_expires
    )

    return {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "bearer",
    }


@router.post("/refresh_token", response_model=Token)
async def refresh_token(form_data: RefreshToken):
    user = await validate_token(token=form_data.refresh_token)

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": user.username, "fresh": False},
        expires_delta=access_token_expires,
    )

    refresh_token_expires = timedelta(minutes=REFRESH_TOKEN_EXPIRE_MINUTES)
    refresh_token = create_refresh_token(
        data={"sub": user.username}, expires_delta=refresh_token_expires
    )

    return {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "bearer",
    }
```

### `pamps/routes/__init__.py`

```py
from fastapi import APIRouter

from .user import router as user_router
from .auth import router as auth_router

main_router = APIRouter()

main_router.include_router(auth_router, tags=["auth"]
main_router.include_router(user_router, prefix="/user", tags=["user"])
```