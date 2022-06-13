# VPC and Virtual Machines in GCP

### Virtual Private Cloud (VPC) Network

> The way most people start with GCP is to define their own Virtual Private Cloud inside their GCP project. Or simply choose the default VPC.

Virtual Machines are always connected to a Virtual Private Cloud. It can be customized or Google's default one.

GCP VPC networks are global; subnets are regional.

![[Pasted image 20220613163400.png]]

#### Important VPC capabilities

VPCs have routing tables.

You control the topology of your VPC network.

- Use its route table to forward traffic within the network, even accross subnets
- define firewall using tags
- it's possible to interconnect networks in GCP projects using VPC Peering. But to use the full power of IAM, using a Shared VPC is preferable.
- With Cloud Balancing your app presents a single frontend to the world
    - users get a single IP address
    - traffic goes over Google's backbone to the closest point-of-presence to the user
    - only healthy backends receive traffic

Google VPC offers a suite of load-balancing options

![[Pasted image 20220613165429.png]]

- Cloud DNS (8.8.8.8):
    - Create managed zones, then add, edit, delete, DNS records
    - Programmatically manage zones and records using RESTful API or CLI
- Cloud CDN




### Compute Engine

Compute Engine is the GCP's terminology to refer to a Virtual Machine (like EC2 in AWS, and Droplet in DigitalOcean).

When you create a VM, pick memory and CPU. You can use a predefine type or make a custom one.

Machine learning and data processing will probably need more processing power. There are GPU available for these usecases.

You can define a startup script.

You can take disks snapshots.


#### Preemptible

Suppose you have a workload where there's no human being sitting around waiting to finish. You can save money by choosing preemptible VMs.

(my opinion: CI pipelines are not a good usecase for preemptible VMs)

You can save a lot of money using preemptible VMs, but be sure to make your job able to stopped and restarted.
