---
dg-publish: true
---
- rails-todo-api
- retroachievements-api
- [book-library-api](https://github.com/ANNEBORTOLI/book-library-api)
- dryve challenge

---

### dryve challenge

#### 1. Problema

Criar um serviço de cadastro de veículos onde serão fornecidos os dados básicos e deverá ser obtido seu valor na tabela FIPE para posterior consulta. A consulta poderá ser através da placa do veículo ou por listagem de veículos dada uma marca (o resultado deverá ser paginado).

O processo para cadastro dos veículos deverá seguir o seguinte fluxo:

- Serão recebidos os dados do veículo para cadastro:
    - Placa
    - ID Marca (21, 13, 45, etc.)
    - ID Modelo (7027)
    - Preço do anúncio
    - Ano
- A partir dos dados recebidos, será consultado o valor da tabela FIPE do veículo utilizando a API disponível em https://github.com/giovanigenerali/fipe-json
- Todos os dados do veículo serão salvos em um banco de dados:
    - Placa
    - Preço do anúncio
    - Ano
    - Preço da FIPE
    - Data do Cadastro
- Deverá existir a relação (FKs) entre marca, modelo e veículo no banco de dados;
- Não poderá ser cadastrado um veículo com uma placa que já esteja cadastrada;
- Não poderá ser cadastrado um veículo com marca, modelo e/ou ano que não existam na consulta dos dados da tabela FIPE ou no banco de dados do serviço;
- Os dados do veículo no resultado da consulta deverão ser no seguinte modelo:

```json
{
  "placa": "XYZ-1234",
  "preco_anuncio": 1234.56,
  "ano": 2020,
  "preco_fipe": 1234.56,
  "data_cadastro": "2020-05-18",
  "modelo": "UNO",
  "marca": "FIAT"
}
```

#### 2. Crie um repositório no github

e descreva o passo a passo no README para o funcionamento, juntamente com as tecnologias utilizadas e as demais informações que achar relevante.

#### 3. Crie um serviço

de para listagem da marcas que deverá retornar as marcas cadastradas e a quantidade de modelos cada marca, a resposta deve ser no seguinte modelo:

```json
[
  {
    "id": "ca43ec74-5bb0-4288-ab11-5df094ca4dc4",
    "name": "FIAT",
    "total_modelos": 3
  }
]
```
