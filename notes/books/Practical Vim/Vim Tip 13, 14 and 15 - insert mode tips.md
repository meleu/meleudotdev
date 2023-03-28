---
dg-publish: true
---

[[Practical Vim]]

## Vim Tip 13 - corrections

| keystrokes | effect                       |
| ---------- | ---------------------------- |
| `<c-h>`    | backspace                    |
| `<c-w>`    | delete back one word         |
| `<c-u>`    | delete back to start of line |

## ⭐ Vim Tip 14 - insert normal mode

When in Insert mode and you press `<C-o>` you enter in the **Insert Normal** mode. It's a special version of normal mode where you're allowed to execute one command and then go back to Insert mode.

For more info see `:help i_CTRL-O`.

## Vim Tip 15 - paste from register

While in insert mode, you can paste from register with `<C-r>{register}`.

It's also mentioned that `<C-r><C-p>{register}` would be smarter, but in my quick tests I didn't see any difference.