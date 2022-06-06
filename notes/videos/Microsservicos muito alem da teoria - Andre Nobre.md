---
dg-publish: true
---
## Microsserviços muito além da teoria: a prática da concepção ao deploy - André Nobre

- <https://youtu.be/OZ5NgGUheII>

### eu preciso de microsserviço?

> In short, the microservice architectural style is an approach to developing a single application as a **suite of small services**, each **running in its own process** and communicating with lightweight mechanisms, often an HTTP resource API. These services are **built around business capabilities** and **independently deployable** by fully automated deployment machinery. There is a bare minimum of centralized management of these services, which may be written in different programming languages and use different data storage technologies.

- suite of small services - contextos bem definidos
- running in its own process - isolados
- built around business capabilities - focados no negócio
- independently deployable - independentes

> Se você tem um desafio que não se refere a algum destes 4 itens, você não precisa de microsserviços. Você não precisa arcar com a complexidade que uma arquitetura de microsserviços traz.

### 05:15 - #2 O que é micro?

> O "micro" na definição de microsserviços é uma "pegadinha". Não acreditem nessa história de microsserviço só faz uma coisa. (...) Muito relacionado com o conceito de Domain Driven Design (Eric Evans).

- SOA design patterns:
    - functional decomposition
    - service encapsulation
    - agnostic context
    - agnostic capability
    - utility abstraction 
    - entity abstraction
    - non-agnostic context
    - process abstraction


### 10:22 - #3 Utilizar a melhor tecnologia para o cenário

> Você pode usar tecnologias diversas, mas isso tem um custo. Não é barato você ter mão de obra com conhecimento tão diversificado, infraestrutura é um tópico complexo, e é difícil achar profissionais tão variados no mercado.


### 13:40 - #4 Cuidados no desenvolvimento

- **Pontos de atenção:**
    - não crie microsserviços para resolver problemas de tecnologia (e sim para resolver problemas de negócio)
    -  performance não é só tempo de resposta
        -  tempo de resposta + CPU + memória
    - cache


### 18:10 - #5 Teste, por favor. É sério.

Definir uma meta de cobertura de código mínima.

Testes de navegação (ex.: PhantomJS).

Faça testes de carga com frequência (ex.: BlazeMeter, Load Testing do Azure).


### 21:25 - #6 Monitoramento

Não tem como desenvolver microsserviços e abrir mão do monitoramento.

- Exemplos:
    - Dynatrace
    - New Relic
    - AppDynamics
    - Zabbix

Transaction flow - fornecido pelo dynatrace.


### 24:50 - #7 API Management

Precisamos ter uma governançla muito bem definida.


### 26:10 - #8 API Gateway

Vocês irão precisar de um gateway. Não tem como fugir disso.

- Opções
    - sensedia
    - Amazon API Gateway
    - ASO2 API Manager
    - API Management - IBM
    - ??? - Microsoft Azure
 

### 29:07 - #9 Vá devagar, aprenda.

- Pontos que a gente se deu mal:
    - performance
    - falta de montiroamento
    - curva de aprendizagem
    - custo mais alto

No entanto os benefícios em produtividade são bastante interessantes.
