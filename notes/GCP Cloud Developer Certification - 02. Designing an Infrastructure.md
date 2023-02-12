---
dg-publish: true
---
# GCP Cloud Developer Certification - 02. Designing an Infrastructure

## Agenda

- Translating requirements to GCP services
    - Compute
    - Storage
    - Network
- High Availability Design
- Security
    - Authentication and permissions
    - Data encryption
    - Compliance
- Disaster recovery


## Case Study

### GreatInside Company

- Company Overview
    - SaaS interior design app
    - free version supported by ads
    - customer base in North America
- Company Background
    - Growing quickly
    - Existing infrastructure not capable of scaling
- Solution Concept
    - Migrate both Linux and Microsoft systems to the cloud
    - Ensure PCI DSS compliance (what's this???)
    - Improve disaster recovery solution

### Existing tech environment

- Databases
    - MySQL - for the app
    - Microsoft SQL Server - for payment processing
    - NoSQL database - dev environment
- Web and App Servers
    - Apache and Tomcat on 6 servers
    - IIS on 4 servers (2 customer-facing and 2 internal)
- Infrastructure Servers
    - ActiveDirectory
    - File server for internal documents, etc.

### Requirements

- Business requirements
    - scale easily
    - move infrastructure to the cloud
    - increase performance, reliability and security
    - reduce management overhead
- Technical requirements
    - connect data center's network with the cloud environment's network
    - encrypt all data
    - high availability
    - disaster recovery in a few hours


## Mapping needs to GCP Services

### Compute solution

For compute resources, you should consider:

- App Engine
- Kubernete Engine

- App Engine
    - Why use it?
        - You don't want to manage an app's underlying infrastructure.
        - App Engine provisions and scales all the resources your application needs
        - **Advisable only for new applications**
    - Why not use it?
        - It's much easier to develop a new app than to migrate an existing one.
        - You need to check programming language and OS dependencies.
        - You may have to re-architect your app.
- Kubernetes Engine
    - Provides many of the benefits of App Engine, but requires more management.
    - **Ideal for apps that already run in containers.**
    - If your app doesn't run in containers, see if you can containerize it.
    - Not as easy as Compute Engine for migrating apps that run on VMs.


For the **GreatInside Company** we won't use the solutions above, but VMs in Compute Engine

- 6 Tomcat
    - 2 Dual-core CPUs
    - 24GB of RAM
    - Two 200GB mirrored disks
- 4 IIS
    - 1 Dual-core CPU
    - 16GB of RAM
    - Two 250GB mirrored disks

How to translate cores into vCPUs?

> Some people say that cores and vCPUs are equivalent, but that’s not quite true. A vCPU on a Compute Engine instance is implemented as a single hyper-thread on an Intel Xeon processor. Since each Xeon processor has 2 hyperthreads, that means you need to multiply the number of cores by 2 to get the number of threads, and thus the number of vCPUs.
> 
> So our Tomcat servers have the equivalent of 8 vCPUs (4 cores times 2) and our IIS servers have the equivalent of 4 vCPUs (2 cores times 2). Of course, if we really wanted to be accurate, we’d need to take into account things like the clock speed of the CPUs, but we’re not going to go that far.

N vCPU ~ 2N cores

(this part didn't make much sense to me...)

2 Dual-core CPUs = 8 vCPUs

#### IIS Server

| Current IIS server       | Compute requirements |
| ------------------------ | -------------------- |
| 1 Dual-core CPUs         | 4 vCPUs              |
| 16GB of RAM              | 16GB of RAM          |
| Two 250GB mirrored disks |                      |

The n1-standard-4 has 4vCPUs/15GB RAM.

Only 1GB less than the current server, then it should be OK.

#### Tomcat server

| Current Tomcat server    | Compute requirements |
| ------------------------ | -------------------- |
| 2 Dual-core CPUs         | 8 vCPUs              |
| 24GB of RAM              | 24GB of RAM          |
| Two 200GB mirrored disks |                      |

The n1-standard-8 has 8vCPUs/30GB RAM.

That's 4GB more than what we need. Maybe we can use a custom machine type. So, it's important to compare the costs.

#### Discounts

- Committed-use discounts
    - Purchase a one-year or a three-year contract.
    - Typically reduces costs by up to 57%.
- Sustained-use discounts
    - Starts after instance runs for more than 25% of a month.
    - Maximum discount for most machine types is 30%.

#### Licensing

blablabla boring Microsoft licensing stuff... Options:

- Google's pay-as-you-go licensing
    - Create instance with pre-configured Windows Server
    - Import a Windows VM
        - Import a virtual disk
        - use Cloud Migrate for Compute Engine
- Bring your own license
    - Run your Windows  VMs on sole-tenant nodes

also the so called "premium Linux OS licensing". Options:

- Create an instance using a pre-configured boot disk
- Import a VM

For both you can use **Google pay-as-you-go license** or **bring your own license**.

#### Preemptible VMs

- Up to 80% cheaper
- Google can remove it with 30 seconds' notice
- Use **ONLY** as disposable instances

We will NOT use it in our case study!


### Storage solution

#### Persistent and Local Disks for the VMs

Options:

- Standard Persistent Disk
- SSD Persistent Disk - **chosen one**
- Local SSD - faster, but risky
- RAM Disk - faster, but expensive
- Cloud Storage - doesn't apply for all situations

GreatInside requirements/current scenario:

- Tomcat: Two 200GB mirrored disks
- IIS: Two 250GB mirrored disks

**Note**: Persistent disks at GCP are redundant, so no need to mirror disks!

So, let's just use an SSD persistent disk for both and define the specific size we need.

#### Databases

Differences between Database solutions on GCP:

- Cloud SQL
- Cloud Datastore
- Cloud Bigtable
- BigQuery
- Cloud Spanner

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - databases.png]]

GreatInside Current Scenario:

| Current Databases                 | GCP Databases                    |
| --------------------------------- | -------------------------------- |
| Interior design app: MySQL        | Cloud SQL / MySQL                |
| Payment processing: MS SQL Server | Cloud SQL / SQL Server           |
| Experimental: NoSQL datastore     | Try Cloud Datastore / App Engine |


### High Availability

To ensure high availability, you need to define an instance group.