---
dg-publish: true
---

# Programação Defensiva em shell-script

Evitando dores de cabeça e tiros no pé.

---

![[the-art-of-unix-programming.png]]

> **Quando precisar falhar, falhe ruidosamente e o mais cedo possível.**

- Eric S. Raymond, The Art of UNIX Programming

%%

Esse livro, escrito pelo Eric Raymond há cerca de 20 anos atrás, foi um livro que eu gostei muito. Eu considero uma preciosidade, por que ele contém um compilado da sabedoria acumulada dos caras que participaram e testemunharam o nascimento e a evolução do UNIX.

É um livro onde encontramos várias "regras" que nortearam o desenvolvimento dessa coisinha maravilhosa que o UNIX. E uma dessas regras diz o seguinte:

**Quando precisar falhar, falhe ruidosamente e o mais cedo possível.**

E essa apresentação basicamente vai mostrar algumas técnicas de como você pode aplicar essa regra nos seus programas escritos em shell-script e como isso vai te salvar de muita dor de cabeça.

%%

---

## Quem é meleu?

![[avatar-linkedin.png]]
Augusto "meleu" Lopes

![[megameleu.png]]

meleu

- <https://meleu.dev>
- <https://meleu.sh>


%%
Bem me chamo Augusto, mas dificilmente alguém me chama assim, por que desde criancinha meu apelido é meleu e eu acabei trazendo esse apelido pra minha vida digital também.

Sou um entusiasta do Linux desde 1999, que foi quando comprei meu primeiro computador. Passei boa parte da minha juventude com a cara na telinha preta, fuçando Linux, programando em C, shell script, estudando protocolos de rede, tudo isso com o único propósito de me divertir.

Sou de Campos dos Goytacazes, uma cidade do interior do Rio de Janeiro e sempre tive zero expectativa de trabalhar com Linux. Eu simplesmente passava meu tempo nerdeando porque achava isso divertido, por que eu gosto de saber como a internet funciona e acreditava que eu ia ser um super hackerzão.

O tempo passou, eu tive um filho, e eu com toda essa bagagem de nerdão do Linux fui trabalhar com o quê? Adivinha!

Petróleo.

Trabalhei na Petrobras, e fui operador de produção por 17 anos. Eu era o peão que ficava em alto mar, numa plataforma de petróleo e, bem, produzindo petróleo.

E o interessante é que durante todo esse tempo, nunca abandonei a nerdeza. Durante esse tempo trabalhando na área de petróleo eu dei meus pulo pra me formar em Ciência da Computação. Mas mesmo depois de formado eu permaneci na área de petróleo, por que, né? 🤑 A grana era interessante e talz...

E mesmo lá a bordo da plataforma, só tendo máquina com Windows disponível, eu dava um jeito de instalar o bash e automatizar as tarefas repetitivas que eu tinha que fazer.

Em 2016, graças ao Raspberry Pi, eu comecei a me envolver com projetos Open Source relacionados ao meu hobby: retrogames.

Comecei no projeto RetroPie, que faz uso intensivo de bash. E foi aí que realmente comecei a entender como é essa coisa de trabalhar de maneira colaborativa, Pull Request, Code Review.

Fiz algumas contribuições ao projeto RetroArch, que é em C. E escrever código em C é uma delicinha. Aquela sensação que você tá fazendo uma cirurgia.

Mas onde o bixo pegou mesmo foi no projeto RetroAchievements, que é um projeto que implementa esse conceito de conquistas, que temos nos jogos modernos, só que pra games antigos. Usando emuladores.

Foi nesse projeto que comecei a usar, sem nem saber, os conceitos de DevOps. Eu via um desenvolvedor contribuindo com o projeto, mas tendo dificuldade com alguma área que não era da expertise dele, eu já queria pegar aquela tarefa pra mim e tirar todos os empecilhos da frente do cara. Deixava o caminho livre pro desenvolvedor e falava voa garoto!

Criei site de documentação, bot no discord, liderança da comunidade...

Até que por volta de 2018 eu comecei a perceber que todas essas skills que eu estava usando e desenvolvendo, totalmente no amor, por pura diversão, eu poderia usar pra pagar minhas contas.

Nessa época comecei gerenciar alguns servidores Linux para alguns amigos, um com uma empresa de logística aqui, outro com uma empresa de contabilidade acolá. Comecei também a escrever artigos sobre shell scripting e truques de linha de comando no meleu.sh até que pintou o convite pra trabalhar como DevOps Engineer e finalmente larguei a indústria do Petróleo.

Como DevOps eu acabei focando em esteiras de integração contínua e deploy em Kubernetes.

E aí que nos últimos dois anos a maior parte do meu dia a dia tem sido refatorar/reescrever esteiras que foram escritas em shell script.

Quem aqui já trabalhou com esteiras escritas em shell-script sabe a dor que é. É um mangue que ninguém quer mexer. Pois bem, é esse tipo de desafio que eu venho encarando nos dois últimos anos.

E as técnicas que quero compartilhar nessa palestra são técnicas que a princípio foram usadas pra me ajudar a economizar tempo e a sofrer menos nesse processo de refatoração/reescrita dessas pipelines.

E aí acontece que eu percebi que essas técnicas são extremamente benéficas para qualquer pessoa que escreves programas usando bash.

Independente se você é iniciante ou experiente, se é pra pipeline ou pra um scriptzinho que automatiza alguma coisa pra você, no seu servidor.

Então, vamos lá ver que técnicas são essas.

%%

---

> **Quando precisar falhar, falhe ruidosamente e o mais cedo possível.**

%%

Interpretando essa regra, a parte de falhar ruidosamente significa fornecer mensagens de erro claras e explícitas a respeito do erro pra poder facilitar a correção.

Essa segunda parte, de falhar o mais cedo possível, a princípio pode causar um pouco de estranheza. "Como assim cara? Qual é a vantagem de falhar o mais cedo possível?" O lance é que quanto mais cedo você perceber/visualizar um erro, mais rápido você vai corrigir. Sua mente já vai estar contextualizada com o código que está relacionado aquele erro e você vai ir mais certeiro no problema.

Agora imagine um erro que só aparece daqui há uma semana, ou meses ou até anos... Você vai ter que gastar um tempo e queimar uns neurônios até se contextualizar e ter clareza do que está acontecendo. Por isso quanto mais cedo melhor.


Essa palestra é basicamente uma demonstração desse que é um dos princípios da filosofia Unix, aplicada à shell-script.

%%


A apresentação é dividida em três partes:

1. técnicas de falhar o mais cedo possível (bash "strict mode").
2. técnica de falhar ruidosamente (usando o trap).
3. técnica de ser alertado antes mesmo de falhar (usando shellcheck).

---

## Parte 1: Falhe o mais cedo possível com bash "strict mode"

<http://redsymbol.net/articles/unofficial-bash-strict-mode/>


---

## Exemplo 1

```bash
#!/usr/bin/env bash

# exemplo hipotético de um script super crítico
# ...

# preenchendo a variável com algo importante
variavelImportante="$(grep -o "RegEx" "/dir/file")"

echo "Padrão encontrado: '${variavelImportante}'"

echo "mais coisas super legais acontecerão a seguir..."
# ...
```

%%
O problema aqui é: se o `grep` falhar, o bash vai continuar seguindo em frente e executar os próximos comandos.

Como podemos ver, mesmo após um comando mal sucedido, o bash continua executando o script. 

Aqui nesse exemplo, tá tranquilo, é só um echo com uma variável vazia. Mas na vida real a dor de cabeça pode ser grande. Vai ter um cenário onde você está esperando que essa variável esteja devidamente populada e vai estar vazia, e seu script vai continuar.

Vai chegar um momento que você vai perceber que sua lógica tá quebrada. Que o resultado não é o que você esperava. Aí você vai gastar um tempo investigando. Você vai começar sua investigação a partir do lugar onde você percebeu que o script não te deu o resultado esperado, e vai tentar analisar a lógica indo em marcha ré.

Pode acontecer um cenário onde o erro é percebido num ponto distante do erro original.

Então pra evitar esse tipo de problema nós vamos pedir ao bash pra ele interromper a execução do script assim que ele encontrar um erro.

Fazemos isso utilizando `set -o errexit`, que também pode ser expressado através do `set -e`.
%%

---

## Solução

```bash
# forma curta
set -e

# forma longa
set -o errexit
```

Sai imediatamente se um comando termina com falha (status não-zero).


---

## FAQ

- P: O programa **sempre** será interrompido em **qualquer** situação de erro?
- R: Não. Cláusulas condicionais "capturam" o erro.

- P: E se eu quiser ignorar um erro?
- R: `|| true`

- P: O `set -e` é POSIX? Posso usar com o `/bin/sh`?
- R: Sim! 👍


---

## lidando `|` com `|` sequências `|` de `|` pipes

Informação importante 1:

**TODOS** os comandos em uma sequência de pipes são executados.

```
cmd1 | cmd2 | cmd3
```

---

## lidando `|` com `|` sequências `|` de `|` pipes

Informação importante 2:

Por default, o exit status de uma sequência de pipes é o status do último comando.

```
# por default, o exit-status da linha
# abaixo será o status de 'cmd3'
cmd1 | cmd2 | cmd3
```

---

## Exemplo 2

```bash
#!/usr/bin/env bash
# homeDirUpper.sh
#################

set -e # sai ao falhar

grep "^${1}:" /etc/passwd \
  | cut -d: -f6 \
  | tr "[:lower:]" "[:upper:]"
```

%%
Executar com 
```bash
bash homeDirUpper.sh && echo sucesso || echo falha
```

Mesmo com o `set -e` pra interromper o script assim que encontrar um erro, esse `grep` falhou e e o script continuou!

A treta aqui é que o todos os comandos foram executados e o exit-status final dessa linha foi o status desse comando `tr`, que mesmo sem ter feito nada, terminou com sucesso. O `tr` não recebeu nada de input, e como isso não é um erro, ele terminou com sucesso.

Portanto, mesmo que esse grep tenha falhado, o que valeu foi o exit status do tr, e por conta disso o nosso "milagroso" `set -e` não serviu pra nada.
%%

---

## lidando `|` com `|` sequências `|` de `|` pipes

Solução:

`set -o pipefail`

O valor de retorno de uma pipeline é o status do último comando que falhou, ou sucesso se nenhum comando falhar.

---


## FAQ

- P: O `set -o pipefail` é POSIX? Posso usar com o `/bin/sh`?
- R: Não. ☹️


---

## Não permita variáveis não declaradas

### Exemplo

```bash
#!/usr/bin/env bash

set -u # variáveis não declaradas = erro

echo "Hello, ${name}"
echo "Seja bem vindo..."
```

%%
Essa opção serve para que variáveis não declaradas sejam consideradas como erro.

Deixa eu ser bem sincero com vocês: eu estou mencionando essa técnica do `set -u` só por uma questão de completude. Por que se vocês pesquisarem por aí "bash strict mode", vocês vão ver esse `set -u` e vão logo pensar, pq será que o não falou disso?
%%

---

## Por que eu não gosto de usar `set -u`?

É comum definirmos o comportamento do script baseado no valor de uma variável de ambiente que não foi declarada explicitamente no script, exemplo:

```bash
#!/usr/bin/env bash

set -u

echo "começo do script..."

if [[ -z "${ENV_VAR}" ]]; then
  echo "--> ENV_VAR está vazio..."
  echo "--> vamos fazer algo quanto a isso."
fi

echo "fim do script"
```

%%
Imagine que dentro do seu script você faz uma verificação de uma variável que você espera que seja definida no "shell pai", ou no ambiente que chama esse script.

Se a variável estiver vazia, você quer que seu script trate isso de alguma forma.

Mas acontece que como a gente definiu o `set -u`, o script vai quebrar. Isso não é muito legal né...
%%

---

Exemplo da "vida real", considerando uma pipeline do GitLab CI:

```bash
set -u

if [[ "${CI_COMMIT_BRANCH}" == 'dev' ]]; then
  echo "Faz algo relacionado a branch 'dev'..."
  # ...
fi
```

Problema: a variável `CI_COMMIT_BRANCH` não é preenchida quando a pipeline é disparada por um Merge Request ou pela criação de tags.

%%
Até existe uma maneira de contornar isso, que é usando a técnica do "valor default" pra uma string vazia: `${ENV_VAR:-}`.

Eu particularmente não gosto disso por que eu acho que polui o código. Pode confundir a pessoa que vai dar manutenção nesse código futuramente... Enfim, eu acho que o código já começa a ficar desnecessariamente complexo.

Aí pode surgir aquela pergunta: mas meleu, você não vai querer tratar esse problema de referenciar uma variável que não foi definida?

A resposta é sim, eu quero tratar isso sim, mas vai ser de outra forma, que é o que nós vamos ver daqui a pouco na terceira parte da apresentação, quando vamos falar do shellcheck.
%%

---

## Parte 1: Resumo

```bash
# sai do script se um comando falhar
set -e

# termina com falha se algum comando entre pipes falhar
set -o pipefail

# considera variáveis não definidas com um erro
# (obs.: prefiro usar shellcheck)
set -u
```

---

