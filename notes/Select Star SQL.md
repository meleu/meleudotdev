---
dg-publish: true
---
# Select Star SQL

Notes of what I've been learning from <https://selectstarsql.com/>.

[TOC]

The table used for practice is filled with data about death executions that happened in Texas.

- executions
    - first_name
    - last_name
    - ex_number
    - ex_age
    - ex_date
    - county
    - last_statement

---

## Beazley's Last Statement

### SELECT and FROM

Most important parts of a query: `SELECT` and `FROM`.

Most of the time we are `SELECT`ing some fields `FROM` a table.

So, the arguments for `SELECT` can go wild, but `FROM` receives only a table.

The `SELECT` can also do math:

```sql
SELECT 50 * 2, 51 / 2
-- 100, 25

-- if you want decimal numbers,
-- one of the terms must have decimals
SELECT 51.0 / 2
-- 25.5
```

### WHERE

Used as a filter. Example:
```sql
-- younger than 25
SELECT * FROM executions WHERE ex_age < 25
```

To filter text, we can use `=`, but `LIKE`:

  


### Chapter's challenge

What was the Beazley's last sentence when he was executed?



---

## Claims of Innocence

### aggregate functions

- [list of SQLite built-in aggregate functions](https://sqlite.org/lang_aggfunc.html)

> [!important]
> - Aggregation functions take multiple rows of data and combine them into one number.
> - Most of the functions act on non-NULL values.

Most common ones:

- COUNT
- AVG
- MIN
- MAX
- SUM

### a strange query!

```sql
SELECT first_name, COUNT(*) FROM executions
```

Although it's a valid query it's probably not what you want.

As an aggregation function, `COUNT(*)` is trying to return a single value, but `first_name` is trying to return multiple values (one entry for each row).


### case-when-else

It works like a big if-else statement:

```
CASE
    WHEN <clause> THEN <result>
    WHEN <clause> THEN <result>
    ...
    ELSE <result>
END
```

It's useful for times when we want to go through a table multiple times in the same query. Like in this example where we want to count the executions in two different counties:

```sql
SELECT
  COUNT(
    CASE
      WHEN county='Harris' THEN 1
      ELSE NULL
    END) as harris_county_counter,
  COUNT(
    CASE
      WHEN county='Bexar' THEN 1
      ELSE NULL
    END) as bexar_county_counter
FROM executions
```

**Remember**: `COUNT()` only counts non-NULL values. That's why we use `ELSE NULL` in the query above.

