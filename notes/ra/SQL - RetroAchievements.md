---
dg-publish: true
---
## RA Practice

![basic RA DB scheme](https://user-images.githubusercontent.com/8508804/92043707-f1ea8080-ed52-11ea-9f3e-e5fbb3caf616.png)


### How many users have less than 1000 points?

```sql
SELECT COUNT(*)
FROM UserAccounts
WHERE RAPoints < 1000;
```

### How many users don't log in for more than 2 years?

```sql
SELECT COUNT(*)
FROM UserAccounts
WHERE LastLogin < ??????(timestamp)
```

### How many users have created at least one achievement?

```sql
SELECT COUNT(DISTINCT Author)
FROM Achievements;
```

### How many users didn't create any achievement?

???


### How many users have less than 1000 points AND didn't login for 2 years AND didn't create any achievement?

```sql
SELECT COUNT(*)
FROM UserAccounts
WHERE
  RAPoints < 1000
  AND LastLogin < ??????(timestamp)
  AND ?????;
```

### Which users have less than 1000 points AND didn't login for 2 years AND didn't create any achievement?

```sql
SELECT User
FROM UserAccounts
WHERE
  RAPoints < 1000
  AND LastLogin < ??????(timestamp)
  AND ?????;
```

### How many points the user USERNAME had in the date X?

???

NOTE: rescores won't allow it to be accurate.

