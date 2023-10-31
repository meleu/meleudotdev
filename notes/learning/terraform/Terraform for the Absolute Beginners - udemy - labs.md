# Terraform for the Absolute Beginners - udemy - labs

[[Terraform for the Absolute Beginners - udemy|course notes]]

## lab 01: HCL Basics

[link](https://kodekloud.com/topic/lab-hcl-basics-3)

Terraform extension: `.tf`

`main.tf`:
```hcl
resourc "local_file" "games" {
  file = "/root/favorit-games"
  content = "FIFA 21"
}
```

- resource type: `local_file`
- resource name: `games`
- provider: `local`
- 3 phases of terraform:
    1. init
    2. plan
    3. apply
- in the `main.tf` there are two errors:
    1. a missing required argument: `filename`
    2. an invalid argument: `file`
    - this info can be checked in the [docs here](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file#required)

If you don't want to have the contents of the file being created to be echoed on the screen, use the resource type `local_sensitive_file`.

## lab 02: Terraform Providers

`main.tf`:
```hcl
resource "local_file" "things-to-do" {
  filename = "/root/things-to-do.txt"
  content = "Clean my room before Christmas\nComplete the CKA Certification!"
}

resource "local_file" "more-things-to-do" {
  filename = "/root/more-things-to-do.txt"
  content = "Learn how to play Astronomia on the guitar!"
}
```

In both resources, the provider is `local`.

Provider types:

- official
    - `hashicorp/<provider>`
- partner
    - `registry.terraform.io/<organization>/<provider>`
- community
    - `registry.terraform.io/<username>/<provider>`

In the lab there was an example with `registry.terraform.io/<somename>/ansible`. What makes it clear that it refers to a community plugin is the fact that `ansible` is managed by `redhat`. So, previous knowledge is required.


## lab 03: Multiple Providers

Nothing very significant...

When we change the `.tf` file we need to run `terraform init` again.


## lab 04: Variables

variable types:

- string
- number
- bool
- any
- list
- map
- set (like a list, but with no repetition)
- object
- tuple (like a list, but with mixed types)

Variables are accessed by prefixing the var name with `var.`


## lab 05: Using variables in terraform

getting vars from env: `ENV_VAR_<variable_name>`

The argument for `-var-file` is a a `*.tfvars` file.

variáveis em arquivos `.tfvars` são definidas simplesmente assim:
```
var_name = var_value
```

para que as variáveis sejam carregadas, é necessário que isso seja explicitado no arquivo `variables.tf`.


## lab 06: Resource attributes

Some resources don't need any arguments. Example:

```hcl
resource "time_static" "time_update" {
}
```

To access the `id` we use `time_static.time_update.id`.

Interpolation: `"Time stamp of this file is ${time_static.time_update.id}"


## lab 07: Resource Dependencies

Declaring an explicit dependency:

```hcl
resource "local_file" "pet" {
  filename = var.filename
  content = "My favorite pet is Mr.Cat"
  # here #############
  depends_on = [
    random_pet.my-pet
  ]
  ####################
}

resource "random_pet" "my-pet" {
  prefix = var.prefix
  separator = var.separator
  length = var.length
}
```


## lab 08: Output Variables

```hcl
output "<variable-name>" {
  value = "<variable-value>"
  <arguments>
}
```

inspect the value with `terraform output` or `terraform output <variable-name>`.


## lab 09: Terraform State

- Terraform State file is placed in the same dir as the `.tf` files.
- Default name: `terraform.tfstate`
- The extension: `.tfstate` 
- Format is JSON.

The command `terraform show` is useful to check the terraform state.

**NOTE**: Terraform State stores sensitive data.


## lab 10: Terraform Commands

Use `terraform validate` to check your `.tf` config files.

Use `terraform fmt` to format your code.

Use `terraform providers` to list the providers currently in use.