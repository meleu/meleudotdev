---
dg-publish: true
---
# GitHub Actions - Udemy

<https://cloudwalk.udemy.com/course/github-actions-the-complete-guide/>

## Git Crash Course

### undoing commits

- `git revert <id>` - creates a new commit undoing the changes made in the commit `<id>`.
- `git reset --hard <id>` - undo the changes since commit `<id>` and **delete the commit history since then**


## GitHub Actions

### Summary

#### Core components

- Workflows: define events+jobs
    - Jobs: define runner+steps
        - Steps: do the actual work

Workflows go in `.github/workflows/*.yml`

#### Events

Most used:

- `push` - pushing a commit
- `workflow_dispatch` - manually trigger

[official documentation](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)

#### Runners

Environments where the jobs are executed.

Most used: `ubuntu-latest`.

[official documentation](https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources).


#### Actions

In the steps you can either run Actions or `run` shell commands.

> **Action**: a custom application that performs a typically complex frequently repeated task.

### 3 main building blocks

- workflows
    - jobs
        - steps

- workflows
    - attached to a git repository
    - triggered uppon **events**
    - contain multiple **jobs**
- jobs
    - define a **runner** (execution environment)
    - contain multiple **steps**
    - run in parallel (default) or sequential
    - can be conditional
- steps
    - execute **shell scripts** or **actions**
    - executed in order
    - can be conditional

### creating your first workflow

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

### simple workflow structure to memorize:

```yaml
name: <workflow-name>
on: <event>
jobs:
  <job-name>:
    runs-on: ubuntu-latest
    steps:
      - name: <step-name>
        uses: <action-name>
      - name: <step-name>
        run: <shell-command>
```

### Events (Workflow Triggers)

> [official doc](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)
>
> See also [[#Event Filters and Activity Types]]

- Repository related:
    - `push` - pushing a commit
    - `pull_request` - pull request action (open, close, ...)
    - `create` - branch or tag created
    - `fork` - repository was forked
    - `issues` - issues opened, deleted, ...
    - `issue_comment` - issue or pull request comment action
    - `watch` - repository was starred
    - `discussion` - discussion action (created, deleted, ...)
    - more...
- other events:
    - `workflow_dispatch` - manually trigger
    - `workflow_call` - can be called by other workflows
    - `repository_dispatch` - REST API request triggers workflow
    - `schedule` - workflow is scheduled

**NOTE**: the `on:` keyword accepts an array with multiple events.

### What are Actions?

Action is an alternative to the `run` command in the workflow yaml file.

> **Action**: a custom application that performs a typically complex frequently repeated task.

You can build your own Actions, use the official or community Actions.

In order to use an Action, we must use the word `uses:` instead of `run:`

### Expressions & Context Objects

See the docs: <https://docs.github.com/en/actions/learn-github-actions/expressions>

Example:
```
${{ toJSON(github) }}
${{ github.ref_name }}
```

## Event Filters and Activity Types

- Events
    - Activity Types
        - e.g.: `pull_request` event
            - opened
            - closed
            - edited
            - ...
    - Filters
        - e.g.: `push` event
            - filter based on target branch

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
    types: [opened, edited]
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


### Fork Pull Request Workflows

> [!note]
> By default, Pull Requests based on forks do NOT trigger a workflow.
> 
> Reasoning: prevent malicious code running on your runners.

