---
dg-publish: true
---
# origamid-bootstrap

- <https://www.origamid.com/curso/bootstrap-4>

[TOC]

## Intro

Tou usando esses arquivos aqui pra acompanhar o curso:
```html
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- ... -->
</head>

<body>
  <!-- ... -->

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
    integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</body>
```

### documentação do grid

<https://getbootstrap.com/docs/4.0/layout/grid/>

O grid é sempre dividido em 12 colunas (percentualmente).

Se quiser abrir colunas dentro de uma célula, coloque dentro de um `row`.

#### Padrão de nomeclatura

- sm: small
- md: medium
- lg: large
- xl: extra large


## Navbar

<https://getbootstrap.com/docs/4.0/components/navbar/>

- `nav > .navbar.fixed-top` - começa o navbar, fixada no topo
- `nav > a.navbar-brand` - colocar a logo
- `nav > ul.ml-auto` - margin-left auto, pra manter os links à direita
- `nav > ul.navbar-nav > li.nav-item` - lista de links
- `nav.navbar navbar-expand-md` - em que momento que o menu vira "hamburguer"
- `button.navbar-toggler` - botão do hamburguer menu


## Spacing

<https://getbootstrap.com/docs/4.0/utilities/spacing/>

Classes para spacing:

Formato: `{property}{sides}-{size}`

- `{property}` can be:
    - `m`argin
    - `p`adding
- `{sides}` ca be:
    - `t`op
    - `b`ottom
    - `l`eft
    - `r`right
    - `x` for both left and right
    - `y` for both top and bottom
    - blank for all 4 sides
- `{size}` ca be
    - 0 - eliminate margin/padding
    - 1 - small...
    - 2
    - 3
    - 4
    - 5 - big
    - auto