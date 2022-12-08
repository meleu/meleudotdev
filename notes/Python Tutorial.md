---
dg-publish: true
---
# Python Tutorial

Following the [official tutorial](https://docs.python.org/3/tutorial/).

## informal introduction

<https://docs.python.org/3/tutorial/introduction.html>

### numbers

- Number types: 
    - `int`
    - `float`
    - also Decimal, Fraction and complex numbers...
- number operations:
    - `+`, `-`, `*` and `/`
    - `/` division always returns a float
    - `//` means floor division
    - `%` gets the remainder
    - `**` powers operator

In interactive mode the last printed expression is assigned to the variable `_`.

```python
>>> tax = 12.5 / 100
>>> price = 100.50
>>> price * tax
12.5625
>>> price + _
113.0625
>>> round(_, 2)
113.06
```

### strings

Use *raw strings* to ignore `\` backslash escapes (just put an `r` before the opening quote):
```python
# here \n means newline!
>>> print('C:\some\name')
C:\some
ame

# note the r before the quote
>>> print(r'C:\some\name')
C:\some\name
```

Use `"""triple quotes"""` for multiline string literals:
```python
print("""\
Usage: thingy [OPTIONS]
     -h                        Display this usage message
     -H hostname               Hostname to connect to
""")
```

Concatenate strings with `+`.

Repeat strings with `*`.
```python
>>> 3 * 'meleu'           
'meleumeleumeleu'
```

Two or more **string literals** next to each other are automatically concatenated. This is useful for situations like this:
```python
>>> text = ('Put several strings within parentheses '
            'to have them joined together.')
>>> text
'Put several strings within parentheses to have them joined together.'
```

Strings can be *indexed*.
```python
>>> word = 'Python'

>>> word[0]  # character in position 0
'P'

>>> word[5]  # character in position 5
'n'

>>> word[-1]  # last character
'n'

>>> word[-2]  # second-last character
'o'

>>> word[-6]
'P'

# out of range index results in error
>>> word[42]
# Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
# IndexError: string index out of range
```

Strings can also be sliced:
```python
# characters from position 0 (included) to 2 (excluded)
>>> word[0:2]
'Py'

# characters from position 2 (included) to 5 (excluded)
>>> word[2:5]
'tho'

# character from the beginning to position 2 (excluded)
>>> word[:2]
'Py'

# characters from position 4 (included) to the end
>>> word[4:]
'on'

# characters from the second-last (included) to the end
>>> word[-2:]
'on'

# out of range slice indexes are handled gracrfully
>>> word[4:42]
'on'

>>> word[42:]
''
```

Strings are immutable.

You can get the length of a string with `len()`

## more control flow tools

### defining  functions

<https://docs.python.org/3/tutorial/controlflow.html#defining-functions>

```python
def fib(n):
    """Print a Fibonacci series up to n."""
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
    print()
```

The first statement of the function body can optionally be a string literal to be used as the function's documentation, the [docstring](https://docs.python.org/3/tutorial/controlflow.html#tut-docstrings). It's good practice to include docstrings, so make a habit of it.


### more on defining functions

<https://docs.python.org/3/tutorial/controlflow.html#more-on-defining-functions>

#### keyword arguments

This function:
```python
def parrot(voltage, state='a stiff', action='voom', type='Norwegian Blue'):
    print("-- This parrot wouldn't", action, end=' ')
    print("if you put", voltage, "volts through it.")
    print("-- Lovely plumage, the", type)
    print("-- It's", state, "!")
```

can be called in any of the following ways:
```python
# 1 positional argument
parrot(1000)

# 1 keyword argument
parrot(voltage=1000)

# 2 keyword arguments
parrot(voltage=1000000, action='VOOOOOM')

# 2 keyword arguments
parrot(action='VOOOOOM', voltage=1000000)

# 3 positional arguments
parrot('a million', 'bereft of life', 'jump')

# 1 positional, 1 keyword
parrot('a thousand', state='pushing up the daisies')
```



