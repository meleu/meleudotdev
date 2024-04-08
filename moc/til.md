---
dg-publish: true
dg-permalink: til
---

# Today I Learned

List of little things I've been learning...


```dataview
TABLE
  file.tags as tags,
  dateformat(file.ctime, "yyyy-MM-dd") as "date"
FROM "til"
WHERE
  dg-publish = true
SORT file.ctime DESC
```