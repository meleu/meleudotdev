---
dg-publish: true
---
# SQL Murder Mystery

#sql 

<https://mystery.knightlab.com>

Better than solving in the webpage, we can solve in our own machine. Here are the steps:

```shell
git clone git@github.com:NUKnightLab/sql-mysteries.git
cd sql-mysteries
sqlite3 sql-murder-mystery.db
```

Here's the mystery you need to solve:

> A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a **murder** that occurred sometime on **Jan.15, 2018** and that it took place in **SQL City**. All the clues to this mystery are buried in a huge database, and you need to use SQL to navigate through this vast network of information. Your first step to solving the mystery is to retrieve the corresponding crime scene report from the police department's database.

Check the tables you have to work below (hint: start your investigation in the `crime_scene_report`)

![[SQL Murder Mystery ERD.png]]

