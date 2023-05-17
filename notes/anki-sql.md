---
dg-publish: true
cards-deck: webdev::sql
deck: webdev::sql
---

# Anki cards for SQL

#sql #anki

TODO: create some cards based on [[Select Star SQL]].

[TOC]


---

<!-- basicblock-start oid="ObsNdUD7ChYD2nSHbUzBUfy8" -->
## basic INSERT structure
::
```sql
INSERT INTO table
(field1, field2, fieldN)
VALUES (value1, value2, valueN)
```
<!-- basicblock-end -->

---

<!-- basicblock-start oid="ObshNKoEgf78pzGvpROw0cz6" -->
## basic UPDATE structure
::
```sql
UPDATE table
SET field1 = new_value1, fieldN = new_valueN
WHERE condition
```
**Don't forget the `WHERE`!**
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsGYRlID7zhrZoZOvqIpJBK" -->
## basic DELETE structure
::
```sql
DELETE FROM table
WHERE condition
```
**Don't forget the `WHERE`!**
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsiQqLjoAfkhB1D7VxHgygF" -->
## Order of execution
::
1. from
2. where
3. group by
4. having
5. select
6. order by
7. limit
<!-- basicblock-end -->
