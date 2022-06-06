---
dg-publish: true
---
# git

## learn

- <https://thoughtbot.com/upcase/mastering-git>
- <https://github.com/eficode-academy/git-katas> - deliberate git practice
- <https://egghead.io/q/git>
- <https://blog.bitsrc.io/how-to-utilize-submodules-within-git-repos-5dfdd1c62d09> - How to Utilize Submodules within Git Repos


## gitflow

- [[gitflow]]
- Interesting video (portuguese): <https://www.youtube.com/watch?v=wzxBR4pOTTs>
- Good doc: <https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow>
- cheatsheet: <https://danielkummer.github.io/git-flow-cheatsheet/index.html>


## random tips

### how to find large commits in git history

from: <https://stackoverflow.com/a/42544963/6354514>

```bash
git rev-list --objects --all |
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' |
  sed -n 's/^blob //p' |
  sort --numeric-sort --key=2 |
  cut -c 1-12,41- |
  $(command -v gnumfmt || echo numfmt) --field=2 --to=iec-i --suffix=B --padding=7 --round=nearest
```


### verbose git

```bash
GIT_TRACE=true \
  GIT_CURL_VERBOSE=true \
  GIT_SSH_COMMAND="ssh -vvv" \
  GIT_TRACE_PACK_ACCESS=true \
  GIT_TRACE_PACKET=true \
  GIT_TRACE_PACKFILE=true \
  GIT_TRACE_PERFORMANCE=true \
  GIT_TRACE_SETUP=true \
  GIT_TRACE_SHALLOW=true \
  git command...
```

### revert a commit

Undoing **and removing** commits that were not yet pushed to the remote repository:
```sh
# reverting a commit
# the '--hard' option discards the changes made in the commits being reverted.
git reset --hard HEAD~1

# the number after the tilde '~' sets the amount of commits to be reverted
# example reverting last 3 commits:
git reset --hard HEAD~3

# reverting the commit but keeping the changes
# (this is equivalent to use --soft)
git reset HEAD~1

# once you're happy with the changes you've made, let's ammend that commit
git commit --amend -m 'commit message'
```

Undoing **and removing** commits that were already pushed to the remote repository

**WARNING**: Don't do this in master or develop branch! Only do this when working alone in a branch!
```sh
# reverting a commit
git reset --hard HEAD~1

# force push a new commit history to the remote repository
git push --force
```

Reverting changes through a new commit actually changing the files to the previous state.
```sh
# create a new commit changing the commit but in the reverse way
git revert <commit-hash>
```


### getting the latest commit hash

```sh
git log origin/master --max-count=1 --no-merges --format='format:%h'

# git log <repo>/<branch> --max-count=1 --no-merges --format='format:%h'
```

For more info about formatting see `man git log`.

### copy of the remote repository

You cloned a repo, changed some stuff and then regretted. The only thing you want is an exact copy of the remote repo.

Don't 'rm -rf' and clone the repo again!

here's the command you want:

```sh
git reset --hard origin/master
# git reset --hard <repo>/<branch>
```


### edit Pull Requests

Tip obtained from: <https://ardupilot.org/dev/docs/editing-prs.html>

**Assumptions**:
- you have the main repository cloned locally
- you have permission to modify the PR

```sh
# 1. Setup a remote to the requester's repository.
# In this example we're using `tempremote`
$ git remote add tempremote https://github.com/username/repository.git
# using the SSH address also works: git@github.com:username/repository.git

# 2. Pull down the code from the branch used in the PR.
# example: `xyz`
$ git fetch tempremote xyz

# 3. Create a local branch with a copy of the PR
# example: username-xyz
$ git checkout -b username-xyz tempremote/xyz

# 4. Make you changes and commit them.

# 5. Push your changes to the branch used in the PR.
$ git push tempremote HEAD:xyz

# 6. Once it's all done, you can delete your `username-xyz` local branch
#    and remove `tempremote` from the list of remote repositories.
$ git branch -d username-xyz
$ git remote remove tempremote
```


### testing a pull request

TARGET DECK: git

testing a pull request again #flashcard
```sh
git fetch origin pull/1234/head:pr-1234
git checkout pr-1234
# git fetch <repo> pull/<pr-id>/head:<local-branchname>
# git checkout <local-branchname>
```
<!--ID: 1625054083408-->


### gitconfigs to be applied to specific directories

If you work for multiple clients - or if you work for a company and contribute to open source projects - you probably already faced the situation where you made a git commit with the wrong account. Now the github commit history has your real name and your work email... :/

A good solution for this is to:

1. have a specific dir for a specific customer's source code and
2. have a specific gitconfig to be applied to all git repositories inside that directory.

Let's just do that:

```bash
# creating specific dirs
mkdir -p ~/src/client1
mkdir -p ~/src/client2

# gitconfig for client1
echo "
[user]
  email = meleu.dev@client1.com
  name = meleu" > ~/src/client1/gitconfig

# gitconfig for client2
echo "
[user]
  email = meleu.dev@client2.com
  name = meleu" > ~/src/client2/gitconfig
```

Once each directory has its own gitconfig, now we must setup the global `.gitconfig` to apply them at specific situations using `includeIf`:

```
# add this to your ~/.gitconfig

[includeIf "gitdir:~/src/client1/**"]
  path = ~/src/client1/gitconfig

[includeIf "gitdir:~/src/client2/**"]
  path = ~/src/client2/gitconfig
```

Once it's done, your configuration in `~/src/client1/gitconfig` will be applied to all cloned repositories inside that directory (same for `client2`).

