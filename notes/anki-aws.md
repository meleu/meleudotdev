---
dg-publish: true
cards-deck: DevOps::AWS
deck: DevOps::AWS
---
# anki-aws

#anki #aws

Flashcards for AWS. Created with [Obsidian Anki Sync](https://github.com/debanjandhar12/Obsidian-Anki-Sync) notation.

[TOC]

---

<!-- basicblock-start oid="ObsY4yApwEghuYjoVMOAmPH7" -->
## AWS S3
::
Amazon Simple Storage Service
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsOM3IWrrFy4NVd4qNciJyI" -->
## AWS SNS
::
Amazon Simple Notification Service
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsSUVn0Y3f3xZg4QgvHPBj1" -->
## AWS CloudFormation list the stacks
::
```shell
aws cloudformation list-stacks
```
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsLaJrtBNxyvNQWIG2zrEiL" -->
## AWS Lambda Function: 4 main components
::
1. Function
2. Events
3. Resources
4. Services
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsQUn4w2p9wu86fGf7Om9fA" -->
## AWS Lambda: Events
::
Anything that triggers a Lambda function.

- Examples:
    - API Gateway HTTP endpoints
    - S3 bucket upload
<!-- basicblock-end -->


---

<!-- basicblock-start oid="ObsUUGfhzVltjJM53GZoCRDn" -->
## AWS Lambda: Resources
::
Infrastructure components used by the Lambda function.

- Examples:
    - DynamoDB table (saving a comment)
    - SNS (sending messages assynchronously)
<!-- basicblock-end -->


---

<!-- basicblock-start oid="Obsh3Max668bMcaPXnmWwOqG" -->
## AWS Lambda: Services
::
The "project file". Where you define the Functions, the Events and the Resources.
Usually described in YAML (JSON is also accepted).
<!-- basicblock-end -->
