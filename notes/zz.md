---
dg-publish: true
---
I'm thinking about using features of [funcoeszz](https://funcoeszz.net/) as inspiration to write about [bashly](https://bashly.dev/)

## Roadmap

### [zzmaiusculas](https://github.com/funcoeszz/funcoeszz/blob/master/zz/zzmaiusculas.sh)

```
Converte todas as letras para MAIÚSCULAS, inclusive acentuadas.
Uso: zzmaiusculas [texto]
Ex.: zzmaiusculas eu quero gritar                # via argumentos
     echo eu quero gritar | zzmaiusculas         # via STDIN
```

### [zzminusculas](https://github.com/funcoeszz/funcoeszz/blob/master/zz/zzminusculas.sh)

```
Converte todas as letras para minúsculas, inclusive acentuadas.
Uso: zzminusculas [texto]
Ex.: zzminusculas NÃO ESTOU GRITANDO             # via argumentos
     echo NÃO ESTOU GRITANDOO | zzminusculas     # via STDIN
```

### [zzaleatorio](https://github.com/funcoeszz/funcoeszz/blob/master/zz/zzaleatorio.sh)

```
Gera um número aleatório.
Sem argumentos, comporta-se igual a $RANDOM.
Apenas um argumento, número entre 0 e o valor fornecido.
Com dois argumentos, número entre esses limites informados.

Uso: zzaleatorio [número] [número]
Ex.: zzaleatorio 10
     zzaleatorio 5 15
     zzaleatorio
```

### [zzsenha](https://github.com/funcoeszz/funcoeszz/blob/master/zz/zzsenha.sh)

```
Gera uma senha aleatória de N caracteres.
Obs.: Sem opções, a senha é gerada usando letras e números.

Opções: -p, --pro   Usa letras, números e símbolos para compor a senha
        -n, --num   Usa somente números para compor a senha
        -u, --uniq  Gera senhas com caracteres únicos (não repetidos)

Uso: zzsenha [--pro|--num] [n]     (padrão n=8)
Ex.: zzsenha
     zzsenha 10
     zzsenha --num 9
     zzsenha --pro 30
     zzsenha --uniq 10
```


### [zztestar](https://github.com/funcoeszz/funcoeszz/blob/master/zz/zztestar.sh)

```
Testa a validade do número no tipo de categoria selecionada.
Nada é ecoado na saída padrão, apenas deve-se analisar o código de retorno.
Pode-se ecoar a saída de erro usando a opção -e antes da categoria.

 Categorias:
  ano                      =>  Ano válido
  ano_bissexto | bissexto  =>  Ano Bissexto
  exp | exponencial        =>  Número em notação científica
  numero | numero_natural  =>  Número Natural ( inteiro positivo )
  numero_sinal | inteiro   =>  Número Inteiro ( positivo ou negativo )
  numero_fracionario       =>  Número Fracionário ( casas decimais )
  numero_real              =>  Número Real ( casas decimais possíveis )
  complexo                 =>  Número Complexo ( a+bi )
  dinheiro                 =>  Formato Monetário ( 2 casas decimais )
  bin | binario            =>  Número Binário ( apenas 0 e 1 )
  octal | octadecimal      =>  Número Octal ( de 0 a 7 )
  hexa | hexadecimal       =>  Número Hexadecimal ( de 0 a 9 e A até F )
  ip                       =>  Endereço de rede IPV4
  ip6 | ipv6               =>  Endereço de rede IPV6
  mac                      =>  Código MAC Address válido
  data                     =>  Data com formatação válida ( dd/mm/aaa )
  hora                     =>  Hora com formatação válida ( hh:mm )

  Obs.: ano, ano_bissextto e os
        números naturais, inteiros e reais sem separador de milhar.

Uso: zztestar [-e] categoria número
Ex.: zztestar ano 1999
     zztestar ip 192.168.1.1
     zztestar hexa 4ca9
     zztestar numero_real -45,678
```

