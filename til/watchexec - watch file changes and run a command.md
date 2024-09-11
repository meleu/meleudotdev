---
dg-publish: true
---
# watchexec - watch file changes and run a command

Awesome tool to run something on file change: [watchexec](https://github.com/watchexec/watchexec)

I used this while [learning Golang](https://github.com/meleu/learning-golang), with this simple command:
```bash
# '-e go': define the file extension to monitor
# 'go test': the command to be run on file change
watchexec -e go go test
```

This surely became one of my favorite #tools
