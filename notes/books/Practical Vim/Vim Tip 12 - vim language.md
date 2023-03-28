---
dg-publish: true
---
# Vim Tip 12 - vim language

[[Practical Vim]]

Another tip where the most important lesson is basically what I learned from [Mastering the Vim Language](https://youtu.be/wlR5gYd6um0): use text-objects to make your changes repeatable.

But it was learn that `gU` and `gu` are commands to make upper/lower case. Therefore `gU{text-object}` makes the text object ALL CAPS.

| trigger | effect       |
| ------- | ------------ |
| `c`     | Change       |
| `d`     | Delete       |
| `y`     | Yank         |
| `g~`    | Swap case    |
| `gu`    | lowercase    |
| `gU`    | uppercase    |
| `>`     | indent right |
| `<`     | indent left  |
| =       | autoindent   |

> Vim's grammar: when an operator command is invoked in duplicate, it acts upon the current line.

Example: `gUU` makes the whole line ALL CAPS.