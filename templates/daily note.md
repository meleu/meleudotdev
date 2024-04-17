# {{title}}


---

### Notes created today

```dataview
List FROM -"work/cw/log/daily" WHERE file.cday = date("{{title}}") SORT file.ctime asc
```

### Notes modified today

```dataview
List FROM -"work/cw/log/daily" WHERE file.mday = date("{{title}}") SORT file.mtime asc
```