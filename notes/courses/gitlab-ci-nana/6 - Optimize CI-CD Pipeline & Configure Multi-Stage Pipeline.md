---
dg-publish: true
---
## 6 - Optimize CI-CD Pipeline & Configure Multi-Stage Pipeline

### 2 - Configure Dynamic Versioning for Docker Image

- <https://techworld-with-nana.teachable.com/courses/1769488/lectures/39901791>

In this lecture it's explained how `needs` differs from `dependencies`. Note: when needs is used, dependencies is not needed.

At 30 min she talks about Dotenv files

Create a `build.env` file during the job. The contents must be `key=value`.

And then use this:
```yaml
# ...
build_image:
  # ...
  artifacts:
    reports:
      dotenv: build.env
```

This automatically makes the `key` variable available for the next stages.

- Collected variables are registered as runtime-created variables of the job.
- Jobs in later stages can use the variable in scripts.
- Variables cannot be used to configure a pipeline, but only in job scripts.
- `dependencies` or `needs` keywords can be used to control which jobs receive these env vars.


### 3 - Configure Caching to speed up Pipeline execution

In the first job that downloads dependencies:

```yaml
# ...
run_unit_tests:
  # ...
  cache:
    key: "$CI_COMMIT_REF_NAME"
    paths:
      - app/node_modules
```

- Cache `key`:
    - give each cache a **unique identifying key**
    - if not set, the default key is `default`
    - all jobs that use the same cache key use the same cache
    - common practice: use `$CI_COMMIT_REF_NAME`
- Cache `paths`
    - used to choose which files or directories to cache
    - you can use an array of paths relative to the project directory

Note that the `cache` key has 2 different purposes:

- generate the cache
- download the cache

On 1st execution, the job generates the cache. On 2nd execution, the job ca re-use its own cache.

- Cache `policy`
    - `pull-push` job downloads the cache when the job starts & uploads changes to the cache when the job ends (**note**: that's the default behavior, you don't need to specify)
    - `pull` only download the cache, but never upload changes (use when you have many jobs executing in parallel using the same cache).
    - `push` common to have a job, which just builds the cache (will only upload a cache, but never download).

> [!IMPORTANT]
> 
> Your job should never depend on a cache to be available. Caching is an optimization, but it isn't guaranteed to always work.

Notes about the `[Clear runner caches]` button on GitLab's UI:

- the old cache is not deleted
- instead its cache name will be updated and used
- you can manually delete the files from the Runner storage


### 4 - Testing in CI-CD & Configure Security Tests (SAST)

Different types of automated tests

- Unit Testing
    - most basic
    - validate that **individual parts** of the app function
    - so only specific units, instead of the entire program
- Functional Testing
    - Validate the functionality of the software
- Integration Testing
    - validate that individual parts of the code work together (e.g.: fronte and backend communication).
    - or microservice application works properly with all those self-containted services
- **Security Related Tests**
    - validate application's security
    - vulnerability scanning, penetration testing, etc.
    - SAST: Static Application Security Testing
        - Analyzes the **source code** to identify any vulnerabilities
        - Examples: SQL injection, Cross-site scripting, buffer overflows...
    - DAST: Dynamic Application Security Testing
        - it analyzes the **running application**
        - represents the hacker approach, testing from outside with no knowledge of the technologies used

### Multi-Stage Deployments

Her method does not distinguish deployment environments by branch (gitflow).

