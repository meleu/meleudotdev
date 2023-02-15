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
- Cloud Datastore - NoSQL
- Cloud Bigtable - NoSQL
- BigQuery
- Cloud Spanner

> [!note]
> Relational databases are good to store data for complex data structures with relations between them. But they are hard to scale.
> 
> NoSQL databases are easy to scale, but used to store simple information, most likely key/pair data.
> 
> Cloud Spanner is a Relational database and massively scalable. But very expensive.



![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - databases.png]]

GreatInside Current Scenario:

| Current Databases                 | GCP Databases                    |
| --------------------------------- | -------------------------------- |
| Interior design app: MySQL        | Cloud SQL / MySQL                |
| Payment processing: MS SQL Server | Cloud SQL / SQL Server           |
| Experimental: NoSQL datastore     | Try Cloud Datastore / App Engine |


### High Availability / Instance Groups

To ensure high availability, you need to:

- create an instance group
- configure it to create instances accross different regions
- configure autoscaling.

For more information: [GCP Systems Operations](https://cloudacademy.com/course/google-cloud-platform-systems-operations/) course.

When creating instance group, choose multi-zone

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - overprovision.png]]

To make the instance group work as a high availability solution, you'll need:

- Cloud Load Balancer
    - Distribute incoming requests to different instances
- **No stateful data**
    - Stateful data requires the same instance to handle all requests from a given user
    - Stateful data must be put in a database or Cloud Storage
    - Cloud Storage automatically replicates across zones and regions

Stateful Data Storage

- **Cloud SQL** - *chosen one*
    - create failover replica in another zone by selecting the "High Availability" option.
- Cloud Datastore
    - as it scales horizontally, it automatically replicates data across zones within a region
- Cloud Bigtable
    - can be configured to replicate across zones or regions
- BigQuery
    - automatically replicates within a region, but not suitable for real-time stateful data storage
- Cloud Spanner
    - automatically replicates within a region and does not need a failover replica


#### Networks


There are 5 layers in GCP to isolate and manage resources

- Organizations
    - Folders - not required, but can be useful
        - Projects
            - Networks
                - Subnetworks

##### Projects

Projects provide a level of separation. In different projects:

- resources are unable to communicate
- resources are billed separately
- security controls are separate

Regarding networks, for each project:

- One network with preset configs and firewall rules.
- You can customize or create 4 additional networks.
- You can request a quota increase up to 15 networks.


##### Networks and Subnets

- a Network belongs to only one Project
- a Subnet belongs to only one Network
- an Instance belongs to only one Subnet

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - project-network-subnet.png]]

Regarding Subnets:

- Instances in the same Network can communicate with each other (even if in different subnets)
- Subnets are used to group and manage resources
- a Network spans all regions, but a subnet can only be in one region
- Subnets allow you to define IP address range and default gateway for instances
- Instances in the same subnet communicate over TCP, UDP and ICMP
- the default firewall rules between subnets only allows SSH, RDP and ICMP traffic
- if you want to prevent communication between subnets, you must change the firewall rules


##### Local DNS

- Each Network includes a loccal DNS server so VM instances can refer to each other by name.
- The instance name is tied to the internal IP of the instance: `[HOSTNAME].c.[PROJECT_ID].internal`.
- Each VM has an ephemeral external IP by default that changes on restart.
- Google charges for unused static IP addresses.

#### Private Google Access

By default, instances connect to GCP services over the internet. Example:

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - services over the internet.png]]

By enabling "Private Google Access" in a subnet, instances connect to GCP services over Google's network using internal IP addresses.


#### Cross-Project Connections

3 options:

1. Internet
    - Slower, expensive, insecure
2. VPC Network Peering
    - Simplest one. RFC-1918
    - Can connect different projects and organizations
    - Both sides have to set up a peering association
    - Can't have any overlapping IP ranges
3. Shared VPC
    - Complex

#### GreatInside Network solution

3 Projects:

- Development
- Test
- Production

Also:

- Default network
- Default subnetwork
- Default region
- Default firewall rules
- External IP address for Load Balancer (the only external IP address)


How can a system administrator connect to instances for troubleshooting?

- Cloud VPN
- Cloud Interconnect
- Peering

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - Cloud VPN.png]]


## Security

### Authentication

Use "G Suite Global Directory" to manage users.

- Google Cloud Directory Sync (GCDS)
    - easiest solution if you have Active Directory or LDAP.
- Google Apps Admin SDK
- Third-party connector

### Roles

- basic roles act at the project level
- 3 basic roles:
    - owner
    - editor
    - viewer
- there are also predefined roles for individual resources

Roles are not overwritten in lower hierarchy. In the example below, the user still have the Editor role for lower contexts, it's not overwritten because of the Viewer Role in the project:

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - role levels.png]]

There are a few principles to apply when setting roles and permissions:

1. Principle of least privilege
2. Assign roles to groups instead of individuals (I should enforce this at my work)
3. Control who can add members to groups and change policies
4. Audit all policy changes by checking the Cloud Audit Logs.


Solution for GreatInside

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - GreatInside Roles.png]]

### Service Accounts

- Use service accounts instead of embedding credentials in applications.
- Enable access to specific service APIs on instances that need access.
- Use the Compute Engine default service account or create your own.
- A service account has
    - email address
    - public key
    - private key
- Default service accounts have limited scope of access, but it can be customized

GCP uses OAuth 2.0 for API authentication and authorization in two ways 

How can shell scripts access GCP services?

- Use `gcloud` and `gsutil`.
- They are included by default in most Compute Engine images.
- They automatically use the instance's service account to authenticate.


GreatInside Service Accounts:

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - GreatInside Service Accounts.png]]


### Data Protection and Encryption

#### ACLs

ACL: Access Control Lists specify who has access to Cloud Storage buckets and objects in buckets.

There are five ways for controlling access to Cloud Storage:

- IAM (work at project level)
- ACLs (allow fine-grained access)
- Signed URLs
- Signed Policy Documents
- Firebase Security Rules

Things might get confusing when using IAM and ACLs:

- Listing ACLs for a bucket shows access permissions only for ACLs, not for IAM. So you should use either IAM or ACLs, if possible.
- ACLs on a bucket do not affect ACLs on objects inside that bucket.


#### Encryption

Your data is encrypted in flight and at rest.

- in flight
    - All services accessed via API calls, going through SSL/TLS channels
    - Every API request has to include an auth token
- at rest
    - GCP encrypts all customer data at rest by default
    - each subfile chunk is encrypted with a data encryption key (DEK)
    - DEKs are encrypted with a key encryption key (KEK)
    - ways to manage KEKs:
        - Customer-managed encryption keys
        - Customer-supplied encryption keys


### Legislation and Compliance

Google provides many features to help you deal with DDoS attacks:

- Reduce the attack surface
    - isolating and securing your deployment with firewall rules
    - default anti-spoofing protection
- Isolate the internal traffic from the external world
    - deploying instances without public IPs unless necessary
- Use Load Balancing
    - a load balancer acts as a proxy that hides your internal instances
- Use Cloud Armor
    - Works with Load Balancing
    - Protects agains layer 3 and layer 4 DDoS attacks

#### Logging and Monitoring

To be compliant, every step in the payment-processing environment must be monitored and recorded.

- Stackdriver Logging is a great service for logs
- Enable VPC Flow Logs on each subnet in your VPC
- Default service account grants write access to Stackdriver by default
- Log all shell commands
- Export Stackdriver logs to BigQuery for analysis


## Disaster Recovery

Backups + Transactional log files

Always enable automated backups.


When designing a disaster recovery solution, you must consider RPO and RTO.

- Recovery Point Objective (RPO)
    - Maximum length of time when data can be lost.
    - Example: it may be acceptable to lose an entire workday, then you can recover using the previous night's backup.
    - You have to carefully consider which point in time to recover to.
- Recovery Time Objective (RTO)
    - Maximum length of time your application can be offline and still meet your service level agreement.
    - Having a custom disk image helps you meet your RTO by reducing the amount of time to get the new instance running.

## Summary


---

## Knowledge Check: Designing a Google Cloud Infrastructure

Things I feel I need to study more:

- IAM vs. ACL
- VPN between office network and GCP
- Disaster Recovery: warm/hot server

### Incorrect answers

#### Which database service(s) support standard SQL queries?

- ❌ Cloud Bigtable and Cloud SQL
- ✅ Cloud Spanner and Cloud SQL

Cloud Bigtable and Cloud Datastore are NoSQL databases.

> [!warning]
> Do not confuse **Bigtable** with **Bigquery**.

Review it in [this video](https://cloudacademy.com/course/overview-google-cloud-platform-1245/gcp-overview/), at 4:38.


#### Which of the following statements about encryption on GCP is **not** true?

- ✅ (this information is **INCORRECT**, therefore, the right answer) If you want to manage your own encryption keys for data on Google Cloud Storage, **the only option** is Customer-Managed Encryption Keys (CMEK) using Cloud KMS.
- ❌ Each encryption key is itself encrypted with a set of master keys.

There are 3 ways to manage your own encryption keys:

- **CMEK**: Customer-managed encryption keys using Cloud KMS allow you to manage your own keys that are hosted on GCP.
- **CSEK**: Customer-supplied encryption keys allow you to manage your own keys on premise, but still use them on GCP.
- With client-side encryption, you encrypt the data before you send it to GCP.


#### Which statement about IP address pricing in Google Cloud is **correct**?

- ❌ You are charged for static external IP addresses, but not ephemeral external IP addresses.
- ✅ An unused static external IP address cost more than a used static external IP address.

From the [official documentation](https://cloud.google.com/vpc/network-pricing#ipaddress:

| Type                                             | Price/Hour (USD) |
| ------------------------------------------------ | ---------------- |
| Static IP (assigned but unused)                  | 0.01             |
| Static/ephemeral IP on **standard VMs**          | 0.004            |
| Static/ephemeral IP on **preemptible VMs**       | 0.002            |
| IPs used in forwarding rules/Cloud NAT/Cloud VPN | No charge        |


#### Which of the following is **not** a best practice for mitigating Denial of Service attacks on your Google Cloud infrastructure?

- ❌ Scale to absorb the attack.
- ✅ (this is **NOT** a best practice) Block SYN floods using Cloud Router

These are all best practices for mitigating Denial of Service attacks:

- Reduce the attack surface for your GCE deployment
- Scale to absorb the attack
- Isolate your internal traffic from the external world

Cloud Router is used to dynamically update VPN routes. It cannot block SYN floods. On the other hand, Google's Frontend infrastructure, which terminates user traffic, automatically scales to absorb certain types of attacks (e.g., SYN floods) before they reach your compute instances.

Learn more: <https://cloud.google.com/files/GCPDDoSprotection-04122016.pdf>


#### Which of the following would **not** reduce your recovery time in the event of a disaster?

- ✅ (this would **NOT** reduce the time to recovery) Replace your active/active hybrid production environment (on-premises and GCP) with a warm standby server.

A warm standby server would still require manual intervention in the DNS configurations, therefore replacing an active server with a warm standby server would NOT reduce the time to recovery.


#### To set up a virtual private network between your office network and Google Cloud Platform and have the routes automatically updated when the network topology changes, what is the minimal number of each type of component you need to implement?

VPC networks allow you to regionally segment the network IP space into prefixes (subnets) and control which prefix a VM instance's internal IP address is allocated from. If you want to avoid statically managing these subnets, including the burden of adding and removing related static routes for your VPN, you can do so by enabling dynamic routing for your VPNs using Cloud Router.

![[GCP Cloud Developer Certification - 02. Designing an Infrastructure - vpn.png]]

#### Which of these statements about Microsoft licenses is true?

- ❌ You can migrate your existing Microsoft Windows and Microsoft application licenses to Compute Engine instances.
- ✅ You can migrate your existing Microsoft application licenses to Compute Engine instances, but not your Microsoft Windows licenses.

You cannot migrate your existing Windows Server licenses to Compute Engine, but you can [bring your existing Microsoft Application Licenses](https://cloud.google.com/compute/docs/instances/windows/ms-licensing) to your Windows Server instances to run specific applications.

Learn more: <https://cloud.google.com/compute/docs/instances/windows/#licensing_for_windows_server_images>
