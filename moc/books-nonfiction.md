---
dg-publish: true
dg-permalink: books-nonfiction
---
# books nonfiction

```dataview
TABLE 
  author,
  read-timestamp AS "When I read"
FROM #books/nonfiction 
WHERE dg-publish = true
SORT read-timestamp DESC
```
