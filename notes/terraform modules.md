---
dg-publish: true
---
# terraform modules

In order to use a terraform module, we need to use this syntax:

```hcl
module "my_module_name" {
  source = "path/to/module"
  version = "1.0.0" # specify the version
  
  # check the required args in the module's documentation
  arg1 = value1
  argN = valueN
}
```