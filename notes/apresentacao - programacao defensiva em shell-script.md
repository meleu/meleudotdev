---
dg-publish: true
---
assunto a sere abordado na palestra

---

quem sou eu

- meleu.sh - shell script
- contribuições Open Source
- meleu.dev

Nos últimos dois anos a maior parte do meu dia a dia tem sido refatorar/reescrever pipelines de integração contínua que foram escritas como shell-script.

As técnicas que quero compartilhar nessa palestra são técnicas que a princípio foram usadas por mim pra me ajudar a economizar tempo e a sofrer menos nesse processo de refatoração/reescrita dessas pipelines. Acontece que eu percebi que essas técnicas são extremamente benéficas para qualquer pessoa que escreves programas usando bash.

---

The Art of Unix Programming

> Quando precisar falhar, falhe ruidosamente e o mais cedo possível.

Interpretando essa regra, a parte de falhar ruidosamente é fácil de compreender né? Significa fornecer mensagens de erro claras e explícitas a respeito do erro pra poder facilitar a correção.

Essa segunda parte, de falhar o mais cedo possível, a princípio pode causar um pouco de estranheza. "Como assim cara? Qual é a vantagem de falhar o mais cedo possível?" O lance é que quanto mais cedo você perceber/visualizar um erro, mais rápido você vai corrigir. Sua mente já vai estar contextualizada com o código que está relacionado aquele erro.

Imagine um erro que só aparece daqui há uma semana, ou meses ou até anos... Você vai ter que gastar um tempo e queimar uns neurônios até se contextualizar e ter clareza do que está acontecendo. Por isso quanto mais cedo melhor.

---

Essa palestra é basicamente uma demonstração desse que é um dos princípios da filosofia Unix, aplicada à shell-script.

A palestra é dividida em três partes:

1. vou mostrar algumas técnicas de falhar o mais cedo possível (com configurações do bash).
2. vou mostrar uma técnica de falhar ruidosamente (usando o trap).
3. vou mostrar uma técnica de ser alertado antes mesmo de falhar (usando shellcheck).

---

TODO: rodar o vim "seco", sem plugin algum.

---

## Script "permissivo"

Exemplo:

```bash
#!/usr/bin/env bash

# exemplo hipotético de um script super crítico

# ...

# preenchendo a variável com algo importante
variavelImportante="$(grep -o "RegEx" "/dir/file")"

# usando um comando super legal com um conteúdo
# de uma variável super importante!
comando "${variavelImportante}"

# ...

```

O problema aqui é: se o `grep` falhar, o bash vai continuar seguindo em frente e executar os próximos comandos.


```bash
#!/usr/bin/env bash

echo "exibindo conteúdo do arquivo:"
cat /diretorio/arquivo-inexistente
echo "fim do arquivo"
```

Como podemos ver, mesmo após um comando mal sucedido, o bash continua executando o script. Isso pode gerar resultados bastante desagradáveis e você pode perder muito muito tempo debugando seu programa até se tocar de que o problema é que sua variável não está sendo alimentada onde você esperava que isso acontecesse.

Então pra evitar esse tipo de problema nós vamos pedir ao bash pra ele interromper a execução do script assim que ele encontrar um erro.

Fazemos isso utilizando `set -o errexit`, que também pode ser expressado através do `set -e`.

Vamos fazer um teste aqui:

```bash
#!/usr/bin/env bash

set -e # saia ao falhar

echo "exibindo conteúdo do arquivo:"
cat /diretorio/arquivo-inexistente
echo "fim do arquivo"
```

Opa, agora sim hein! Agora melhorou!

TODO: Continuar aqui... falar do `if`, `while` e `||`, que são maneiras de "interceptar" a interrupção do script.



---

## `set -o pipefail`

Exemplo:

```bash
#!/usr/bin/env bash
# userUpper.sh
##############
# Verifica se usuário existe no sistema
# e converte o username para maiúsculo.

grep -o "^${1}:" /etc/passwd \
  | cut -d: -f1 \
  | tr "[:lower:]" "[:upper:]"
```


