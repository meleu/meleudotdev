---
dg-publish: true
tags:
  - vim
---
# Vim Tip 19 - replace mode

[[Practical Vim]]

> Replace is identical to Insert mode, except that it overwrites existing text.

Nothing new here, except this:

> Vim has a second variant of Replace mode. *Virtual Replace mode* is triggered with `gR` and treats the tab character as though it consisted of spaces.

Vim also provides a single-shot version of Replace mode and Virtual Replace mode: `r{char}` and `gr{char}`.
