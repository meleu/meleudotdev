---
dg-publish: true
dg-permalink: til
---

# Today I Learned

List of little things I've been learning...


```dataview
TABLE
  file.tags as tags,
  dateformat(file.mtime, "yyyy-MM-dd") as "Last change"
FROM "til"
WHERE
  dg-publish = true
SORT file.mtime DESC
```