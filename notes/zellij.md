---
dg-publish: true
---
# zellij

<https://zellij.dev>

## things I want

- [ ] do not start a session when inside a session
- [ ] scroll up in the pane with the keyboard
- [ ] `ctrl+q` asks for confirmation (or simply disable `ctrl+q` at all)
- [ ] how to replace the current session with another one
- [x] enable mouse copy (didn't work by default) - [solution](https://zellij.dev/documentation/faq.html#copy--paste-isnt-working-how-can-i-fix-this)



```shell
# create new session
zellij --session $sessionName
# another option:
zellij attach --create $sessionName

# attach to an existing session
zellij attach $sessionName

# 
```