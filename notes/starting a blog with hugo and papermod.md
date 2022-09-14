---
dg-publish: true
---
# starting a blog with hugo and papermod

[TOC]

---

## first steps

```shell
# use '-f yml' to create a config.yml
# (otherwise it'll be toml)
hugo new site meleudotdev -f yml
cd meleudotdev
git init

# adding the papermod theme
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod

# needed when you reclone your repo
# (submodules may not get cloned automatically)
git submodule update --init --recursive
```

Now open the `config.yml` and add this:
```yaml
theme: "PaperMod"
```

## custom CSS

`./assets/css/custom.css`
