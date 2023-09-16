# Python Essentials - linuxtips

Seguindo o curso Python Essentials da LinuxTips

## Componentes da Plataforma Python

- PSF = Python Software Foundation
- PLR = Python Language Reference

A partir da PLR são criados os interpretadores Python.

O interpretador oficial é o CPython.

- Ecossistema
    - PSF
        - Comunidades
    - pacotes e ferramentas
        - PyPI = Python Package Index <https://pypi.org>

## Comandos úteis

Exibe informações de como o site está instalado.

```
python -m site
```


Executar um comando python:
```
python -c 'print("hello world")'
```


### Dica valiosa: help()

Quando estiver Python interativo:
```
help()
help(object)

# exemplo
help(1)
# vai mostrar o help para objeto int
```


### Comentários com significado especial

o `test-ignore` abaixo tem um significado especial.

```
print('Hello') # test-ignore
```




## Organização do código

PEP8

Sequência:

1. docstring
2. dunder metadata
3. imports
4. actual code...


## Ambientes Virtuais

Ambientes virtuais são usados para evitar conflitos de versões de pacotes.

```
# exibe os diretórios usados na instalação local do python
python3 -m site
```

Os arquivos presentes nos diretórios exibidos pelo comando acima são necessários para executar o seu programa. Para copiar os arquivos para uma pasta específica do seu projeto, utilizamos o módulo `venv` (Virtual Environment)

Pra criar um ambiente virtual:
```
# python3 -m venv <nome-do-ambiente>
# por convenção, usa-se '.venv' como nome
python3 -m venv .venv
```



## iPython

```
# install ipython
python -m pip install ipython

# run it
ipython
```

get help appending `?` at the end of a command/class/method

From Bruno Rocha:

> Recomendo que em todos os seus ambientes virtuais você adicione o ipython