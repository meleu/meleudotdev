---
dg-publish: true
---
# Packer - What to do when there is no default VPC defined for the region?

#tools #devops

## TL;DR

If the region you want to build a new AMI doesn't have a default VPC, you'll probably want a config like this:

```hcl
# ...
source "amazon-ebs" "any_name" {
  # ...
  vpc_filter {
    filters = {
      "tag:Name"  = "vpc-name"
      "isDefault" = "false"
    }
  }
  subnet_filter {
    filters = {
      "state" = "available"
    }
    # if more than one subnet matches, pick one at random
    random = true
  }
}
# ...
```

## explanation

I was tasked to create a custom Amazon Machine Image (AMI) and I decided to use [Hashicorp Packer](https://developer.hashicorp.com/packer) for that.

I quickly learned how to use Packer by following the [official tutorials](https://developer.hashicorp.com/packer/tutorials).

For creating an AMI, what Packer basically does is:

1. reads the `*.pkr.hcl` file...
2. create an AWS EC2 instance, starting from the AMI defined in the `source` block.
3. run the instructions present in the `build` block.
4. creates a snapshot and an AMI after `build` is done.
5. destroys the EC2 instance.

The issue happened when I tried to use it in a real scenario where there was no default VPC defined in the region where I was wanting to create the AMI.

Fortunately you can specify a non-default VPC, like this:

```hcl
# ...
source "amazon-ebs" "any_name" {
  # ...
  vpc_filter {
    filters = {
      "tag:Name"  = "vpc-name"
      "isDefault" = "false"
    }
  }
}
```

A new problem appear when your VPC has many available subnets, then Packer doesn't know which one to pick. Here's the solution

```hcl
# ...
source "amazon-ebs" "any_name" {
  # ...
  subnet_filter {
    filters = {
      "state" = "available"
    }
    # if more than one subnet matches, pick one at random
    random = true
  }
}
```

## useful links

- [official documentation about amazon EBS integration](https://developer.hashicorp.com/packer/integrations/hashicorp/amazon/latest/components/builder/ebs)
- [old issue posted on packer repository](https://github.com/hashicorp/packer/issues/2002)
