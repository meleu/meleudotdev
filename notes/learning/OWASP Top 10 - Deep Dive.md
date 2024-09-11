---
dg-publish: true
---
# OWASP Top 10 - Deep Dive

Udemy course: <https://udemy.com/course/the-owasp-top-10-deep-dive/>

## links

- https://owasp.org/Top10/
- <https://hacksplaining.com/owasp>
- WebGoat: "deliberately insecure application"
    - <https://github.com/WebGoat/WebGoat> - "deliberately insecure application"
    - https://owasp.org/www-project-webgoat/ - website with some instructions


## OWASP Top 10

### 1. Broken Access Control

Unauthorized information disclosure, modification or destruction...

- Elevation of privilege
    - Vertical (become an admin)
    - Horizontal (become another user)

> **Fallacy of security through obscurity**
> 
> the belief that anything that exist on a website that isn't linked or indexed cannot be found.


#### Prevention

- Deny by default
- RBAC (Role-Based Access Control)
- Disable web server directory listing
- Constant testing & auditing access controls

### 2. Cryptographic Failures

Focuses on failures related to cryptography which often lead to exposure of sensitive data.


Example: Not using TLS, making it possible to sniff the network and steal cookies

### 3. SQL Injection

Occur when maliciously crafted inputs are submitted by an attacker, causing an application to perform an unintended action.

Target is databases

- extract sensitive information
- enumerate login details of users
- delete tables
- inject more malicious code

Cool exercise: <https://www.hacksplaining.com/exercises/sql-injection>
#### Prevention

- sanitizing inputs (server reject inputs that look suspicious)
- parameterized statements
- escaping inputs



### 3. Cross Site Scripting Attacks (XSS)

(not sure why number 3 is duplicated)

Primarily a **client side** attack and targets the victim's browser with the use of malicious code.

Very common on message boards, forums and webpages that allow comments

Most common with JavaScript.

Exercise: <https://www.hacksplaining.com/exercises/xss-stored>

XSS attacks can:

- Hijack the victim's cookies
- Gain access to the webcam, microphone, geolocation, etc.
- Combined with social engineering, instal trojans, keyloggers etc.

#### Prevention

User input should always be filtered.


### 4. Insecure Design

> Risks related to design and architectural flaws with a call for more use of threat modeling and reference architectures.

Example:

> A cinema chain allows group booking discounts and has a maximum of fifteen attendees before requiring a deposit. Attackers could threat model this flow and test if they could book six hundred seats and all cinemas at once in a few requests, causing a massive loss of income.

Preventions

1. Principle of least privilege
2. Validation of input
3. Segregation of tenants
    - Different envs such as live and test, should be on separate networks and not share resources.
4. Encryption
5. Fail securely
  - Internal architectural details should be not revealed in error messages.
6. Observe the logs (Observability)

#### STRIDE methodology

- Spoofing
- Tampering
- Repudiation
- Information disclosure
- Denial of Service (DoS)
- Elevation of privilege


### 5. Security Misconfiguration

- default credentials

Prevention:

Access to production data should be restricted to internal networks or require use of 2FA.

### 6. Vulnerable and Outdated Components

Preventions

- remove unused dependencies
- obtain components from official sources
- 