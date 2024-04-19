---
dg-publish: true
---
# Nerd Font

## Linux

- Download the font you want from the [nerd-font releases page](https://github.com/ryanoasis/nerd-fonts/releases)
- unpack the downloaded file in either
    - `~/.local/share/fonts`
    - or `/usr/local/share/fonts`
    - or `/usr/share/fonts`
- run `fc-cache -f -v`
- done!

## MacOS

From <https://www.geekbits.io/how-to-install-nerd-fonts-on-mac/>

```
brew tap homebrew/cask-fonts

brew install --cask font-meslo-lg-nerd-font
```

Then enable `MesloLGS NF` in the terminal.

In VSCode:
```json
"terminal.integrated.fontFamily": "MesloLGS NF"
```
