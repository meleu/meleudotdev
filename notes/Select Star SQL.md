---
dg-publish: true
---
# Select Star SQL

#sql

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

## main takeaways

- A query has several blocks, like `SELECT columns`, `FROM table`, `WHERE filter`.
- `WHERE` is a filter applied in the table given to `FROM`.
- `SELECT` can do math. If you want numbers with decimals and is getting an integer, multiply by 1.0.
- Aggregation functions (COUNT, AVG, MIN, MAX, SUM, etc.)
    - Take multiple rows of data and combine them into one number.
    - Most of the functions act on non-NULL values.
    - `WHERE` happens before aggregations.
- About `GROUP BY`
    - It changes the behavior of aggregation functions. It makes the functions perform their operations on groups of rows, instead of the entire table.
    - `WHERE` happens before `GROUP BY`
    - use `HAVING` to filter after a `GROUP BY`
    - `HAVING` can take the results of aggregations into consideration.
- We can use nested queries (specially useful to calculate percentages).
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

To filter text, we can use '=', but `LIKE` makes some things easier. Example:

```sql
SELECT * FROM executions WHERE first_name LIKE '%roy'
```

Implications of using `LIKE`:

- the string becomes case insensitive
- use `%` as a multicharacter wildcard
- use `_` as a single character wildcard

### challenge: What was the Beazley's last sentence before being executed?

```sql
SELECT last_sentence
FROM executions
WHERE last_name LIKE '%beazley%'
```


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

### challenge: What's the percentage of executed people who claim innocence?

To solve this we need to go through the table twice:

1. count the claims of innocence
2. count the amount of people who said a last sentence

Once we have these numbers, we do the math.

This needs to be solved in one query.

```sql
SELECT
  100.0 * COUNT(
    CASE
      WHEN last_statement LIKE '%innocent%'
        THEN 1
      ELSE NULL
    END) / COUNT(
    CASE
      WHEN last_statement IS NOT NULL
        THEN 1
      ELSE NULL
    END)
FROM executions
```

**NOTE**: the `100.0 *` multiplication is important to make the division with decimals.


---

## The Long Tail

### GROUP BY

> [!important]
> The `GROUP BY` clause is normally used along with "aggregate" functions. These functions perform special operations on an entire table, set or group, of rows (rather than on each row) and then return one row of values for each group.

### HAVING

> [!important]
> The `WHERE` block happens before grouping aggregation. This is reflected in the order of syntax since the `WHERE` block always precedes the `GROUP BY` block.

Things to keep in mind:

- `WHERE` happens before `GROUP BY`
- `HAVING` happens after `GROUP BY`
    - therefore `HAVING` can act on aggregation functions


The `HAVING` clause was added to SQL because the `WHERE` keyword cannot be used with aggregate functions.

You can think of `HAVING` as a post-aggregation `WHERE` block.

In this example we are getting the list of counties in which **more than 2 inmates** aged >= 50:
```sql
SELECT county
FROM executions
WHERE ex_age >= 50
GROUP BY county
HAVING COUNT(*) > 2
```

### nested queries

#### Who has the longest last sentence?

We want the first and last name of the inmate with the longest last statement.

To achieve this we need to know the length of the longest last statement and then query the info about the row where such a long statement is.

Solution:
```sql
SELECT first_name, last_name
FROM executions
WHERE LENGTH(last_statement) = (
  SELECT MAX(LENGTH(last_statement))
  FROM executions
)
```

#### Percentage of execution on each county

For this we need the amount of executions on each county, and then divide by the total amount of executions.

Here's the query:
```sql
SELECT
  county,
  100.0 * COUNT(*) / (SELECT COUNT(*) FROM executions)
    AS percentage
FROM executions
GROUP BY county
ORDER BY percentage DESC
```


### challenge: Which counties has more executions?

The solution is in the example above. 👆


---

## Execution Hiatuses