# {{title}}


---

### Notes created today

```dataview
List FROM "" WHERE file.cday = date("{{title}}") SORT file.ctime asc
```

### Notes modified today

```dataview
List FROM "" WHERE file.mday = date("{{title}}") SORT file.mtime asc
```