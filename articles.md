---
dg-publish: true
---
# Articles

```dataview
TABLE
  title as Title,
  file.cday as "Created at"
FROM "articles"
WHERE dg-publish = true
SORT file.ctime DESC
```
