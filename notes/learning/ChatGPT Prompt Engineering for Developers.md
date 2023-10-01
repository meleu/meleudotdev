---
dg-publish: true
---
# ChatGPT Prompt Engineering for Developers

- https://learn.deeplearning.ai/chatgpt-prompt-eng/

## Intro

Two types of large language models (LLMs):

- **Base LLM**:
    - Predicts next word, based on training data.
    - Example:
        - **What's the capital of France?**
        - 🤖 - What is France's largest city?
- **Instruction Tuned LLM**
    - Tries to follow instructions
    - Fine-tune on instructions and good attempts at following those instructions
    - RLHF: Reinforcement Learning with Human Feedback
    - Example:
        - **What is the capital of France?**
        - 🤖 - The capital of France is Paris.

This course is focused on **Instruction Tuned LLMs**.


## Guidelines for Prompting

### Principles of Prompting

1. Write clear and specific instructions
2. Give the model time to think

#### Write clear and specific instructions

Tactics

- Tactic 1: Use delimiters.
    - e.g.: triple backticks
- Tactic 2: Ask for structured output.
    - e.g.: JSON
- Tactic 3: Check whether conditions are satisfied.
    - Check assumptions required to do the task.
    - e.g.: `You will be provided with text (...). If it contains a sequence of instructions, re-write those instructions in the following format (...). If the text does not contain a sequence of instructions, then simply write "No steps provided".`
- Tactic 4: Few-shot prompting.
    - Give successful examples of completing tasks, then ask model to perform the task.
    - e.g.: `Your task is to answer in a consistent style. (... then give an example of the style you want)`


#### Give the model time to think

> Our second principle is to give the model time to think. If a model is making reasoning errors by rushing to an incorrect conclusion, you should try reframing the query to request a chain or series of relevant reasoning before the model provides its final answer.

- Tactic 1: Specify the steps to complete a task.
- Tactic 2: Instruct the model to work out its own solution before rushing to a conclusion.
    - e.g.: `Your task is to determine if the student's solution is correct or not. To solve the problem do the following: First, work out your own solution to the problem. Then compare your solution to the student's solution is correct or not. Don't decide if the student's solution is correct until you have done the problem yourself.`