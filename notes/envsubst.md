# envsubst

Get's a stream and replaces the `${variables}` with the ones defined in the environment.

Example:
```bash
# not a environment variable yet (no export)
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

