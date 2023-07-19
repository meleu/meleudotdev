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
- 23:45 - install fontawesome

Copied from searching `font awesome` in <https://cdnjs.com>:
```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
```

### hamburger menu

To hide the menu at `lg` breakpoint and show the hamburger icon:

```html
<ul class="hidden lg:flex"> traditional menu... </ul>

<ul class="lg:hidden"> hamburger icon... </ul>
```

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

#### possible icons for ontime

##### Nível de serviço

- truck & clock
```html
<i class="fa-solid fa-truck-fast"></i>
```

##### gestão

- money
```html
<i class="fa-solid fa-hand-holding-dollar"></i>
<i class="fa-solid fa-circle-dollar-to-slot"></i>
```


##### quality

- thumbs up in a seal



### section: hero banner 2 / CTA

- 48:10 - applying flex to the divs in the second hero banner
- 50min - blobs classes as custom classes (`@apply`)



PAREI em 51:23


### contact form

- 1:42:20
