---
dg-publish: true
---
# AWS Services

## 1 - Introduction to AWS

Core services:

- Compute:
  - EC2
- Storage:
  - S3
- Database:
  - RDS
- Networking & Content Delivery
  - VPC
- Security, Identity & Compliance
  - IAM
- Containers
  - ECR - registry
  - Elastic Kubernetes Service

### Scopes of Services

One thing to be mindful is that different services have different scopes.

The AWS scopes are:

- Global
  - Regions
    - Availability Zone Scopes

![[Pasted image 20211011100304.png]]

## Create an AWS account

<https://aws.amazon.com/>

## IAM - Manage Users, Roles and Permissions

IAM: Identity and Access Management

Once you create an root account, it's better to create an admin account, with less permissions

- ROOT users
  - ADMIN users
    - System Users

Users vs. Roles:  roles are assigned to users.

Policies cannot be assigned to AWS Services directly. You first assign a policy to a role, and then assign the role to the service.

System Users vs. Human Users

## VPC - Virtual Private Cloud

- Scoped in Region
- VPC spans **all the AZs (Subnets)** in that region.
- VPC is your own **isolated network** in the cloud

- Virtual representation of network infrastrucutre
- Set of servers, network configuration moved to cloud
- **Your components have to run in a VPC!**

### Security Groups

1. A Security Groups is scoped in a VPC level.
2. Region-Specific: Since VPCs are region-specific, Security Groups are also region-specific.
3. Stateful: Security Groups are stateful, meaning if you allow an incoming request from a specific IP address, the response is automatically allowed, regardless of outbound rules.
4. Rules: You can define inbound and outbound rules for a Security Group. These rules specify the allowed protocols, ports, and source/destination IP ranges.


### Subnets

- Components of a VPC
- Scoped in Availability Zone
- A "private network" inside a network
- A VPC has a range of private IP addresses
- Subnets in a VPC have their own "sub-range" from the VPC range.
- Internet Gateway: connects your VPC to the outside world.

| RFC 1918 name | IP address range              | Number of addresses | Largest CIDR block (subnet mask) | Host ID size |
| ------------- | ----------------------------- | ------------------- | -------------------------------- | ------------ |
| 24-bit block  | 10.0.0.0 – 10.255.255.255     | 16777216            | 10.0.0.0/8 (255.0.0.0)           | 24 bits      |
| 20-bit block  | 172.16.0.0 – 172.31.255.255   | 1048576             | 172.16.0.0/12 (255.240.0.0)      | 20 bits      |
| 16-bit block  | 192.168.0.0 – 192.168.255.255 | 65536               | 192.168.0.0/16 (255.255.0.0)     | 16 bits      |

Private vs. Public Subnets: firewal rule config makes it either private and/or public subnet.

CIDR: range of IP addresses

Cool links:
- [Visual Subnet Calculator](https://www.davidc.net/sites/default/subnets/subnets.html)
- https://cidr.xyz

## EC2

Steps to launch an instance:

1. Add Tags
2. Choose OS Image
3. Choose capacity
4. Network configurations
5. Configure Security Group
6. Add storage

Using AWS CLI to create an EC2 instance:

```bash
aws ec2 run-instances \
  --image-id ami-xxxxxx \
  --count 1 \
  --instance-type t2.micro \
  --key-name MyKeyPair \
  --security-group-ids sg-xxxxxx \
  --subnet-id subnet-xxxxxx
```

