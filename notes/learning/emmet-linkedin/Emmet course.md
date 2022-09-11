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

<!--
h1 to h6:
h${Heading $}*6
-->
  <h1>Heading 1</h1>
  <h2>Heading 2</h2>
  <h3>Heading 3</h3>
  <h4>Heading 4</h4>
  <h5>Heading 5</h5>
  <h6>Heading 6</h6>

<!--
multiple $ for multiple digits:
ul>li.item${item $$}*5
-->
<ul>
  <li class="item1">item 01</li>
  <li class="item2">item 02</li>
  <li class="item3">item 03</li>
  <li class="item4">item 04</li>
  <li class="item5">item 05</li>
</ul>

<!--
use the @ sign to start at a specific value:
ul>li.p$@5*10
-->
<ul>
  <li class="p5"></li>
  <li class="p6"></li>
  <li class="p7"></li>
  <li class="p8"></li>
  <li class="p9"></li>
  <li class="p10"></li>
  <li class="p11"></li>
  <li class="p12"></li>
  <li class="p13"></li>
  <li class="p14"></li>
</ul>

<!--
the @ sign can also count backwards:
ul>li.p$@-20*10
-->
<ul>
  <li class="p29"></li>
  <li class="p28"></li>
  <li class="p27"></li>
  <li class="p26"></li>
  <li class="p25"></li>
  <li class="p24"></li>
  <li class="p23"></li>
  <li class="p22"></li>
  <li class="p21"></li>
  <li class="p20"></li>
</ul>


<!--
example of a card wrapper:
section#cardWrapper>article#c$.card*3>h2{Card Title $}+p*2>lorem^a{Link}
-->
<section id="cardWrapper">
  <article id="c1" class="card">
    <h2>Card Title 1</h2>
    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Praesentium, numquam!</p>
    <p>Tenetur expedita illum pariatur. Quidem expedita quasi repellat natus pariatur!</p>
    <a href="#">Link</a>
  </article>
  <article id="c2" class="card">
    <h2>Card Title 2</h2>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ad, esse!</p>
    <p>Asperiores, nihil dolorum exercitationem reprehenderit veniam repellat architecto eligendi suscipit!</p>
    <a href="#">Link</a>
  </article>
  <article id="c3" class="card">
    <h2>Card Title 3</h2>
    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas, consequuntur!</p>
    <p>Nihil veniam quos, porro officiis ut velit tempore dolorem? Magni?</p>
    <a href="#">Link</a>
  </article>
</section>
```

### Adding attributes

Use square brackets
```html
<!-- a[href=#] -->
<a href="#"></a>

<!--
if you need more attributes, just separate them with spaces:
a[href=# class=my-link]
-->
<a href="#" class="my-link"></a>

```


### Some abbreviations

```
Abbreviation    Rendered HTML
mn              <main></main>
sect            <section></section>
art             <article></article>
hdr             <header></header>
ftr             <footer></footer>
fig             <figure></figure>
figc            <figcaption></figcaption>
```


### Building Forms

[link](https://www.linkedin.com/learning/emmet-fast-and-efficient-web-coding/building-forms)

```
Reference for form elements
Abbreviation            Rendered html
form                    <form action=""></form>
form:get                <form action="" method="get"></form>
form:post               <form action="" method="post"></form>
label                   <label for=""></label>
input                   <input type="text" />
inp                     <input type="text" name="" id="" />
input:hidden, 
    input:h             <input type="hidden" name="" />
input:text, 
    input:t             <input type="text" name="" id="" />
input:search            <input type="search" name="" id="" />
input:email             <input type="email" name="" id="" />
input:url               <input type="url" name="" id="" />
input:password, 
    input:p             <input type="password" name="" id="" />
input:datetime          <input type="datetime" name="" id="" />
input:date              <input type="date" name="" id="" />
input:datetime-local    <input type="datetime-local" name="" id="" />
input:month             <input type="month" name="" id="" />
input:week              <input type="week" name="" id="" />
input:time              <input type="time" name="" id="" />
input:tel               <input type="tel" name="" id="" />
input:number            <input type="number" name="" id="" />
input:color             <input type="color" name="" id="" />
input:checkbox, 
    input:c             <input type="checkbox" name="" id="" />
input:radio, 
    input:r             <input type="radio" name="" id="" />
input:range             <input type="range" name="" id="" />
input:file, 
    input:f             <input type="file" name="" id="" />
input:submit, 
    input:s             <input type="submit" value="" />
input:image, 
    input:i             <input type="image" src="" alt="" />
input:button, 
    input:b             <input type="button" value="" />
input:reset             <input type="reset" value="" />
button:submit, 
    button:s, 
    btn:s               <button type="submit"></button>
button:reset, 
    button:r, 
    btn:r               <button type="reset"></button>
button:disabled, 
    button:d, 
    btn:d               <button disabled="disabled"></button>
btn                     <button></button>
fieldset:disabled, 
    fieldset:d, 
    fset:d, 
    fst:d               <fieldset disabled="disabled"></fieldset>
fst, 
    fset                <fieldset></fieldset>
leg                     <legend></legend>
optg                    <optgroup></optgroup>
select                  <select name="" id=""></select>
select:disabled, 
    select:d            <select name="" id="" disabled="disabled"></select>
option, 
    opt                 <option value=""></option>
textarea,
    tarea               <textarea name="" id="" cols="30" rows="10"></textarea>


<!--
interesting example:
form:post#cForm>fset>legend{Give us a buzz}+label[for=name]{Name:}+inp#name[name=name]+label[for=email]{Email:}+input:email[name=email]+label[for=tel]{Phone:}+input:tel#tel[name=phone placeholder=111-222-3333]+label[for=msg]{Please write your inquiry:}+tarea#msg[name=msg]+input:s[value=Submit]
-->


```


### Time-saving actions

<https://docs.emmet.io/actions/>

On VSCode, `Ctrl+Shift+p` and then:
- `emmet: next edit point` -> config it to `Ctrl+Alt+l`
- `emmet: previous edit point` -> config it to `Ctrl+Alt+h`
- `emmet: wrap with abbreviation` -> config it to `Ctrl+Shift+A`

**NOTE**: when using neovim inside vscode, these actions work only in the edit mode.

#### "wrap with abbreviation",  `$#` `$#` and `*`

Given the following text
```
      instagram.com/beehappbee
      facebook.com/beehappbee
      twitter.com/beehappbee
```

Select it, then "Wrap with abbreviation" (`Ctrl+Shift+A`) and then:
```
ul.social-links>li>a[href=https://$#]{$#}*
```

The `$#` will be replaced with the selection, and generate this results:
```html
<ul class="social-links">
  <li>
    <a href="https://instagram.com/beehappbee">instagram.com/beehappbee</a>
    <a href="https://facebook.com/beehappbee">facebook.com/beehappbee</a>
    <a href="https://twitter.com/beehappbee">twitter.com/beehappbee</a>
  </li>
</ul>
```

#### Wrap with abbreviation,  `*` and `|t`

If you receive a text like this:
```
- Bee hives
- Bees entering hive
- Bee pollinating flower
```

And you want to create an unordered list removing the leading `-` dash, you can use the `|t` to trim them.

Select it, then "Wrap with abbreviation" (`Ctrl+Shift+A`) and then:
```
ul>li*|t
```

Results:
```html
<ul>
  <li>Bee hives</li>
  <li>Bees entering hive</li>
  <li>Bee pollinating flower</li>
</ul>
```

The same can be done if the prefix is numeric (e.g.: `1.`).

### Filters

- `|c` - add a comment after closing tags
    - It doesn't comments for all tags, but only the important ones that are expanding through several lines
- `|e` - expands to escaped html characters
    - ☹️ Whoops! Apparently it's not present in VSCode.
- `|s` - outputs code in a single line
    - ☹️ Whoops! Apparently it's not present in VSCode.


## 5 - Emmet and CSS

For CSS it's just 🤯 mindblowing! It uses a fuzzy finder.

Some examples:
```css
h1 {
    /* bl */
    border-left: 1px solid #000;
    
    /* c#fda809 */
    color: #fda809;
    
    /* fz30 */
    font-size: 30px;
    
    /* fw */
    font-weight: normal;
    
    /* pl5 */
    padding-left: 5px;
    
    /* ttc */
    text-transform: capitalize;
}
```

You can specify the unit:
```css
* {
  /* fz10 */
  font-size: 10px;
  
  /* fz3e */
  font-size: 3em;
  
  /* fz3r */
  font-size: 3rem;
}
```

Separate multiple values with `-`:
```css
ul {
  /* m10-25-15-20 */
  margin: 10px 25px 15px 20px;
}
```


