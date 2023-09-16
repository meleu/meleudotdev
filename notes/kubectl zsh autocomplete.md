# kubectl zsh autocomplete

**NOTE** This very same process can be done for `minikube`.

## How to configure

Use the following commands to add the kubectl autocomplete to zsh:

```shell
# create the custom plugin dir
mkdir -p ~/.oh-my-zsh/custom/plugins/kubectl-autocomplete/

# generate the plugin script with kubectl
kubectl completion zsh > ~/.oh-my-zsh/custom/plugins/kubectl-autocomplete/kubectl-autocomplete.plugin.zsh
```

Edit your `~/.zshrc` to include the plugin `kubectl-autocomplete`

`~/.zshrc`:
```
# ...
plugins=(
  # ...
  kubectl-autocomplete
)
# ...
```

Then restart zsh
```
exec zsh
```