---
dg-publish: true
---
# lua

- [Lua Programming](https://youtu.be/zDKK_1hxW_o?si=ohhiaxisLb3Oridi) - by Steve's teacher
- <https://exercism.org/tracks/lua>

### data types

```lua
5       -- number
nil     -- null
"meleu" -- string
true    -- boolean

-- tables:
{key = 'value', keyN = false }
-- when key is explicitly given, they'll be the ordinal number
my_table = {'a', 'b', 'c'}
-- my_table[1] = 'a'
-- my_table[2] = 'b'
-- my_table[3] = 'c'

-- multiline strings
local address = [[
  Rua Sobe e Desce
  Número desaparece
  12345-678
]]
```

### variables

- variables are global by default
    - good practice: prefix globals with `_G`
    - example: `_G.MyVar = 10`
- use `local` to specify the scope
    - using `local` in a file outside any function, makes the variable scoped to that file


### strings and some functions

```lua
-- length of a string
print(string.len('meleuzord'))
--> 9

-- hashtag prefix is an alias to 'string.len()'
print(#'meleuzord')
--> 9

-- convert number to a string
num = 20
str = tostring(num)

-- print the type of a variable
print(type(str))
--> string

-- changing to upper/lower case
print(string.upper('meleuzord'))
--> MELEUZORD
print(string.lower('Augusto Lopes'))
--> augusto lopes
```


### math library

```lua
-- print Pi
print(math.pi)

-- minimum value from a list
print(math.min(10, 5, 4, 6))
--> 4
print(math.max(10, 5, 4, 6))
--> 10

-- round up with ceil
print(math.ceil(20.9))
--> 21
print(math.ceil(20.1))
--> 21

-- round down with floor
print(math.floor(20.9))
--> 20
print(math.floor(20.1))
--> 20

-- random float numbers between 0 and 1
math.random()

-- more "pedantic" way to get a random number:
-- - first use math.randomseed(os.time())
math.randomseed(os.time())
math.random()

-- random integers between 1 and 10
math.random(10)

-- random integers between 10 and 15
math.random(10, 15)
```

### if statement

```lua
if condition then
  -- do something cool
elseif condition2 then
  -- do something else
else
  -- do another thing
end
```

- logical operators:
    - `and`
    - `or`
    - `not`
    - `>`
    - `<`
    - `>=`
    - `<=`
    - `~=` different
    - == 

similar to the ternary operator:
```lua
age = 12
message = age > 18 and "You can!" or "You can't!"
print(message)
--> You can't!
```

### loops

**Note**: loops accept the `break` instruction

#### for ... do

```lua
-- print from 1 to 10
for i = 1, 10 do
  print(i)
end

-- print from 1 to 10, incrementing by 2
for i = 1, 10, 2 do
  print(i)
end

-- print from 10 to 1, decrementing by 2
for i = 10, 1, -2 do
  print(i)
end

-- using for to iterate through a table
for key, value in pairs(my_table) do
  print(key .. ':', value)
end
```

#### while ... do

```lua
while condition do
  -- do something
end
```


#### repeat ... until

Similar to `while`, but it executes at least once
```lua
repeat
  -- do something...
until condition
```

### get input from user

```lua
print("What's your name?")
name = io.read() -- whatever user types is considered as string

-- print a string with no newline at the end
io.write('Enter your name: ')
name = io.read()
```


### tables

```lua
-- tables:
{key = 'value', keyN = false }
-- when key is explicitly given, they'll be the ordinal number
my_table = {'a', 'b', 'c'}
-- my_table[1] = 'a'
-- my_table[2] = 'b'
-- my_table[3] = 'c'

-- use this construct to loop through the key/value pairs:
for key, value in pairs(my_table) do
  print(key .. ':', value)
end
-- 1:      a
-- 2:      b
-- 3:      c

-- insert a value to the end of the table
table.insert(my_table, 'e')
-- 1:      a
-- 2:      b
-- 3:      c
-- 4:      e

-- insert a value at a specific index
-- note: it updates the keys of later values (increment)
table.insert(my_table, 4, 'd')
-- 1:      a
-- 2:      b
-- 3:      c
-- 4:      d
-- 5:      e

-- remove a value from a specific index
-- note: it updates the keys of later values (decrement)
table.remove(my_table, 4)
-- 1:      a
-- 2:      b
-- 3:      c
-- 4:      e

-- table.concat() acts like a join() in other languages
table.concat(my_table, ', ')
-- a, b, c, e
```

Tables with explicit keys:
```lua
person = {
  first_name = 'augusto'
  last_name = 'lopes'
}

person[1]            -- nil
person['first_name'] -- 'augusto'
person.first_name    -- 'augusto'

-- add properties at will
person.middle_name = 'gomes'
person['age'] = 42
```


### functions

```lua
function sayHello(name)
  local name = name or 'World'
  print('Hello' .. name .. '!')
end
```