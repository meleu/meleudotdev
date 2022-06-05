---
dg-publish: true
---
# Getting Started with Wireshark

- <https://app.pluralsight.com/library/courses/getting-started-analyzing-network-traffic-wireshark/table-of-contents>
- [Exercise files](https://app.pluralsight.com/library/courses/getting-started-analyzing-network-traffic-wireshark/exercise-files)

Not in the course, but interested me:
- <https://downey.io/blog/kubernetes-ephemeral-debug-container-tcpdump/>
- <https://github.com/eldadru/ksniff>

## Examining the OSI Model, Protocols, and Headers

<https://app.pluralsight.com/course-player?clipId=f8eea8c7-b723-4352-9712-3530c651f0fd>

- Surfing the Web
- Protocols to download a website
- Protocol Hierarchy
- Encapsulation
- The OSI Model

### Protocols and Encapsulation

Example: stack needed for HTTP communication

| HTTP |
|:-:|
| TCP |
| IP |
| Ethernet |


- HTTP
    - Client
    - Server
- TCP
    - SYN ->
    - <- SYN-ACK
    - ACK ->
 - IP
     - ip addresses x.x.x.x


#### Encapsulation

- HTTP encapsulates the website
- TCP segment encapsulates HTTP data
- IP packet encapsulates TCP segment
- Ethernet frames encapsulates IP packet

### OSI Model

layer | OSI | TCP/IP
:-:|:-:|:-:
1 | Physical | 
2 | Data Link | Ethernet
3 | Network | IP
4 | Transport | TCP
5 | Session |
6 | Presentation |
7 | Application | HTTP



## Getting Started with Wireshark

- Demonstration of Wireshark
    - Examine Protocol Headers
 - Examine Packet Capture Operation


## Capturing Traffic

- Wireshark Caution
- Demo - Capturing Traffic
- Demo - Examining the Wireshark Interface
- Demo - Using a Capture Filter






