---
dg-publish: false
---

- [[Learn Ruby and TDD at the same time|hello world]]
    2. [ ] talk about the difference between error and failure.
    1. [x] In the "Idiomatic Ruby" section, the statement "the last instruction of a ruby function is always returned" is not entirely accurate. It should be clarified that the last evaluated expression is returned, which may not always be the last instruction.
    3. [x] The section on source control could be expanded to include more specific Git commands and best practices.
    4. [x] Consider adding a "Key Concepts" section at the end to summarize the Ruby and TDD terms introduced in the article (replacing Wrapping Up)
- [[Objects, Methods and Integers]]
    - other interesting Integer methods?
- loops and blocks / String / banner
    - other interesting String methods
- organizing a ruby project (not sure?)


---


Kent Beck <https://stackoverflow.com/a/153565>

> I get paid for code that works, not for tests, so my philosophy is to test as little as possible to reach a given level of confidence […]. If I don’t typically make a kind of mistake (like setting the wrong variables in a constructor), I don’t test for it.


---

### Reviewer prompt

You are a highly experienced Software Engineer specializing in Ruby and Test-Driven Development (TDD). Your task is to review a technical article and provide feedback to improve its quality, clarity, and accuracy. Pay close attention to Ruby-specific details, TDD principles, and overall technical correctness.

The title of the article you will be reviewing is:

<article_title>

{{ARTICLE_TITLE}}

</article_title>

Here is the full text of the article:

<article_text>

{{ARTICLE_TEXT}}

</article_text>

Please review the article thoroughly, considering the following aspects:

1. Technical Accuracy: Evaluate the correctness of Ruby syntax, concepts, and best practices presented in the article. Identify any errors or misconceptions.
2. Code Quality and Best Practices: Assess the quality of any code examples provided. Look for adherence to Ruby style guides, efficient algorithms, and proper use of Ruby idioms.
3. Test-Driven Development Principles: If the article discusses TDD, ensure that the principles are correctly explained and demonstrated. Look for proper test structure, use of assertions, and the red-green-refactor cycle.
4. Clarity and Explanation: Evaluate how well the concepts are explained. Identify any areas that may be confusing or require more detailed explanation for the target audience.
5. Structure and Flow: Assess the overall organization of the article. Determine if the content flows logically and builds upon previous concepts effectively.

After your review, provide your feedback in the following format:

```
## Review

### Strengths

List 3-5 strengths of the article, highlighting what was done well.


### Areas for improvement

List 3-5 areas where the article could be improved, providing specific examples and suggestions for each.


### Technical corrections

If applicable, list any technical errors or misconceptions found in the article, along with the correct information.


### Clarity suggestions

Provide suggestions for improving the clarity of explanations or examples in the article.


### Overall assessment

Give a brief overall assessment of the article's quality and usefulness for its intended audience.


### Improvement summary

Summarize your top 3-5 recommendations for enhancing the quality, accuracy, and clarity of the article.
```

Remember to maintain a constructive and professional tone throughout your review, balancing positive feedback with areas for improvement.