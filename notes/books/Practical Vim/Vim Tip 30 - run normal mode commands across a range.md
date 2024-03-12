---
dg-publish: true
---
# Vim Tip 30 - Run normal mode commands across a range

[[Practical Vim]]

This is very simple and powerful!

Simply select the text in visual mode and then run `:normal .`

Other usages:

```vim
" the `%` percent symbol means *the whole file*,
" so, to append `;` in the end of all lines of a file:
:%normal A;

" comment the whole file using `//`
:%normal i//
```

It was not covered in the book but here it goes an useful related tip: add this to your `.vimrc`
```vim
" apply the dot command on each line of a selection
vmap . :normal .<cr>
```

- More examples in:
    - [[Vim Tip 68]]
    - [[Vim Tip 70]]
- Alternative solution:
    - [[Vim Tip 26]]
