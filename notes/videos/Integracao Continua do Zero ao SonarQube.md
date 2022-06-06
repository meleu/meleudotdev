# Integração Contínua (CI) do ZERO ao Sonarqube

- <https://youtu.be/oObcolQppS8>

11:50 - começa a parte prática

Começando a brincar com SonarQube rapidamente:
<https://docs.sonarqube.org/latest/setup/get-started-2-minutes/>

```bash
docker container run \
  -d \
  --name sonarqube \
  --publish 9000:9000 \
  sonarqube:7.9.3-community
```
