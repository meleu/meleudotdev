---
dg-publish: true
---
# video - Tailwind CSS - build landing page

<https://youtu.be/oP5yKkKxLvE>

```sh
mkdir my-site
cd my-site

git init
npm init -y
npm install -D tailwindcss
npx tailwindcss init
```

`tailwind.config.js`:
```js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.{html,js}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

`input.css`
```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Colocar no package.json
```json
{
  // ...
  "scripts": {
    "build": "tailwindcss -i ./input.css -o ./css/main.css",
    "watch": "tailwindcss -i ./input.css -o ./css/main.css --watch"
  }
  // ...
}
```

## index.html

index.html começa aos 15:22 minutos
```html
<link rel="stylesheet" href="css/main.css">
```


## header / navbar

- 19:47 - flexbox stuff

### hamburger menu

- 23min - install fontawesome
- 26min - JavaScript code for the hamburger
    - 26:50 - several elements with the same id???
    - 29:12 - full JS code

## main

### section: hero banner

- 33:46 - custom class based on tailwind classes (just use `@apply`)
- 35:23 - blobs in the background


### section: features / cards

 - 42:30 - responsive cards
 - 44:45 - card's icon
 - 45:40 - card number 2 is `bg-color-primery-dark`

### section: hero banner 2 / CTA

- 48:10 - applying flex to the divs in the second hero banner
- 50min - blobs classes as custom classes (`@apply`)



PAREI em 51:23
