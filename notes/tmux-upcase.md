---
dg-publish: true
---
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

A session is a collection of windows. A window has one or more panes.

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

3 ways to use tmux commands

- directly in the command line (useful to experiment a new configuration before putting it in your `.tmux.conf`)
- tmux command prompt: `prefix :` (don't need to prefix the commands with tmux)
- `~/.tmux.conf` file

Command line examples
```
tmux split-window
tmux bind-key u split-window
```

tmux command prompt examples:
```
# prefix :
# pro-tip: you can press <tab> for autocompletion
split-window
bind-key y split-window

# make the prefix unnecessary
bind-key -n C-h select-pane -L
bind-key -n C-j select-pane -D
bind-key -n C-k select-pane -U
bind-key -n C-l select-pane -R
```


## Part 3: Navigation
