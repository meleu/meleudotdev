---
dg-publish: true
---

<https://www.udemy.com/course/the-complete-mongodb-course/>

Personal knowledge gap: aggregation and performance

## Intro to NoSQL

With SQL DBs we have a structured data in a relational database.

In NonSQL databases data is NOT stored in a tabular manner.

Instead of tables, we call them collections.

Each entry is a key-value pair (the value can be an object with more key-value pairs).

> Relational databases have a schema. This is a fixed structure that is defined beforehand. **Document databases like MongoDB are "schema-less"**.
> 
> Documents are **polymorphic**, i.e. they do not have a fixed structure. Changes can be made easily to an individual document structure e.g. new field value pairs can be added.

- MongoDB instance contains databases
- a database contains collections
- a collection contains documents
- a document contains objects (like a JSON)


### Replica Sets and Sharded Clusters

There are 3 "instances" in a Replica Set, each "instance" contains a full copy of the data in each other "instances"

Sharded Cluster contains a group of Replica Sets.

Components of a Sharded Cluster:

- Shard: containing a partition of the data
- Mongos: Interface between any application using MongoDB and the sharded cluster.
- Config Servers: store metadata and configuration settings.

### Mongo Query Language

```js
// returns only the first one matching the query
db.CollectionName.findOne(query)

// returns an array of matching elements
db.CollectionName.find(query)

// ------------
// the use of $
// ------------
//
// comparison operators
// --------------------
// https://www.mongodb.com/docs/manual/reference/operator/query-comparison/
// precedes an operator in this format
// {field: {$operator: value}}
// e.g.: less than `$lt`
{"salary": {$lt: 5000}}

// $eq - equal to
// $ne - not equal to
// $gt - grather than
// $gte - grather than or equal
// $lt - less than
// $lte - less than or equal
// $in - compare to an array of values
// $nin - not in...

// logical operators
// -----------------
// https://www.mongodb.com/docs/manual/reference/operator/query-logical/
// {$operator: [{condition1}, {condition2}]}
//
// $and
// $or
// $nor - all docs that fail all conditions
// $not - negates condition
```

## Creating Indexes

<https://www.mongodb.com/docs/manual/reference/method/db.collection.createIndex/>


