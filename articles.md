---
dg-publish: true
---
# Articles

```dataview
TABLE title as Title
FROM "articles"
WHERE
  dg-publish = true
  AND language != "pt"
SORT file.ctime DESC
```
