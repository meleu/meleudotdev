---
dg-publish: true
---
# Vim Tip 10 and 11 - use counts or not

[[Practical Vim]]


## Vim Tip 10 - use counts to do simple arithmetic


**I liked this one!** Simple but powerful!

We already know that we can prefix the commands with a count, right? This tip is just to highlight that it can also be done with `<c-a>` and `<c-x>` to increment/decrement numbers.

See how beautiful it is!

Imagine this line:
```css
.blog { background-position: 0px 0px }
```

And you want this:
```css
.blog { background-position: 0px 0px }
.news { background-position: -180px -180px }
```

Steps to quickly achieve that:
- cursor on the first line
- `yyp` - copy the line and paste below, the cursor follows
- `cW`.news - change `.blog` with `.news`
- `180<c-x>` - yeah! this is enough to make `0` become `-180`! there's no need to even move the cursor!
- `w.` - go to the next word and repeat


## Vim Tip 11 - don't count if you can repeat

Quite frequently it's faster to do a change and then repeat with dot than counting to solve things with less keystrokes.

Remember [[Vim Tip 4, 5 and 6 - tricks to use the Dot Formula#Vim Tip 4 - act, repeat, reverse]].



