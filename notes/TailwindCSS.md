---
dg-publish: true
---
# TailwindCSS

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

🏖️