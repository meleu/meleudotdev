# Regra da Clareza - The Art of Unix Programming

**Clareza é melhor que esperteza.**

> Devido à manutenção ser tão importante e tão cara, escreva programas como se a comunicação mais importante que eles fazem não é com computador que os executam mas com os seres humanos que irão ler e manter seu código no futuro (incluindo você mesmo).
> 
> Na tradição Unix, as implicações desse conselho vai além de apenas comentar seu código. Boas práticas Unix também envolve escolher seus algoritmos e implementações para manutenção futura. **Trocar um pequeno aumento de performance por um grande aumento na complexidade e obscuridade de sua técnica é um mau negócio** - não apenas por que código complexo é mais propenso a conter bugs, mas também porque código complexo será mais difícil de ler para os futuros mantenedores.

> Nunca se esforce para decifrar um código sutil por três vezes. A primeira vez pode ter sido um golpe de sorte, mas se você se vê tendo que descobrir o que ele faz uma segunda vez - porque a primeira foi há muito tempo e você esqueceu os detalhes - é hora de comentar o código para que a terceira vez seja relativamente indolor.
> -- Henry Spencer

Sobre o comentário acima, acredito que além de adicionar comentários, existe a possibilidade de refatorar o código para deixá-lo mais claro (nem que seja apenas agrupar o código "obscuro" em uma função com um nome descritivo).
