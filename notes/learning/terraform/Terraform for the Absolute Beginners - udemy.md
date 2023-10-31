---
dg-publish: true
---
# Terraform for the Absolute Beginners - udemy

- <https://udemy.com/course/terraform-for-the-absolute-beginners>

[[Terraform for the Absolute Beginners - udemy - labs]]

## Basic Concepts

### IaC tools

- **Configuration Management**
    - Designed to install and manage software
    - maintains standard structure
    - version control
    - idempotent (run as many times you want and the result is the same)
    - examples:
        - ansible
        - puppet
        - saltstack
- **Server Templating**
    - Pre-installed software and dependencies
    - VM or container images
    - immutable infrastructure
    - examples:
        - docker
        - packer
        - vagrant
- **Provisioning Tools**
    - deploy immutable infrastructure resources
    - servers, databases, network components, etc.
    - multiple providers
    - examples:
        - terraform
        - CloudFormation

### 3 phases of Terraform

1. init
2. plan
3. apply


`.tfstate` ?

### HCL syntax

```hcl
<block> <parameters> {
  key1 = value1
  keyN = valueN
}
```

example:
```hcl
# resource: block name
# local_file: resource type
#   local = provider
#   file = resource
# pet: resource name
resource "local_file" "pet"{
  # here goes the arguments
  filename = "/root/pets.txt"
  content = "We love pets!"
}
```

`aws-ec2.tf`:
```
resource "aws_instance" "webserver" {
  ami = "ami-123456..."
  instance_type = "t2.micro"
}
```

`aws-s3.tf`:
```hcl
resource "aws_s3_bucket" "data" {
  bucket = "webserver-bucket-org-2206"
  acl = "private"
}
```


## 4 steps of basic Terraform workflow

1. write the `.tf` file
2. `terraform init`
3. `terraform plan`
4. `terraform apply`

See also: `terraform show`

Destroy a resource: `terraform destroy`


## provider types

- official
    - `hashicorp/<provider>`
- partner
    - `registry.terraform.io/<organization>/<provider>`
- community
    - `registry.terraform.io/<username>/<provider>`


### Terraform vars

`variables.tf`:
```hcl
variable "var_name" {
  default = "default value"
  # optionals:
  type = <variable-type>
  description = <text>
}
```

Now we can reference the variable in our `main.tf`:
```hcl
resource "local_file" "pet" {
  filename = var.var_name
}
```

When we explicitly declare a variable we are actually setting a constraint for the values that can be stored in the variable.

Variable types:

- string
- number
- bool
- any (used when `type` is not explicitly declared)
- list (like an array)
    - `["Mr", "Mrs", "Sir"]`
    - `type: list`
    - `type: list(string)`
    - `type: list(number)`
- map (like a hash, key-value pairs)
    - `{ "key1" = "value1" }
    - `type: map`
    - `type: map(string)`
    - `type: map(number)`
- set (like a list, but with no repeatition)
- object
    - `object({ propertyname = propertyvalue })
- tuple (like an array, but mixing different types inside)
    - `tuple([string, number, bool])`
    - `["cat", 7, true]`

[Variable definition Precendence](https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence):

> Terraform uses the _last_ value it finds, overriding any previous values.

This is the sequence (remember: what comes later takes precedence):

1. environment variables: `TF_VAR_varname`
2. `terraform.tfvars`
3. `*.auto.tfvars` or `*.auto.tfvars.json` (alphabetical order)
1. `-var` or `-var-file` in command line

### output variables

```hcl
output "<variable-name>" {
  value = "<variable-value>"
  <arguments>
}
```

inspect the value with `terraform output` or `terraform output <variable-name>`.


## Terraform Commands

```shell
# check if config is correct
terraform validate

# formats the code in the config file
terraform fmt

# show the state
terraform show
terraform show -json

# show current providers
terraform providers

# display outputs mentioned in the configs
terraform output

# sync terraform state with the actual state
# NOTE: it doesn't change anything in the resources,
#       only sync the tfstate
terraform refresh

# create a graph for visualization of the dependencies
terraform graph
# install graphviz so you can use it like this
terraform graph | dot -Tsvg > graph.svg

```