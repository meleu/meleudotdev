---
dg-publish: true
---
# reusing GitHub workflows

Today I learned a bunch about reusing workflows in #github actions...

### `uses` has a different meaning when in a job vs. in a step

If you want to reuse a workflow you already had, the `uses:` must be set in a **job** (not in a step), like this:

```yaml
# ...
jobs:
  pr_trigger:
    # ...
    
  trigger_cd_test:
    name: Trigger 'CD - Test' workflow
    needs: pr_trigger
    
    # this 'uses' here refers to a file
    #####################################
    uses: ./.github/workflows/cd_test.yml
    #####################################
    
    with:
      environment: "staging"
```

**This does not work** (because it's inside a step):

```yaml
# ...
jobs:
  pr_trigger:
    # ...
    steps:
      - name: Trigger 'CD - Test' workflow

        # this does NOT work!
        #####################################
        uses: ./.github/workflows/cd_test.yml
        #####################################
        
        with: # ...
```

The `uses:` in a step **MUST** refer to a GitHub Action (not a workflow file).

### passing secrets to a reusable workflow

(I already have some notes about [[GitHub Actions - Udemy#Reusable Workflows]])

I learned this `secrets` thing in the [official documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows#using-inputs-and-secrets-in-a-reusable-workflow).

First, highlight in your reusable workflow that the secret is required:

```yaml
on:
  workflow_call:
    inputs:
      # ...
    # list the secrets here!
    ########################
    secrets:
      TAILSCALE_AUTHKEY:
        required: true
    ########################

# ...

jobs:
  reusable_workflow_job:
    # ...
    steps:
    # ...
    - name: '[auth] VPN'
      run: |
        chmod +x ./app/scripts/tailscale.sh
        ./app/scripts/tailscale.sh
      # actually using the secret
      #####################################################
      env:
        TAILSCALE_AUTHKEY: ${{ secrets.TAILSCALE_AUTHKEY }}
      #####################################################
```

And in the caller of the reusable workflow, you can simply use `secret: inherit` to get the repository's secrets (assuming both files are in the same repo).

```yaml
# ...
jobs:
  pr_trigger:
    # ...

  trigger_cd_test:
    name: Trigger 'CD - Test' workflow
    needs: pr_trigger
    uses: ./.github/workflows/cd_test.yml
    with:
      environment: "staging"
      # ...
    # here is the trick!
    ####################
    secrets: inherit
    ####################
```

See also: [[GitHub Actions - pass variables from a job to another]]
## references

- <https://docs.github.com/en/actions/using-workflows/reusing-workflows#using-inputs-and-secrets-in-a-reusable-workflow>
- <https://web.archive.org/web/20220427182405/https://github.community/t/actions-reusable-workflow-failing-to-find-action-yml-that-does-exist/231258/3>
- [ChatGPT - GH Actions and Workflows Advisor](https://chat.openai.com/g/g-CSnWebVwr-gh-actions-and-workflows-advisor)
