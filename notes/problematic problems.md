---
dg-publish: true
---
# problematic problems

Sources of complexity typically related to things like "agile development", CI pipelines and such...

## caching dependencies in CI pipelines

We don't want to download dependencies on every single job! We need to cache them!

## secrets and source code version management

We want to trigger pipelines automagically, sometimes test some stuff connecting to the database and/or reaching some APIs... How to authenticate to those services if the secrets are not easily accessible?

