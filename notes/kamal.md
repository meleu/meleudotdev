---
dg-publish: true
---
# Kamal

Trying https://kamal-deploy.org/

## pre-requisites

- ssh access to the VM
    - access via ssh keys (no password)
    - preferably with root
- the app must have a `Dockerfile`
- container registry to push/pull the container image

### info needed

- VM IP address
- container registry
    - image name
    - username
    - password
- DB
    - container image name
    - IP address
    - port
    - DB root password
- `RAILS_MASTER_KEY`


## kamal steps

- enter projects directory
- `kamal init`
    - `config/deploy.yml`
    - `.env`
    - `.kamal/hooks`
- `config/environments/production.rb`
    - comentar linha com `config.force_ssl = true` 