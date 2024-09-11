---
dg-publish: true
---
# GitHub Action - assure branch is up to date with main

In a job we were having problems when a deploy was made to the staging environment without the recent changes in the main branch.

To prevent this I was willing to prevent deployments to the staging environment if the branch being deployed is not up to date with main branch.

To achieve this I edit the #github action workflow, adding a new step right after the checkout one:

```yaml
    steps:
      - uses: actions/checkout@v4
        with:
          # IMPORTANT: you MUST specify fetch-depth
          # as zero to get all commit history
          fetch-depth: 0
      
      #############################################################
      # This is the step that makes the validation!
      # BUT it depends on 'fetch-depth: 0' in
      # the checkout step
      #############################################################
      - name: assure branch is in sync with main
        env:
          # IMPORTANT: change the value below if your
          # main branch is different (e.g.: master)
          MAIN_BRANCH: main
        run: |
          if ! git merge-base --is-ancestor origin/${MAIN_BRANCH} HEAD; then
            echo "This branch is not up to date with main" >&2
            exit 1
          fi
      #############################################################
```

## references

inspiration: <https://github.com/actions/checkout/discussions/1547>