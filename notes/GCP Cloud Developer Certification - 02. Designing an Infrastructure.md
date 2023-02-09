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

Great Inside Company

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

Existing tech environment

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

Requirements

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