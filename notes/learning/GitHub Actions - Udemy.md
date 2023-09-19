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


### Events (Workflow Triggers)

> [official doc](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows)

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

### What are Actions?

Action is an alternative to the `run` command in the workflow yaml file.

> **Action**: a custom application that performs a typically complex frequently repeated task.

You can build your own Actions, use the official or community Actions.

In order to use an Action, we must use the word `uses:` instead of `run:`
