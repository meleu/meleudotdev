# Checking if directory is empty

Although not very readable, this is what I believe is the most effective way:

```bash
find /path/to/dir -maxdepth 0 -type d -empty

# if you want to execute something:
find /path/to/dir -maxdepth 0 -type d -empty \
  -exec echo {} is empty \;
```
