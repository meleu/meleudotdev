# upcase video series

- link: <https://thoughtbot.com/upcase/tmux>

## Part 1: Introduction

tmux stands for terminal multiplexer.

Install with your system's package manager.

### Initial Commands

Initial commands:
- `C-b` - the default prefix
- `<prefix> %` - split horizontally
- `<prefix> "` - split vertically
- `<prefix> o` - jump to the other pane
- `<prefix> c` - creates a new window

Check `man tmux` and `/KEY BINDINGS` for more.

### Config file

`~/.tmux.conf`
```
# use C-a as the prefix key
unbind C-b
set -g prefix C-a
```

Reload the config file:
```
$ tmux source-file ~/.tmux.conf
```


### session vs. window vs. pane

When you type `tmux` you're starting a new session.

You can also start a new session with:
```
tmux new-session -s session-name
tmux new -s name
```

And list the running sessions with:
```
tmux list-sessions
tmux ls
```


## Part 2: Config

- <https://thoughtbot.com/upcase/videos/tmux-configuration>