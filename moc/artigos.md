---
dg-publish: true
dg-permalink: artigos
---
# Artigos

A maioria dos meus artigos em português são publicados em <https://meleu.sh>, que é onde falo sobre linha de comando, shell-scripting com uma pegada de DevOps. Artigos que não se enquadram nesse nicho eu acabo publicando aqui mesmo.

Veja também alguns [[traducoes|artigos que eu traduzi]] de outros autores.


```dataview
TABLE
  title AS "Título",
  file.mday AS "Última modificação"
FROM "articles"
WHERE
  dg-publish = true
  AND language = "pt"
SORT file.mtime DESC
```
