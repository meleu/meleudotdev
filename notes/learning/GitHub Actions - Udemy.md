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
    - triggered upon **events**
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

See the docs:

- [expressions](https://docs.github.com/en/actions/learn-github-actions/expressions)
- [contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)

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


### Fork Pull Request Workflows

> [!note]
> By default, Pull Requests based on forks do NOT trigger a workflow.
> 
> Reasoning: prevent malicious code running on your runners.

### Skipping workflows

[doc](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs)

Commit messages with strings like this:

```
[skip ci]
[ci skip]
[no ci]
[skip actions]
[actions skip]
```



## Job Outputs

### Artifacts

Use these actions:

- <https://github.com/actions/upload-artifact>
- <https://github.com/actions/download-artifact>


### Job Outputs

Simple values. Typically used for reusing a value in different jobs.

Example: name of a file generated in a previous step.

```yaml
# ...
build
  # ...
  outputs:
    # <identifier>: ${{ steps.$ID.outputs.$SOMETHING }}
    script-file: ${{ steps.publish.outputs.script-file }}
  steps:
    - name: publish JS filename
      id: publish
      run: find *.js -type f -execdir echo 'script-file={}' >> $GITHUB_OUTPUT ';'
    # ...
      
  deploy:
    - name: output filename
    - run: echo "${{ needs.build.outputs.script-file }}"
  
```


Useful docs:

- [expressions](https://docs.github.com/en/actions/learn-github-actions/expressions)
- [contexts](https://docs.github.com/en/actions/learn-github-actions/contexts)

## Caching dependencies

[Check the docs](https://docs.github.com/en/actions/using-workflows/caching-dependencies-to-speed-up-workflows)

```yaml
jobs:
  test:
    # ...
    steps:
      - name: get code
        # ...
        # cache needs to be right before installing deps
      - name: cache dependencies
        uses: actions/cache@v3
        with:
          path: ~/.npm
          key: deps-node-modules-${{ hashFiles('**/package-lock.json') }}
      - name install dependencies
        run: npm ci
      # ...
  build:
    needs: test
    # ...
    steps:
      # yeah, we need to repeat the same yaml code... :(
      - name: get code
        # ...
        # cache needs to be right before installing deps
      - name: cache dependencies
        uses: actions/cache@v3
        with:
          path: ~/.npm
          key: deps-node-modules-${{ hashFiles('**/package-lock.json') }}
      - name install dependencies
        run: npm ci
```

## Environment Variables and Secrets

## Environment Variables

> See also: [default environment variables](https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables)

```yaml
name: <workflow-name>

on: <events>

env: # variables available for all jobs
  <key>: <value>

jobs:
  <job-name>:
    env: # variables available only for this job
      <key>: <value>
      
    steps:
      - name: <step-name>
        env: # variables available only for this step
        # ...
```

### Secrets

Secrets can be stored on repository-level or via Environments (in the repo Settings tab).

Secrets can be refeereenced via the `${{ secrets }}` context object.

## Controlling Workflow and Job Execution (conditionals)

[video](https://udemy.com/course/github-actions-the-complete-guide/learn/lecture/34140160#overview)

Special conditional functions ([doc](https://docs.github.com/en/actions/learn-github-actions/expressions#status-check-functions))

- `failure()`
- `success()`
- `always()`
- `cancelled()`

Note that the default behavior is to interrupt execution if any previous step fails, so if we want to run something after a failure, we need to use `if: failure() && ...`.

Example 1: upload report only if a previous job:
```yaml
jobs:
  test:
    # ...
  lint:
    # ...
  report:
    # this 'needs:' is mandatory to specify which
    # job we want to check if failed.
    needs: [lint, test]
    if: failure()
    steps:
      # ...
```


Example 2: upload report only if a previous step in the same job failed:
```yaml
jobs:
  test:
    steps:
      # ...
      - name: test code
        id: run-tests
        run: npm run test
      - name: upload test report
        # only runs if there's a failure and 'run-tests' fails
        if: failure() && steps.run-tests.outcome == 'failure'
        # doc:
        # https://docs.github.com/en/actions/learn-github-actions/contexts#steps-context
        uses: actions/upload-artifact@v3
        with:
          name: test-report
          path: test.json
# ...
```

Example 2: only install dependencies if there's no cache ([info about `cache-hit` here](https://github.com/actions/cache#outputs))

```yaml
jobs:
  test:
    steps:
      # ...
      - name cache dependencies
        id: cache
        uses: actions/cache@v3
        with:
          path: node_modules
          key: deps-node-modules-${{ hashFiles('**/package-lock.json') }}
      - name: install dependencies
        # info about 'cache-hit': https://github.com/actions/cache#outputs
        if: steps.cache.outputs.cache-hit != 'true'
        run: npm ci
      - name: test code
        run: npm run test
        # ...
```


### Continue on Error

To flag a step as something where a failure is acceptable, just set the `continue-on-error` to true.

In technical terms, we can say that "`continue-on-error` forces the `conclusion` to be always `success`"

Example:
```yaml
# ...
jobs:
  test:
    steps:
      # ...
      - name: test code
        continue-on-error: true
        run: npm run test # the job continues even if this fails.
        # ...
```

#### outcome vs. conclusion

**Note**: `continue-on-error` affects the `conclusion` status of a job.

> From [the docs](https://docs.github.com/en/actions/learn-github-actions/contexts#steps-context):
>
> **`steps.<step_id>.outcome`**
> 
> The result of a completed step **before** `continue-on-error` is applied.
> 
> Possible values are:
> 
> - `success`
> - `failure`
> - `cancelled`
> - `skipped`
> 
> When a `continue-on-error` step fails, the `outcome` is `failure`, but the final `conclusion` is `success`.
>
> **`steps.<step_id>.conclusion`**
> 
> \[similar to `outcome`, but **after** `continue-on-error` is applied]


### matrix

- [video](https://udemy.com/course/github-actions-the-complete-guide/learn/lecture/34140186#overview)
- [doc](https://docs.github.com/en/actions/using-jobs/using-a-matrix-for-your-jobs)

Example:
```yaml
name: Matrix Demo
on: push
jobs:
  build:

    # if we don't use 'continue-on-error', a failure in any
    # job from the matrix combinations would cancel all the
    # incomplete ones.
    continue-on-error: true
  
    strategy:
      matrix:
        node-version: [12, 14, 16]
        operating-system: [ubuntu-latest, windows-latest]

    runs-on: ${{ matrix.operating-system }}
    
    steps:
      - name: get code
        uses: actions/checkout@v3
      - name: install NodeJS
        uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node-version }}
      - name: install dependencies
        run: npm ci
      - name: build project
        run: npm run build
```

It's also possible to include/exclude specific combinations. Example:

```yaml
    strategy:
      matrix:
        node-version: [12, 14, 16]
        operating-system: [ubuntu-latest, windows-latest]
        include:
          # only runs node 18 on ubuntu-latest
          - node-version: 18
            operating-system: ubuntu-latest
        exclude:
          # ignore node 12 on windows-latest
          - node-version: 12
            operating-system: windows-latest
        
```

### Reusable Workflows

Create a `.github/workflows/reusable-deploy.yml`:
```yaml
name: Reusable Deploy

# here's the "secret"
on: workflow_call

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Deploy project
        run: echo "Deploying & uploading..."
```

In another workflow file you can use:
```yaml
# ...
jobs:
  # ...
  deploy:
    needs: build
    # it needs to be the path relative to the repository
    uses: ./.github/workflows/reusable-deploy.yml
```

#### adding inputs to reusable workflows

[video](https://udemy.com/course/github-actions-the-complete-guide/learn/lecture/34140204#overview)

If our `reusable-deploy.yml` needs input from previous jobs, we can something like this:

```yaml
name: Reusable Deploy

on:
  workflow_call:
    inputs:
      # can be any name here
      artifact-name:
        description: The name of the deployable artifact files
        required: false # when set to false, define a 'default'
        # if the caller doesn't pass a 'with:', the default value
        # for ${{ inputs.artifact-name }} is 'dist'
        default: dist
        type: string

jobs:
  deploy:
    runs-on: ubuntu-laatest
    steps:
      - name: get code
        uses: actions/download-artifact@v3
        with:
          name: ${{ inputs.artifact-name }}
      # ...
```

In the caller:
```yaml
# ...
jobs:
  # ...
  steps:
    # ...
    deploy:
      needs: build
      uses: ./.github/workflows/reusable-deploy.yml
      with:
        artifact-name: dist-files
```

## Jobs and Containers
