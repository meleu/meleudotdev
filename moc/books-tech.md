---
dg-publish: true
dg-permalink: books-tech
---
# books tech

```dataview
TABLE 
  author,
  read-timestamp AS "when I read"
FROM #books/tech 
WHERE dg-publish = true
SORT read-timestamp DESC
```
