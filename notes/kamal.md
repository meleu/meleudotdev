---
dg-publish: true
---
# Kamal

Trying https://kamal-deploy.org/

## pre-requisites

- ssh access to the VM
    - access via ssh keys (no password)
    - preferably with root
    - if non-root, must be able to `sudo` without password
- the app must have a `Dockerfile`
- container registry to push/pull the container image
- `config/routes.rb` must have an `up` endpoint for health checking

### info needed

- VM IP address
- container registry
    - image name
    - username
    - password or token
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

---

this looks promising:
https://gist.github.com/code-206/682c46bd6414b01f912096b4f8865a4b