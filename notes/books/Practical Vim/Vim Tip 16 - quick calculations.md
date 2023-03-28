---
dg-publish: true
tags:
  - vim
---
# Vim Tip 16 - quick calculations

[[Practical Vim]]

The expression register can evaluate a piece of Vim script code and return the result as text. This can be useful to solve quick calculations like `34 * 15`.

To use it: `<C-r>=` while in Insert mode

This opens a prompt at the bottom of the screen and you can type your calculation there. When done, press `<CR>` and the result will be pasted as text.

