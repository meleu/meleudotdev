## Chapter 2 - Metaphors for a Richer Understanding of Software Development

Metaphors are heuristics, not algorithms. Therefore they are not mutually exclusive, you can use more than one metaphor to better understand software. Choose one that works for you and for your target audience.

#### Algorithm vs. Heuristic

 > An algorithm is a set of well-defined instructions for carrying out a particular task. (...) **A heuristic is a technique that helps you look for an answer.**
 > 
 > (...) An algorithm gives you the instructions directly. **A heuristic tells you how to discover the instructions** for yourself, or at least where to look for them. (...)
> 
> **Here is an algorithm** for driving to someone's house: Take Highway 167 south to Puyallup. Take the South Hill Mall exit and drive 4.5 miles up the hill. Turn right at the light by the grocery store, and then take the first left. Turn into the driveway of the large tan house on the left, at 714 North Cedar.
> 
> **Here's a heuristic** for getting to someone's house: Find the last letter we mailed you. Drive to the town in the return address. When you get to town, ask someone where our house is. Everyone knows us—someone will be glad to help you. If you can't find anyone, call us from a public phone, and we'll come get you.

I was amazed by this. To know what heuristics is. I noticed that it's quite common to get myself looking for the "heuristics" for doing something instead of blindly accepting the "algorithm" being offered. It's good to know it has a name.

What I was used to say: "I don't want to just solve **this** problem. I want to **know how to solve** the same kind of problem everytime I face it."

Now I can say: "I'm looking for the heuristics to solve this problem."

### 2.3 Common Software Metaphors

#### ✍️ Software Penmansip: Writing Code

I don't agree with this understanding from the author:

> The writing metaphor suggests that developing a program is like writing a *casual letter* [I don't see this metaphor like this] - you sit down and write it from start to finish. It doesn't require any formal planning and you figure out what you want to say as you go.

- Examples: book [[The Elements of Programming Style]]
- Useful for individual's work or small-scale projects.
- Where this metaphor does NOT work well:
    - in writing, a high premium is placed on originality
    - in software construction, trying to create truly original work is often less effective than focusing on the reuse of design ideas, code and test cases.
- "Plan to throw one away; you will, any how." - Fred Brooks, author of [[O Mitico Homem-Mes]]
    - "If you plan to throw one away, you will throw away two." - Reply from Craig Zerouni
    - My interpretation: "Do not plan to throw away, but be aware that it can happen."
    - It's not that simple to throw away a very large and expensive project.

**IMO**: the criticism here only exist when trying to encompass the whole software development process in the writing metaphor. If we clearly highlight that we are talking about actually writing code (after a minimal planning) this metaphor is useful.


#### 🌱 Software Farming: Growing a System

> Create software as you plant seeds and grow crops. You design a piece, code a piece, test a piece, and add it to the system a little bit at a time. By taking small steps, you minimize the trouble you can get into at any one time.

- The incremental technique is valuable, but the farming metaphor is terrible
- The weakness is its suggestion that you don't have any direct control over how the software develops (like "just plant and let the time/sun/earth do their job").



#### 🦪 Software Oyster Farming: System Accretion

> Accretion:  growth or increase in size by a gradual external addition or inclusion.

- add to your software systems a small amount at a time
- other words
    - incremental
    - iterative
    - adaptive
    - evolutionary
- **first make the simplest possible version of the system that will run** (aka MVP)
- it's a metaphor that seems to be aligned with the "Agile Manifesto"
- **the strength of the incremental metaphor is that it doesn't overpromise**



#### 🏗️ Software Construction: Building Software

- implies various stages of planning, preparation, and execution that vary in kind and degree depending on what's being built.
- suggests that careful preparation is needed
- illuminates the difference between large and small projects
- **"if you're building a house [rather than a doghouse], the building process is more complicated, and so are the consequences of poor design"**
- both building construction and software construction benefit from appropriate levels of planning.
- **A well-planned project improves your ability to change your mind later about details.**

**Costs**:

> In building a house, materials are somewhat expensive, but the main expense is labor. In building a software product, materials are even less expensive, but labor costs just as much.

> Making structural changes in a program costs more than adding or deleting peripheral features.

> A project with double the original size costs more than double the original budget.

**Buy vs. Build**:

It generally costs less to use pre-built components than coding all of them from scratch.

> In building a house, you won't try to build things you can buy already built. You'll buy a washer and dryer, dishwasher, refrigerator, and freezer. Unless you're a mechanical wizard, you won't consider building them yourself. (...) If you're building a software system, you'll do the same thing. You'll make extensive use of high-level language features rather than writing your own operating-system-level codce. You might also use prevuilt libraries of container classes, scientific functions, user interface classes, and database-manipulation classes. It generally doesn't make sense to code things you can buy ready-made.
> 
> If you're building a fancy house with first-class furnishings, however, you might have your cabinets custom-made. (...) You might have windows custom-made in unusual shapes and sizes. This customization has parallels in software development. If you're building a first-class software product, you might build your own scientific functions for better speed or accuracy. You might build your own container classes, user interface classes, and database classes to give your system a seamless, perfectly consistent look and feel.


> Choosing the right tool for each problem is one key to being an effective programmer.

#### Combining Metaphors

> Since metaphors are heuristic, rahter than algorithmic, they are not mutually exclusive. Use whatever metaphor (or combinations) that stimulates your  own thinking or communicates well with others on your team.
