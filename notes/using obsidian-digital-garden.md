---
dg-publish: true
---
# using obsidian-digital-garden

> [!update]
> This note is outdated. It's better to follow the instructions in the [official website](https://dg-docs.ole.dev/)

This is my oversimplified version of the plugin's instructions [here](https://github.com/oleeskild/obsidian-digital-garden).

## preliminary work

- [ ] github account
- [ ] netlify account
- [ ] go to [this repo](https://github.com/oleeskild/digitalgarden) 
    - [ ] click in "Deploy to netlify"
    - [ ] give it a meaningful name
    - [ ] follow the steps on netlify
- [ ] [create an access token](https://github.com/settings/tokens/new?scopes=repo) on github **and copy it in a safe place**

## in obsidian
- [ ] install the obsidian-digital-garden community plugin
- [ ] in obsidian "Digital Garden" options, fill in
    - [ ] github username
    - [ ] the name of the repo (you created it right after "Deploy to netlify")
    - [ ] the github access token


## creating notes

The notes you want to see published must have `dg-publish: true` on their frontmatter:

```yaml
---
dg-publish: true
---
```


The one you wanna see as your home page must have this on the frontmatter:

```yaml
---
dg-publish: true
dg-home: true
---
```


## publishing "all" notes

Currently there's no way to publish all notes by default (I opened an [issue with requesting this feature](https://github.com/oleeskild/obsidian-digital-garden/issues/26)).

As a workaround I created a script that works nice for my workflow: <https://gist.github.com/meleu/f9667e76a2744d46686702edeb3cc77c>

Requirement: the vault itself must be a git repository (what I usually do).

The script adds a `dg-publish: true` to all versioned `*.md` files that don't have a `dg-publish: ` defined in it's frontmatter.

Consequences of this:

- non versioned files won't be affected (e.g.: gitignored files)
- files without any frontmatter will have one with `dg-publish: true`
- files with a `dg-publish: ` (any value) in its frontmatter won't be touched


While the feature requested in the OP is not implemented, I'll be using that script as pre-commit git hook.

## themes for the published website

My favorite ones come in the top

- Atom [dark]
- Things [dark]
- Typewriter [dark]
- 👎 Default theme is not cool