---
dg-publish: true
---
# Basic GCP Environment

[video](https://cloudacademy.com/course/setting-up-google-cloud-platform-environment-1697/summary/)

- Projects
    - useful to organize resources
    - the most basic resources:
        - compute
        - storage
        - network
- Permissions
    - Types of Roles
        - Basic (not secure in real environment)
            - Browser
            - Viewer
            - Editor
            - Owner
        - Predefined (more granular, useful if it fits your needs)
            - examples:
                - Compute Viewer (inventory all compute engines)
                - Compute Admin (full control over all compute engines)
                - Compute Security Admin (modify firewall rules)
        - Custom
            - the most specific
            - when you need a set of permissions not covered by a Predefine Role
- Enabling APIs
    - control which resources a project has access by enabling or disabling APIs
- Billing Accounts
    - You can set up spending alerts for a project by setting a budget

## Knowledge Check: Setting up a Google Cloud Platform Environment

### In Google Cloud Platform, by default, administrators and users with billing account roles will receive email alerts when the amount spent exceeds \_, \_, and \_ percent of the budget.

- ✅ 50, 90, 100


### Which Google Cloud Platform predefined role only allows the user to view the current compute resources?

- ❌ Compute Browser
- ✅ Compute Viewer

I think there's no "Compute Viewer" **predefined role**. Looks like the term "Viewer" was used here to confuse the student with the "Viewer" **basic role**.


