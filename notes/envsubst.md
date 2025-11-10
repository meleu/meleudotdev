---
dg-publish: true
---
# envsubst

Get's a stream and replaces the `${variables}` with the ones defined in the environment.

Example:
```bash
# not an environment variable yet (no export)
$ name='meleu'

$ echo 'Hello $name'
Hello $name

# $name is not exported...
$ echo 'Hello $name' | envsubst
Hello 

$ export name

# now envsubst works as expected
$ echo 'Hello $name' | envsubst
Hello meleu
```

Useful links:

- https://superuser.com/questions/1148950/what-is-shell-format-in-envsubst
- https://unix.stackexchange.com/questions/294378/replacing-only-specific-variables-with-envsubst