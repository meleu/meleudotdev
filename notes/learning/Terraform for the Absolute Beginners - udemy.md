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