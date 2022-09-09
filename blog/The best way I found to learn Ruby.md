---
dg-publish: true
title: The best way I found to learn Ruby
subtitle: What I did to acquire fluency in the Ruby language
slug: learn-ruby
tags: ruby
domain: meleu.hashnode.dev
---

## Table of Contents

- [Intro](#intro)
- [TL;DR](#tldr)
- [Requisites](#requisites)
    - [Why Ruby?](#why-ruby)
- [Aggressively Ignore](#aggressively-ignore)
- [First contact with the language](#first-contact-with-the-language)
- [Challenges from exercism.org](#challenges-from-exercismorg)
    - [Why is exercism so cool?](#why-is-exercism-so-cool)
    - [tip: keep your solutions and notes in a repository](#tip-keep-your-solutions-and-notes-in-a-repository)
- [Ruby Koans - internalizing the fundamentals](#ruby-koans---internalizing-the-fundamentals)
    - ["Installing" the Ruby Koans](#installing-the-ruby-koans)
- [Conclusion](#conclusion)
- [Things I wanna try later](#things-i-wanna-try-later)


## Intro

In this article I'm going to share things that are working quite well for me to learn the Ruby language.

The goal here is NOT to learn programming neither learn how to build web applications. I don't even talk about Rails here.

The goal here is solely and exclusively to acquire fluency in pure Ruby as quick as possible. Therefore, I'm assuming the reader already know some (any) programming language.

You probably know the typical advice: "practice a lot". That's a valid one, but too vague. In this article I'm sharing what I used to practice a lot.


## TL;DR

- **Goal**: acquire basic fluency in pure Ruby as quick as possible
- Requisites
    - Be comfortable with the command line interface
    - Familiarity with programming
    - Basics of OOP would help (but it's not mandatory)
    - Find a reason to learn Ruby
- Aggressively ignore!
- Read [Ruby in 100 minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html) to get a good overview of the syntax
- Do the challenges from the [Ruby track in exercism.org](https://exercism.org/tracks/ruby)
- Play with the [Ruby Koans](https://github.com/edgecase/ruby_koans) to internalize some of the most fundamental concepts of language


## Requisites

Most of the things I'm showing here requires some commands on the terminal, so I'm assuming you're comfortable with the command line.

As I said, the intention here is not to learn programming (that would be too basic) neither learning how to create web applications (that would be too advanced). We just want to be fluent with Ruby as quick as possible.

Some knowledge about Object-Oriented Programming would make some things easier, but it's not mandatory. Just follow the examples and go with the flow.

Knowing the basics of `git` would help. Not exactly to learn, but to save your code and notes in a repository. But it's also NOT mandatory. Don't sweat over it if you don't know git.


### Why Ruby?

Before investing time on doing something, you need a good reason to do it!

I'm impressed about some great applications built with Ruby, like GitHub, GitLab, Airbnb, Shopify, Basecamp. I also read a lot of good things about the Ruby community and how they care about code quality, testing, well designed code, etc. But it never was enough to give me the motivation to go and try it.

My main reason to learn Ruby is because I'm going to a Web Development bootcamp, and their choice for the backend is Ruby on Rails. (why I chose such bootcamp is out of the scope of this article, maybe I write about it in the future)

During the process of learning Ruby I confirmed that it's indeed a pleasure to read and write Ruby code.

If you want to more info about how Ruby is cool, I'm sure you can find tons of good articles and videos if you google for it. Maybe you can start [here in the official "about" page of the language](https://www.ruby-lang.org/en/about/) and see a couple of videos. 

Please please please! Once you're convinced you want to learn Ruby, stop looking for more material! This leads us to the next topic...


## Aggressively Ignore

As I said, the Ruby community cares about quality. And for this reason there are tons of good material out there. So many that you would have an analysis paralysis trying to pick one from the list.

Right now I'm holding myself to not put here some awesome links. I'm doing this because it's a rabbit hole!

Yeah, it can be a little paradoxical. I'm telling you to ignore the existing Ruby tutorials out there not because they're bad, but because they're actually good! The problem is that there are tons of them. It's overwhelming!

Let's resist this urge to find The Best™️ resource to learn the language and focus on our goal: be fluent in Ruby **as quick as possible**!

To get fluent quickly you don't need to read a lot books/tutorials/articles, neither watch a lot of videos. You just need to get the basics of the syntax and then practice a lot.


## First contact with the language

If you start googling things like "how to get started with Ruby" you'll probably stumble upon the "Ruby in Twenty Minutes" in the official page. I didn't enjoy that, I found it kinda unstructured. Then I went for another material.

I really enjoyed this one: [Ruby in 100 minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html). Straight to the point and shows the basic syntax of the language. It worked very well for me. 

Be sure to read the article with your `irb` open and trying all those commands to see the magic happening.

I particularly enjoyed learning the concept of [Blocks](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html#6.-blocks). Realizing that blocks are passed to methods clicked some things in my brain.

OK, now that we know the syntax, let's practice!


## Challenges from exercism.org

Now I suggest to solve the challenges in the [Ruby track on exercism.org](https://exercism.org/tracks/ruby). The challenges start very simple and smoothly progress.

You'll need to check these short [exercism Ruby Docs](https://exercism.org/docs/tracks/ruby) so you can configure your programming environment to work on exercism challenges.

### Why is exercism so cool?

**There's a conceptual sequence to follow**

Start with the [exercises from the Syllabus](https://exercism.org/tracks/ruby/concepts), so you can practice with the exercises focused on specific concepts of the language.

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


## Ruby Koans - internalizing the fundamentals

According to the [Wikipedia](https://en.wikipedia.org/wiki/Koan):

> A koan is a story, dialogue, question, or statement which is used in Zen practice to provoke the "great doubt" and to practice or test a student's progress in Zen.

Uhm... This sounds very abstract... 🤔

In practice, the Ruby Koans are broken tests. They're intentionally broken so you can look at the code and "easily" figure out how to fix it.

Here's an example of one of the introductory koans (the `__` double underscore is where you need to put something to fix the test):
```ruby
# To understand reality, we must compare our expectations against
# reality.
def test_assert_equality
  expected_value = __
  actual_value = 1 + 1
  
  assert expected_value == actual_value
end
```

You just need to replace the `__` with the correct value and run the tests again.

I found this way of learning very funny and highly optimized.

Instead of reading a wordy text explaining code, you look directly at code. You get used to read and understand Ruby code faster.

If you're having a hard time to get started with the Ruby Koans, maybe [this video](https://youtu.be/H0jPLFE17do?t=240) can help you to get started (the relevant part starts at 4 minutes).


### "Installing" the Ruby Koans

The [Ruby Koans website](http://rubykoans.com/) has a link to a zip file with the Koans. As I'm assuming you have some `git` knowledge, I suggest to get the files from [their repository](https://github.com/edgecase/ruby_koans).

Here's the quick way to do that:

```bash
# clone the repo
git clone git@github.com:edgecase/ruby_koans.git
cd ruby_koans

# check if ruby is installed
ruby --version
rake --version

# generate the koans
rake gen

# if you want you can also regenerate the koans
rake regen

# to run all the tests in the koans' creator order:
rake
# it's the same as:
ruby path_to_enlightenment.rb

# you can also run a specific one, example:
ruby about_symbols.rb
```

Most of the time spent learning with Ruby Koans is you iterating through these steps:

1. run the test on the terminal and see where it's breaking
2. edit the `about_*.rb`  file to fix the test
3. repeat

Sooner or later you'll get bored of alternating between the terminal (to run the tests) and the editor (to fix them).

To make your life simpler, you can use the `observr` gem. This way:
```shell
# install observr gem
gem install observr

# watch changes in the .rb files
observr ./koans/koans.watchr
```

Now you can keep a window on the terminal and another one on the editor. Every time you save your code on the editor, the terminal will show you the tests results.

When you advance from the introductory Koans, you'll notice that you need to test some stuff to understand how to fix the test. At this point you'll need to have an `irb` instance at hand to run some code and learn.

**Don't forget to take notes when you learn a new concept!**


## Conclusion

In this article I shared my approach to acquire fluency in the Ruby programming language.

It's an approach with the explicit goal of being fluent as quick as possible. It's highly focused on practice, which means writing and reading Ruby code.

If you follow this strategy for a couple of weeks, you'll be reasonably comfortable with the Ruby language.


## Things I wanna try later

This is a list of material that I'm planning to consume later. Only **after** acquiring the desired fluency.

As I didn't yet went through them, I'm not endorsing this content. But as they were suggested by experienced Rubyists I know, I decided to share it here.

- [Practical Object-Oriented Design](https://www.poodr.com/) - a book by [Sandi Metz](https://sandimetz.com/) (btw, if you see something by Sandi, pay attention that it's probably highly valuable).
- [Confident Ruby](https://avdi.codes/books/) - book from [Avdi Grimm](https://avdi.codes/)
- [Flawless Ruby](https://graceful.dev/courses/flawless-ruby/) - the course *after* the intro-to-Ruby course, also by Avdi Grimm
- [Metaprogramming Ruby 2](https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/) - book by Paolo Perrotta
