---
dg-publish: true
---
# reusing GitHub workflows

Today I learned a bunch about reusing workflows in #github actions...

### `uses` has a different meaning when in a job vs. in a step

If you want to reuse a workflow you already had, the `uses:` must be set in a job, like this:

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

**This does not work:**

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


### passing variables from a job to another

This is my (current) chosen way to pass variables from a job to another.

The job where the variable is created should have this:

```yaml
# ...
jobs:
  pr_trigger:
    # ...
    
    # listing the variables we need to pass to the next jobs
    # note how I'm explicitly saying the vars are being set
    # in a step called `setup` (that's the name I chose)
    outputs:
      ANDROID: ${{ steps.setup.outputs.ANDROID }}
      IOS: ${{ steps.setup.outputs.IOS }}
      SOURCE_BRANCH: ${{ steps.setup.outputs.SOURCE_BRANCH }}
      DESCRIPTION: ${{ steps.setup.outputs.DESCRIPTION }}

    steps:
      - name: Setup variables
        # here's where I define the name to be used in the 
        # outputs section above
        ##################################################
        id: setup
        ##################################################
        # ...
        run: |
          # ...
          # passing variable to the next jobs
          echo "ANDROID=${ANDROID}" >> $GITHUB_OUTPUT
          echo "IOS=${IOS}" >> $GITHUB_OUTPUT
          echo "SOURCE_BRANCH=${SOURCE_BRANCH}" >> $GITHUB_OUTPUT
          echo "DESCRIPTION=${DESCRIPTION}" >> $GITHUB_OUTPUT
          
    # ...

  # in a later job...
  trigger_cd_test:
    name: Trigger 'CD - Test' workflow
    # this 'needs:' is important!
    #############################
    needs: pr_trigger
    #############################
    uses: ./.github/workflows/cd_test.yml
    with:
      # ...
      # here's how I get the vars from the previous job.
      # pattern: `needs.<previous_job_name>.outputs.<VAR>`
      branch: ${{ needs.pr_trigger.outputs.SOURCE_BRANCH }}
      description: ${{ needs.pr_trigger.outputs.DESCRIPTION }}
      #######################################################
```

### a trick to pass the variable contents as a boolean (rather than stringg)

If you reusable workflow expects a boolean, like in here:

```yaml
# ...

on:
  workflow_call:
    inputs:
      # ...
      ios:
        type: boolean
        required: false
      android:
        type: boolean
        required: false
```

Then in the caller you need this trick to prevent passing a string when you need a boolean.

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
      # the " == 'true'" is mandatory to pass the values as a boolean
      ###############################################################
      ios: ${{ needs.pr_trigger.outputs.IOS == 'true' }}
      android: ${{ needs.pr_trigger.outputs.ANDROID  == 'true' }}
      ###############################################################
```

## references

- <https://docs.github.com/en/actions/using-workflows/reusing-workflows#using-inputs-and-secrets-in-a-reusable-workflow>
- <https://web.archive.org/web/20220427182405/https://github.community/t/actions-reusable-workflow-failing-to-find-action-yml-that-does-exist/231258/3>
- [ChatGPT - GH Actions and Workflows Advisor](https://chat.openai.com/g/g-CSnWebVwr-gh-actions-and-workflows-advisor)
