---
dg-publish: true
---
# using GitHub Actions to add comments to a PR

Here's a #github workflow job I used to post a comment in a PR.

The important parts are:

- using [actions/github-script](https://github.com/actions/github-script)
- `permissions.pull-requests: write` needed to post a comment in a PR
- the `with.script` part is JavaScript.
- the message goes in the `body` being sent in the `createComment()` method.

```yaml
# ...
jobs:
  # ...

  # post a comment after the build job is finished
  ##############################################################################
  post_pr_comment:
    name: Post PR Comment
    needs: trigger_cd_test
    runs-on: ubuntu-latest
    env:
      workflow_url: ${{ github.server_url}}/${{ github.repository }}/actions/runs/${{ github.run_id }}
    # permission needed to post a comment on the PR
    permissions:
      pull-requests: write
    steps:
      - name: Post PR Comment
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.issues.createComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: ${{ env.PR_NUMBER }},
              body: `@${{ github.actor }} the build you triggered has been finished.\n\n[Link to the workflow.](${{ env.workflow_url }})`
            })
```


### bonus: add a reaction to a PR comment

Here's the job I used to add a reaction to a PR comment.

```yaml
# ...
jobs:
  # ...

 # adding a 🚀 reaction when the build job is starting
  ##############################################################################
  add_reaction:
    name: Add 🚀 reaction
    needs: pr_trigger
    runs-on: ubuntu-latest
    # permission needed to add a reaction to the comment
    permissions:
      pull-requests: write
    steps:
      - name: Add reaction
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.reactions.createForIssueComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              comment_id: ${{ github.event.comment.id }},
              content: 'rocket'
            })
```
## references

- <https://github.com/actions/github-script?tab=readme-ov-file#comment-on-an-issue>
- <https://octokit.github.io/rest.js/v20>
