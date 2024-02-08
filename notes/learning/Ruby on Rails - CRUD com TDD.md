---
dg-publish: true
---
# Ruby on Rails - CRUD com TDD

Origem: <https://udemy.com/course/rails-tdd/>

## 00. Ideias:

- criar uma pipeline CI no github actions
- rubocop para análise estática
- rodar os testes
- buildar um container 



## 01. Iniciando o projeto Rails e instalando RSpec

- <https://cloudwalk.udemy.com/course/rails-tdd/learn/lecture/9205630#overview>


```shell
# criar um novo app usando rails versão 5.1.4
# -T para começar sem os testes (usaremos RSpec)
#rails _5.1.4_ new rails-crud -T

# na verdade usei o rails mais atual mesmo
rails new rails-crud -T
cd rails-crud
```


`Gemfile`:
```ruby
group :development, :test do
  # ...
  gem 'rspec'
  gem 'rspec-rails'
end
```

```shell
# instalar 'rspec-rails' que adicionamos ao Gemfile
bundle install

# create the commands in bin/ dir
bundle binstubs --all

# install rspec in the project
rails generate rspec:install
```

`.rspec`
```
--format documentation
```

```shell
# criar o banco de dados
rails db:create:all
```

`config/application.rb`:
```ruby
module RailsCrud
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework(
        :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
      )
    end
  end
end
```

## 02. Feature Spec

Só uma explicação de como funciona o método de TDD:

- primeiro escreve o teste
- depois escreve código suficiente para resolver os problemas apontados pelas mensagens de erro do teste.

Aplicando TDD! Primeiro escrever os testes e depois escrever o código de produção!

```shell
rails generate rspec:feature welcome
```

`spec/features/welcome_spec.rb`:
```ruby
require 'rails_helper'

feature 'Welcome', type: :feature do

  scenario 'Show Welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome to my app!')
  end

end
```

Rodar o teste e observar que ocorrerá um erro dizendo que não tem rota!

Vamos criar a rota:

`config/routes.rb`:
```ruby
root to: 'welcome#index'
```

Criar o controller com o método index e também o view com o `index.html.erb`...

Rodar o teste.

## 03. Link para lista de clientes


`spec/features/welcome_spec.rb`:
```ruby
scenario 'Check Show Customers link' do
  visit(root_path)
  expect(find('ul li')).to have_link('Show Customers')
end
```

Rodar o teste e ver que vai falhar

Criar o link para "Show Customers" na view.

Rodar os testes.


## 04. Feature Customer

```shell
rails generate rspec:feature customer
```

`spec/features/customers_spec.rb`:
```ruby
feature 'Customers', type: :feature do
  scenario 'Check New Customer link' do
    visit(root_path)
    expect(page).to have_link('Show Customers')
  end

  scenario 'Validate New Customer link' do
    visit(root_path)
    click_on('Show Customers')
    expect(page).to have_content('Customers List')
    expect(page).to have_link('New Customer')
  end
end
```

Vamos gerar o controller:
```shell
rails generate controller customers
```

`config/routes.rb`:
```ruby
resources :customers
```


`spec/features/customers_spec.rb`:
```ruby
feature 'Customers', type: :feature do
  # ...
  scenario 'Check New Customer form' do
    visit(customers_path)
    click_on('New Customer')
    expect(page).to have_content('New Customer')
  end
end
```

Criar a view `new.html.erb`

## 05. Formulário de novo cliente

Instalar a `faker` gem no grupo de desenvolvimento/teste (`Gemfile`).

teste:
```ruby
scenario 'create a new customer' do
  visit(new_customer_path)
  customer_name = Faker::Name.name 
  fill_in('Name', with: customer_name )
  fill_in('Email', with: Faker::Name.name)
  fill_in('Telephone', with: Faker::Name.name)
  attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
  choose(optin: ['Y', 'N'].sample)
  click_on('Create Customer')

  expect(page).to have_content('New Customer successfully created')
  expect(Customer.last.name).to eq(customer_name)
end
```

Criando o  model
```shell
rails generate model Customer name email phone avatar smoker

# check the migration file

rails db:migrate
```

Legal aqui o lance de internacionalização (aka i18n): [aula, aos 7min](https://udemy.com/course/rails-tdd/learn/lecture/9348306#overview)


