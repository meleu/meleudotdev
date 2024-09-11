---
dg-publish: true
---
# OAuth and OpenID Connect

- [The Nuts and Bolts of OAuth 2.0](https://www.udemy.com/course/oauth-2-simplified/)

## Core Concepts

OAuth only gives permissions, but doesn't identify who you are.

OpenID Connect builds on top of OAuth and adds identification.

> [!important]
> OpenID Connect is an extension of OAuth. It provides a mechanism where the OAuth server can actually communicate data about the user back to the application.
> 
> - **OAuth** is about accessing APIs
> - **OpenID Connect** is about identifying users.


### Roles

User -> Device -> Application -> Authorization -> API

- User: Resource Owner
- Device: User Agent
- Application: Resource Client
- Authorization Server
- API: Resource Server



### Front Channel vs. Back Channel

Different ways that data moves around between systems.

#### back channel

"Normal" way. Secure way. **Prefered way**.

- HTTPS connection:
    - we trust the server (certificate is valid)
    - encrypted in transit
    - direct communication

#### front channel

> Sending data in the front channel is literally using the address bar of the user's browser to move data between two systems.
> (...)
> There's no direct link between the sender and the recipient of the package.

