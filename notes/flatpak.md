---
dg-publish: true
---
# flatpak

## Run a specific from a flatpak package

I was needing to run `ebook-convert` from `calibre`, then I created an `ebook-convert` script with this content:

```bash
#!/usr/bin/env bash

flatpak --command="ebook-convert" run com.calibre_ebook.calibre "$@"
```


## references

- <https://askubuntu.com/questions/1352523/how-to-run-or-execute-the-ebook-convert-script-from-a-flatpak-install-of-calibre>