---
dg-publish: true
title: exercism: The most effective way to learn a new programming language
subtitle: 
slug: exercism
tags: programming, learn coding
domain: meleu.hashnode.dev
# remove ignorePost line when done
ignorePost: true
---

%%Convert this to a "standalone" article%%

## Why is exercism so cool?

**There's a conceptual sequence to follow**

Start with the [exercises from the Ruby syllabus](https://exercism.org/tracks/ruby/concepts), so you can practice with the exercises focused on specific concepts of the language.

That's why I think that **for the purpose of getting used with the language**, exercism stands out from other "coding challenges" services like HackerRank and CodeWars. Those other services are also awesome, but they're more focused on "problem solving". Usually you do their challenges with a language you're comfortable with so you can improve your thinking.

If you go to a service like HackerRank to *learn* Ruby, you'll probably spend more time and mental energy, as you'll need to 1) thinking about how to solve the challenge and 2) translating your thoughts into Ruby code. Of course this is an awesome service! But go for it *after* you have some fluency with the language.

Let's remember our goal one more time: be fluent with Ruby as quick as possible!

The challenges at exercism are better for this purpose because they're simple and you'll mostly spend time researching how to convert those simple algorithms into Ruby code.


**The challenges use Test Driven Development (TDD)**

That means that you're going to code your solutions and run the tests that will promptly tell you if your solution is correct.

You'll be able to use that famous mantra: "Make it work. Make it right. Make it fast."

Alright, you don't need to spend time making it fast. At this stage our mantra should be: "Make it work. Make it right. Make it idiomatic."

Here's how I do it:

1. I solve the challenge as fast as I can (sometimes in a ugly hacky way). All tests are passing.
2. I do my best to clean up my code. All tests are still passing.
3. I submit my solution, mark the challenge as solved and go check other people's code. That's when I'll be able to make my code idiomatic.


**You'll learn a lot look other people's solutions**

Once you submit your solution and all tests are passing, you'll have access to the solutions submit by other people using the exercism platform. That's an awesome way to learn the more idiomatic solutions.

I've been learning a lot with this! I check their solutions and then go to the [Ruby documentation](https://ruby-doc.org/) to understand what they're doing. Sometimes I shamelessly get inspiration from other people's code and refactor my solution, run the tests, and submit my solutions again.

Maybe you feel kinda guilty that you're copying someone else's solution. I know how it feels... 😅 Get rid of this thought! This is not school nor a competition, no one cares who has the best solution or who did the best one. We're here to learn as fast as possible, anything is allowed to achieve that goal!

The funniest part of learning with TDD is that you can fearlessly change your code. You just have to run the tests again to make sure your code is correct!

When I'm done playing with a challenge, I spend some time making notes about the new stuff I learned. And that leads us to the next topic...

### tip: keep your solutions and notes in a repository

I highly recommend that you keep your solutions in a git repository. If it's going to be public or private, is up to you. But create one.

I have a public repository for this purpose. And I keep [this file with my notes](https://github.com/meleu/exercism/blob/master/ruby/README.md) highlighting what I learned from each exercise.

During your programmer's life you'll quite frequently stumble on a problem and think "hey wait! I think I already solved this in the past!". Having a repository to where you can go and search for how you solved that problem in the past is invaluable!

