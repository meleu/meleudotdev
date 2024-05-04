---
dg-publish: true
theme: uncover
class: 
  - invert
  - lead
---

<!--

TODO:
- mudar hello_meleu para hello_dede

-->

# Criando sua própria Ruby gem

## (com CLI)

<br>
<br>
por meleu

---

## Motivação

Criar uma Ruby Gem é uma excelente forma de compartilhar código.

(não apenas no Open-Source, mas também internamente)

---

## O que veremos?

- Processo de criação/publicação de gems:
    - "do zero"
    - com o bundler
- configurar o arquivo `*.gemspec`
- o que o RubyGems.org nos oferece
- criar um CLI para usar a gem direto do terminal

---

## quem sou eu?

- Nerdão do Linux since late 90s
- Projetos Open Source relacionados a retrogaming
- Desenvolvedor Web
- DevOps Engineer
- Hoje Software Quality Engineer na CloudWalk
-  https://meleu.dev

---

### Calibrando as expectativas

- Foco no **processo de criação** de uma gem
- (e não na funcionalidade da gem)

---

### Calibrando o conteúdo

- Testes
    - Minitest e/ou RSpec?
- CI/CD pipeline
    - GitHub Actions, GitLab CI e afins?

---

## WTF is a gem?!

- o comando `gem`
- o  que é **uma** gem
- RubyGems.org

---

## O comando `gem`

Um gerenciador de pacotes da linguagem Ruby que provê um formato padronizado de distribuir programas e bibliotecas.

---

## O que é **uma** gem

É um pacote auto-contido que contêm código ruby que pode ser reutilizado.

Exemplos:
- rails
- nokogiri
- faker

---

## RubyGems.org

<https://rubygems.org>

É um serviço web utilizado para disponibilizar gems.

---

## Espera! Mas e o bundler?!

O bundler é uma ferramenta criada para garantir que **os desenvolvedores** de um projeto utilizem a mesma versão das gems.

`Gemfile` e `Gemfile.lock` são arquivos usados pelo bundler (e não pelo comando `gem`).

---

## Colocando a mão na massa! 💪

doc: <https://guides.rubygems.org/what-is-a-gem/>

O mínimo do mínimo para criarmos uma gem:

```
$ tree hello_meleu
hello_meleu/
├── hello_meleu.gemspec
└── lib
    └── hello_meleu.rb
```

obs.: usar um nome diferente!

---

## Test First!!!

(???)

`test/test_hello_meleu.rb`


---

**`lib/hello_meleu.rb`**

```ruby
class HelloMeleu
  def self.hello
    'Hello meleu!'
  end
end
```


---

**`hello_meleu.gemspec`**

```ruby
Gem::Specification.new do |s|
  s.name = 'hello_meleu'
  s.authors = ['meleu']
  s.files = ['lib/hello_meleu.rb'] # <-- IMPORTANTE!
  s.summary = 'Greeting meleu'
  s.version = '0.0.1'
end
```

doc:
<https://guides.rubygems.org/specification-reference/>

---

## Publicando sua gem

```bash
# buildando a gem
gem build hello_meleu.gemspec

# instalando localmente
gem install hello_meleu-0.0.1.gem
# experimentar no irb

# publicando no RubyGems.org
gem push hello_meleu-0.0.1.gem
# na primeira vez, vai pedir pra se cadastrar
```

---

## 🎉 Parabéns! 🎉

Sua gem foi publicada!

<https://rubygems.org/gems/hello_meleu>

---

### enriquecendo a gemspec

#### arquivo de versão

`lib/hello_meleu/version.rb`
```ruby
module HelloMeleu
  VERSION = "0.0.2"
end
```

---

### enriquecendo a gemspec

#### arquivo de versão

`hello_meleu.gemspec`
```ruby
require_relative "lib/hello_meleu/version"

Gem::Specification.new do |s|
  # ...
  s.version = HelloMeleu::VERSION
end
```

---

### enriquecendo a gemspec

```ruby
Gem::Specification.new do |s|
  # ...
  s.description <<~DESC
    A useless gem created for the only purpose
    of showing people how to create a gem.
  DESC
end
```


---

### enriquecendo a gemspec

#### criar um repositório no github

---

### enriquecendo a gemspec

```ruby
Gem::Specification.new do |s|
  # ...
  s.homepage = "https://github.com/meleu/hello_meleu"
end
```

---

## enriquecendo a gemspec

```ruby
Gem::Specification.new do |s|
  # ...
  s.metadata = {
    "bug_tracker_uri": "#{s.homepage}/issues",
    "changelog_uri": "#{s.homepage}/releases",
    "wiki_uri": "#{s.homepage}/wiki",
    "source_code_uri": s.homepage,
    "documentation_uri": "https://www.rubydoc.info/gems/hello_meleu",
  }
end
```

---

### enriquecendo a gemspec

#### documentação

```ruby
# Class used to greet meleu with "hello".
class HelloMeleu
  # Greets meleu with "hello".
  #
  # @return [String] "Hello meleu!"
  def self.hello
    "Hello meleu!"
  end
end
```

---

## Publicando a nova versão

```bash
# buildando a gem
gem build hello_meleu.gemspec

# publicando no RubyGems.org
gem push hello_meleu-0.0.2.gem
```

---

## 🎉 Parabéns novamente! 🎉

Sua gem foi atualizada!

<https://rubygems.org/gems/hello_meleu>

(lembrete: mostrar rubydoc.info)

---

### Sua gem está disponível para o mundo!

```bash
# instalar
gem install hello_meleu

# testar no irb
```

---

### Recapitulando

- colocamos nosso código em `lib/`
- especificamos configurações da nossa gem no arquivo `*.gemspec`
- vimos alguns campos interessantes do gemspec
- publicamos nossa gem para o mundo
- vimos alguns recursos úteis do RubyGems.org

---

# Break time!

  ![MC Hammer](assets/mc-hammer.gif)

---

## https://icanhazdadjoke.com

(aka "piadas de tiozão")

Fornece uma API REST que não requer autenticação!

---

## gem HTTParty

<https://github.com/jnunemaker/httparty>

experimentar no `irb`:

- random joke
- search

---

## Criar uma gem pra buscar dad jokes!

Motivação:

- Criar uma gem que depende de outra gem
- Criar um CLI pra usar a gem a partir do terminal

---



## Criando uma gem usando o bundler

(scaffold feelings 😇)

obs.: usar um nome diferente!

```bash
bundle gem dadjoke \
  --exe \
  --coc \
  --mit \
  --test=minitest \
  --ci=github \
  --linter=rubocop
  
cd dadjoke
bundle install # vai falhar
```

---

## git stuff

- obs.: não precisa criar repo no github ainda
- criar um `.gitignore`
    - <https://gitignore.io> ([script](https://github.com/meleu/.dotfiles/blob/master/bin/gitignore.io))
- `git add && git commit`

---

## Gemfile

```ruby
# ...

# Specify your gem's dependencies in dadjoke.gemspec
gemspec

# ...
```


---

## Listando dependências no gemspec

```ruby
Gem::Specification.new do |s|
  # ...
  # ignorar código confuso e cheio de TODOs...
  # ...
  spec.add_runtime_dependency "httparty", "~> 0.21"
end
```

```bash
# instalar dependências
bundle install
```

---

## Test First!!!

(??? [link](https://github.com/meleu/dadjoke/blob/main/test/test_dadjoke.rb) ???)

`test/test_dadjoke.rb`

---

## Obtendo uma dadjoke aleatória

```ruby
class Joke
  def self.random
    HTTParty.get(@url, headers: @headers)["joke"]
  end
end
```

---

## Buscando dadjokes

```ruby
class Joke
  def self.search(term, limit = 3)
    query = { term:, limit: }
    response = HTTParty.get(
      "#{@url}/search",
      headers: @headers,
      query:
    )
    response["results"].map { |result| result["joke"] }
  end
end
```

---

## Testar no irb

```bash
bin/console
```

---

## Tudo ok?

Boa hora para mais um `git commit` e subir pra um repo no github.

---

## GitHub Actions

(opcional)

Mostrar action no repo.

---

## Ajeitando o gemspec

- preencher os `TODO`s
- `spec.metadata`
    - formatar em um hash
    - `"documentation_uri" => "https://rubydoc.info/gems/dadjoke"`
- `spec.files`
- `spec.executables`
- `lib/dadjoke/version.rb`

---

## Publicando a gem!

```bash
# buildando a gem
gem build dadjoke.gemspec

# publicando no RubyGems.org
gem push dadjoke-0.0.1.gem

# instalar do rubygems.org
gem install dadjoke
```


---

## Criando um CLI

Primeiro um `deleteme.rb`.


---

## Queremos um comando UNIX decente!

- com uma mensagem de help
- com argumentos auto-explicativos

---

## Conhecendo o Thor

<http://whatisthor.com/>

(criar um `mycli` com hello world e opção `--up`)

---

## Adicionando dependência no gemspec

```ruby
Gem::Specification.new do |s|
  # ...
  spec.add_runtime_dependency "thor", "~> 1.3"
end
```

```bash
bundle install
```

---

### Obtendo uma dad joke aleatória

```ruby
class DadjokeCLI < Thor
  desc "random", "Get a random dad joke"
  def random
    puts Dadjoke::Joke.random
  end
end
```

```bash
# comando:
dadjoke random
```

---

### Comando default

Não quero ter que digitar `dadjoke random` quando apenas `dadjoke` já seria suficiente.

```ruby
class DadjokeCLI < Thor
  # ...
  default_command :random
end
```

```bash
# comando:
dadjoke
```

---

### Buscando uma dad joke

```ruby
class DadjokeCLI < Thor
  desc "search TERM", "Get jokes based on a search TERM"
  def search(term)
    jokes = Dadjoke::Joke.search(term)
    puts jokes.join("\n\n---\n\n")
  end
end
```

---

### Buscando uma dad joke

```diff
class DadjokeCLI < Thor
  desc "search TERM", "Get jokes based on a search TERM"
+ option :num, type: :numeric, default: 1, desc: "Amount of jokes to retrieve"
  def search(term)
-   jokes = Dadjoke::Joke.search(term)
+   jokes = Dadjoke::Joke.search(term, options[:num])
    puts jokes.join("\n\n---\n\n")
  end
end
```

---

## Recapitulando

- Criamos uma gem um pouco mais realista
    - interagindo com API REST
    - com dependências
    - com repo no github (aberto para contribuições)
    - com linting (rubocop)
- Criamos um CLI pra usar nossa gem no terminal
- Publicamos nossa gem para o mundo usar!

---

# Fim! 🥲

<!--
---

## references

- <https://gist.github.com/jendiamond/6128723> - onde tudo começou
- <https://piotrmurach.com/articles/writing-a-ruby-gem-specification/>
- <https://piotrmurach.com/articles/looking-inside-a-ruby-gem/>
- <https://github.com/mattbrictson/gem>
- <https://mattbrictson.com/blog/rails-tasks-with-thor>
- videos
    - gorails 1: <https://www.youtube.com/watch?v=wu2zoy63DeU>
    - gorails 2: <https://www.youtube.com/watch?v=_RPVUwBm6U8>
    - indiano: 

-->