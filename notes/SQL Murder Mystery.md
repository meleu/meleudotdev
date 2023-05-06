---
dg-publish: true
---
# SQL Murder Mystery

#sql 

<https://mystery.knightlab.com>

> [!important]
> These are just my notes to solve the mystery, don't keep reading if you don't like spoilers!

## My notes to solve the mystery

![[SQL Murder Mystery ERD.png]]

- crime type: `murder`
- date: `20180115`
- city: `SQL City`

from `crime_scene_report` table I got this:
```
Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".
```

- 2 witnesses
    1. last house on `Northwestern Dr`
    2. name: `Annabel`, somewhere on `Franklin Ave`

| id    | name           | license_id | address_number | address_street_name | ssn       |
| ----- | -------------- | ---------- | -------------- | ------------------- | --------- |
| 14887 | Morty Schapiro | 118009     | 4919           | Northwestern Dr     | 111564949 | 
| 16371 | Annabel Miller | 490173     | 103            | Franklin Ave        | 318771143 |

TO BE CONTINUED... (at **Making connections**).
