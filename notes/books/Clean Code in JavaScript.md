---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: "2023-12"
author: "James Padolsey"
---

# Clean Code in JavaScript

## main takeaway

TBD...

---
## Tenets of Clean Code

- Reliability
- Efficiency
- Maintainability
- Usability

### Reliability

- Reliability
    - Correct
    - Stable
    - Resilient

#### Correctness

> It is vital to start with the user and their problem; from that, we can establish a set of clear requirements that can be independently tested.

#### Stability

> The continued correct behavior given different valid inputs and situations.

The way to stability is through having a full understanding of all different valid/invalid inputs.

Stability is validated with a test suite that exposes the code to various inputs and situations.

#### Resilience

aka **fault tolerance**.

The examples in the book are interesting:

1. An escalator, when functioning correctly, will convey people via a set of moving metallic steps (...). Ifthe system fails, then the escalator remains static, acting as a regular flight of stairs.
2. An application that delivers the transcription of an audio if the client is unable to play mp3 content.

**My note**:  this "fault tolerance" talk made me remember the [Rule of Repair](http://www.catb.org/esr/writings/taoup/html/ch01s06.html#id2878538) ([[The Art of Unix Programming]]):

> Repair what you can - but when you must fail, fail noisily and as soon as possible.
>
> (...) write your software to cope with incorrect inputs and its own execution errors as gracefully as possible. **But when it cannot, make it fail in a way that makes diagnosis of the problem as easy as possible.**


### Efficiency

Pretty obvious... "Don't be slow."

This topic makes me remember the [[Response-Time Limits for humans]].

### Maintainability

- Maintainability
    - Adaptability
    - Familiarity

#### Adaptability

Two harmful characteristics that might cause trouble: fragility and rigidity

- **Fragility**: change in one place affect different parts of the system.
- **Rigidity**: hard to accommodate change easily. Ex.: having to rewrite code in several places just to accomplish one change (this reminds me the "referrals" in a company I worked).

#### Familiarity

> Most software, regardless of the problem domain, will have the concept of **create, read, update, and delete (CRUD)**. These make up the famous verbs of persistence storage. Most software can be thought of as fancy middleware sitting atop persistent storage.

### Usability

I liked this way of listing the group of users of our work:

> - People wishing to wield the power of our code via interfaces (GUIs, APIs, and so on).
> - People wishing to make changes to our code to accomplish new tasks or fix bugs.

My thoughts after realizing the existence of this second group:

We, as coders, should be defending the interests of that second group. Here are the reasons:

- The first group are already very visible and they'll be vocal if we don't do a good job (we think about them, but we can count that they'll be vocal if we don't do a good work).
- The second group will use our code later. When it happens we probably won't be there to think about what we did wrong, how to do better...
- (There's a high chance that the user will be ourselves)


### User stories

> User stories typically take the following form:
> 
> *As a \[persona\], I want to \[want\], so that \[purpose\]...*


---

## The Enemies of Clean Code

> None of these enemies should be considered *your* enemies; instead they should be thought of as agitators of clean code.

1. JavaScript
2. Management
3. Self
4. The cargo cult

### Enemy 1 - JavaScript

My words: The "accessibility" of JavaScript makes it usable by newbies, who produce messy code.

### Enemy 2 - management

- pressure to ship
- bad metrics
- lack of ownership

#### Pressure to ship

For the "pressure to ship" part, I like remember the [[Clean Code - 1. Clean Code]]:

> Quality vs. Business Pressure -> Managers may defend the schedule and requirements with passion; but that's their job. It's *your* job to defend the code with equal passion.

Some heuristics to ensure a healthy code base:

- Do not ship a feature or fix without tests.
- Pay off technical debt frequently.
- Communicate regularly.


#### Bad metrics

> Over time if a metric is chased too ambitiously, it may end up corrupting the very thing it was trying to measure.
> 
> *"When a measure becomes a target, it ceases to be a good measure."*


