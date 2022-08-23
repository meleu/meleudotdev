---
dg-publish: true
---
# Web Design in 4 minutes

- from <https://jgthms.com/web-design-in-4-minutes/>
- TODO:
    - explain the CSS options being used here
    - create gifs to visualize the differences

## Content

Content is the most important thing.

The purpose of **design** is to enhance the presentation of the content it's applied to.


## Centering

Long lines of text are hard to read. Setting a limit of characters per line greatly enhances the readability.

```css
body {
  margin: 0 auto;
  max-width: 50em;
}
```


## Font family

Times is the default and it looks "unstyled".

Switching to a sans-serif can improve the look of your page:

```css
body {
  font-family: "Helvetica", "Arial", sans-serif;
}
```

If you want a serif font, try `Georgia`.


## Spacing

Provide space both *around* and *within* your content.

```css
body {
  line-height: 1.5;
  padding: 4em 1em;
}

h2 {
  margin-top: 1em;
  padding-top: 1em;
}
```


## Color & Contrast

Softer shad of black for body text [in white background] makes the page more **comfortable** to read.

```css
body {
  color: #555;
}
```

And in order to keep a decent level of contrast, let's pick a darker shad for **important** words:

```css
h1, h2, strong {
  color: #333;
}
```


## Balance (code snippets)

```css
code, pre {
  background: #eee;
}

code {
  padding: 2px 4px;
  vertical-align: text-bottom;
}

pre {
  padding: 1em;
}
```


## Primary color

The **primary color** acts as a visual accent. It's a way to make your website unique.

Example for the **links**:

```css
a {
  color: #e81c4f;
}
```


## Secondary colors

```css
body {
  color: #566b78;
}

code, pre {
  background: #f5f7f9;
  border-bottom: 1px solid #d8dee9;
  color: #a7adba;
}

pre {
  border-left: 2px solid #69c;
}
```


## Custom font

using a **custom font** gives the page even more noticeable identity.

```css
@import 'https://fonts.googleapis.com/css?family=Roboto:300,400,500';

body {
  font-family: "Roboto", "Helvetica", "Arial", sans-serif;
}
```

## Images

### Header

```css
header {
  background-color: #263d36;
  background-image: url("header.jpg");
  background-position: center top;
  background-size: cover;
  line-height: 1.2;
  padding: 10vw 2em;
  text-align: center;
}
```

### Logo

```css
header img {
  display: inline-block;
  height: 120px;
  vertical-align: top;
  width: 120px;
}
```

### text styles

```css
header h1 {
  color: white;
  font-size: 2.5em;
  font-weight: 300;
}

header a {
  border: 1px solid #e81c4f;
  border-radius: 290486px; /* wtf?! */
  color: white;
  font-size: 0.6em;
  letter-spacing: 0.2em;
  padding: 1em 2em;
  text-transform: uppercase;
  text-decoration: none;
  transition: none 200ms ease-out;
  transition-property: color, background;
}

header a:hover {
  background: #e81c4f;
  color: white;
}
```


## See also

From the same author:

- <https://cssreference.io/> - CSS Reference
- <https://jgthms.com/javascript-in-14-minutes/> - JavaScript in 14 minutes
- <https://marksheet.io/> - A free HTML & CSS tutorial