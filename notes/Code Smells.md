---
dg-publish: true
---
# Code Smells

From the Martin Fowler's  _Refactoring_ book (2nd edition).

I got the categorization from Sandi Metz in [[99 Bottles of OOP]].

#### Bloaters

- Long Function
- Long Class
- Data Clumps (data being passed together, probably they should be in an object)
- Long Parameter List
- Primitive Obsession (if you need to supply behavior, probably you need a smarter object)


#### Abusers

- Repeated Switches (conditionals)
- Refused Bequest
- Alternative Classes with Different Interfaces
- Temporary Field
- Global Data
- Mutable Data

#### Preventers

- Divergent Change
- Shotgun Surgery (when you want to change a behavior and need to change several places)
- Mysterious Name


#### Dispensables

- Lazy Element
- Speculative Generality
- Data Class
- Duplicated Code
- Comments
- Loops


#### Couplers

- Feature Envy
- Insider Trading
- Message Chains
- Middle Man


