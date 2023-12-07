---
dg-publish: true
---
# Ruby on Rails - CRUD com TDD

Origem: <https://cloudwalk.udemy.com/course/rails-tdd/>()

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
    expect(page).to have_content('Welcome')
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
scenario 'Check Show Clients link' do
  visit(root_path)
  expect(find('ul li')).to have_link('Show Clients')
end
```

Rodar o teste e ver que vai falhar

Criar o link para "Show Clients" na view.

Rodar os testes.


## 04. Feature Customer

```shell
rails generate rspec:feature customer
```

`spec/features/customers_spec.rb`:
```ruby
feature 'Customers', type: :feature do
  scenario 'Check New Client link' do
    visit(root_path)
    expect(page).to have_link('Show Clients')
  end

  scenario 'Validate New Client link' do
    visit(root_path)
    click_on('Show Clients')
    expect(page).to have_content('Clients List')
    expect(page).to have_link('New Client')
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
  scenario 'Check New Client form' do
    visit(customers_path)
    click_on('New Client')
    expect(page).to have_content('New Client')
  end
end
```

Criar a view `new.html.erb`