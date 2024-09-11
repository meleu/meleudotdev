---
dg-publish: true
---
# jq - parse only JSON content and ignore the rest

This is really useful when you want to use #jq to parse content that has mixed with the JSON you need.

```shell
jq -R 'fromjson? | select(type == "object")'
```

Example of input:
```
This is some text to be ignored by jq...

{"error":{"code":1,"message":"Recovery amount id 2899 with status BLOCKING not processed for loan 6608"}}

...more content to be ignoredd
```

Command:
`jq -R 'fromjson? | select(type == "object")' error.txt`

Output:
```json
{
  "error": {
    "code": 1,
    "message": "Recovery amount id 2899 with status BLOCKING not processed for loan 6608"
  }
}
```

## references

- <https://github.com/jqlang/jq/issues/884#issuecomment-128439361>