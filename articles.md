---
dg-publish: true
---
# Articles

Although this website is my [[digital garden]], sometimes I write some (kinda) "finished" articles. And here's where a list

(Articles writen in portuguese are [[artigos|listed here]].)



```dataview
TABLE title as Title
FROM "articles"
WHERE
  dg-publish = true
  AND language != "pt"
SORT file.ctime DESC
```
