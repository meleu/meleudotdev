---
dg-publish: true
tags:
  - books
read-timestamp: 2023
author:
  - Arnold Robbins
  - Elbert Hannah
---

# Learning the vi and vim Editors

Notes about new things I learned in the book (only the new things).

---

## Chapter 2: Simple Editing

### General Form of vi Commands (p26)

Most vi commands follow this pattern:

`(command)[number](text object)`

or

`[number](command)(text object)`

That's why it's so important to learn about "text object"


### Lack of consistency for "yank"

- Copy
    - `cc` - whole line
    - `C` - from cursor to the end of line
- Delete
    - `dd` - whole line
    - `D` - from cursor to the end of line
- Yank
    - `yy` - whole line
    - `Y` - whole line
    - `y$` - from cursor to the end of line


