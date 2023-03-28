---
dg-publish: true
tags:
  - vim
---
# Vim Tip 20, 21, 22, 23 - visual mode basics

[[Practical Vim]]

## enabling visual mode

| command | effect                           |
| ------- | -------------------------------- |
| `v`     | Visual character-wise            |
| `V`     | Visual Line                      |
| `<C-v>` | Visual Block                     |
| `gv`    | repeat last selection            |
| `o`     | go to **o**ther end of selection |

---

The "Vim Language" usually is `{verb}{text-object}` (or `{verb}{movement}`). In visual mode we invert this order. We first select the text we want to do some operation, and then execute the operation.

Other interesting thing about Visual Mode: if you press `o` you put the cursor in the **o**ther end of the selection.

Visual mode is also an awesome way to **practice** text-objects, because you have a visual hint of what the text-object is.

The Vim Tip 23 is basically saying the same as Chris Toomey in his nice video "Mastering the Vim Language":

> Using Visual Mode is a smell!.

Although it can be useful for on-off operations, using visual mode can make your last action not very repeatable.



