---
dg-publish: true
---
# todo - RANews

## lotusdocs hugo theme

- [x] como fazer a landing page?
    - criei um `layouts/ranews-cover.html`
- [ ] adaptar shortcodes?
- [ ] customizar dir (`issues` no lugar de `docs`)
    - `[params.docs] pathName = "issues"`
    - não gostei (se mudar, várias coisas quebram)
- [ ] estilização para
    - [ ] tabelas
    - [ ] rauserpic
    - [ ] gameicon
- [ ] qual edição começa expandida?
- [ ] no index da issue, dar um jeito de colocar a capa
- [ ] favicon
- [ ] icone RANews no canto superior esquerdo
    - [catálogo de ícones](https://fonts.google.com/icons?icon.style=Outlined&icon.query=article&icon.platform=web&selected=Material+Symbols+Outlined:article:FILL@0;wght@0;GRAD@0;opsz@24&icon.size=24&icon.color=%23e3e3e3) 

### shortcodes

see also: criando/usando shortcodes no hugo: https://www.youtube.com/watch?v=Eu4zSaKOY4A


Vai em `layouts/` cria o diretório `shortcodes`.

cria um arquivo `myshortcode.html` com algum conteúdo.

vai num arquivo em `content/` e  coloca `{{< myshortcode >}}`

- named arguments:
    - content: `{{< myshortcode color="red" >}}`
    - shortcode: `{{ .Get "color" }}`
        - note: you can use backticks
- positional arguments:
    - content: `{{< myshortcode red >}}`
    - shortcode: `{{ .Get 0 }}`
        - positional parameter starting with zero

shortcodes as tags

content:
```
{{< myshortcode >}}
  Here goes the content
{{< /myshortcode >}}
```

shortcode:
```html
<section>
{{ .Inner }}
</section>
```

If you need markdown in the ".Ineer", you must use a different tag in the content:
```
{{% myshortcode %}}
  **This is going to be bold**
{{% /myshortcode %}}
```


## jekyll

- use tailwindcss ([useful article](https://mzrn.sh/2022/04/09/starting-a-blank-jekyll-site-with-tailwind-css-in-2022/))
- deploy GH Pages ([useful article](https://mzrn.sh/2023/10/26/how-to-use-tailwind-css-with-jekyll-on-github-pages/))

## hugo themes to try

- https://github.com/colinwilson/lotusdocs <- setembro/2025 e esse é o meu favorito
- https://github.com/dumindu/E25DX
- creating a custom theme: https://tomo.dev/en/tags/hugo-theme/

## inspiration

- https://increment.com/
- <https://backstagetalks.com/>

## typography

Parar de usar monoespaçada no corpo, escolher uma sem serifa.

dump font names (from Google Fonts):
- Press Start 2P (para título?)
- Rubik (para título?)
- Roboto (para corpo)


Inspiração:
![[material-design - typography-scale.png]]

## Color Scheme

### Gameboy

![[gb.png]]

Selecionar uma cor de destaque...


### references

- <https://coolors.co/palettes/trending>