---
dg-publish: true
---
# jq

## minify JSON with jq

```shell
# --compact-output | -c
$ jq -c input.json
```

## if with no else

Else is mandatory, but you can use `empty` to make it do nothing.

```shell
jq 'if CONDITION then SOMETHING else empty end' input.json
```


## return empty string if result is `null`

```shell
# use '// empty' at the end of the expression
jq '.EXPRESSION // empty' input.json
```
