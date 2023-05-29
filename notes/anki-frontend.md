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

<!-- basicblock-start oid="ObsuyVyW8jNLOgjqMl9ifwmH" -->
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

<!-- basicblock-start oid="ObsMnvj5DTcNp3sT660IgD6t" -->
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

<!-- basicblock-start oid="ObstWWw42bL5aybivK26vsAr" -->
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


---

<!-- basicblock-start oid="ObscZ8YQfSHnRcZ74Qwc5uFX" -->
## 3 basic steps of using JS in frontend
::
1. get an element
2. add an event listener to the element
3. assign a callback function to be triggered by an event
<!-- basicblock-end -->


---

<!-- basicblock-start oid="Obsar0Z7GaVq1tNf9FjOaAmV" -->
## CSS to use on background images to improve contrast?
::
```css
.banner {
  background-image:
    linear-gradient(
      135deg,
      rgba(0,0,0,0.8) 0%,
      rgba(0,0,0,0.2) 50%
    ), url('background.jpg');
  background-size: cover;
}
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="ObsUFapT62scN8haUfgjn64m" -->
## JS: add/remove CSS classes
::
```js
el.classList.add(className)
el.classList.remove(className)
el.classList.toggle(className)
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="ObsQHJuYUcQjE0VaOU30Phmv" -->
## 3 most used DOM events
::
```
click  # any visible element
submit # form
keyup  # window / any focused element
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="ObsPZXYkbAoXz7T7CNNa6PLM" -->
## Change style via JS
::
```js
el.style.<CSS-property> = <value>

// examples
el.style.display = 'none'
el.style.backgroundColor = '#fce'
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="Obs0vF20n8bOi3eu138zOFKz" -->
## 3 main steps of DOM manipulation
::
1. select one or more **elements** - usually with `document.querySelector()` or `.getElementById()`.
2. define a **function** to execute
3. define which **event**, happening in which **element**, should trigger the **function** (probably acting in another **element**)
<!-- basicblock-end -->


---

<!-- basicblock-start oid="Obsr6qw3isx34O2uncv0Mad2" -->
## StimulusJS key concepts
::
1. Controllers
2. Actions
3. Targets

mnemonic: CAT 🐱
<!-- basicblock-end -->


---

<!-- basicblock-start oid="Obsx40gZ3JUSt3FioFjdzQaH" -->
## Stimulus' core purpose
::
Automatically connect DOM elements to JavaScript objects (called controllers)
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsknWgz3Nnbwv4U0vgdhKsi" -->
## Stimulus: marking an HTML element to be the controller
::
Example to connect a div with the `hello_controller.js`:
```html
<div data-controller="hello">
</div>
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsiCQ5wJYcdPzPseqlCObgY" -->
## Stimulus controller "header"
::
```js
// src/controllers/hello_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // ...
}
```
<!-- basicblock-end -->



---

<!-- basicblock-start oid="Obs6V9UStf3tuN7m6Gb32S4S" -->
## Connect a Stimulus action to a button's click
::
```html
<div data-controller="hello">
  <input type="text">
  <button data-action="click->hello#greet">Greet</button>
</div>
```
**NOTE**: the action must be in the controller's tree.
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsgNRjk0eGwlH0bvqubqdUO" -->
## Stimulus: steps to set an element as a target
::
1. mark as target in the html
2. grab in the controller.js
<!-- basicblock-end -->

---

<!-- basicblock-start oid="ObszBqPi6NrY1svi2w7HQOmX" -->
## Stimulus: mark an HTML element as a target
::
```html
<div data-controller="hello">
 <input data-hello-target="nameInput" type="text">
</div>
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsAJCTDgfFaBNUiGODgTlVh" -->
## Stimulus: grab the targets in the controller
::
```js
export default class extends Controller {
  // the target name goes as an element of `targets`
  static targets = [ "nameInput" ]
  
  greet() {
    // and it's accessible by `this.${targetName}Target`
    const element = this.nameInputTarget
  }
}
<!-- basicblock-end -->

