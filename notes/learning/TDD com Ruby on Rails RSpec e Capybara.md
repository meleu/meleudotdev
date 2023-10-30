---
dg-publish: true
---
# TDD com Ruby on Rails RSpec e Capybara

- https://udemy.com/course/rails-tdd/

## links

- <https://rspec.info/>
- <https://www.betterspecs.org/>

## RSpec

```shell
# no dir do projeto:
rspec --init
```

O `rspec init` cria um `spec_helper.rb` que já adiciona o diretório `lib/` no `$LOAD_PATH`. Desta forma já podemos fazer o `require` dos arquivos nos nossos testes sem precisar especificar o path.

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

describe Calculator do
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
# bad
expect(num.odd?).to be true

# good
expect(num).to be_odd
```


#### Erros / Exceptions

Testar se erros ocorrem na hora certa.

**OBS**: para testar erros/exceptions, é necessário colocar dentro de um bloco, o código que vai lançar o erro.

Exemplo:

```ruby
describe Calculator do
  it 'division by zero' do
    expect { subject.div(3, 0) }.to raise_exception
  end
end
```

Usar `raise_exception` é uma bad practice, pois é muito genérico e não especifica qual tipo de erro. O melhor é especificar qual é o tipo de erro:

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
# antes/depis de cada teste
before(:each)
before(:example)
after(:each)
after(:example)

# obs.: ':all' e ':context' são sinônimos.
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
########
# 👎 bad
########
before(:each) do
  @pessoa = Pessoa.new
end
# referenciar com '@pessoa'

#########
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
  # ... run multiple expectatoins ...
end
```

### Custom Matcher

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


### doubles

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


