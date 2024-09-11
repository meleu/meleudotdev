---
dg-publish: true
---
# freeze - code screenshot

repo: <https://github.com/charmbracelet/freeze>

### Installation

```bash
brew install charmbracelet/tap/freeze

# I checked in the project's issue tracker that
# having librsvg lib installed makes freeze have
# a better performance.
brew install librsvg
```

### Config File

[Examples from the official repository](https://github.com/charmbracelet/freeze/tree/main/configurations).

My config (inspired by [the full one](https://github.com/charmbracelet/freeze/blob/main/configurations/full.json))
```json
{
  "window": false,
  "theme": "catppuccin-mocha",
  "border": {
    "radius": 8,
    "width": 1,
    "color": "#515151"
  },
  "shadow": {
    "blur": 24,
    "x": 0,
    "y": 12
  },
  "padding": [
    20,
    40,
    20,
    20
  ],
  "margin": [
    50,
    60,
    70,
    60
  ],
  "background": "#171717",
  "font": {
    "family": "Hack Nerd Font Mono",
    "size": 14,
    "ligatures": true
  },
  "line_height": 1.2
}
```

### Example

![[freeze - code screenshot.png]]
### Themes

[Themes preview](https://xyproto.github.io/splash/docs/all.html).

Cool themes

- catppuccin-mocha
- doom-one
- github-dark
- gruvbox
- solarized-dark