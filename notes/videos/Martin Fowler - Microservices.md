---
dg-publish: true
---
## Martin Fowler - Microservices

- <https://youtu.be/Irlw-LGIJO4>
- <https://www.martinfowler.com/articles/microservices.html> - esse artigo parece ser a versão escrita da apresentação

Resumidamente, o estilo arquitetural de microsserviços é uma abordagem para desenvolver uma única aplicação como um **grupo de pequenos serviços**, cada um **executando em seu próprio processo** e se comunicando com mecanismos leves, frequentemente uma API com recursos HTTP. Estes serviços são **construídos em torno de aptidões de negócio** e **implantados independentementer** por um maquinário de deploy completamente automatizado. Existe um mínimo de gerenciamento centralizado destes serviços, que podem ser escritos em diferentes linguagens de programação e usar diferentes tecnologias de armazenamento de dados.


### Characteristics of Microservices

1. Componentization via services
2. Organized around business capabilities
3. Products not Projects
4. Smart endpoints and dumb pipes
5. Decentralized Governance
6. Decentralized Data Management
7. Infrastructure Automation
8. Design for failure
9. Evolutionary Design
 
 
### 1. Componentization via services

- Component
    - independently replaceable
    - independently upgradeable

- Carro:
    - rádio
    - roda
    - vidro elétrico

Em software podemos ter componentização através da criação de Bibliotecas ou de Serviços. Quando estamos usando o paradigma de microsserviços, obviamente estamos implementando componentização através de serviços.

**Definição crucial do termo microsserviços:**

No paradigma de microsserviços, vc precisa ser capaz de substituir e/ou evoluir o seu microsserviço de maneira independente e sem afetar seus clientes.
 
 
### 2. Organized around business capabilities

Divisão tradicional:

- UI
- Server
- DBA

O que é preconizado em microsserviços

- Orders
- Shipping
- Catalog

Essa configuração favorece uma visão de "foco no cliente".

Ao invés de agrupar várias pessoas da mesma disciplina, focadas no seu nicho, focadas no seu "mundinho", temos um grupo multi-disciplinar focado em entregar valor para o cliente daquel serviço (tanto faz se é interno à organização ou externo)


### 4. Smart endpoints and dumb pipes
 
 A inteligência fica nos endpoints. Não usar middleware.
 
 
 
### 6. Decentralized Data Management

Cada microsserviço é responsável por seus dados.



### 7. Infrastructure Automation

- Continuous Delivery
- Blue/Green Deployment
- Monitoring



### Are Microservices just SOA?
 
"Microsserviço é um termo mais modernoso que criaram mas já praticamos isso a muito tempo com SOA!" 
 
 Podemos dizer que Microsserviços é uma maneira bem específica de fazer SOA (Arquitetura Orientada a Serviços).
 
 
 
### How Big is a Microsservice?
 
"It must be understandable by a single person." - too vague.

### Microservices benefits and costs

20:05

| benefits                 | costs                  |
|:------------------------:|:----------------------:|
| strong module boundaries | distribution           |
| independente deployment  | eventual consistency   |
| technology diversity     | operational complexity |



### Monolith vs. Microservice

| Monolith                 | Microservice        |
|:------------------------:|:-------------------:|
| Simplicity               | Partial Deployment  |
| Consistency              | Availability        |
| Inter-module refactoring | Preserve Modularity |
| ~                        | Multiple Platforms  |


A decisão "monólito ou microsserviços" não é apenas tecnológica, também está muito relacionado com como você quer organizar as pessoas.
 
 > People usually complain about silos. But it's human nature to form silos. Groups of people that want to get together. What we wanna do is to rearrange things so that those silos are in the most productive manner possible. That is really what is driving a lot of interest in microservices.
 
 
 
 ### Requirements to use Microservices
 
 - Rapid Provisioning
 - Basic Monitoring
 - Rapid Application Deployment

 
 - DevOps Culture
 
 - Plus:
    - Traceable Business Transactions
    - Continuous Delivery
    - Product-centered Teams
    - Multi-dev Environment
    - Infrastructure as Code
 
 
 ### extra
 
 Achei uma referência à esta apresentação no site do Martin Fowler:
 <https://vimeo.com/74452550>
 
