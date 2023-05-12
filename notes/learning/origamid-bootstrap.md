---
dg-publish: true
---
# origamid-bootstrap

- <https://www.origamid.com/curso/bootstrap-4>

[TOC]

## Intro

Usar bootstrap 4.0 para acompanhar o curso:

<https://getbootstrap.com/docs/4.0/getting-started/introduction/>


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

## Container Após Navbar

Primeira coisa: adicionar um `padding-top` para evitar que o navbar cubra o  conteúdo no topo da página:

Inspecione o navbar e veja a altura dele, em seguida coloque no seu `style.css` customizado o tamanho da altura do navbar.

No meu caso eu fiz assim:
```css
body {
  padding-top: 75px;
}
```