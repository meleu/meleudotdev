---
dg-publish: true
---
# Emmet course

- <https://www.linkedin.com/learning/emmet-fast-and-efficient-web-coding/>
- cheatsheet: <https://docs.emmet.io/cheat-sheet/>
- very nice written Emmet tutorial: <https://flaviocopes.com/emmet/>

[TOC]

---

## 2 - Get Up and Running with Emmet

Emmet uses CSS-like selectors. Just type the selector name and press tab.

Some examples for html:
```shell
# always hit Tab at the end
h1

# > for child
ul>li

# * for multipliers
ul>li*3

# + for siblings
p+ul

# combining
p+ul>li*3

# Start a brand new HTML file 
html:5
# or simply `!`
!
```

Useful tags to use in the `<head>`:
```shell
link:favicon
link:css
script:src
```

**NOTE**: In the lecture [about customizing Emmet](https://www.linkedin.com/learning/emmet-fast-and-efficient-web-coding/customizing-emmet?autoplay=true&resume=false) the instructor shows how to customize the Emmet snippets in the Brackets Editor, I don't know how to do this for VSCode.




## 3 - Emmet Fundamentals

IDs and Classes
```
# section with the id=wrapper
section#wrapper

# header with the class=hero
header.hero
```

Context aware implicit tags:
```html
<!--
Quite frequently, when you mention only
the class or ID, a `div` is implicit.
-->

<!-- #special -->
<div id="special"></div>

<!-- .extra -->
<div class="extra"></div>

<!--
Depending on the context, it can also
be a `span`.
-->
<!-- section>p>.newClass -->
<section>
  <p><span class="newClass"></span></p>
</section>


<!--
Even a `li` with a class can be
implicitly declared
-->
<!-- .wrapper>ul.list>.sites -->
<div class="wrapper">
  <ul class="list">
    <li class="sites"></li>
  </ul>
</div>

```


Navigating the document tree:
```html
<!-- use `^` caret to climb up one level in the document tree -->
<!-- .wrapper>article>h1+p^footer>p -->
<div class="wrapper">
  <article>
    <h1></h1>
    <p></p>
  </article>
  <footer>
    <p></p>
  </footer>
</div>


<!-- use double `^` to climb up twice -->
<!-- .wrapper>article>h1>em>a^^p -->
  <div class="wrapper">
    <article>
      <h1><em><a href=""></a></em></h1>
      <p></p>
    </article>
  </div>


<!-- maybe using `(`parenthesis`)` makes more sense -->
<!-- .wrapper>article>(h1>em>a)+p -->
<div class="wrapper">
  <article>
    <h1><em><a href=""></a></em></h1>
    <p></p>
  </article>
</div>
```


Defining what goes inside a tag using curly brackets:
```html
<!-- h1{Welcome!} -->
<h1>Welcome!</h1>
```

Using Lorem Ipsum:

- `lorem` - creates random text
- `lorem5` - creates random text with 5 words (replace 5 with the amount of words you want)

Try this and see how cool it is:
```
main>article*3>h2>lorem5^p*3>lorem
```


## 4 - Emmet and HTML

### Numbering

Use the `$` dollar sign and see how cool it is:
```html
<!-- ul>li{item$}*5 -->
  <ul>
    <li>item1</li>
    <li>item2</li>
    <li>item3</li>
    <li>item4</li>
    <li>item5</li>
  </ul>

<!-- h${Heading $}*6 -->
  <h1>Heading 1</h1>
  <h2>Heading 2</h2>
  <h3>Heading 3</h3>
  <h4>Heading 4</h4>
  <h5>Heading 5</h5>
  <h6>Heading 6</h6>

<!-- ul>li.item${item $$}*5 -->
<ul>
  <li class="item1">item 01</li>
  <li class="item2">item 02</li>
  <li class="item3">item 03</li>
  <li class="item4">item 04</li>
  <li class="item5">item 05</li>
</ul>

```
