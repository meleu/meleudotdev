---
dg-publish: true
---
# Google Cloud Platform Fundamentals

- <https://app.pluralsight.com/channels/player?courseId=5d5cf01d-b8e2-493b-bc77-73be1236a4ec&channelId=a81a554f-59dc-4eee-a30a-83744d11a381>

- [[00 - Introducing GCP]]
- [[01.00 - Getting Started with GCP]]
- [[02 - VPC and Virtual Machines in GCP]]

---

# GCP Storage 

## Cloud Storage

Similar to AWS S3 Bucket.

Cloud Storage is binary large-object storage

- high performance, internet-scale
- files in a flat namespace, no directory structure (works like a bucket)
- simple administration
    - you don't need to setup a size upfront, just use it.
- you do not edit your files, instead you create new versions
- if you don't enable versioning, new always overwrites the old
- data encryption before saving to disk
- data encryption in transit, using HTTPS
- when you create a bucket, you specify a unique name and a location.

### Cloud Storage interactions


4 classes of Cloud Storage

- multi-regional
- regional
- nearline
- coldline


How to think about them:

- Multi-regional and regional are high performance object storage.
- Nearline and coldline are backup and archival storage.

![[Pasted image 20220613171754.png]]


## GCP Bigtable

Fully managed NoSQL database service.

- Accessed using HBase API
- Native compatibility with big data, Hadoop ecosystems


## GCP SQL and Spanner

- <https://app.pluralsight.com/course-player?clipId=42a6d95b-a6e4-4a6f-a20b-ebe91eb5546f>

Cloud SQL is a managed RDBMS

- Offers MySQL and PostgreSQLBeta database as a service
- Automatic replication
- Managed backups
- Vertical and horizontal scaling
- Google security

Cloud Spanner is a horizontally scalable RDBMS

- Strong global consistency
- Managed instances with high availability.

### Comparing GCP Storage options

- <https://app.pluralsight.com/course-player?clipId=663fa735-6fd7-4afa-a43a-ae1ae6ebf527>


Comparison based on use cases:

![[Pasted image 20220613175903.png]]

Technical comparison:

![[Pasted image 20220613175747.png]]
