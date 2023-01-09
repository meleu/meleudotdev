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


