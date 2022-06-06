# Regra da Composição - The Art of Unix Programming

**Projete programas para serem conectados a outros programas.**

> É difícil evitar programar monolitos supercomplicados se nenhum de seus programas podem conversar entre si.

> (...) No Unix clássico, tantos programas quanto possível são escritos como simples *filtros*, que pegam um simples fluxo de texto como entrada e o processa em outro simples fluxo de texto como saída.
> **Apesar da mitologia popular, esta prática é preferida não porque programadores Unix odeiam interfaces gráficas. É porque se você não escreve programas que aceitam e emitem simples fluxos de texto, é muito mais difícil de conectar os programas.**

> Um programa em uma ponta de um fluxo de texto deve se preocupar o mínimo possível a respeito do programa na outra ponta. Deve ser fácil de substituir uma ponta com uma implementação completamente diferente sem atrapalhar a outra.

> Antes de escrever uma GUI, é aconselhável perguntar se as complicadas partes interativas do seu programa podem ser segregadas em uma parte e os algoritmos "burro de carga" em outra, com um simples fluxo de comandos ou protocolo de aplicação conectando os dois.

---

De alguma forma isso me fez lembrar de uma maneira de classificar funções que eu vi em [[Eloquent JavaScript]]:

> Functions can be roughly divided into those that are called for their side effects and those that are called for their return value.
