---
dg-publish: true
---
# TDD com Ruby on Rails RSpec e Capybara

- https://udemy.com/course/rails-tdd/
- [[Ruby on Rails - CRUD com TDD]]

## links

- <https://rspec.info/>
- <https://www.betterspecs.org/>

## RSpec

```shell
# no dir do projeto:
rspec --init
```

O `rspec --init` cria um `spec_helper.rb` que já adiciona o diretório `lib/` no `$LOAD_PATH`. Desta forma já podemos fazer o `require` dos arquivos nos nossos testes sem precisar especificar o path.

Basicão:
```ruby
require 'calculator' # assume existência de lib/calculator.rb

describe Calculator do
  it '#sum 2 numbers' do
    calc = Calculator.new    # setup
    result = calc.sum(5, 7)  # exercise
    expect(result).to eq(12) # verify
  end
  # neste exemplo o teardown é implícito
end
```

Basicão com mais conhecimento:
```ruby
require 'calculator'

describe Calculator do # subject = Calculator.new
  it '#sum 2 numbers' do
    result = subject.sum(5, 7)
    expect(result).to eq(12)
  end
end
```


### Teste em 4 fases

1. Setup
    - coloca o sistema no estado necessário para o teste
2. Exercise
    - interação com o sistema
3. Verify
    - verifica o comportamento esperado
4. Teardown
    - coloca o sistema no estado em que ele estava antes do teste.


### BDD

Termo criado pelo Dan North em 2003 quando notava uma dificuldade de ensinar TDD.

> A principal motivação do TDD não é testar o seu software, e sim especificá-lo com **exemplos de como usar o seu código** e deixar isso guiar o design do software.


### Context

Para melhor organizar o código da spec, podemos agrupar os testes de um comportamento/método em um `context`.

Exemplo:
```ruby
require 'calculator'

describe Calculator do
  context '#sum' do

    it 'positive numbers' do
      calc = Calculator.new
      result = calc.sum(5, 7)
      expect(result).to eq(12)
    end

    it 'negative numbers' do
      calc = Calculator.new
      result = calc.sum(-5, 7)
      expect(result).to eq(2)
    end

  end
end
```

### Subject

Se o argumento do `describe` for uma classe, não há necessidade de instanciar a classe. Ela já é automaticamente instanciada pelo rspec em uma variável chamada `subject`.

> Na verdade, qualquer coisa que for passada como primeiro argumento para o `describe` será o `subject` (exemplo: strings, arrays). Explicado [neste vídeo](https://udemy.com/course/rails-tdd/learn/lecture/7766566#overview).

Usando o exemplo da calculadora:
```ruby
require 'calculator'

describe Calculator do
  context '#sum' do

    it 'positive numbers' do
      result = subject.sum(5, 7)
      expect(result).to eq(12)
    end

    it 'negative numbers' do
      result = subject.sum(-5, 7)
      expect(result).to eq(2)
    end

  end
end

```

No exemplo acima 👆 estamos usando o chamado "subject implícito". A seguir veremos o "subject explícito".

Se quiser um nome customizado no lugar de `subject`, por exemplo `calc`, basta fazer:

```ruby
# ...
describe Calculator do
  subject(:calc) { described_class.new }
  # a partir daqui podemos usar calc.sum()...
  # ...
end
```

**OBS.:** Se você precisa passar parâmetros quando for instanciar um objeto da classe testada, será necessário usar o "subject explícito" (mesmo que queira manter o nome `subject`).
```ruby
# ...
describe MyClass do
  subject(:subject) { described_class.new(arg1, arg2) }
  # ...
end
```

Também podemos dar um texto mais descritivo ao nosso Subject para que no relatório apareça algo mais descritivo. Exemplo:

```ruby
describe Calculator, "Comportamento da calculadora" do
  # ...
end
```

### Matchers

- links
    - Documentação: <https://rubydoc.info/github/rspec/rspec-expectations/RSpec/Matchers>
    - [alias matchers](https://gist.github.com/JunichiIto/f603d3fbfcf99b914f86)

- `expect(subject).to`
- `expect(subject).not_to`
- `is_expected` == `expect(subject)`

O `is_expected` é útil para one-liners como esse:
```ruby
it { is_expected.to respond_to(:cool_method) }
```

Outra coisa interessante, é que quando utilizamos one-liners, o rspec já adiciona uma boa descrição ao relatório final.

---

#### matchers cheatsheet

| matcher                        | description                   | used with    |
| ------------------------------ | ----------------------------- | ------------ |
| be                             | same object (like 'equal?')   | *            |
| eq                             | same value (like 'eql?')      | *            |
| be_nil                         | nil?                          | *            |
| be_between(min, max)           | (.inclusive by default)       | number       |
| be_between(min, max).exclusive | excludes min and max          | number       |
| match(/regex/)                 | useful for strings            | string       |
| start_with()                   |                               | array/string |
| end_with()                     | (same as above)               | array/string |
| include(elements)              | array include elements?       | array        |
| contain_exactly(args)          | args are elements (any order) | array        |
| match_array(expected_array)    | arg is an array (any order)   | array        |
| respond_to(:method)            | has a method                  | object       |
| be_instance_of                 | exact class                   | object       |
| be_kind_of                     | of a class in the inheritance | object       |
| be_a / be_an                   | alias to be_kind_of           | object       |
| have_attributes(key: value)    |                               | object       |
| raise_exception - BAD PRACTICE | OBS: subj. must be in a block | block        |
| raise_error(error_class)       | same as above                 | block        |
| cover(arg1, argN)              | args are items in a range     | range        |
| all(matchers)                  | all elem. match given matcher | collection   |

---
#### igualdade

exemplo:
```ruby
expect(subject).to eq(5)
```

- nativos do ruby:
    - `equal?` - testa se é o mesmo objeto
    - `eql?` - testa o valor
- rspec DSL
    - `be` - testa se é o mesmo objeto (like `equal`)
    - `eq` - testa o valor (like `eql`)


#### verdadeiro/falso

exemplo:
```ruby
# true
expect(subject).to be true
expect(subject).to be_truthy

# false
expect(subject).to be true
expect(subject).to be_truthy

# nil
expect(subject).to be_nil
```

#### comparação

basta usar os símbolos de comparação após o `be`.

Exemplos:
```ruby
expect(subject).to be > 5
expect(subject).to be <= 10
# etc...
```

Outras possibilidades:

- `be_between(min, max)` (`.inclusive` by default)
- `be_between(min, max).exclusive`
- `match(/regex/)`
- `start_with()`
- `end_with()`

#### arrays

- `include`
- `contain_exactly` - argumentos são os elementos do array (qualquer ordem)
- `match_array` - argumento é um array (qualquer ordem)

#### classes e tipos

- `respond_to` - has a method...
- `be_instance_of` - classe exata
- `be_kind_of` - aceita herança
- `be_a` - alias pra `be_kind_of`
- `be_an` - alias pra `be_kin_of`


#### atributos de classe

`have_attributes`

Exemplo:
```ruby
# simple example
expect(pessoa).to have_attributes(name: "meleu", age: 42)

# more ellaborated example
expect(pessoa).to have_attributes(
  name: starting_with('m'),
  age: (be >= 18)
)
```

#### predicados

Nos tradicionais métodos nativos do Ruby, substituir o sufixo `?` pelo prefixo `be_`.

```ruby
be_odd # => .odd?
be_positive # => .positive?
be_nil # => .nil?
```

Exemplos

```ruby
# 👎 bad
expect(num.odd?).to be true

# 👍 good
expect(num).to be_odd
```


#### Erros / Exceptions

Testar se erros ocorrem na hora certa.

> [!note]
> **OBS**: para testar erros/exceptions, é necessário colocar dentro de um bloco, o código que vai lançar o erro.

Exemplo:

```ruby
describe Calculator do
  it 'division by zero' do
    expect { subject.div(3, 0) }.to raise_exception
  end
end
```

> [!note]
> Usar `raise_exception` é uma bad practice, pois é muito genérico e não especifica qual tipo de erro.

O melhor é especificar qual é o tipo de erro:

```ruby
describe Calculator do
  it 'division by zero' do
    expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError)
    # also valid:
    expect { subject.div(3, 0) }.to raise_error("divided by 0") # msg
    expect { subject.div(3, 0) }.to raise_error(ZeroDivisionError, "divided by 0")
    expect { subject.div(3, 0) }.to raise_error(/divided/) # RegEx
  end
end
```


#### ranges

Use `cover`:

```ruby
describe (1..6) do
  it '#cover' do
    expect(subject).to cover(2, 5)
  end
end
```


#### coleções

Usando `all`:
```ruby
expect([1, 3, 5]).to all( be_odd.and be_an(Integer) )
```


#### números reais (ponto flutuante / float)

Usando `be_within`

```ruby
# aceita de 11.5 até 12.5
expect(11.5).to be_within(0.5).of(12)

# aceita de 12.49 a 12.51
expect(12.5).to be_within(0.01).of(12.5)
```

#### detectar mudanças

```ruby
# hypotetical Counter class
require 'counter'

describe 'Matcher change' do
  # n = 1
  it { expect{ Counter.increment }.to change { Counter.n } }

  # n = 2
  it { expect{ Counter.increment }.to change { Counter.n }.by(1) }

  # n = 3
  it { expect{ Counter.increment }.to change { Counter.n }.from(2).to(3) }
end
```

#### output

```ruby
expect { block }.to output.to_stdout

# opções
output.to_stdout # could be '_stderr'
output("string").to_stdout # could be '_stderr'
output(/regex/).to_stdout # could be '_stderr'
```

#### negando matcher com nome customizado

[doc](https://rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers%2FDSL:define_negated_matcher)

Exemplo:
```ruby
# negando o 'include'
RSpec::Matchers.define_negated_matcher :be_an_array_excluding, :include
```

### Hooks

#### suíte de testes

```ruby
# antes/depois de toda suite de testes
before(:suite)
after(:suite)
```

Colocar isso no  `spec_helper.rb`:
```ruby
config.before(:suite) do
  puts "antes da suíte de testes"
end
```

#### cada describe

```ruby
# antes/depois de todos os testes
before(:all)
before(:context)
after(:all)
after(:context)

# obs.: ':all' e ':context' são sinônimos.
```

#### cada teste

```ruby
# antes/depois de cada teste
before(:each)
before(:example)
after(:each)
after(:example)

# obs.: ':each' e ':example' são sinônimos.
```

#### around

Podemos substituir a utilização de `before`+`after` através do uso do `around`. Exemplo:

```ruby
around(:each) do |test|
  puts ">>> antes"
  test.run
  puts ">>> depois"
end
```


### let

Quando precisar atribuir uma variável de instância, ao invés de usar `before`, use `let`.

Ao usar `let`, a variável é carregada apenas quando ela é utilizada pela primeira vez no teste ("lazy loading") e fica em cache até o teste em questão terminar.

Se quiser "forçar" a execução para antes do teste (desativar o "lazy loading"), use `let!`.

```ruby
# 👎 bad
########
before(:each) do
  @pessoa = Pessoa.new
end
# referenciar com '@pessoa'

# 👍 good
#########
let(:pessoa) { Pessoa.new }
# referenciar com 'pessoa'
```

Um exemplo que demonstra o funcionamento do `let`:
```ruby
# variável global, começa em zero
$counter = 0

describe "let" do
  let(:count) { $counter += 1 }

  it "runs once and caches" do
    expect(count).to eq(1) # valor é atualizado
    expect(count).to eq(1) # valor em cache
  end

  it "runs again" do
    expect(count).to eq(2) # valor atualizado
  end
end
```


### Agregando Falhas

```ruby
it 'test description' do
  # do some stuff
  aggregate_failures do
    # ... run multiple expectations ...
  end
end

# se não tem nada a fazer antes dos expects
it 'test something', :aggregate_failures do
  # ... run multiple expectations ...
end
```

### Custom Matcher

[doc](https://rubydoc.info/github/rspec/rspec-expectations/RSpec%2FMatchers%2FDSL:define)

O exemplo a seguir está melhor que no doc...

```ruby
# Exemplo de matcher customizado
RSpec::Matchers.define :be_a_multiple_of do |dividend|
  match do |subject|
    subject % dividend == 0
  end

  description do
    "be a multiple of #{dividend}"
  end

  failure_message do |subject|
    "expected that #{subject} would be a multiple of #{dividend}"
  end
end

describe 18, 'Custom Matcher' do
  it { is_expected.to be_a_multiple_of(3) }
end
```


### mocks

[Interesting reading from Martin Fowler](https://martinfowler.com/bliki/TestDouble.html)

- double: cria **objetos fake**
    - a classe não precisa existir
    - utilizado na fase de setup
- stub: cria **comportamento fake**
    - "forçar uma resposta para um determinado método de um **objeto colaborador**"
    - útil quando queremos testar uma classe que depende de outra
    - utilizado na fase de setup
- mock: (?) cria verificação fake (?)
    - utilizado na fase de verificação

#### doubles

Depende do `rspec-mocks` (instalado by default).

```ruby
user = double('User')
allow(user).to receive_messages(
  name: 'Jack',
  password: 'sUpErSeCrEt'
)
# agora podemos usar:
# user.name
# user.password
```


#### stubs

> Um stub é forçar uma resposta específica para um determinado método de um **objeto colaborador**.
>
> Stubs são usados para a fase de **setup**.
> 
> Stubs são usados para **substituir estados**.

```ruby
require 'student'
require 'course'

describe 'Stub' do
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    # aqui está o stub
    # (Course é a classe colaboradora)
    allow(student).to receive(:has_finished?)
      .with(an_intance_of(Course))
      .and_return(true)

    course_finished = student.has_finished?(course)

    expect(course_finished).to be_truthy
  end
end
```


#### Mocks

> Mocks são usados para a fase de **verify**.
> 
> Mocks são usados para **testar comportamentos** (ao invés de testar o resultado).

exemplo:
```ruby
# definir que student tem um método #bar
expect(student).to receive(:bar)

# agora essa chamada é válida
student.bar
```

especificando os argumentos
```ruby
expect(student).to receive(:foo).with(123)
students.foo(123)
```


### RSpec no Rails

```shell
rails new test_app -T
cd test_app
```

Seguir instruções em https://github.com/rspec/rspec-rails para instalar `rspec-rails` no Gemfile

Algo tipo assim:
```ruby
# verifique o README do rspec-rails!!
group :development, :test do
  # ...
  gem 'rspec-rails', '~> 6.0.0'
end
```

```shell
# instalar o rspec-rails adicionado ao Gemfile
bundle install

# criar os arquivos para o RSpec
rails generate rspec:install
```

Abrir o `.rspec` e adicionar o `--format documentation`.

No arquivo `config/application.rb`:

```ruby
module TestApp
  class Application < Rails::Application
    # ...

    # configuração da aula de TDD (Jackson Pires)
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end
  end
end
```


## Factory Bot

- repo: <https://github.com/thoughtbot/factory_bot>
- looks interesting: <https://thoughtbot.com/upcase/videos/factory-bot>

### instalar

TBD...

lembrar de ativar o [[#FactoryBot Lint]]!

### attributes_for

### atributo transitório

`spec/factories/customer.rb`:
```ruby
FactoryBot.define do
  factory :customer do
    # ...

    transient do
      upcased false
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
```

`spec/models/customer_spec.rb`:
```ruby
RSpec.describe Customer, type: :model do
  it 'something...' do
    customer = create(:customer, upcased: true)
  end
end
```

### traits

`spec/factories/customer.rb`:
```ruby
FactoryBot.define do
  factory :customer do
    # ...

    trait :male do
      gender 'M'
    end

    trait :female do
      gender 'F'
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    
  end
end
```


### callbacks

- `after(:build)` - após instanciar o objeto, com `build` ou `create`
- `before(:create)` - antes de persistir no DB
- `after(:create)` - após persistir no DB


### sequences

`spec/models/customer_spec.rb`:
```ruby
FactoryBot.define do
  factory :customer do
    # ...
    sequence(:email) { |n| "user#{n}@email.com"}
  end
end
```


### associações - belongs_to

criando um outro model
```shell
rails g model Order description:string customer:references
```

`spec/factories/orders.rb`:
```ruby
FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido #{n}" }

    # usar apenas 'customer' é equivalente a:
    # association :customer, factory: :customer
    customer
    
  end
end
```

### create_list

Cria várias instâncias de uma vez só:
```ruby
# cria 3 instâncias de Order
orders = create_list(:order, 3)
```

Similarmente também temos `build_list`e `attributes_for_list`.



### associações - has_many


TBD...


### FactoryBot Lint

Colocar no `spec/spec_helper.rb`:
```ruby
RSpec.configure do |config|
  # FactoryBot Lint
  config.before(:suite) { FactoryBot.lint }
end
```

lembrete: ativar o lint pode causar impactos na performance


## httparty

- repo: <https://github.com/jnunemaker/httparty>

Funciona como um `curl` para Ruby.

instalação

`Gemfile`
```ruby
group :development, :test do
  gem 'httparty'
end
```


## WebMock

repo: <https://github.com/bblimke/webmock>

"Library for stubbing and setting expectations on HTTP requests in Ruby"

`Gemfile`
```ruby
group :development, :test do
  gem 'webmock'
end
```

`spec/spec_helper`
```ruby
require 'webmock/rspec'
```

e aí no teste usamos algo como
```ruby
stub_request(:get)
```


## VCR

repo: <https://github.com/vcr/vcr>

"Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests"

Instalar

`Gemfile`
```ruby
group :development, :test do
  gem 'vcr'
end
```

`spec/spec_helper`
```ruby
VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock

  # permite usar ':vcr' na assinatura do teste
  config.configure_rspec_metadata!

  # filtrando dados sensíveis
  config.filter_sensitive_data('<LOCATION>') { 'World' }
  config.filter_sensitive_data('<KEY-TOKEN>') { ENV[:api_key] }
  
end
```

documentação sobre filtragem de dados sensíveis: <https://benoittgt.github.io/vcr/#/configuration/filter_sensitive_data>

No teste fica algo assim:
```ruby
describe 'HTTParty' do
  # atenção nesse 'vcr:' aqui
  it 'content-type', vcr: do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']

    expect(content_type).to match(/application\/json/)
  end
end
```

Outras opções para `vcr:`
- `cassette_name: 'custom/path'` - define um arquivo pra salvar o cassette
- `match_requests_on: [:body]` - permite usar VCR com URIs não determinísticos
- `:new_episode` - define um novo modo de gravação (útil para quando temos um número finito de possibilidades)

### modos de gravação

- once (default)
- new episodes: útil para quando temos um n´úmero finito de possibilidades
- none: nunca grava um cassette
- all: sempre grava


## Rails ActiveSupport Time Helpers

<https://api.rubyonrails.org/classes/ActiveSupport/Testing/TimeHelpers.html>

Nota: use Timecop para projetos sem Rails.

## Executar testes em ordem aleatória

colocar no `.rspec`: `--order random`

Se precisar repetir uma ordem, use `--seed <seed-number>`


## Testando Models

Tentando listar os passos pra começar do zero...

No terminal
```shell
# -T: skip test files
rails new my_project -T
cd my_project
```

`Gemfile`
```ruby
group :development, :test do
  # ...
  # ler no readme qual é a versão a ser utilizada
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "httparty"
  gem "webmock"
  gem "vcr"
end
```

De volta ao terminal:
```shell
bundle install
rails generate rspec:install
```

`spec/rails_helper.rb`
```ruby
RSpec.configure do |config|
  # add FactoryBot
  config.include FactoryBot::Syntax::Methods

  # ...
end
```

- TBD:
    - vcr

<https://rspec.info/features/6-0/rspec-rails/model-specs/>

Nos códigos de teste de model, colocar `type: :model` no describe. Exemplo:
```ruby
RSpec.describe Post, type: model do
  # ...
end
```


`spec/factories/products.rb`
```ruby
FactoryBot.define do
  factory :product do
    description { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    category
  end
end
```

`spec/factories/products.rb`
```ruby
FactoryBot.define do
  factory :product do
    description { Faker::Commerce.department }
  end
end
```

### testes de product

- it "is valid with description, price and category"
- it "is invalid without description"
- it "is invalid without price"
- it "is invalid without category"
- it "returns a product with full description"


### shoulda-matchers

- repo: <https://github.com/thoughtbot/shoulda-matchers>
- website: <https://matchers.shoulda.io/>

`Gemfile`
```ruby
group :development, :test do
  # ...
  gem 'shoulda-matchers'
end
```

`spec/rails_helper.rb`
```ruby
RSpec.configure do |config| 
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  # ...
end
```

Agora podemos fazer isso:

```ruby
it { should validate_presence_of(:description) }
# é possível usar 'is_expected.to' no lugar do should
```

### devise

instalar devise...