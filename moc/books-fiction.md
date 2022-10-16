---
dg-publish: true
dg-permalink: books-fiction
---
# books fiction

```dataview
TABLE 
  author,
  read-timestamp AS "When I read"
FROM #books/fiction 
WHERE dg-publish = true
SORT read-timestamp DESC
```