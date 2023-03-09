---
dg-publish: true
---
# Content Security Policy - CSP

- Pluralsight course: [Defeating Cross-site Scripting with Content Security Policy 2](library/courses/defeating-cross-site-scripting-content-security-policy/table-of-contents)


```
default-src 'self'; script-src 'report-sample' 'self'; style-src 'report-sample' 'self'; object-src 'none'; base-uri 'self'; connect-src 'self' https://api-us.synthos.health; font-src 'self'; frame-src 'self'; img-src 'self'; manifest-src 'self'; media-src 'self'; worker-src 'none';
```