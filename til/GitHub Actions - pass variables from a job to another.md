---
dg-publish: true
---
# GitHub Actions: pass variables from a job to another

This is my (current) chosen way to pass variables from a job to another in a #github workflow.

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

## a trick to pass the variable contents as a boolean (rather than string)

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
