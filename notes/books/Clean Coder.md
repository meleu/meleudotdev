---
dg-publish: true
tags:
  - books
  - books/tech
read-timestamp: 2023
author: Robert Martin
---

# Clean Coder

[TOC]

---

## main takeaways

- Don't make a mess to ship faster!
- Software MUST be easy to change! Our industry is based on this. Don't violate this principle with your mess!
- mentoring: the benefit of teaching is strongly in favor of the teacher.
- Software professionals are always on the lookout for growing messes, and they clean them as soon as they are recognized.

---

## 1. Professionalism

### don't be irresponsible neither egocentric

This part shows that "by-passing" tests, besides irresponsible, is an egocentric action:

> (...) shipping without testing the routine had been irresponsible. **The reason I neglected the test was so I could say I had shipped on time**. It was about me saving face. I had not been concerned about the customer, nor about my employer. I had only been concerned about my own reputation.

This also reminds me what the author says in [[Desenvolvimento Agil Limpo]], about the doctor washing the hands...


### we must not create bugs

But wait! Software is too complex to create without bugs. Are you telling us we must be perfect?!

> No, I'm telling that you must be **responsible for your imperfections.** The fact that bugs will certainly occur in your code does note mean you aren't responsible for them.


### your code MUST be easy to change

Don't make a mess just to ship faster!

> The fundamental assumption underlying all software projects is that software is easy to change. If you violate this assumption by creating inflexible structures, then you undercut the economic model that the entire industry is based on.
> 
> In short: *You must be able to make changes without exorbitant costs.*


### your career is *your* responsibility

> Your career is your responsibility. It is not your employer's responsibility to make sure you are marketable. It is not your employer's responsibility to train you, or to send you to conferences, or to buy you books. These things are *your* responsibility.



### topics to always have in mind

- ⭐ Design Patterns: yeah, the GoF book. He anso mention the POSA books.
- ⭐ Design principles: SOLID.
- ⭐ Disciplines: TDD, OOP, CI/CD, Pair Programming.
- Project Management Methodologies: XP, Scrum, Lean, Kanban, Waterfall, etc.
- Artifacts: UML, DFDs, Structure Charts, Petri Nets, *State Transition Diagrams and Tables*, flow charts and decision tables.


### mentoring

> the benefit of teaching is strongly in favor of the teacher.


### identify with your employer/customer

> It's easy to fall into an *us versus them* attitude with your employer. Professionals avoid this at all costs.


---

## 2. Saying No

> Professionals speak truth to power. Professionals have the courage to say no to their managers.
> 
> (...)
> 
> Slaves are not allowed to say no. Laborers may be hesitante to say no. But professionals are *expected* to say no. Indeed, good managers crave someone who has the guts to say no. It's the only way you can really get anything done.
> 
> (...) hard decisions are best made through the confrontation of adversarial roles.
> 
> Managers are people with a job to do, and most managers know how to do that job pretty well. Part of that job is to pursue and defend their objectives as aggressively as they can.
> 
> By the same token, programmers are also people with a job to do, and most of them know how to get that job done pretty well. If they are professionals they will pursue and defend *their* objectives as aggressively as *they* can.

### talking to non-technical managers

> Providing too much detail can be an invitation for micro-management.


### There is no try

> The word *try* has many definitions. The definition I take issue with here is "to apply extra effort." (...) If there is extra effort you could apply, then you and your team must not have been applying all your effort before. (...)
> 
> The promise to try is an admission that you've been holding back, that you have a reservoir of extra effort that you can apply. (...)
> 
> By promising to try you are promising to change your plans. After all, the plans you had were insufficient. (...)
>
> If you are holding back some energy in reserve, if you don't have a new plan, if you aren't going to change your behavior, and if you reasonably confident in your original estimate, them promising to try is fundamentally dishonest. **You are *lying***. And you are probably doing it to save face and to avoid a confrontation.


---

## 3. Saying Yes

### Recognizing Lack of Commitment

Signs of noncommitment:

- **Need/should**
    - We need to get this done.
    - I need to lose weight.
    - Someone should make that happen.
- **Hope/wish**
    - I hope to get this done by tomorrow.
    - I hope we can meet again some day.
    - I wish I had time for that.
    - I wish this computer was faster.
- **Let's** (not followed by "I ...")
    - Let's meet sometime.
    - Let's finish this thing.

> The secret ingredient to recognizing real commitment is to look for sentences that sound like this: I will ... by ... (example: I will finish this by Tuesday.)

> You can only commit to things that you have full control of.

### communicate as soon as possible

> If you can't make your commitment, the most important thing is to raise a red flag as soon as possible to whoever you committed to.
> 
> The earlier you raise the flag to all stakeholders, the more likely there will be time for the team to stop, reassess the current actions being taken, and decide if something can be done or changed (in terms of priorities, for example). By doing this, your commitment can still be fulfilled, or you can change to a different commitment.

### conclusion

> Professionals are not required to say yes to everything that is asked of them. However, they should work hard to find creative ways to make "yes" possible. When professionals say yes, they use the language of commitment so that there is no doubt about what they've promised.


---


## 4. Coding

> Doctors don't like to reopen patients to fix something they did wrong. Lawyers don't like to retry cases that they flubbed up. A doctor or lawyer who did that too often would not be considered professional. Likewise, a software developer who creates many bugs is acting unprofessionally.


### being late

> *regularly* measure your progress against your goal, and come up with three fact-base en ates: best case, nominal case, and worst case. Be as honest as you can about all three dates. *Do not incorporate hope into your estimates!* Present all three numbers to your team and stakeholders. Update these numbers daily.
>
> (...) Hope is the project killer. Hope destroys schedules and ruins reputations. Hope will get you into deep trouble. If the trade show is in ten days, and your nominal estimate is 12, you *are not* going to make it. Make sure that the team and the stakeholders understand the situation, and don't let up until there is a fall-back plan. Don't let anyone else have hope.

### improve schedule = reduce scope

> The only way to improve the schedule is to reduce scope. *Do not be tempted to rush.*

This is also mentioned in the [[Desenvolvimento Agil Limpo]].

### false delivery

> Of all the unprofessional behaviors that a programmer can indulge in, perhaps the worst of all is saying you are done when you know you aren't. Sometimes this is just an overt lie, and that's bad enough. But the far more insidious case is when we manage to rationalize a new definition of "done." We convince ourselves that we are done *enough*, and move on to the next task. We rationalize that any work that remains can be dealt with later when we have more time.

What is really sad here is that this is a contagious practice. If one programmer does it, others will see and follow suit.


### definition of "done"

> You avoid the problem of false delivery by creating an independent definition of "done."

You can achieve this with acceptance tests.

> The \[acceptance] tests should be understandable by the stakeholders and business people, and should be run frequently.



### helping others

> You should be conscious of the status of your teammates. If you see someone who appears to be in trouble, you should offer your help. You will likely be quite surprised at the profound effect your help can have. It's not that you are so much smarter than the other person, it's just that a fresh perspective can be a profound catalyst for solving problems.


---


## 5. Test Driven Development

### writing tests later

> the tests you write after the fact are *defense*. The tests you write first are *offense*. After-the-fact tests are written by someone who is already vested in the code and already knows how the problem was solved. There's just no way those tests can be anywhere near as incisive as tests written first.


---

## 6. Practice

> Consider a guitarist like Carlos Santana. The music in his head simply comes out his fingers. He does not focus on finger positions or picking technique. His mind is free to plan out higher-level melodies and harmonies while his body translates those plans into lower-level finger motions.

I want to achieve this kind of dexterity in vim! 😃

### katas


- <https://katas.softwarecraftsmanship.org/>: Videos to watch
- <https://kata-log.rocks>: katas to practice

other sites for practicing:

- exercism.org
- HackerRank.com

### open source

> One way to stay ahead of the curve is to do what lawyers and doctors do: Take on some pro-bono work by contributing to an open-source project.


---

## 7. Acceptance Testing

> The purpose of acceptance tests is communication, clarity, and precision. By agreeing to them, the developers, stakeholders, and testers all understand what the plan for the system behavior is. Achieving this kind of clarity is the responsibility of all parties. Professional developers make it their responsibility to work with stakeholders and testers to ensure that all parties know what is about to be built.


### who writes acceptance tests?

> In an ideal world, the stakeholders and QA would collaborate to write these tests, and developers would review them for consistency. In the real world, stakeholders seldom have the time or inclination to dive into the required level of detail. So they often delegate the responsibility to business analysts, QA, or even developers. If it turns out that developers must write these tests, then take care that the developer who writes the test is not the same as the developer who implements the tested feature.
> 
> Typically business analysts write the "happy path" versions of the tests, because those tests describe the features that have business value. QA typically writes the "unhappy path" tests, the boundary conditions, exceptions, and corner cases. This is because QA's job is to help think about what can go wrong.


### acceptance and unit tests

> Acceptance tests are not *unit* tests. Unit tests are written *by* programmers *for* programmers. They are formal design documents that describe the lowest level structure and behavior of the code. The audience is programmers, not business.
> 
> Acceptance tests are written *by* the business *for* the business (even when you, the developer, end up writing them). They are formal requirements documents that specify how the system should behave from the business' point of view. The audience is the business *and* the programmers.


### frontend

> There is a design principle called the Single Responsibility Principle (SRP). This principle states that you should separate those things that change for different reasons, and group together those things that change for the same reasons. GUIs are no exception.

> Testing through the GUI is always problematic unless you are testing *just* the GUI. The reason is that the GUIs is likely to change, making the tests very fragile. When every GUI change breaks a thousand tests, you are either going to start throwing the tests away or you are going to stop changing the GUI. Neither of those are good options. So write your busniess rules tests to go through an API just below the GUI.

---

## 8. Testing Strategies

No notes in this chapter...


---

## 9. Time Management

> The person inviting you to a meeting is not responsible for managing your time. Only *you* can do that. So, when you receive a meeting invitation, don't accept unless it is a meeting for which your participation is immediately and significantly necessary to the job you are doing now.


### arguments/disagreements

> Kent Beck once told me something profound: "**Any argument that can't be settled in five minutes can't be settled by arguing.**" The reason it goes on so long is that there is no clear evidence supporting either side. The argument is probably religious, as opposed to factual.


### focus-manna

> After you have expended your focus-manna, you have to recharge by doing unfocused activities for an hour or more.


### muscle focus

> There is something peculiar about doing physical disciplines such as martial arts, tai-chi or yoga. Even though these activities require significant focus, it is a different kind of focus from coding. It's not intellectual, it's muscle. And somehow muscle focus helps to recharge mental focus.


### input vs. output

> balance output with appropriate input. Writing software is a *creative* exercise. I find that I am most creative when I am exposed to other people's creativity.


### driving the system into a swamp

> You create a solution to a simple problem, being careful to keep the code simple and clean. As the problem grows in scope and complexity you extend that code base, keeping it as clean as you can. At some point you realize that you made a wrong design choice when you started, and that your code doesn't scale well in the direction that the requirements are moving.
> 
> This is the inflection point! You can still go back and fix the design. But you can also continue to go forward. Going back looks expensive because you'll have to rework the existing code, but going back will *never* be easier than it is now. If you go forward you will drive the system into a swamp from which it may never escape.

Wow! A lot of links here! It reminds me the [[Code Complete - 5.2. Sotfware's Primary Technical Imperative - Managing Complexity]]. Also the "sunk costs falacy" and the [[Habito Eficaz 2 - Comece com o objetivo em mente#Liderar vs. Gerenciar]].

> Moving forward through a swamp, when you *know* it's a swamp, is the worst kind of priority inversion.


### conclusion

> \[Software professionals] are always on the lookout for growing messes, and they clean them as soon as they are recognized. There is no sadder sight than a team of software developers fruitlessly slogging through an ever-deeping bog.

---

## 10. Estimation

> Professionals don't make commitments unless they *know* they can achieve them.

> Errors in estimates tend toward underestimation and not overestimation.


---

## 11. Pressure

### staying clean

> The way to go fast, and to keep the deadlines at bay, is to stay clean. Professionals do not succumb to the temptation to create a mess in order to move quickly. Professionals realize that "quick and dirty" is an oxymoron. **Dirty always means slow!**


---

## 12. Collaboration

### programmers vs. employers

> It's good to be passionate about what we do. But it's also good to keep your eye on the goals of the people who pay you.


---

## 13. Teams and Projects

I saw this when working for a big telecom company.

> Often a project at a bank will be a relatively small job that requires one or two programmers for a few weeks. This project will often be staffed with a project manager, **who is also managing other projects**. (...) with a business analyst, **who is also providing requirements for other projects**. (...) with some programmers who are also working on other projects. A tester or two will be assigned, and they too will be working other projects.
> 
> See the pattern? The project is so small that no individual can be assigned to it on a full-time basis. Everybody is working on the project at 50, or even 25, percent.
> 
> Now here's a rule: **There is no such thing as half a person**.

The sad thing is that sometimes I see professionals going to this scenario by themselves.

---

## 14. Mentoring, Apprenticeship, and Craftmanship

What I learned from this chapter is that reading good books, following good authors, also make them your mentors.

I have good examples of these situations, not only from books, but contributing to open source and observing how people work.


