## O que são Microsserviços - Alura

- <https://youtu.be/jSnLOoGjQ80>

O discurso deste vídeo vai pelo viés de que o microsserviços tem uma forte influência do fato de ser mais fácil trabalhar com times pequenos.

Um sistema grande (monolítico) sendo mantido por dezenas de desenvolvedores, fica bem difícil de gerenciar as alterações, aguardar testes integrados, etc...

- 2:22 - Benefícios (em comparação com aplicações monolíticas):
    - Implantação mais fácil
    - Integração Contínua mais fácil
    - Testes mais rápido

- Banco de Dados:
    - "Microsserviços que compartilham banco de dados não são microsserviços."
    - Um microsserviço que precisa de persistência terá seu próprio banco de dados "ou utiliza um outro serviço para gravar os dados que ele está utilizando" (ô porra?! isso parece ferir o princípio de que o ms deve ser completamente independente).

Um microsserviço que quebra não quebra a aplicação como um todo.


5:00 - Microsserviços se comunicando através de mensageria.

JSON vs. GRPC (criado pela Google, focado em performance)

Apache Kafka, similar a um Service Bus.

Vantagem de se trabalhar com mensageria:
- Você não precisa se preocupar se o serviço na outra ponta está rodando ou não. Você publica a mensagem, quem tiver interessado nessa mensagem vai consumir. Se quem precisa dessa informação não estiver disponível no momento que ela foi lançada, não tem problema, pois ele poderá perguntar ao orquestrador se há alguma mensagem para ele.

Uma vez que foi tomada a decisão de migrar de monolito para microsserviço, a maneira recomendada para realizar a migração é **NÃO** quebrar seu monolito. O melhor é começar a implementar novas funcionalidades em microsserviços e ir migrando as antigas funcionalidades aos poucos, a medido que elas demandarem atualizações/mudanças.
