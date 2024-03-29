---
dg-publish: true
---
# 00-prepwork

- <https://learn.lewagon.com/>

---

[TOC]

---


## Web 101

Main concepts:

- internet vs web
- HTTP
    - client and server
    - request and response
- static vs dynamic websites
- backend vs frontend

## Web Content & HTML

Basic HTML stuff.

I'm considering taking this emmet course before the Bootcamp: <https://www.linkedin.com/learning/emmet-fast-and-efficient-web-coding>

Things to remember:

- HTML basic syntax: `<element attribute="value">content</element>`
- `<img>` tags are self-closing
- in an `<a>` used for link, the `target` attribute can have the value `blank` to open the link in a new tab (btw, this is not a very intuitive thing).

Useful links mentioned at the end of the module:

- Accessibility:
    - [Web fundamentals - Accessibility](https://developers.google.com/web/fundamentals/accessibility/)
    - [Accessible to all](https://web.dev/accessible/)
- SEO:
    - [Intro to SEO by Google](https://learndigital.withgoogle.com/digitalgarage/course/become-searchable-online/module/6/lesson/46)
    - Full Course [Make sure customers find you online](https://learndigital.withgoogle.com/digitalgarage/course/become-searchable-online)



## Web Design & CSS

![[00-prepwork-css-fonts-size-spacing.png]]

### div

Styling divs involves structuring the content and customizing the spacing of our boxes (the yellow rectangle below).

![[00-prepwork-div-box-model.png]]

- width: full width of the page
- height: same height as div's content
- margin: external space around the outside of the box
- padding: internal space between content and the border of the box
- border: the limit of the box (default: nothing)
- box-shadow: a nice way to differentiate the box from the rest


#### Classic `<div>` design

```css
background: white;  /* white background */
padding: 30px;      /* internal space */
border-radius: 4px; /* small radius */
box-shadow: 0 15px 35px rgba(50, 50, 93, 0.1); /* strip shadow */
```


#### `<div>` centering technique

```css
width: 300px;   /* fix the width */
margin: 0 auto; /* automatic left/right margins */
```


### `id` and `class`

- `id` to style unique element
- `class` for creating reusable styling

#### `class` names

What are the best `class` names?

- `.btn-red` or `.btn-signup`?
- `.background-blue` or `.background-home`?
- `.img-user` or `.img-circle`?

**Tip**: think graphical

Le Wagon naming convention:

```css
/* Convention */
.element-design

/* Examples */
.text-center
.text-justify
.btn-red
.btn-green
.btn-big
.list-inline
.form-horizontal
.img-rounded
.img-circle
```

---

## Ruby

First 3 data types in Ruby:

- Numeric
    - Integer
    - Float
- String
- Boolean

**Coding style**: variables and methods named with `snake_case`

Arrays:

```ruby
burger = ["bun", "patty", "lettuce", "tomato"]
```


"Everything in Ruby is an Object"

```ruby
name = "meleu"
name.class # => returns String

10.even? # => returns true
22.odd?  # => returns false
500.to_s # => returns the string "500"
```

Methods:

```ruby
def hello(name)
  return "Hi #{name}!"
end

puts hello("meleu") # => "Hi meleu!"
```

### Things I learned doing the challenges

While doing the <https://codewars.com/> challenges I learned some useful stuff.

#### convert string to array
```ruby
"um dois tres quatro".split
# => ["um", "dois", "tres", "quatro"]

# convert to string and convert to integer
"5 1 4 2 3 15 42 34".split.map(&:to_i)
# => [5, 1, 4, 2, 3, 15, 42, 34]

# in the example above 👆 looks like the '&' char
# refers every single item in the array.
```

#### get min and max of an array

```ruby
[5, 1, 4, 2, 3].minmax
# => [1, 5]
```

#### `for` loop

```ruby
for i in 0..10 do
  puts i
end

# iterating like a .forEach()
array.each do |n|
  puts n
end
```

#### char to ASCII value

```ruby
# from char to ASCII value
'a'.ord
# => 97

# from ASCII value to char
97.chr
# => "a"
```

#### arrays subtraction
```ruby
[1, 2, 3] - [1, 3]
# => [2]
```



See also:

- [[ruby]]
- [[The Well-Grounded Rubyist]]


---

## Terminal & Bash

Nothing new...

---

## Version Control & Git

Nothing new...

---

## Product Design & Figma

Uhm... Some interesting stuff, but I'm afraid that's not the thing the pleases me... 😔

Some stuff I saw as related (maybe useful):
- <https://www.origamid.com/curso/ui-design-para-iniciantes> - curso do Origamid, deve ser bom.
- <https://www.udemy.com/course/sketching-for-ux-designers/> - prototyping by drawing on a paper


---


## Going Further

- [ ] Read a detailed [introduction to HTTP](https://dev.to/mahmoudessam/introduction-to-http-5hkj)
- [ ] Follow and code along with [this in-depth tutorial](https://learn.shayhowe.com/html-css/) on HTML and CSS and build a full webpage
- [ ] Understand the difference between UI and UX design by reading [this article](https://xd.adobe.com/ideas/process/ui-design/ui-vs-ux-design-understanding-similarities-and-differences/)
- [ ] Study the difference between a wireframe, a mockup and a prototype in [this article](https://blog.railwaymen.org/wireframe-vs-mockup-vs-prototype-what-is-the-difference-and-why-your-app-needs-it)
- [ ] Read the [Shape Up](https://basecamp.com/shapeup/webbook) Product Development methodology and watch [this Introduction to Shape Up Video](https://learn.lewagon.com/c/4721/b/7917)
- [x] Watch [this video](https://www.youtube.com/watch?v=hJHvdBlSxug) for a more detailed and visual explanation of how the Web works.
- [x] Watch [this short introduction](https://www.youtube.com/watch?v=c7FExaJY9A4) on Ruby: what kind of companies are using it, and why it’s a great language to learn


Links that I should NOT spend time on:

- _Learn Enough Command Line to Be Dangerous_ in [this tutorial](https://www.learnenough.com/command-line-tutorial)
- [An extensive overview](https://launchschool.com/books/ruby/read/basics) of all available data types in Ruby
- [An extensive overview](https://launchschool.com/books/ruby/read/variables#whatisavariable) of variables in Ruby
- Learn more about Booleans in [this guide](https://www.rubyguides.com/2019/02/ruby-booleans/)