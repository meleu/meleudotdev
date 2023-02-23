---
dg-publish: true
---
# GCP Systems Operations

[link](https://cloudacademy.com/course/google-cloud-platform-systems-operations/?context_id=56&context_resource=lp)

### Project resources

- global resources
    - firewall rules
- regional-based resources
    - IP addresses
- zone-based resources
    - instance
    - disks

### Interacting with GCP

- Cloud Console - web interface
- Cloud SDK/Cloud Shell - CLI
- REST-based API

Cool links:

- <https://developers.google.com/learn>
- <https://developers.google.com/apis-explorer>

## Compute Engine Instances

### IaaS vs PaaS

![[GCP Systems Operations - IaaS vs PaaS.png]]


### Machine Types

- High Memory
    - 6.50GB of RAM per vCPU
- High CPU
    - 0.90GB of RAM per vCPU
- Standard
    - 3.75GB of RAM per vCPU
- Shared-core
    - One virtual CPU
    - Cost-effective for running small, non-resource intensive apps
- Custom machine types
    - Select the cores and memory

### Instance states

Provisioning > Staging > Running > Stopping > Terminated

Check instance state with:

```shell
gcloud compute instances describe $INSTANCE
```


## Networking

If you have several instances, it's not a good idea to expose all of them to the public internet. Instead:

- Use a bastion
    - Limit CIDR range of source IPs connecting to bastion
    - Firewall rules allow SSH traffic to private instances only from bastion


## Snapshots

- Create a copy of a disk
- Store only data that's changed since the last snapshot
- Snapshot a running instance for point in time backups
- Snapshots are a global resource
- Use cases:
    - Backps
    - Migrating data between zones
    - Swapping between disk types
- Snapshots are data only

### Creating snapshots

- unmount the disk or prevent writes
- `sudo umount $mountPoint`
- for a boot disk, shutdown the instance
- if you can't umount, use `sync` and `fsfreeze`


### Instance Groups

- Manage groups of instances
- Perform simple management tasks, including:
    - Monitor CPU, disk, and network traffic across the group
    - Reboot all instances in the group
- Two types:
    - Managed: template defining the instances
    - Unmanaged: collection of instances not necessarily identical

### Cloud SQL

Basic stuff...

### Metadata

Present in Compute Engine tab.

- A set of key/value pairs containing info related to the running instance or project
- Project level settings
    - API keys
    - Connection strings
    - Access tokens
- Instance level settings
    - Tags
    - Zones
    - Flag to determine if the instance is pre-emptible
    - hostname


### Startup / Shutdown Scripts

Scripts that run when an instance is starting up (or shutting down).

All startup script output is written to `/var/log/daemon.log`.
See also `/var/log/startupscript.log`.

Common uses:

- installing a provisioning client:
    - chef
    - puppet
    - ansible?
- run security checklist
- bootstrap batch processing node

Shutdown script:

- run as a "best-effort"
- Triggered by:
    - instances.delete / instances.stop
    - When Compute Engine stops a pre-emptible instance
    - normal shutdown...
- use cases
    - backup logs
    - copying data to cloud storage
    - clean terminating apps


### Auto Scaling

- Compute Engine API
- Auto scale the number of instances in a **managed instance group**
    - helps reduce costs by shutting down instances when not required
- one autoscaler per managed instance group


Policies

- policy determines autoscaler behavior
- options:
    - Average CPU utilization
    - HTTP load balancing serving capacity (defined in the backend service)
    - Stackdriver standard and custom metrics

### Load Balancer

- 3 types:
    - TCP
    - UDP
    - HTTP
- Network Load balancer
    - TCP and UDP
    - Balance load based on incoming IP protocol data:
        - IP address
        - Port
        - Protocol type
    - Allows packet inspection
    - Does NOT support cross-region balancing
    - Can maintain session affinity (useful for stateful apps)
- HTTP Load Balancer
    - Distributes HTTP(S) traffic among groups of instances based on:
        - Proximity to the user
        - Request URL - URL rules route requests to instances
    - Requires instance groups
    - Supports session affinity
    - Supports connection draining

> [!note]
> Cloud Load Balancer is going to be a key component in any Compute Engine based, highly available workload. So take the time to test it out and get to know it.


### Cool demo showing Load Balancer configs

[video](https://cloudacademy.com/course/google-cloud-platform-systems-operations/putting-it-all-together-1/?context_id=56&context_resource=lp)