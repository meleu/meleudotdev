---
dg-publish: true
---
experiência ruim!

[driver bugado](https://plus.diolinux.com.br/t/dell-g15-5530-problemas-com-distros-linux/67825)

> o problema de congelamento é devido a versão do Kernel. Você tem que instalar o linux com uma versão mais antiga (eu uso a 6.6) e deixa ela fixa pra você poder usá-la quando der boot.


Solução que encontrei: instalar o Pop OS 22.04 (que tem um kernel 6.5) e fixar essa versão pra nunca ser atualizada:

```bash
# get kernel version 
uname -r

# mark kernel and drivers
apt-mark hold <nome-do-pacote>
```

