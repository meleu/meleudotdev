---
dg-publish: true
---
# Artigos

Lista dos artigos de minha autoria.

Artigos sobre linha de comando e shell-scripting eu publico em <https://meleu.sh>.

Artigos de outros autores que eu traduzi ficam [[traducoes|aqui]].


```dataview
TABLE title AS "Título" FROM "artigos"
WHERE dg-publish = true
SORT file.ctime DESC
```

