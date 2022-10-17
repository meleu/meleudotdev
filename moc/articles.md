---
dg-publish: true
dg-permalink: articles
---
# Articles

Although this website is my [[digital garden]], sometimes I write some (kinda) "finished" articles. And here's where a list

(Articles written in portuguese are [[artigos|listed here]].)



```dataview
TABLE
  title as Title,
  file.mdate as "Last change"
FROM "articles"
WHERE
  dg-publish = true
  AND language != "pt"
SORT file.mtime DESC
```
