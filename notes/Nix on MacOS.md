---
dg-publish: true
---
# Nix on MacOS

<iframe width="560" height="315" src="https://www.youtube.com/embed/LE5JR4JcvMg?si=51qeugxWkpPj5RqJ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

Install following official docs.

```shell
# try it!
nix-shell -p nix-info --run "nix-info -m"

# executing a flake
nix --extra-experimental-features "nix-command flakes" run github:zmre/pwzsh

# once you're in the demo environment...
mkdir -p src/system-config
touch flake.nix
nvim flake.nix
```

`flake.nix`:
```nix
{
  description = "my minimal flake";
  inputs = {
    
  };
  outputs = {
    
  };
}
```