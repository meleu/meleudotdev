---
dg-publish: true
tags:
  - tech/git
  - tech/dotfiles
---

- [[#smart way to manage your dotfiles]]

---

## Things I wanna do

### zsh with a minimalist prompt

I only want:

- current working directory in blue
- `[branch]`, if in a git repository
- `\$` in a new line
    - the `\$` must be red if last command failed

In bash I do this:
```bash
# if in a git repository, shows the current branch
gitBranch() {
	ret="$?"
	branch="$(git branch --show-current 2>/dev/null)" &&
		echo -n " [${branch}]"
	return "${ret}"
}

# /current/directory [branch]
# $
PS1=
PS1+='\[\033[01;34m\]'                        # blue
PS1+='\w'                                     # working dir
PS1+='\[\033[00m\]'                           # no color
PS1+='$(gitBranch || echo "\[\033[01;31m\]")' # red if last command failed
PS1+='\n\$ '
PS1+='\[\033[00m\]' # no color
```

## make aliases POSIX-compliant

So I can use them in zsh or bash.

## detect if I'm on Mac or Linux

To handle, for example `pbcopy` vs. `xclip`.

---

## smart way to manage your dotfiles

### starting a dotfiles repo

```bash
# create your configs dir
cd ~
mkdir dotfiles

# start a git repo
cd ~/dotfiles
git init

# create a git repository for you and get the url
git remote add origin git@github.com:${USERNAME}/${REPO_NAME}.git

# tell git that your worktree starts in your $HOME
git config core.worktree '../../'

# ignore everything
echo '*' > ../.gitignore

# once you're ignoring everything, the only way
# to add files is by using The Force™️
git add -f ../.bashrc
git add -f ../.bash_profile
git add -f ../.vimrc
# etc...

# commit your changes to the remote repo
git commit -m "Initial commit"
git push
```


### getting your dotfiles on a new machine

```bash
# go to your home dir
cd ~

# clone the repo with the "--no-checkout" option
# (so we can checkout the files in our homedir)
git clone --no-checkout git@github.com:${USERNAME}/${REPO_NAME}.git

# go to the created directory and do the wortree trick
cd ${REPO_NAME}
git config core.worktree '../../'

# checkout your files overwriting the existing ones
git reset --hard origin/master
```


### notes about gitignoring everything

- Remember: your `.gitignore` is ignoring "everything" with that `*`
- Anything you want to add must be done with `git add -f`
- Your `git` commands will only work while you're in the `~/${REPO_NAME}` directory, so if you want to add a new file, you need to `git add -f ../${FILENAME}`
- Once a file was added to the list of tracked files, you don't need to use `-f` for that file anymore.

### inspiration

- worktree trick: <https://www.wangzerui.com/2017/03/06/using-git-to-manage-system-configuration-files/>
- gitignoring everything: <https://drewdevault.com/2019/12/30/dotfiles.html>