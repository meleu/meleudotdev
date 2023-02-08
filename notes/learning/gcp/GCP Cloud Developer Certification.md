---
dg-publish: true
---
# GCP Professional Cloud Developer Exam Prep

## Intro

The Cloud Developer exam tests your knowledge of five subject areas:

- Designing highly scalable, available, and reliable cloud-native apps
- Building and testing apps
- Deploying apps
- Integrating GCP services
- Managing app performance monitoring


Requires familiarity with:

- Compute
    - VMs
    - Container clusters
- Network
    - VPC
- Storage 
    - Cloud Storage
    - NoSQL (Cloud Bigtable)
    - Relational databases (Cloud SQL)
    - Data warehouses (BigQuery)

---

## Basics

For most applications you need 3 three core elements:

- Compute
- Storage
- Networking

If you have on-premises app, on your own server, you can do a "lift & shift migration". Which means taking your app to a Virtual Machine.

**Compute Engine** = Iaas

**App Engine** = PaaS

- App Engine vs. Compute Engine
    - In most cases, using App Engine is a better solution than using virtual machines
    - If you have an application that's not a web or mobile app, then you can't use App Engine, so you'll have to use a VM.


**Cloud Run**: lets you runa container using a single command.

**Google Kubernetes Engine**: container orchestrator (useful for apps with multiple containers)


### Serverless

- App Engine - apps
- Cloud Functions - containers
- Cloud Run - functions

**Cloud Function** is event-driven


### Storage

**Cloud Storage** = just like S3 buckets, non-hierarchical.

Storage classes:

- Standard
    - Frequently accessed files
    - `$$$$`
- Nearline
    - Files accessed about once a month or less
    - `$$$`
- Coldline
    - Files accessed at most once every three months
    - `$$`
- Archive
    - Files expected to access less than once a year.
    - `$`

**Cloud Filestore** = allows hirarchical file structure.

Filestore lets you create NFS-compatible file shares that can be mounted on your Virtual Machines or Containers.


### Databases

#### RDBMS

**Cloud SQL** is a fully managed service for each of these RDB:

- MySQL
- PostgreSQL
- SQL Server

#### NoSQL databases

- Bigtable
    - Run large analytical workloads
- Firestore
    - Build client-side mobile and web applications
- Firebase Realtime Database
    - Sync data between users in real time
- Memorystore
    - Speed up applications by caching frequently requested data


#### Cloud Spanner

Relational database and massively scalable.

💲💲💲💲💲

> if your application is written specifically for a particular database, such as SQL Server, then Cloud SQL would be a better choice, unless you can rewrite it to work with Cloud Spanner.



#### BigQuery

If you need a Data Warehouse


BigQuery is good for aggregating data from various sources and then do SQL Queries.

Good for OLAP (Online Analytical Processing) and business intelligence reporting.

### Network

**VPC** is very similar to an on premises network.

Each VM in a VPC can communicate to each other. You can also split VPCs into subnets and refine routes.

By default, outbound traffic to the internet is allowed. To allow inbound traffic you must define an external IP to a VM.

It's possible to connect one VPC to another one by using VPC Network Peering.

Connecting a VPC to an on-premises network:

- Cloud VPN
- Cloud Interconnect
- Peering



