---
dg-publish: true
---

# linux - how to check if a directory is empty?

Although not very readable, this is what I believe is the most effective (but unfortunately not very useful for scripting):

```bash
find /path/to/dir -maxdepth 0 -type d -empty

# if you want to execute something:
find /path/to/dir -maxdepth 0 -type d -empty \
  -exec echo {} is empty \;

# CAVEAT: you can't use this technique if you want
# to execute something when the dir is NOT empty. :(
```

> [!caveat]
> If you need to make decisions based on the exit status, unfortunately `find` doesn't exits with failure if it does not find the file(s).

Other options I've found on the web was to use `ls -A`, but I have a feeling that it'll inefficient if the directory has thousands of files. I'd like to "fail" as soon as a file is found.
