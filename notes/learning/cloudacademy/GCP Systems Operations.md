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

PAREI AQUI: <https://cloudacademy.com/course/google-cloud-platform-systems-operations/instance-groups/?context_id=56&context_resource=lp>