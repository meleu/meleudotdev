---
dg-publish: true
---
# gh-actions

## basic structure

```yaml
name: <workflow-name>
on: <event>
jobs:
  <job-name>:
    runs-on: ubuntu-latest
    steps:
      - name: <step-name>
        uses: <action-name>  # can b an action
      - name: <step-name>
        run: <shell-command> # can be a shell command
```

## hello world

```yaml
# define the name of the **workflow**
name: First Workflow

# define the event that triggers this workflow
on: workflow_dispatch # <- this means "manual trigger"

# define the **jobs** of this workflow
jobs:
  first-job: 
    # define the runner for this job
    # list of supported runners:
    # https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources
    runs-on: ubuntu-latest

    # define the **steps** of this job
    steps:
      - name: Print greeting
        run: echo "Hello World"
      - name: Print bye
        run: echo "Done! Bye!"
```


## trigger configs

It can be "Activity Types" or "Filters"

### Activity Types

> [same docs as the events](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows), just check the `Activity types` column of the event.

Structure:
```yaml
# ...
on:
  <event>:
    types: [activity-type-1, activity-type-n]
  <another-event>:
# ...
```

example:
```yaml
# ...
on:
  pull_request:
    types: 
      - opened
      - edited
  dispatch_workflow:
  # yeah, it's an empty key
# ...
```

### Filters

Check the [Workflow syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) doc. For example [this part](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#onpull_requestpull_request_targetbranchesbranches-ignore) for `pull_request` filters.

Example:
```yaml
# ...
on:
  push:
    branches:
      - main
      - 'dev-*'
      - 'feat/**' # works like shell globbing
    paths-ignore:
      # don't trigger the workflow for the following paths
      - '.github/workflows/*'
# ...
```

Check the [Filter pattern cheat sheet](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#filter-pattern-cheat-sheet), it's quite handy.

