---
dg-publish: true
---
### Code Complete - 3.2. Determine the Kind of Software You're Working On

> Posted on [codingcareer forum](https://codingcareer.circle.so/c/lindy-library/book-code-complete-by-steve-mcconnel).

([On discord I mentioned](https://discord.com/channels/711240423917486090/736616091463319614/999029144606228570) the book "[Code Complete (2nd Edition)](https://www.oreilly.com/library/view/code-complete-2nd/0735619670/)", by Steve McConnel. I'd like to move the conversation to here as a forum seems to fit better for longer conversations...)

For me it's a really good book with timeless knowledge. It's like a handy collection of programmer's wisdom - and that's why I'm posting this in the Lindy Library section of the forums. :)  
  
I think it's curious that I don't see this book being mentioned as much as other classics (my guess is because it was originally published by Microsoft Press, and, you know, "real hackers don't like Microsoft" 🤷‍♂️)...  
  
I'd like to highlight here one specific small part of the book that was very enlightening for me: the section 3.2 "Determine the Kind of Software You're Working On".  
  
That knowledge made a huge impact on me, and how I decide which project I should engage in. As I'm now able to infer if the project I'm about to join is highly bureaucratic, if I'll have autonomy, if I should care too much about security, architecture/design, testing, or if I should rush to reduce the time to market...

Here's a table that tries to summarize the "kind of softwares" knowledge. It lists different kinds of software and what to expect from them in regards to life-cycle, planning & management, requirements, design, testing, deployment, etc...

![[Code-Complete-table-kind-of-softwares.png]]

I'm gonna try to give a personal context to show how this knowledge is important when you need to decide which project you want to work on. First talking about an episode where I didn't have this knowledge, and later how this knowledge helped me.

### Frustration for not knowing the kind of software I was working on

As I mentioned in [my intro](https://codingcareer.circle.so/c/intros/greetings-from-brazil-i-m-meleu) I started my career in Tech as a DevOps Engineer. My first job was in a big Telecom company. Highly bureaucratic processes.

You know that excitement of young people, right? OK, I'm not that young, but, as a newcomer in the DevOps field, I was really excited! Before actually moving to this job I read everything about DevOps, not only about the tools, but about the "DevOps culture" (Dev + Ops working together, with shared goals).

So, I started that job wanting to anything to make Developers more productive. One little specific example, in order to make the pipeline faster, I was wanting to create a persistent volume to cache the dependencies. For a big Telecom company, the cost of this volume would be derisory, but the bureaucracy process to request it and get an approval is an herculean job.

My inexperience made me believe that I would be able to simply create a volume and talk to my boss about the benefits of it, and he would obviously agree that such a small cost would bring a big benefit in not only making the pipeline faster but saving network bandwidth.

I became negatively surprised when I realized that I (a DevOps Engineer) didn't have access to create a persistent volume. Also, my "boss" wasn't the person who could approve that. There were many layers of hierarchy to get such a simple (and cheap) thing that would benefit the company to release software faster.

At that time I hadn't read the "Determine the Kind of Software You're Working On", and I became kinda frustrated.

Currently I think I would understand better. That is a big Telecom company. They handle a huge amount of sensitive and private data. It makes sense to be extremely careful with IT processes. Also, they don't need to rush or care that much about "time to market". They are on this market for decades.

My initial excitement and will to "deliver faster" was highly influenced by the DevOps literature, which highly encourages velocity, "break things, fix them, make them stronger". Maybe I took that as something that the entire software industry value. Which is not true. Velocity has a huge importance for startups, to reduce the "time to market" and try new things faster. But the tech industry is more than only startups.


### How knowing the kind of software I was working on helped me

My second job as a DevOps Engineer was in a startup. "F\*ck yeah!"" Now I have autonomy! I can allocate computational resources from the Cloud Provider and I have only two layers of hierarchy to explain why I want to do and they usually see the benefits.

That's wonderful, right? Yes, but... The application we produce handles medical information. Not the kind of software where you can afford to break & fix things to make them stronger.

At a given time I (already equipped with the "know-the-kind-of-software" knowledge) had to talk to my managers: "Guys, this is a medical application! We already have `N` clients and we already have proved that this idea is viable. If we want to stay on this market for years we need to stop rushing to implement new features and start to pay the technical debt (me, wanting to spend more time planning/designing)... Also we can't allow people doing `X` and `Y` directly on production, they need to create a ticket for that (me, wanting to increase bureaucracy)..."

Of course they didn't gladly follow through on everything I said (especially regarding not rushing to implement new features), but they surely started to respect my opinions more.


