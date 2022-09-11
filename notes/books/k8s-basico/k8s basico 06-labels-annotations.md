---
dg-publish: true
---
## Capítulo 6: Rótulos e Anotações


[TOC]

---

Na página 92 os comandos `kubectl run` estão outdated (não servem para criar deployments).

```sh
# ver labels
kubectl get all --show-labels

# atribuir uma label
kubectl label deployments alpaca-test canary=true

# remover label (basta usar o sufixo `-` menos)
kubectl label deployments alpaca-test canary-

# filtrar `kubectl get` com --selector
kubectl get pods --selector "ver=2"

# limpar tudo
kubectl delete deployments --all
```

Operadores de seleção:

|           Operador           |                Descrição                 |
|:---------------------------- |:---------------------------------------- |
|         `key=value`          |        `key` definido com `value`        |
|         `key!=value`         |   `key` não está definido com `value`    |
|   `key in (value1, value2`   |    `key` é igual `value1` ou `value2`    |
| `key notin (value1, value2)` | `key` é diferente de `value1` e `value2` |
|            `key`             |           `key` está definido            |
|            `!key`            |         `key` não está definido          |

Seletor do tipo `matchExpressions` em um yaml:
```yaml
selector:
  matchExpressions:
    - {key: ver, operator: In, values: [1, 2]}
```

