---
dg-publish: true
---
# TailwindCSS

## useful links

### colors

- <https://tailwindcolor.com>
- <https://uicolors.app>

## typical header

logo on the left, menu on the right

For the header container:
```
flex
flex-wrap
justify-between
items-center

max-w-7xl
mx-auto
```

For the `<ul>` in the menu on the right:
```
flex
flex-wrap
gap-10
```

## Customizing default font

From [docs](https://tailwindcss.com/docs/font-family#customizing-the-default-font)

```js
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Proxima Nova', ...defaultTheme.fontFamily.sans],
      },
    }
  }
}
```
