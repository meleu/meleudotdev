---
dg-publish: true
deck: webdev::css
---
# CSS

[TOC]

---

- [[CSS - transition e transform]]


## courses

- <https://web.dev/learn/css/> - Learning CSS with the best guys.
- <https://css-for-js.dev/> - [paid] this seems to be an awesome course (CSS aimed to JS developers).
- <https://cssgrid.io/> - CSS grid layout.
- <https://flexbox.io/> - Flexbox layout.



## CSS games

- CSS selectors: CSS Diner <https://flukeout.github.io/>
- flexbox: <https://flexboxfroggy.com>
- grid: <https://cssgridgarden.com>
- <https://codingfantasy.com/>
- [17 games to practice CSS](https://bookercodes.hashnode.dev/css-practice?source=tw0922#heading-try-one-of-these-17-games-to-practice-css)
- <https://csskatas.com/> - maybe cool to practice tailwind


## how to organize your CSS code

- <https://cube.fyi/> - CUBE CSS (inspired by BEM)
- <https://getbem.com> - BEM


---

<!-- basicblock-start oid="ObsRsO8RujveTSFrhYQjpQwk" -->
## smooth scrolling
::
```css
scroll-behavior: smooth;
```
<!-- basicblock-end -->


## [flexbox] place something in the center of the screen

```css
html, body, #container {
  height: 100vh;
}
#container {
  display: flex;
  align-items: center;
  justify-content: center;
}
```



## background perfeitamente ajustado

Truque aprendido em [https://css-tricks.com/perfect-full-page-background-image/](https://css-tricks.com/perfect-full-page-background-image/)

O objetivo é usar uma imagem com plano de fundo de uma página web, cobrindo toda a janela.

Premissas:
- preencher toda a página com a imagem, sem espaços em branco;
- redimensionar a imagem se necessário;
- manter a proporção da imagem (_aspect ratio_);
- imagem centralizada na página;
- imagem não provoca o aparecimento de barras de rolagem;
- funciona ~~em qualquer~~ na esmagadora maioria dos navegadores.

Eis o código CSS:

<!-- basicblock-start oid="Obs4sikA3Y4NWay2uozGSk7N" -->
perfect fullpage background image
::
```css
html {
  background: url("background.jpg") no-repeat center center fixed;
  background-size: cover;
}
```
<!-- basicblock-end -->
