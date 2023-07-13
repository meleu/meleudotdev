---
dg-publish: true
---
# egghead - CSS Fundamentals

<https://egghead.io/courses/css-fundamentals-238ce697>

Notes of what's new for me:

### Attribute Selector

```html
<h1 data-name="name">Tyler</h1>
```

```css
[data-name='name'] {
  color: blue;
}
```

### Selector Specificity Ranking

The most specific in the top

1. `!important`
2. inline style `<element style="color: red;">...`
3. id
4. class
5. element


### Inheritance

```css
selector {
  property: inherit; /* value from the parent */
}
```

```css
selector {
  property: initial; /* value from browser's default */
}
```


### box-sizing: border-box vs. content-box

- `content-box`:
    - default-behavior.
    - "The Box" refers to the content.
    - the `height` and `width` properties are stick to the content.
    - the "box" expands to accomodate padding and border.
- `border-box`
    - "The Box" refers to the border.
    - the `height` and `width` properties are stick to the border
    - ?The content shrinks to accomodate padding and border.


### `em` vs. `rem`

- `em` refers to the current element's font-size
- `rem` refers to the browser's default font-size



### `visibility: hidden` vs. `display: none`

- `visibility: hidden`, the box of the element still fills the page.
- `display: none`, the box is not shown on the page.

In both cases the element still appears in the DOM.


### pseudo classes

```
:hover

:first-child

:nth-child(number)

:focus

:visited
```

Reference: <https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes>



### positioning

lesson 14

Rewatch when needed!


- relative
- absolute
- fixed
- sticky


### media query

lesson 15

We can also query the `orientation` (as `portrait` or `landscape`).

### CSS variables

```css
:root {
  --varname: value;
}

.my-class {
  property: var(--varname);
}

/* fallback values */
.other-class {
  property: var(--nonexistent, default_value)
}
```