---
dg-publish: true
title: exercism: the most effective way to learn a new programming language
subtitle: Why I think exercism.org is the best way to learn a new programming language
slug: exercism
tags: programming, learn coding
domain: meleu.hashnode.dev
---

## Intro

In this article I show **my** reasons to believe that exercism.org is currently (2022) the best platform to learn a *new* programming language. And why it stands out from other similar platforms of coding challenges.

Expect to read some opinionated conclusions. 😇


## What is exercism?

In short: it's a platform where you can solve programming challenges and get mentored to improve your code.

It's a wonderful way to gain true fluency in your chosen programming language.

To know more, check their [Getting Started doc](https://exercism.org/docs/using/getting-started) and their [FAQ](https://exercism.org/docs/using/faqs).

And to check which languages they have available, check [this page here](https://exercism.org/tracks) (currently they have 61).


## Requisites

Two things:

- Familiarity with computer programming (any language)
- Not be afraid of the command line interface

Do note that I'm not saying *"learn programming"*. I'm assuming you already know how to program in a language and want to learn a new one.

Someone can argue and say that it is possible to learn programming from scratch with exercism. Sure I think it's possible, but it would require a lot of effort and willpower. If you have these requirements, definitely go for it! 🚀

I also need to mention that it's important to not be afraid of the command line. The exercism.org provides a way to solve the challenges directly in the browser, but to have the full experience it's important to perform some commands in the terminal.



## Why exercism and not `$otherCodingChallengeSite`?

Currently there's a lot of coding challenges websites out there. In [this article](https://www.freecodecamp.org/news/the-most-popular-coding-challenge-websites/) from freeCodeCamp.org you can see a list of 21 of them.

So why focusing on exercism.org?

Very good question. And to answer this we need to be mindful about our goal: **learn a new programming language**.

Most of those websites are great to make you improve your computational thinking, your "problem solving" skill. The exercises were usually created to challenge your thought process so you can bring a solution written in a language you're comfortable with.

This is a great exercise, but for our goal of learning a new language, I believe that exercism.org is better.

In exercism we have a thing called Syllabus.

A Syllabus is a tree of concepts that you need to internalize to get fluency in a specific programming language ([here's an example](https://exercism.org/tracks/ruby/concepts) for the Ruby language).

Each concept has a set of exercises and the concepts depend on one another. You need to work on some exercises from a previous concept to unlock the next ones.

The cool thing is that some of these exercises are not *that* challenging. They were created to make you explore this and that feature of the language you're studying. Such exercises were not exactly created to stress your problem solving skill.

If you go to a service like HackerRank to *learn* Ruby, you'll probably spend more time and mental energy, as you'll need to 1) thinking about how to solve the challenge and 2) translating your thoughts into Ruby code. Of course this is an awesome service! But go for it *after* you have some fluency with the language.

So, that's why I think exercism is a better choice to learn a new language

**NOTE**: Although the most famous programming languages has a Syllabus, not all languages available in the platform has one.


## Cool features in exercism.org

Note: the features I'm going to highlight here are not en exclusivity of exercism.

### The challenges use Test Driven Development (TDD)

That means that you're going to code your solutions and run the tests that will promptly tell you if your solution is correct.

You'll be able to use that famous mantra: "Make it work. Make it right. Make it fast."

Alright, you don't need to spend time making it fast. At this stage our mantra should be: "Make it work. Make it right. Make it idiomatic."

Here's how I do it:

1. I solve the challenge as fast as I can (sometimes in a ugly hacky way). All tests are passing.
2. I do my best to clean up my code. All tests are still passing.
3. I submit my solution, mark the challenge as solved and go check other people's code. That's when I'll be able to make my code idiomatic.

The funniest part of learning with TDD is that you can fearlessly change your code. You just have to run the tests again to make sure your code is correct!


### You learn a lot by looking other people's solutions

Once you submit your solution and all tests are passing, you'll have access to the solutions submitted by others. That's an awesome way to learn the more idiomatic solutions.

I've been learning a lot with this while learning Ruby! I check their solutions and then go to the [Ruby documentation](https://ruby-doc.org/) to understand what they're doing. Sometimes I shamelessly get inspiration from other people's code and refactor my solution, run the tests, and submit my solutions again.

Maybe you can feel kinda guilty because you're copying someone else's solution. I know how it feels... 😅 Get rid of this thought! This is not school, there are no grades here. It's also not a competition, no one cares who has the best solution. We're here to learn as fast as possible, anything is allowed to achieve that goal!


### You can ask for mentorship

Another great feature in exercism is that they have a great mentoring system.

The website encourage and offers easy ways to ask and offer mentorship. This is a great way to learn more about the language and also work in the so called *soft skills*. The interaction with other people is also a great experience.


When I'm done playing with a challenge, I spend some time making notes about the new stuff I learned. And that leads us to the next topic...


### Tip: keep your solutions and notes in a repository

I highly recommend that you keep your solutions in a git repository. If it's going to be public or private, is up to you. But create one.

I have a public repository for this purpose: <https://github.com/meleu/exercism>

Here's an example of my notes for [bash](https://github.com/meleu/exercism/blob/master/bash/README.md) and this one for [Ruby](https://github.com/meleu/exercism/blob/master/ruby/README.md).

During your programmer's life you'll quite frequently stumble on a problem and think "hey wait! I think I already solved this in the past!". Having a repository to where you can go and search for how you solved that problem in the past is invaluable!

## Conclusion

I showed in this article why I think exercism is an awesome platform to learn a new programming language. Also why it stands out from other similar platforms of coding challenges.
