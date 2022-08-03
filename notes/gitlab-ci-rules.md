---
dg-publish: true
---
# gitlab-ci rules

## docs

- <https://docs.gitlab.com/ee/ci/yaml/#rules>
- useful video: <https://youtu.be/QjQc-zeL16Q>

## convert from `only` to `rules`

Using `only`:
```yaml
job:
  script:
    - echo something...
  only:
    - master
```

Using `rules`:
```yaml
job:
  script:
    - echo something...
  rules:
    - if: $CI_COMMIT_BRANCH == "master"
```


## useful video

- <https://youtu.be/QjQc-zeL16Q>

Variables come from several different places, and used in different places.

- Come from:
    - entered manually
    - configured by the project, group or instance
    - data generated in jobs from previous stages
    - data from CI configuration
    - data from gitlab itself
- used in:
    - ci engine (in gitlab)
    - ci jobs (in runner)
    
- When are pipelines run?
    - new commit
    - new branch
    - new tag
    - manual
    - api call
    - scheduled
    
You may want to avoid multiple pipelines being started by different triggers.

```yaml
jobname:
  rules:
    # if statements can reference variables
    # including the predefined ones
    - if: $CI_MERGE_REQUEST_IID
  script:
    - echo "I only run inside MRs"
```

**NOTE**: when using `rules`, do NOT use `only` or `except` (these are deprecated ones).

### Rules quick reference

- clauses
    - `if`
    - `changes` - when some files where changed (this is going to be useful to deploy my [[digital garden]])
    - `exists`
    - (none) - default behavior
- operators:
    - `$VAR_NAME` - true if non-empty
    - `==`
    - `!=`
    - `=~` - equals regex
    - `!~` - not equals regex
    - `&&`
    - `||`
- results
    - `when` - tip: read this as "then" (if-then)
    - `allow_failure` - boolean
    - `start_in`
- `when` options:
    - `always` - ignores the 
    - `never` - job is never started
    - `on_success` - previous stages finished with success
    - `on_failure`
    - `manual`
    - `delayed` - ???
    - (none) - default behavior

#### 5:39 - Defaults

- if no attributes are defined:
    - `when: on_success` - previous stage resulted in success
    - `allow_failure: false`
- the job is **added** to the pipeline if:
    - rule matches and has
        - `when: on_success`
        - or `when: delayed`
        - or `when always`
    - no rules match, but **last clause** is
        - `when: on_success`
        - or `when: delayed`
        - or `when: always`
- the job is **not** added to the pipeline if:
    - A:
        - no rules match
        - and there is no **standalone**
            - `when: on_success`
            - or `when: delayed`
            - or `when: always`
    - B:
        - rule matches
        - and `when: never`

**notes**:
- last clause: acts like an "else"
- standalone: a `when` with no `if`

Trying to explain with pseudcode.

TARGET DECK: DevOps/gitlab-ci

gitlab-ci `rules` defaults: #flashcard
```
# if no attributes defined:
when: on_success
allow_failure: false
#
# job goes to the pipeline if
rules && (when: on_success || delayed || always)
!rules && (when: on_success || delayed || always)
#
# job does NOT goes to the pipeline if
!rules && !(when: on_success || delayed || always)



```


### 6:46 - real examples

#### example 1

```yaml
job:
  script: "echo Hello, Rules"
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
    - if: '$CI_PIPELINE_SOURCE == "schedule"'
```

There's no `when` clauses, so it's considered `when: always`.


#### example 2

```yaml
job:
  script: "echo Hello, Rules"
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
      when: never
    - if: '$CI_PIPELINE_SOURCE == "schedule"'
      when: never
    - when: on_success
```

The job will not be added to the pipeline if those `if` clauses match (because of the `when: never`)

Cases not addressed by those `if`s will make the job be added to the pipeline.

If the standalone `when: on_success` didn't exist, the last `when: never` would be the "default when" clause, resulting in job not going to the pipeline at all.

doubt: could those two `if`s be replaced with this?:
```yaml
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event" || $CI_PIPELINE_SOURCE == "schedule"'
      when: never
```


#### example 5

```yaml
docker build:
  script: docker build -t my-image:$CI_COMMIT_REF_SLUG .
  rules:
    - if: '$VAR == "string value"'
      changes:
        - Dockerfile
        - docker/scripts/*
      when: manual
```

If that `$VAR == "string value"` and there were changes in any of those paths, then the job will be added to the pipeline and wait for a manual approval.


#### example 6

```yaml
docker build:
  script: docker build -t my-image:$CI_COMMIT_REF_SLUG .
  rules:
    - if: '$CI_COMMIT_BRANCH == "master"'
      when: delayed
      start_in: '3 hours'
      allow_failure: true
```

If the commit happened in the master branch, then the job will be delayed for 3 hours and will be allowed to fail.