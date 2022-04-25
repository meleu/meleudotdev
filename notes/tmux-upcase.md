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

- <https://thoughtbot.com/upcase/videos/tmux-navigation>

```
# create new panes in the same directory
bind-key - split-window -v  -c '#{pane_current_path}'
bind-key \ split-window -h  -c '#{pane_current_path}'

# pane navigation
bind-key -n C-h select-pane -L
bind-key -n C-j select-pane -D
bind-key -n C-k select-pane -U
bind-key -n C-l select-pane -R

# Pane Resizing
# Fine adjustment (1 or 2 cursor cells per bump)
bind -n S-Left resize-pane -L 2
bind -n S-Right resize-pane -R 2
bind -n S-Down resize-pane -D 1
bind -n S-Up resize-pane -U 1

# Coarse adjustment (5 or 10 cursor cells per bump)
bind -n C-Left resize-pane -L 10
bind -n C-Right resize-pane -R 10
bind -n C-Down resize-pane -D 5
bind -n C-Up resize-pane -U 5

# window numbering
set -g base-index 1
set -g renumber-windows on

# breaking a pane out to a window
bind b break-pane -d
```

Cool way to start tmux sessions:
- <https://github.com/thoughtbot/dotfiles/blob/main/bin/tat>


About copy'n'paste and clipboard, I noticed [in tmux's wiki](https://github.com/tmux/tmux/wiki/Clipboard) that the version 3.2 has an improvement in this regard. Then I did this:
```
# depends on xclip (and tmux 3.2+)
set -s copy-command 'xclip -selection c'
```
