---
dg-publish: true
---

# Get script name in bash and zshn bash and zsh

## problem

Here's an edge case I faced recently:

- you use [[notes/shfmt|shfmt]] to format your bash scripts
- you have a useful #bash script that relies on `BASH_SOURCE[0]`
- your bash script is so useful that you want to source its functions to use in an interactive shell session
- you use #zsh for interactive session

We all (should) know that you shouldn't source a **bash** script in an interactive shell session using another shell... But sometimes it happens... 😇

The issue I faced is because the useful bash function relies on `BASH_SOURCE[0]` to get the full path to the file being sourced, and the `BASH_SOURCE` is obviously not available in zsh.

### partial solution: detect if we're on zsh or bash

I used the `ZSH_VERSION` to check if I'm on zsh.

```bash
if [ -n $ZSH_VERSION ]; then
  # assume we're on zsh
elif [ -n $BASH_VERSION ]; then
  # assume we're on bash
else
  # assume POSIX
fi
```

### partial solution: zsh equivalent to `BASH_SOURCE[0]`

According [this StackOverflow answer](https://stackoverflow.com/a/28336473), the zshell way to get the script path is with `${(%):-%x}`, which actually works great.

```bash
if [ -n $ZSH_VERSION ]; then
  SCRIPT_FULLPATH="${(%):-%x}"
elif [ -n $BASH_VERSION ]; then
  SCRIPT_FULLPATH="${BASH_SOURCE[0]}"
else
  SCRIPT_FULLPATH=/hardcoded/path
fi
```

This works, but there's a problem: the `${(%):-%x}` is not a valid bash expression, and its presence in a script crashes #shfmt. 🙁

### solution: mask invalid bash expression from shfmt

In order to "mask" the invalid-but-useful zshell expression from `shfmt` I used an alias.

```bash
if [ -n "$ZSH_VERSION" ]; then
  alias get_zsh_source='echo "${(%):-%x}"'
  SCRIPT_FULLPATH="$(get_zsh_source)"
elif [ -n "$BASH_VERSION" ]; then
  SCRIPT_FULLPATH="${BASH_SOURCE[0]}"
else
  SCRIPT_FULLPATH=/hardcoded/path
fi
```

And this is enough to fix the `shfmt` crash.