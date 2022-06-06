---
dg-publish: true
---
## When To Use Microservices (And When Not To!) - Sam Newman & Martin Fowler

- <https://youtu.be/GBTdnfD6s5Q>
- Book: Monolith to Microservices - Sam Newman


Question: When to use Microservices?

Sam Newman: There's a danger in our industry that we often focus on the activity and not on the outcome. We focus on the tech tool, not the thing that the tech tool let's you do. **A microservice architecture is a conscious choice you have made to implement something in that style because of some outcome you're looking for**.

What can microservices achitectures give you?

- More options to scale up applications
- Independent deployability
- Limit the "blast radius" of failure


**Takeaway #1:**

> Our industry tends to focus on tech instead of the outcome. One should use microservices as a means to obtain a desired outcome rather than for the sake of using a new technology.

---

Martin Fowler: Your default option should be not to use microservices, unless you have a really good reason.

Sam Newman: Microservices are not an on/off switch.


**Takeaway #2:**

> Microservices shouldn't be the default option. If you think a service architecture could help, try it with one of the modules from a very simple monolith typology and let it evolve from there.

---

Question: Your top 3 reasons you think as valid reasons for people to go the microservices path?

Sam Newman:

1. Independent deployability with zero downtime. Scenario: SaaS business where you can't afford downtime.

2. Isolation of processing around data.

3. Enable a higher degree of organizational autonomy. (Distribute responsibilities into teams to reduce the amount of coordination with the rest of the organization)


---

**Takeaway #4:**

> You can avoid a distributed monolith by:
> - Creating a deployment mechanism.
> - Looking for patterns and deciding how to deal with them.
> 
> Be aware! People don't know what information hiding really means.

---

**Takeaway #5:**

> You should strive for independent deployment because:
> - It's easier to limit the impact of each release when using microservices.
> - As the team size increases it gets exponentially harder to coordinate a deployment.

---

As team size increases, it's harder to coordinate people.

The way to separete team in distinct groups and reduce the coordination effort is to use modules.

Modules within a monolith system should work better than they do. We find ways to violate these modules. When you make that service a process boundary, violating those things becomes really painful

**Takeaway #6:**

> We tend to violate monolith architecture by not respecting the modules. Breaking them into services makes it harder to do so.

---

A lot of the complexity of breaking complex systems lies in the data.

After extracting the microservice you need to understand what part of the old database this system uses.

The database chapter is the biggest one in the book because there are so many difficulties that emerge in that space.

**Takeaway #7:**

> A lot of the complexity of breaking complex systems lies in the data. After extracting the microservice you need to understand what part of the old database this system uses.


---

"No matter what they tell you, it's always a people problem"

-- Gerald Weinberg

There has to be a willingness to change as an organization if you want to make the most out of using microservices.

Microservice architectures will very rarely save you money. They might help you to make more money, but it'll cost you more money in the short term.

**Takeaway #8:**

> There has to be a willingness to change as an organization if you want to make the most ouf ot using microservices.

