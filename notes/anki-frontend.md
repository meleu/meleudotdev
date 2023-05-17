---
dg-publish: true
cards-deck: webdev::frontend
deck: webdev::frontend
---
# anki-frontend

#anki

[TOC]

---

<!-- basicblock-start oid="ObssOinCxWD1REOIvOdP0w2G" -->
## html: basic input text field in a form
::
```html
<form action="/restaurants">
 <label for="name-input">Name</label>
 <input id="name-input" type="text" name="name">
 <input type="submit" value="Submit">
</form>
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsqI5i6Q4Ee9bl1f74LbBxD" -->
## html meta tag with the text shown in Google results
::
```html
<html>
 <head>
  <title>main thing in google results</title>
  <meta
    content="text appearing below the link"
    name="description">
 </head>
 <!-- ... -->
</html>
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObszTuAPYmZkGmLcFTcOyNgS" -->
## box model properties sequence
::
From inside to outside:

1. content
2. padding
3. border
4. margin
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsjVkANSmhyTnn0rKW2EYat" -->
## Four types of CSS length units
::
- `px` - absolute
- `%` - relative to the parent element
- `vh`/`vw` - relative to the viewport height/width
- `em` - relative to the font size of the element
<!-- basicblock-end -->

---

<!-- basicblock-start oid="ObsMB508m2FcU4BZ5E6n1uBZ" -->
## Options for `justify-content` for flex-items
::
- flex-start
- flex-end
- center
- space-between
- space-around
<!-- basicblock-end -->



---

<!-- basicblock-start oid="Obse5HLKu3RTItVdGhb7eSs4" -->
## Site to resize images
::
<https://squoosh.app/>
<!-- basicblock-end -->

---

<!-- basicblock-start -->
## How to prevent the default behavior of an event from happening?
::
Using the `preventDefault()` function in an event.

Example:
```js
element.addEventListener(
  'click',
  (event) => event.preventDefault()
);
```
<!-- basicblock-end -->

---

<!-- basicblock-start -->
## How to append content into a DOM element?
::
Using `insertAdjacentHTML()`:

Example:
```js
element.insertAdjacentHTML(
  location,
  htmlContent
);
```

`location` can be:
```html
<!-- beforebegin -->
<p>
  <!-- afterbegin -->
  the content
  <!-- beforeend -->
</p>
<!-- afterend -->
```
<!-- basicblock-end -->


---

<!-- basicblock-start -->
## Get all the properties of an Object in JS
::
Only the keys:
```js
Object.keys(myObj);
```

The array of key-value pairs:
```js
Object.entries(myObj);
// [ [key1, value1], [keyN, valueN] ]
```
<!-- basicblock-end -->


