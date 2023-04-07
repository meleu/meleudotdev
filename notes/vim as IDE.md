---
dg-publish: true
---
# vim as IDE

I tried lazyvim and didn't like it. Very opinionated.

In this video it shows kickstart.nvim: <https://youtu.be/stqUbv-5u2s>

<https://github.com/nvim-lua/kickstart.nvim>

This playlist is also useful (long though): <https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ>

And this one from ThePrimeagen: <https://youtu.be/w7i4amO_zaE>

### backup your neovim configs

```shell
# required
mv ~/.config/nvim ~/.config/nvim.bak

# optional but recommended
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```