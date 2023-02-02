---
dg-publish: true
---
# Estrutura Curso de DevOps


## O que é DevOps?
- Como e por que surgiu?
- Que problemas queremos resolver?
- Dev vs Ops
- DevOps como cargo
- Tarefas e Responsabilidades

## Sistemas Operacionais e Básico de Linux

- Máquinas Virtuais
- Instalação do Virtualbox
- Instalação do Linux
    - qual distro? Talvez Ubuntu?
- Linux File System
    - falar da estrutura de diretórios típica de um sistema Linux
    - /home
    - /bin
    - /sbin
    - /usr
    - /lib
    - /var
    - /opt
    - /etc
    - /tmp
    - /boot
    - /dev
- Vivendo no terminal
    - manipulação de arquivos/diretórios
        - cd, ls, mkdir, rmdir, rm, touch, cat
    - editor de texto
        - nano
        - vim
    - manipulação de conteúdo
        - grep, sed
    - atalhos do bash
        - (zsh é uma opção, mas eu não gosto)
        - (por enquanto nada de scripts)
        - ctrl+c, ctrl+a, ctrl+e, ctrl+w, ctr+r, ctrl+z
- gerenciadores de pacotes
    - apt-get (debian based)
    - apk (alpine)
- permissões de arquivos
    - `rwx`
    - fazer demonstrações
- pipes e redirecionamento
- introdução a shell script
    - _**usar shellcheck!!!**_
    - variaveis
    - funcoes
    - sempre abilitar "bash strict mode"!
- variáveis de ambiente

##  Networking

- endereço IP
- como o DNS funciona
- porta TCP
- requisições HTTP
- SSH
    - servidor SSH
    - gerar chaves SSH
    - conectar num servidor via SSH

## _**NOT SURE**_: já falar sobre Cloud Providers?

## Desenvolvimento de Sofware Moderno - Aplicações Web

- Arquitetura cliente/servidor
- Frontend / Backend / Database

## git

- _to be done_

## ferramentas de build e gestão de dependências

- _to be done_
- pip, npm, maven, etc.

## _**NOT SURE**_: falar de repositório de artefatos? (Nexus)

## containers e docker

- _to be done_

## CI/CD pipelines

- Gitlab-CI ou Jenkins (ou outra ferramenta)?
- (sugiro gitlab-ci por ser bastante usado e fácil de experimentar no gitlab.com)
- _**decidir:**_ uma aplicação bem simples para fazer os primeiros experimentos?

## Orquestração de Containers com Kubernetes

- instalar minikube
- _to be done_...
- _**decidir:**_ uma aplicação bem simples, mas que torne possível visualizar os recursos do kubernetes (o [kuard](https://github.com/kubernetes-up-and-running/kuard) do livro "Kubernetes Up & Running" é muito bom!).
- Helm
    - _to be done_...

## Kubernetes gerenciado pelo Cloud Provider

- _to be done_...

## Terraform

- _to be done_...

## Ansible

- _to be done_...

## Prometheus

- _to be done_...

## _**Se chegar até aqui já tá bom pacaralio!!!**_

---

## references

- <https://techworld-with-nana.teachable.com/p/devops-bootcamp>
