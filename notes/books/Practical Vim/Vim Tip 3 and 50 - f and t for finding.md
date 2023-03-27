---
dg-publish: true
---
# Vim Tips 3 - f for find

[[Practical Vim]]

This tip is basically showing that `f{char}` searches for the next occurrence of `{char}` in the current line, and `;` goes to the next occurrence.

A funny way to practice this is to play the [Vim be good](https://github.com/ThePrimeagen/vim-be-good) game.

In the Tip 50 we learn that besides `;` to go to the next occurrence, there's also `,` to come back to the previous one.

**NOTE**: avoid to use `,` coma as your leaderkey.

"Think like a scrabble player": you can save keystrokes if you use `f` to find a less frequent letter and then do the operation you want using text-objects.

In the example below, imagine the cursor in the beginning of the line and you want to delete `excelent`:

```
Improve your writing by deleting excelent adjectives.
```

So, `fxdaw` can do the job pretty well! 🤓
