---
dg-publish: true
---
# SQL

#sql

- [[SQL games]]
- [[SQL - RetroAchievements]]
- [[Select Star SQL]]


## Source of Information

Some notes here were taken while studying the first lessons of "SQL Fundamentals" from <datacamp.com>

Others were taken by demand.


## SELECT with Regular Expressions

**NOTE**: I only tested this on MySQL.

```sql
SELECT 
  column_list
FROM
  table_name
WHERE
  string_column REGEXP pattern;
```

example:
```sql
SELECT 
  productname
FROM
  products
WHERE
  productname REGEXP '^(A|B|C)'
ORDER BY productname;
```



## SELECT DISTINCT

Works like `uniq` in shell scripts.

## SELECT COUNT()

### COUNT(*)

Counts the number of rows.

### COUNT(column_name)

Counts the number of *no-null* values in `column_name`.

### COUNT(DISTINCT column_name)

Counts the number of distinct values in `column_name`.

## WHERE

### WHERE a BETWEEN x AND y

Checks if the value of `a` is between the values `x` and `y` (inclusive).

### WHERE a IN (value1, value2, value3)

Checks if `a` is equal one of the values in the list.

### SELECT a LIKE pattern / SELECT a NOT LIKE pattern

Allows using patterns for searching.

`%` is a wildcard fro "anything", and `_` is a wildcard forr any character).


## Aggregate functions

### SELECT AVG()

### SELECT SUM()

### SELECT MAX()

### SELECT MIN()
---

