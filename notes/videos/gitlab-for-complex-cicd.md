# GitLab for Complex CI/CD: Robust, Visible Pipelines

- #video <https://youtu.be/qy8A7Vp_7_8>

![[Pasted image 20210714164825.png]]


8:23 - Looks like I could use GitLab to replace Nexus and Harbor. It can act like a Container Registry, Registry/Repository and Dependency Proxy.

12:45 - [DAG - Directed Acyclic Graph] Use `needs:` to go ahead with some jobs with no need to wait the whole previous stage to finish.

16:55 - use the `- parallel:` (it didn't explains it too much).
