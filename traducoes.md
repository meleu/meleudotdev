# Artigos Traduzidos

Traduzindo para o português artigos que permanecerão relevantes por vários anos.

```dataview
TABLE 
  title as Título,
  description as Descrição,
  author as Autor
FROM "repos/traducoes"
WHERE dg-publish != false
SORT file.mtime ASC
```
