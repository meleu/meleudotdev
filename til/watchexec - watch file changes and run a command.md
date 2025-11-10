---
dg-publish: true
---
# watchexec - watch file changes and run a command

Awesome tool to run something on file change: [watchexec](https://github.com/watchexec/watchexec)

I used this while [learning Golang](https://github.com/meleu/learning-golang), with this simple command:
```bash
# -e or --exts
# '-e go': define the file extension to monitor
# 'go test': the command to be run on file change
watchexec -e go go test
```

When wanting to watch for specific files:
```bash
# -f or --filter
# '-f filename': to filter the file you want
watchexec -f source_file.rb -- ruby source_file_test.rb
```

**NOTE**: you can specify the path to be watched with `--watch`, but there's an important information got from the help output:

> When watching a single file, it's often better to watch the containing directory instead, and filter on the filename. Some editors may replace the file with a new one when saving, and some platforms may not detect that or further changes.

This surely became one of my favorite #tools
