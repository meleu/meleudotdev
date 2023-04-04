---
dg-publish: true
---
# git squashing commits


Truque rápido e rasteiro de como fazer squash commit:

1. `git rebase -i <hash of commit before first commit>`

isso vai abrir um arquivo com os commits executados desde aquele do hash:

```txt
pick hash1
pick hash2
pick hash3
```

2. Editar este arquivo desta forma:

```txt
pick hash1
squash hash2
squash hash3
```

fechar e salvar. Isso vai fazer o _squash_ em um commit apenas

3. Editar o próximo arquivo que será aberto com as mensagens dos commits.

4. `git push --force origin branchname`

Feito!