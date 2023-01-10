---
dg-publish: true
---
# Descomplicando o Terraform

## Day 1

Estrutura básica de funcionamento do Terraform:

- **Arquivo**: contem as definições da infraestrutura que você deseja
- **Binário terraform**: aplicação que vai aplicar na Cloud, as definições descritas no Arquivo. Em seguida irá registrar o Estado da sua infraestrutura.
- **Cloud**: Aonde sua infraestrutura será montada.
- **Estado**: como está sua infraestrutura atual.

![[Descomplicando o Terraform - funcionamento bsico.png]]

Conceito importante: **infraestrutura imutável**.

Ao invés de ir alterando um servidor, deverá ser criado um novo "do zero" já com as configurações desejadas.

### Cloud e S3

Nesta aula foi criado um bucket S3 e também fomos no IAM e criamos um usuário para uso programático, salvamos o ID a o token (Access Key ID e Secret Access Key).


### Regiões da AWS

Nessa aula é falado sobre as regiões e as Availability Zones (AZ)


### Entendendo o HCL

Dar uma lida na documentação oficial sobre [Configuration Syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration).

HCL é o arquivo de definição do Terraform. Exemplo:

`main.tf`:
```hcl
provider "aws" {
  region = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket = "descomplicando-terraform-meleu"
    key = "terraform-test.tfstate"
    region = "us-east-1"
  }
}
```

Executar o terraform a partir de um container
```shell
docker container run \
  -it \
  -v $PWD:/app \
  -w /app \
  --entrypoint sh \
  hashicorp/terraform:light
```
