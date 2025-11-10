---
dg-publish: false
theme: uncover
marp: true
---

# 🧑‍💻 Aprenda Ruby e TDD ao mesmo tempo

<br>
<br>
por meleu

---

# 🧑‍💻 ~~Aprenda Ruby e TDD ao mesmo tempo~~

# Fluxo básico de TDD em Ruby

<br>
por meleu

---

# O que é _Test-Driven Development_?

---

# Por que praticar TDD?

---

## Minha motivação favorita:

<br>

Promove melhor _design_ do código.

---

# 🤔 O que é _design_?

<br>

> Toda aplicação é uma coleção de código,
> **o arranjo desse código é o _design_**.

<small>Sandi Metz<br>(📖 _Practical Object-Oriented Design_)</small>

---

## 📝 Pra que _design_?!

<br>

👎 O _design_ não é para a máquina executar.

<br>

👍 O _design_ serve para os **humanos**<br>entenderem o que o código faz.

<br>

<small>
ex.: Rails, MVC, etc.
</small>

---

(voltando...)

# Por que TDD?

- Promove melhor _design_ do código
- Possibilita **refatoração**
- Menos bugs (ou menos tempo de debugging)
- Desenvolvimento mais rápido
- e...

---

## 🤖 **Na era da IA,<br>TDD é mais valioso que nunca!**

---

## Quem é meleu?

- 🐧 Nerdão do Linux since late 90s
- 🎓 Formado em Ciência de Computação
- 👾 Projetos Open Source de retrogaming
- 🧑‍💻 Desenvolvedor Web / DevOps Engineer
- ☁ Hoje: desenvolvedor na [nuuvem.com](https://nuuvem.com)

---

## O que veremos?

- Básico de Ruby
- **Fluxo básico de _Test-Driven Development_**
- Bônus final

---

## O que precisamos?

- Computador com Ruby instalado
- Terminal
- Editor de código
- Importante: maneira rápida de executar testes

---

# **Minitest** vs. RSpec

---

# 💪🤓 Vamos pra ação!

(sim! teremos live coding!)

---

# 👋 Hello, World!

<br>

```ruby
# hello.rb
puts "Hello, World!"
```

---

# 🤔 Como testar a impressão de texto na tela?

(queremos realmente testar isso?)

---

# TDD promove _design_

Separar o domínio dos efeitos colaterais.

<br>

<!--
Domínio é o "assunto principal" da aplicação.
Se é uma aplicação de ecommerce de games, o domínio é venda de games; se é um sistema de pagamentos, o domínio é pagamento. Aqui se é um sistema pra cumprimentar o mundo com o um "Hello, World", o domínio da nossa aplicação é cumprimentar.
Hoje estamos apenas imprimindo essa cumprimento na tela, mas se amanhã quisermos cumprimentar o mundo através de requisições HTTP, conseguiremos fazer isso facilmente graças a essa separação.
-->

- **Domínio**: _String_ usada para cumprimentar.
- **Efeito colateral**: imprimir _String_ na tela

---

# classe Greeter

```ruby
class Greeter
  def hello
    "Hello, World!"
  end
end
```

---

# usando Greeter

```ruby
greeter = Greeter.new
puts greeter.hello
```

<!--
É um over-engineering para um simples hello world?
Claro que é!
Mas o que eu quero passar aqui não é hello-world, e sim o workflow, a maneira de pensar e de organizar o seu código para conseguir testar.
-->

---

# _Separation of Concerns_

- classe vai em `greeter.rb`

- executável fica em `hello.rb`

---

# Escrevendo nosso primeiro teste!

---

# Primeiro teste

```ruby
# greeter_test.rb
require "minitest/autorun"
require_relative "greeter"

class GreeterTest < Minitest::Test
  def test_hello_world
    greeter = Greeter.new
    actual = greeter.hello
    expected = "Hello, World!"
    assert_equal expected, actual
  end
end
```

<small>Executando: `ruby greeter_test.rb`</small>

---

# 🧑‍🏫 Explicando o<br>arquivo de teste

---

## `<arquivo>_test.rb`

Não é uma regra, apenas uma recomendação.

---

## Acessar código de outro arquivo

```ruby
# permite que executemos o arquivo de teste
require "minitest/autorun"

# acessando código que será testado
require_relative "greeter"
```

---

## Herança:<br>criando uma subclasse

Subclasse herda o comportamento do superclasse.

```ruby
class GreeterTest < Minitest::Test
  # ...
end
```

---

## Métodos de teste

```ruby
class GreeterTest < Minitest::Test

  # precisa começar com 'test_'
  def test_hello_world
    # ...
  end

end
```

###### Podemos ter outros métodos em `GreeterTest`, mas somente os que começam com `test_` são considerados testes.

---

## O teste propriamente dito

Precisa ser simples!
AAA:

```ruby
# Arrange
greeter = Greeter.new

# Act
actual = greeter.hello

# Assert
expected = "Hello, World!"
assert_equal expected, actual
```

<!-- time: 15 min -->

---

# 💥 Quebrando o teste!

```
# Running:

F

Finished in 0.001926s, 519.1528 runs/s, 519.1528 assertions/s.

  1) Failure:
GreeterTest#test_hello_world [greeter_test.rb:9]:
Expected: "Hello, World!"
  Actual: "Hello, meleu!"

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```

---

# 🖐 Peraí!

Escrevemos o código "de produção" antes do teste!

<br>

## 😤 Isso não é TDD!

---

# 📝 Conceito Básico de TDD

<br>

### 🟥 Red -> 🟩 Green -> 🔄 Refactor

---

# 🚮 Deletar tudo!

(e recomeçar com um requisito diferente)

---

# 👋 Hello, YOU!

---

## 🗣📢 **Escreva o teste primeiro!**

---

```ruby
# greeter_test.rb
require "minitest/autorun"
require_relative "greeter"

class GreeterTest < Minitest::Test
  def test_hello_meleu
    greeter = Greeter.new
    actual = greeter.hello("meleu")
    expected = "Hello, meleu!"
    assert_equal expected, actual
  end
end
```

<small>Obs.: precisa executar rápido!</small>

---

(💭 lembrando...)

## O que precisamos?

- Computador com Ruby instalado
- Terminal
- Editor de texto

##### 👉 **_Importante: maneira rápida de executar testes_** 👈

---

### Maneira rápida de executar testes

```bash
# instala a gem
gem install rerun

# monitora alterações nos arquivos,
# executa os testes quando detecta mudança
rerun -x -- ruby greeter_test.rb
```

Isso 👆 é apenas uma maneira.

---

# Finalmente:

## Desenvolvimento<br>**guiado por testes**

---

### 🟥 Red -> 🟩 Green -> 🔄 Refactor

# 👆 estamos no Red

---

# 📝 Importante

## Escreva o mínimo de código para passar no teste.

---

### O erro guia nosso próximo passo

1. 💥 arquivo não existe 👉 criar arquivo
2. 💥 classe não existe 👉 criar classe
3. 💥 método não existe 👉 criar método
4. 💥 número errado de argumentos 👉 corrigir método
5. 👀 "expected" diferente do "actual"

---

## mínimo de código para passar no teste.

```ruby
# greeter.rb
class Greeter
  def hello(name)
    "Hello, meleu!" # 👈🤨 é sério isso?!
  end
end
```

---

# _Fake it, 'til you make it!_

> Retorne uma constante e gradualmente as substitua pelo seu código real.

<small>Kent Beck<br>(📖 _Test-Driven Development by example_)</small>

---

### 🟥 Red -> 🟩 Green -> 🔄 Refactor

# estamos 👆 no Green

---

## código real

```ruby
# greeter.rb
class Greeter
  def hello(name)
    "Hello, #{name}!"
  end
end
```

---

### 🟥 Red -> 🟩 Green -> 🔄 Refactor

# hora de refatorar 👆

---

## 🔎 Tem algo pra refatorar aqui?

```ruby
# greeter.rb
class Greeter
  def hello(name)
    "Hello, #{name}!"
  end
end
```

---

# ✅ feito!

---

## "novo" requisito:

## `Hello, World!`

# 👋🌍

---

# Teste

```ruby
class GreeterTest < Minitest::Test
  # ...

  def test_hello_world
    greeter = Greeter.new
    actual = greeter.hello
    expected = "Hello, World!"
    assert_equal expected, actual
  end
end
```

---

### 🟥 Red -> 🟩 Green -> 🔄 Refactor

# 👆 voltamos pro Red

---

### O erro guia nosso próximo passo

1. 💥 número errado de argumentos 👉 corrigir método
2. ❓❗

---

## Valor _default_ para um argumento

```ruby
def hello(name = "World")
  "Hello, #{name}!"
end
```

---

### 🟥 Red -> 🟩 Green -> 🔄 Refactor

# estamos 👆 no Green

E não tem nada pra refatorar...

---

# ✅ feito!

---

# novo requisito:

## 🇧🇷 🇵🇹 Um Greeter bilíngue!

## 👋 "Olá, meleu!"

---

### 🟥 Red

```ruby
def test_ola_meleu_in_portuguese
  greeter = Greeter.new("portuguese")
  actual = greeter.hello("meleu")
  expected = "Olá, meleu!"
  assert_equal expected, actual
end
```

---

### 🟩 Green

```ruby
class Greeter
  def initialize(language = "english")
    @language = language
  end

  def hello(name = "World")
    if @language == "portuguese"
      "Olá, #{name}!"
    else
      "Hello, #{name}!"
    end
  end
end
```

---

### 🔄 Refactor

```ruby
class Greeter
  def initialize(language = "english")
    @language = language
  end

  def hello(name = "World")
    "#{greeting}, #{name}!"
  end

  private

  def greeting
    if @language == "portuguese"
      "Olá"
    else
      "Hello"
    end
  end
end
```

---

# ✅ feito!

---

# Mais requisitos:

# Um Greeter poliglota!

## 🇪🇸 Hola!

## 🇫🇷 Bonjour

---

# 🖐 Pare!

Não trabalhe em dois requisitos ao mesmo tempo!

<br>

# 📝 Anote

... e trabalhe em apenas um de cada vez!

---

### 🟥 Red

🇪🇸

```ruby
def test_hola_meleu_in_spanish
  greeter = Greeter.new("spanish")
  actual = greeter.hello("meleu")
  expected = "Hola, meleu!"
  assert_equal expected, actual
end
```

---

### 🟩 Green

🇪🇸

```ruby
class Greeter
  # ...

  def greeting
    if @language == "portuguese"
      "Olá"
    elsif @language == "spanish"
      "Hola"
    else
      "Hello"
    end
  end
end
```

---

### 🔄 Refactor

🇪🇸

```ruby
class Greeter
  # ...

  def greeting
    case @language
    when "portuguese"
      "Olá"
    when "spanish"
      "Hola"
    else
      "Hello"
    end
  end
end
```

---

# ✅ hecho! 🇪🇸

---

### 🟥 Red

🇫🇷

```ruby
def test_bonjour_meleu_in_french
  greeter = Greeter.new("french")
  actual = greeter.hello("meleu")
  expected = "Bonjour, meleu!"
  assert_equal expected, actual
end
```

---

### 🟩 Green

🇫🇷

```ruby
class Greeter
  # ...

  def greeting
    case @language
    # ...
    when "french"
      "Bonjour"
    # ...
    end
  end
end
```

---

### 🔄 Refactor

🇫🇷

```ruby
class Greeter
  # ...

  def greeting
     greetings = {
      "portuguese" => "Olá",
      "spanish" => "Hola",
      "french" => "Bonjour",
      "english" => "Hello"
    }
    greetings.fetch(@language, "Hello")
  end
end
```

---

# ✅ fait! 🇫🇷

---

![reflitao.png](../assets/reflitao.png)

🤔 Como o TDD agilizou o nosso trabalho até aqui?

---

### 😌 Benefícios testemunhados:

- Testes guiando o desenvolvimento
  - estimulando design
  - evitando _over-engineering_
- Permitiu refatoração segura
- Bugs inseridos e rapidamente detectados
- Rapidamente implementamos novas _features_
- ...

---

# 🤨 E aquele papinho de<br>TDD na era da IA?!

---

# 🎁 Bônus!

## Inserindo IA no fluxo de TDD

---


# Em que etapa usar IA?

### 🧠 Red -> 🤖 Green -> 🧠+🤖 Refactor

---

# 🤖

## https://aider.chat

---

# ✨ Novo projeto:

```bash
mkdir hello-ai
cd hello-ai
```

E comece pelo teste!

---

# 🗣️🤖 Chamando o aider

<br>

```
aider --test-cmd 'ruby greeter_test.rb'
```

---

# 🤏 prompt

```
implement the production code for this test
```

---

# Ciclo TDD com aider

- 🧠 escrever o teste
- 🤖 `/test`
- 🧠 refatorar

---

![reflitao.png](../assets/reflitao.png)

Reparou na "complexidade" dos prompts que usamos?

---

# 👋 Obrigado!

<br>

Material baseado em:

- 📖 https://tdd-ruby.gitbook.io

<br>

Mais sobre mim:

- 🐚 <https://meleu.sh>
- 🌱 <https://meleu.dev>
