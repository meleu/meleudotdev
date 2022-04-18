---
dg-publish: true
---
# Google Cloud Platform Fundamentals

## Introducing GCP

- Welcome to GCP Fundamentals
    - this course focus on Compute Engine and basics of Networking

- What is Cloud computing?
    - Cloud computing is a way of using IT that has these 5 traits:
        1. On-demand self-service: no human intervention needed to get resources
        2. Broad network access: access from anywhere
        3. Resource pooling: provider shares resources to customers
        4. Rapid elasticity: Get more resources quickly as needed
        5. Measured service: Pay only for what you consume.

- How did we get here?
    - Physical/Colocations: User-configured, managed and maintained.
    - Virtualized: User-configured. Provider-managed and maintained.
    - Serverless: Fully automated.

- Every company is a data company:
    - At some point, most of software will be considered as a commodity. Therefore the most valuable asset of a company will be the data it has about the users.

- GCP computing archtectures
    - Compute Engine: IaaS
    - Kubernetes Engine: Hybrid
    - App Engine: PaaS
    - Cloud Functions: Serverless logic
    - Managed Services: Automated elastic resources

- The Google network / GCP regions and zones
    - Think in a zone as a single point of failure within a region

- Google offers customer-friendly pricing
    - Billing in sub-hour increments
    - Discounts for sustained use
    - Discounts for committed use
    - Discounts for preemptible use
    - Custom VM instance types

- Open API
    - GCP uses open APIs and it helps to prevent vendor lock-in

- Why choose GCP?
    - "GCP enables developers to build, test, and deploy applications on Google's highly secure, reliable and scalable infrastructure."
    - Review GCP Services:
        - Compute:
            - Compute Engine
            - Kubernetes Engine
            - App Engine
            - Cloud Functions
        - Storage
            - Bigtable
            - Cloud Storage
            - Cloud SQL
            - Cloud Spanner
            - Cloud Datastore
        - Big Data
            - Big Query
            - Pub/Sub
            - Data flow
            - Data proc
            - Data lab
        - Machine Learning
            - Natural Language API
            - Vision API
            - Machine Learning
            - Speech API
            - Translate API
    
- Multi-layered security approach
    - GCP is very secure

- Budgets and Billing
    - To prevent surprises, you can set and budget alert and keep your billing under control


## Getting Started with GCP

### Introduction

IAM - Identity and Access Management

Projects are the main way you organize the resources you use in GCP. Use them when you want to group a common business objective.

Principle of least privilege:

> Each user should have only those privileges needed to do their jobs.

This way people are protected from an entire class of errors.

In GCP we use IAM to implement least privilege.

Four ways to interact with GCP management layers:

1. **web based console**
2. **SDK & CLI tools**
3. APIs
4. mobile app

In the image below we can see in blue the parts which are still users' reponsibility, and in yellow what's Google's reponsibility.

![[Pasted image 20220304175151.png]]


### The GCP resource hierarchy

- Org Node
    - Projects
        - Folders [optional]
            - other Folders [optional]
        - Resources (VMs, Storage, etc.)

![[Pasted image 20220304180327.png]]

Important: policies are inherited downwards in the hierarchy

Any GCP resource belongs to a project.

Projects are the basis for enabling and using GCP services.

Each project is a separate compartment, and each resource belongs to exactly one.

Projects can have different owners and users. They're billed separately, and they're managed separately.

Each project has a name and a project ID.

Project Id | Project name | Project Number
-|-|-
Globally unique | Need not be unique | Globally unique
Chosen by you | Chosen by you | Assigned by GCP
Immutable | Mutable | Immutable

> In general, project IDs are made to be human-readable strings, and you'll use them frequently to refer to projects.

You can use folders to help you to manage your organization's projects.

- Folders group projects under an organization
- Folders can contain projects, other folders, or both
- Use folders to assign policies

**Caution!**

To use folders, you need an organization node at the top of the hierarchy.

**Important rule to keep in mind**

Policies implemented at a higher level can NOT take away access that's granted at a lower level.

"The most generous policy, is the one that takes effect." - doubt: an "allow" in the top of the hierarchy has precedence over a "deny" in the specific resource?


### Identity and Access Management

An IAM defines 3 things:

- who
- can do what
- on which resource


#### who

The "who" part can be defined either by:

- Google account
- Google group
- Service account
- an entire G Suite or cloud identity domain


#### can do what

Defined by an IAM role.

An IAM role is a collection of permissions.

Three types of roles

1. Primitive
2. Predefined
3. Custom

##### Primitive roles

Primitive are broad. You apply them to a project and they affect all resources in that project.

Primitive roles:

- Owner
- Editor
- Viewer
- Billing administrator

**Careful**: if you have several people working together on a project that contains sensitive data, primitive roles are probably not enough. IAM provides a finer-grained types of roles.

GCP services offer their own sets of predefines roles, and they define where those roles can be applied.


##### Predefined roles

There was an example talking about the "InstanceAdmin" role, but it was really quick.


##### Custom roles

Allows more even control to achieve the "least privilege" principle.

**Cautions**:

1. You have to decide to use custom roles (some companies prefer to stick with the predefined roles).
2. Custom roles can only be used at the project or organization levels.

##### Service Account

When you want to give permissions to a machine instead of a user.


### Interacting with GCP

 Four ways to interact with GCP management layers:

1. **web based console**
2. **SDK & CLI tools**
3. APIs
4. mobile app

#### web based console

If you build an application in GCP, you'll use the web based console; although the end users of your application won't.

It provides you full access to the GCP resources. It also lets you enable, disable and explore the APIs of GCP services.

It also gives you access to the Google's Cloud Shell, from your browser.


#### Google Cloud SDK 

Accessible via:

- web browser (cloud shell)
- you can install in your computer
- docker image

Includes command line tools, like `gcloud` (the main CLI tool), `gsutil` (Cloud Storage), `bq` (BigQuery).


#### RESTful APIs

Your code can pass information to the APIs using JSON.

The GCP console lets you turn on and off APIs.

Experiment with the **APIs Explorer**. It's an interactive tool that lets you easily try Google APIs using a browser.

[Sounds like an interesting way to play with code :nerd:]


#### Cloud Console Mobile App

- Manage VMs and DB instances
- Manage apps in Google App Engine
- Manage your billing
- Visualize your projects with a customizable dashboard


### Cloud Marketplace

A solution marketplace containing pre-packaged, ready-to-deploy solutions. Some offered by Google, others by third-party vendors.


## Virtual machines in the Cloud