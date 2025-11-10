---
dg-publish: true
---
The `mktemp` is useful for creating temporary files.

When creating scripts with `mktemp`, be mindful about the different implementations, specially if your intention is to run your script in a container.

The Alpine Linux (a very common distro in the Docker ecosystem) uses a simplified version of `mktemp`. Then, consider these caveats:

- don't use `--long-options` (it may work in your favorite distro, but not in Alpine)
- if you specify the template for the file name:
    - use **exactly 6 `X`s**, like this: `<name>-XXXXXX`
    - the 6 `X`s **MUST** come at the end of the template (therefore you can't specify a file extension)
