---
dg-publish: true
---

Conteúdo copiado daqui: <https://www.inf.ufpr.br/nicolui/grad/Programas/Curiosidades/Gerador-CPF/Algoritmo-CPF.txt>

```
        Algoritmo do CPF - O que está por trás do gerador de CPF
        ========================================================
	

Para exemplificar  o processo vamos  gerar um CPF válido,  calculando os
dígitos verificadores de um número hipotético, 111.444.777-XX.

Calculando o Primeiro Dígito Verificador

O  primeiro  dígito  verificador  do  CPF é  calculado  utilizando-se  o
seguinte algoritmo.

1) Distribua os 9 primeiros dígitos  em um quadro colocando os pesos 10,
   9, 8, 7,  6, 5, 4, 3,  2 abaixo da esquerda para  a direita, conforme
   representação abaixo: 

1 	1 	1 	4 	4 	4 	7 	7 	7
10 	9 	8 	7 	6 	5 	4 	3 	2

2) Multiplique os valores de cada coluna:

1 	1 	1 	4 	4 	4 	7 	7 	7
10 	9 	8 	7 	6 	5 	4 	3 	2
10 	9 	8 	28 	24 	20 	28 	21 	14

3) Calcule o somatório dos resultados (10+9+...+21+14) = 162

4) O resultado obtido (162) será divido por 11. Considere como quociente
   apenas  o valor  inteiro, o  resto da  divisão será  responsável pelo
   cálculo do primeiro dígito verificador.

Vamos acompanhar: 162 dividido por 11 obtemos 14 como quociente e 8 como
resto da  divisão. Caso  o resto da  divisão seja  menor que 2,  o nosso
primeiro dígito verificador se torna 0 (zero), caso contrário subtrai-se
o  valor obtido  de  11, que  é  nosso caso.  Sendo  assim nosso  dígito
verificador é 11-8,  ou seja, 3 (três). Já temos  portanto parte do CPF,
confira: 111.444.777-3X.

Calculando o Segundo Dígito Verificador

1)  Para  o cálculo  do  segundo dígito  será  usado  o primeiro  dígito
    verificador  já  calculado.   Montaremos  uma  tabela  semelhante  a
    anterior  só que  desta vez  usaremos  na segunda  linha os  valores
    11,10,9,8,7,6,5,4,3,2 já que  estamos incorporando mais um algarismo
    para esse cálculo. Veja:

1 	1 	1 	4 	4 	4 	7 	7 	7 	3
11 	10 	9 	8 	7 	6 	5 	4 	3 	2

2)  Na próxima etapa  faremos como  na situação  do cálculo  do primeiro
    dígito  verificador, multiplicaremos  os  valores de  cada coluna  e
    efetuaremos o  somatório dos resultados  obtidos: (11+10+...+21+6) =
    204.

1 	1 	1 	4 	4 	4 	7 	7 	7 	3
11 	10 	9 	8 	7 	6 	5 	4 	3 	2
11 	10 	9 	32 	28 	24 	35 	28 	21 	6

3) Realizamos  novamente o  cálculo do módulo  11. Dividimos o  total do
   somatório por 11 e consideramos o resto da divisão.

Vamos acompanhar: 204 dividido por 11 obtemos 18 como quociente e 6 como
resto da divisão.

4) Caso o valor  do resto da divisão seja menor que  2, esse valor passa
   automaticamente a  ser zero,  caso contrário (como  no nosso  caso) é
   necessário  subtrair o  valor obtido  de 11  para se  obter  o dígito
   verificador. Logo, 11-6= 5, que é o nosso segundo dígito verificador.

Neste caso chegamos  ao final dos cálculos e  descobrimos que os dígitos
verificadores do nosso  CPF hipotético são os números 3  e 5, portanto o
CPF ficaria assim: 111.444.777-35.

O  gerador  de  cpf  apresentado  neste site  funciona  com  base  neste
algoritmo.  A rotina  de gerar  CPF 's  válidos, inicialmente  sorteia 9
números. Calcula-se o  1o dígito verificador e integra-se  o mesmo aos 9
números  iniciais.   Prossegue-se  com  o  cálculo   do  segundo  dígito
verificador como ensinado. Ao final, o criador de CPF emite um número de
CPF válido.

=========================================================================

FONTE: http://www.geradorcnpj.com/algoritmo_do_cpf.htm (em Seg Jun 17 15:06:49 BRT 2013)
```