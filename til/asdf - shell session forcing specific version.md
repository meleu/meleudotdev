---
dg-publish: true
---
# asdf - shell session forcing specific version

#asdf

Sometimes we use some tools that rely on a specific version of the interpreter (NodeJS, ruby, etc.). Then you enter in a directory that has a `.tool-versions` specifying an older version.

Suddenly your tool doesn't work because it requires a newer version of the interpreter.

In my case it happened when I needed to use [newman](https://github.com/postmanlabs/newman) and a private ruby gem I created.

Here's a way to solve this: start a new shell session "forcing" a specific version for a package.

From #asdf help:
```shell
# Set the package version to
# `ASDF_${LANG}_VERSION` in the current shell
asdf shell <name> <version>

# in my example, for ruby
asdf shell ruby 3.2.2
```

## reference

`asdf help`