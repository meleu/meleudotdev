---
dg-publish: true
---
# Test && Commit || Revert

https://increment.com/testing/testing-the-boundaries-of-collaboration/


## TCR Variants

There are some cool insights about how to implement TCR workflow here: https://medium.com/@tom-010/tcr-variants-test-commit-revert-bf6bd84b17d3

### the original

```bash
./test \
  && git commit -am WIP \
  || git reset --hard
```

Problem: if test fails, the test code gets deleted.

### the relaxed

Assuming the production code is in `src/` and test code is in a separated directory (let's say: `test/`).

```bash
./test \
  && git commit -am WIP \
  || git checkout HEAD -- src/
```

### the standalone binary

https://github.com/murex/TCR

Important thing about TCR solutions:

> The only things it needs to know for a language are the following:
> 
> - Where to find, and how to recognize source files
> - Where to find, and how to recognize test files
> - How to run the tests
> - (for compiled languages) How to build the code

---


## O que tenho em mente

Antes de começar, verificar se existem arquivos alterados e/ou staged. Abortar em caso positivo, com um alerta do motivo para o usuário.


Pré-requisitos:

> - Where to find, and how to recognize source files
> - Where to find, and how to recognize test files
> - How to run the tests

rodar os testes...

verificar se o último commit message é `WIP`...


verificar se último commit foi vazio

```bash
# se commit for vazio,
# isso 👇 retorna string vazia
git diff-tree \
  --no-commit-id \
  --name-only \
  -r HEAD

# criar função is_empty_commit
```

se NÃO for um commit vazio, criar um:

```bash
git commit \
  --allow-empty \
  --message "TCR WIP"
```

se passar, vai "amendando" no último commit

```bash
git commit \
  --all \
  --amend \
  --no-edit

# na dúvida se --all é uma boa
```

se não passar, reverte

```bash
# mudei isso pra git restore
git checkout HEAD -- \
  ${dir_with_production_code}
```

OBS.: depois de um revert o teste será executado novamente (por conta do watch), o output desse novo teste deve ser omitido

[neovim reload file](https://www.reddit.com/r/neovim/comments/f0qx2y/automatically_reload_file_if_contents_changed/?rdt=37818)

