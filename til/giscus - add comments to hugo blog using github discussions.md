---
dg-publish: true
---
# giscus - add comments to hugo blog using github discussions

I use hugo as the Static Site Generator for my #blog: <https://meleu.sh>.

I use the PaperMode theme.

And I learned to use [giscus](https://giscus.app) to add comments.

In the giscus website we fill a form and they give us a snippet to be used in our pages.

Here are the changes I made in my code:

Added this to my `config.yml`:

```yaml
params:
  # ...
  comments: true
  giscus:
    repo: "meleu/meleudotsh"
    repoId: "R_kgDOG_9USg"
    category: "Announcements"
    categoryId: "DIC_kwDOG_9USs4ChHrL"
    mapping: "pathname"
    strict: "0"
    reactionsEnabled: "1"
    emitMetadata: "0"
    inputPosition: "bottom"
    # "transparent_dark" works fine with both
    # light/dark PaperMod colors
    theme: "transparent_dark"
    lang: "pt"
    loading: "lazy"
```

Created a `layouts/partials/giscus.html` with this:
```html
{{- if isset .Site.Params "giscus" -}}
  {{- if and (isset .Site.Params.giscus "repo") (not (eq .Site.Params.giscus.repo "" )) (eq (.Params.disable_comments | default false) false) -}}
<script src="https://giscus.app/client.js"
        data-repo="{{ .Site.Params.giscus.repo }}"
        data-repo-id="{{ .Site.Params.giscus.repoID }}"
        data-category="{{ .Site.Params.giscus.category }}"
        data-category-id="{{ .Site.Params.giscus.categoryID }}"
        data-mapping="{{ .Site.Params.giscus.mapping }}"
        data-strict="{{ .Site.Params.giscus.strict }}"
        data-reactions-enabled="{{ .Site.Params.giscus.reactionsEnabled }}"
        data-emit-metadata="{{ .Site.Params.giscus.emitMetadata }}"
        data-input-position="{{ .Site.Params.giscus.inputPosition }}"
        data-theme="{{ .Site.Params.giscus.theme }}"
        data-lang="{{ .Site.Params.giscus.lang }}"
        data-loading="{{ .Site.Params.giscus.loading }}"
        crossorigin="anonymous"
        async>
</script>
  {{- end -}}
{{- end -}}
```

And finally created a `layouts/partials/comments.html` with this single line (note: this is overriding the PaperMods file)
```
{{- partial "giscus.html" . }}
```


## references

- <https://cdwilson.dev/articles/using-giscus-for-comments-in-hugo/>
- PaperMod docs
    - [comments param](https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-features/#comments)
    - [How to override theme template](https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-faq/#override-theme-template)
- [commit diff with my changes](https://github.com/meleu/meleudotsh/compare/c0ff3d8935ea9129e7eb438f30696838b5e616b9..461c1a51fe8b4b2c1b0987a4d82c3b914d84f5ed)