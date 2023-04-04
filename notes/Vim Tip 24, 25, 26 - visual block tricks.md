---
dg-publish: true
tags:
  - vim
---
# Vim Tip 24, 25 - visual block tricks

[[Practical Vim]]

## Personal Tip - Squashing commits

Tip for when [[git squashing commits]].

Text:
```txt
pick 06d6aa2 Delete about.md
pick 6bb037b better home page
pick 47f9716 no emojis
pick 1234567 commit message
```

Put your cursor in the beginning of the second line, and then:

`<C-v>}kEc`squash`<Esc>`

Explanation:

- `<C-v>` - enter visual-block mode
- `}` - go to the line right after the end of the paragraph
- `k` - go up one line
- `E` - end of the `pick` word
- `c`squash - change the selected text to "squash"
- `<Esc>` - go back to normal mode (then all lines will be updated)


## Vim Tip 24 - replace command replace all selected text

Pretty cool exercise to be done with this text:
```txt
Chapter            Page
Normal mode          15
Insert mode          31
Visual mode          44
```

![[Vim Tip 24 - visual block - table.png]]

## Vim Tip 25 - the change feedback only appears when back to Normal mode

Pretty much what the title says.

## Vim Tip 26 - non-rectangular visual-block

We can have a non-rectangular visual-block if we go to the end of line with `$`. 

Text for practicing:
```js
var foo = 1;
var bar = 'a';
var foobar = foo + bar;
```

Like in this example:

![[Vim Tip 24, 25 - visual block - non-rectangular.png]]

