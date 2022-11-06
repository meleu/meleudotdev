---
dg-publish: true
---
# Testing Ruby with RSpec: The Complete Guide

- <https://www.udemy.com/course/testing-ruby-with-rspec>

## Types of Tests

Three layers of tests:

- **Unit tests**: focus on individual units (a class, module, object or method)
- **Integration tests**: 
- **E2E tests**: focus on a feature and its interaction with the entire system.
    - specs hard to write, hard to troubleshoot and run slow.

We should have more unit tests, then integration tests, and then end-to-end tests.

![[RSpec - udemy - types of tests.png]]

I also like what Kent Dods says in <https://testingjavascript.com>:

![[RSpec - udemy - testing trophy.png]]

## Install RSpec and Start a Project

Install globally:
```bash
gem install rspec
```

Start a new project
```bash
mkdir rspec-course
cd  rspec-course
rspec --init

```