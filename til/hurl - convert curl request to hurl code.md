---
dg-publish: true
---
# hurl - convert curl request to hurl code

Hurl currently is one of my favorite #tools to test APIs.

We can convert `curl` command to `hurl` code easily  with this command:

```bash
cat sample.curl | hurlfmt --in curl
```

I noticed though that when the input has multilines, the break-line escaping was causing issues. Example:
```
curl --location 'http://localhost:8080/settings' \
--header 'X-User-Id: 1234' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer CrAzY-hAsH' \
--data '{
    "amount": 100000,
    "due_date": "2024-07-23"
}'
```

This 👆 causes `hurlfmt` to fail with a message like this: 
`Can not parse curl command at line 1: Invalid escape at column 71`

The solution I used was to use `tr` to delete the problematic chars:
```bash
cat sample.curl 
  | tr -d '\\\n' \
  | hurlfmt --in curl
```

## references

- <https://github.com/Orange-OpenSource/hurl/issues/316#issuecomment-1463457760>
