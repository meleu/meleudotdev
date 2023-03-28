---
dg-publish: true
---

[[Practical Vim]]

## Vim Tip 7 - normal mode


Not very practical, but a metaphorical/philosophical tip.

Normal mode has this name for a good reason. It's the natural resting state

> programmers spend a fraction of their time composing code. More time is spent thinking, reading, and navigating from one part of the code base to another.

## Vim Tip 8 - chunk your undos

Every trip to the insert mode creates an "undoable" change.

**Note**: when in insert mode, if you move around using the arrow keys you create another undoable change.


## Vim Tip 9 - compose repeatable changes

Pretty much the most important lesson I learned from [Mastering the Vim Language](https://youtu.be/wlR5gYd6um0): use text-objects to make your changes repeatable.

There was also a link to <https://www.vimgolf.com/>. Which is an interesting thing. 🤓

See also [[Vim Tip 12 - vim language]].
