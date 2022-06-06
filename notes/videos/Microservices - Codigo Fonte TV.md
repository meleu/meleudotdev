# Microservices - Código Fonte TV

- <https://youtu.be/_2bDOCTnbKc>

Uma forma de desenvolver sistemas onde cada pedaço pode ser pensado, desenvolvido e disponibilizado de forma independente.

(similaridades com SOA: Service Oriented Archtechture)

Microsserviços devem ser considerados, principalmente nestas situações

- Aplicações grandes
- Aplicações complexas
- Aplicações com domínios avançados (ou muitos subdomínios)
- Equipes pequenas de desenvolvimento

Percebe-se que há uma forte relação com outras práticas como:

- Integração Contínua
- Containers
- DevOps

Pois é o que possibilita a implantação (deploy) dos microsserviços de maneira independente.

### desafios

Cada pedacinho do sistema (ou seja, o microsserviço em si) torna-se mais simples. Mas o sistema como um todo fica mais complexo.

Uma boa gestão e orquestração dos microsserviços se torna mandatório para o bom andamento do sistema. Também podemos chamar isso de governança.

Desenvolvimento e testes exigem uma abordagem diferente. Refatorar entre os limites de serviços se torna bastante complicado. Testar uma aplicação com muitas dependências de serviço é bastante desafiador.

"Estudos indicam" que a resolução de problemas ficam cerca de **73%** mais complicadas.

Como a comunicação entre os microsserviços se dá através de um gateway de API com chamadas HTTP, a latência e o congestionamento são uma realidade. Principalmente se houverem chamadas encadeadas.

Outro desafio: maior necessidade de storage.


### boas práticas

- Serviços devem ser modelados em torno de domínios da empresa
- Descentralize o poder, equipes autônomas trabalham melhor
- Armazenamento de dados deve ser privado (??)
- Serviços se comunicam via APIs bem projetadas (sem vazamento de detalhes de implementação)
- Evite o acoplamento de serviços
- Deixe para o gateway que controla as chamadas de APIs os detalhes como autenticação, comunicação SSL, e outros detalhes mais abrangentes
- Deixe os detalhes de domínio, de fora do gateway. Ele vai apenas tratar e rotear as solicitações sem qualquer conhecimento sobre as regras de negócio.
- Acoplamento flexível e alta coesão funcional.
- Estratégias de resiliência (??)
