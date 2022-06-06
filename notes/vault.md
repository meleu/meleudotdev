# Vault - HashiCorp

[[Secret Management with Vault]]

## Vault on Kubernetes

1. Vault on Kubernetes Reference Architecture: <https://learn.hashicorp.com/tutorials/vault/kubernetes-reference-architecture>
2. Vault on Kubernetes Deployment Guide: <https://learn.hashicorp.com/tutorials/vault/kubernetes-raft-deployment-guide?in=vault/kubernetes>


## Good video to deploy a simple version Vault

- <https://youtu.be/L_o_CG_AGKA>
    - interesting part starts at 14:40
    - files: <https://github.com/marcel-dempers/docker-development-youtube-series/tree/master/hashicorp/vault>



## Getting Started

- <https://learn.hashicorp.com/collections/vault/getting-started>
- <https://www.udemy.com/course/hashicorp-vault/>
- [[notes/learning/hashicorp-vault-pluralsight/index]]
- [[notes/learning/hashicorp-certified-vault-associate-pluralsight/index]]
- [[notes/learning/getting-started-hashicorp-vault/index]]


## Useful links

- <https://devopscube.com/vault-in-kubernetes/>


## Vault & GitLab CI

<https://docs.gitlab.com/ee/ci/examples/authenticating-with-hashicorp-vault/>


## basic commands

```bash
# starting the dev server
################################
vault server -dev
# note: follow the instructions on the logs

# vault CRUD
################################
# note: kv stands for key-value

# write a secret `foo` with value of `world`
# to the path `secret/hello`:
vault kv put secret/hello foo=world

# multiple key-value pairs
vault kv put secret/hello foo=world excited=yes

# get a secret
vault kv get secret/hello

# get a specific field
vault kv get -field=excited secret/hello

# get from a json output
vault kv get -format=json secret/hello

# filter with jq
vault kv get -format=json secret/hello | jq -r '.data.data.excited'

# delete a secret
vault kv delete secret/hello
```

Commands from the tutorial about [Secrets Engines](https://learn.hashicorp.com/tutorials/vault/getting-started-secrets-engines)

```bash
# enable a secret named kv
################################
vault secrets enable -path=kv kv
# the path defaults to the secret's name.
# thus, the following command is equivalent:
vault secrets enable kv

# list available secrets engines
vault secrets list

# CRUDing the new secret engine
################################
# creating some secrets
vault kv put kv/hello target=world
vault kv put kv/my-secret value='s0m3tH1nG'

# getting the secrets
vault kv get kv/hello
vault kv get kv/my-secret

# delete the secrets at `kv/my-secret`
vault kv delete kv/my-secret

vault kv list kv/


# disable the secret named kv
################################
vault secrets disable kv/
```

Commands from the tutorial about [Authentication](https://learn.hashicorp.com/tutorials/vault/getting-started-authentication)

```bash
# create a new token
vault token create

# copy the token from the output of the above command
# and then login with this command:
vault login s.iyNUhq8Ov4hIAx6snw5mB2nL

# revoke the token
vault token revoke s.iyNUhq8Ov4hIAx6snw5mB2nL
```


## env variables for vault CLI

`VAULT_ADDR` - URL of the Vault server
`VAULT_TOKEN` - Token value for requests
`VAULT_SKIP_VERIFY` - No verify TLS certificate
`VAULT_FORMAT` - Specify the output format
