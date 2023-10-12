---
dg-publish: true
---
# Terraform for the Absolute Beginners - udemy

- <https://udemy.com/course/terraform-for-the-absolute-beginners>

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


### 4 steps of basic Terraform workflow

1. write the `.tf` file
2. `terraform init`
3. `terraform plan`
4. `terraform apply`

See also: `terraform show`

Destroy a resource: `terraform destroy`


### Terraform vars

precedence order:

1. environment variables: `TF_VAR_varname`
2. `terraform.tfvars`
3. `*.auto.tfvars` (alphabetical order)
4. `-var` or `-var-file` in command line

