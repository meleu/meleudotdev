---
dg-publish: true
---
## Chapter 5 - Design in Construction

![[Code Complete - 5.2. Sotfware's Primary Technical Imperative - Managing Complexity]]

### Desirable Characteristics of a Design

- Minimal complexity
- Ease of maintenance
- Loose coupling
- Extensibility
- Reusability
- High fan-in
    - meaning: high number of "clients" using a given class.
- Low-to-medium fan-out
    - meaning: a given class use a low-to-medium number of other classes
    - high fan-out (more than about seven) indicates that a class may be overly complex.
- Portability
- Leanness
    - no extra parts, nothing more to be removed
    - code is liability
- Stratification
    - design the system so that you can view it at one level without dipping into other levels
    - example: if you have to use a lot of older, poorly designed code, write a layer on top of it offering a simplified interface.
- Standard techniques
    - Have a coding style, a standard tooling, etc.


