---
dg-publish: true
cards-deck: webdev::rails
deck: webdev::rails
---

# Anki cards for Rails

#anki 

Flashcards for Rails. Created with [Obsidian Anki Sync](https://github.com/debanjandhar12/Obsidian-Anki-Sync) notation.


---

<!-- basicblock-start oid="Obs8SW01LaI2OBk80G4xEMyl" -->
## Generic syntax of a migration to add a column to a given table?
::
```ruby
class AddColumnToTable < ActiveRecord--Migration[7.0]
  def change
    add_column :table, :column, :type
    # table names are always plural!
  end
end
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="Obsmy4RYMBkWGeiCDEPWjBHT" -->
## What are the 4 most common ActiveRecord validation types?
::
1. `presence`
2. `uniqueness`
3. `length { min or max }`
4. `format { with: /regex/ }`
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsE3b7q4U80qUnwifZ1Nv7N" -->
## ActiveRecord: migration to rename a column?
::
```ruby
rename_column :table, :old_column_name, :new_column_name
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsF6NL86t10w6XiVpuxFuKZ" -->
## ActiveRecord: 1:n relation between `doctors` and `interns` written in the `interns` migration
::
```ruby
class CreateInterns < ActiveRecord--Migration[7.0]
  def change
    create_table :interns do |t|
      t.references :doctor, foreign_key: true
      # ...
    end
  end
end
```
<!-- basicblock-end -->

---

<!-- basicblock-start oid="Obs2Kfjyj0GtUgQ8qmCNY0Dq" -->
## ActiveRecord: migration to add an `intern_id` foreign key in `patients` table
::
```ruby
class AddInternReferenceToPatients < ActiveRecord--Migration[7.0]
  def change
    add_reference :patients, :intern, foreign_key: true
  end
end
```
<!-- basicblock-end -->

---

<!-- basicblock-start oid="ObsBF89MWJvqspoqiZYNLMLx" -->
## ActiveRecord: migration to remove column from table
::
```ruby
class RemoveColumnFromTable < ActiveRecord--Migration[7.0]
  def change
    remove_column :table, :column, :type
  end
end
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="ObstJN5K8HVjDLiZYywbm9dw" -->
## When a restaurant is destroyed, all of its reviews must be destroyed as well
::
```ruby
class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="Obsc708UHJgCd7T64jngDWN7" -->
## Strong Params for a Task
::
```ruby
def task_params
  params
    .require(:task)
    .permit(:title, :details, :completed)
end
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="Obs04C5uPXdtVlpmTC4tH7nE" -->
## Run a method before a collection of controller's action
::
```ruby
# example for set_task
before_action :set_task, only: %i[show edit update destroy]
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsusEBEMVmr0JkNWscJ1OzL" -->
## Simple Form installation
::
```ruby
# Gemfile
# ...
gem 'simple_form'
```

```bash
bundle install
rails generate simple_form:install --bootstrap
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="ObsAPk085wN2wOjPdtLoJvOC" -->
## Simple Form for a Task
::
```ruby
simple_form_for @task do |f|
  f.input :title
  f.input :details
  f.submit
end
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="Obs9ih9c9L56kQD5XyJJ4BXS" -->
## 5 steps of Rails assets pipeline
::
1. precompile
2. concatenate
3. minify
4. fingerprinting (for caching)
5. compacting (gzip)
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsD6U9HbrhftP6epddUy8bG" -->
## Routes for restaurants and reviews
::
```ruby
resources :restaurants do
  resources :reviews, only: %i[new create]
end

resources :reviews, only: :destroy
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsiA5zoB3Cd4Tin8MK07i0Q" -->
## View: delete button with a confirmation
::
```rb
button_to(
  "Delete",
  @post,
  method: :delete,
  data: {
    turbo_confirm: 'Sure?'
  }
)
```
<!-- basicblock-end -->