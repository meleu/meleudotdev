---
dg-publish: true
---
# minikube

## deploying local images

> tip from: <https://octopus.com/blog/local-images-minikube>

Just push your local image to the "minikube registry"

```bash
minikube image load <my_image>:<tag>
```

Now you can reference your image in your deployment manifest.

A quick&dirty way to launch your app could be like this:
```bash
# create the deployment
kubectl create deployment <myapp> --image=<myimage>:<tag>

# create the NodePort service
kubectl expose deployment <myapp> --type=NodePort --port=<port>

# check if the service is running fine
kubectl get services <myapp>

# easiest way to access this service:
minikube service <myapp>

# alternatively: kubectl port-forwarding to localhost:8080
kubectl port-forward service/<myapp> 8080:<port>
# and then access http://localhost:8080
```

---
## autocomplete

Use the following commands to add the minikube autocomplete to zsh:

```shell
# create the custom plugin dir
mkdir -p ~/.oh-my-zsh/custom/plugins/minikube-autocomplete/

# generate the plugin script with minikube
minikube completion zsh > ~/.oh-my-zsh/custom/plugins/minikube-autocomplete/minikube-autocomplete.plugin.zsh
```

Edit your `~/.zshrc` to include the plugin `minikube-autocomplete`

`~/.zshrc`:
```
# ...
plugins=(
  # ...
  minikube-autocomplete
)
# ...
```

Then restart zsh
```
exec zsh
```
