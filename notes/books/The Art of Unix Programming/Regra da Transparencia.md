---
dg-publish: true
---
# Regra da Transparência - The Art of Unix Programming

from [[The Art of Unix Programming]]

**Projete para visibilidade para tornar mais fácil a inspeção e a depuração.**

> **Como depuração frequentemente ocupa 3/4 ou mais do tempo de desenvolvimento, trabalho antecipado para facilitar depuração pode ser um investimento muito bom.** Uma maneira particularmente efetiva de facilitar a depuração é projetar para *transparência* e *descoberta*.
> 
> Um sistema de software é **transparente** quando você pode olhar pra ele e imediatamente entender o que ele está fazendo e como. Ele é *descobrível* quando possui facilidades para monitorar e mostrar se estado interno (...).
> 
> (...) o programa deve ser apto a demonstrar sua própria corretude e comunicar aos futuros desenvolvedores o modelo mental do desenvolvedor original.
> 
> Para um programa demonstrar sua própria corretude, ele precisa usar formatos de entrada e saída suficientemente simples de forma que a relação apropriada entre entrada válida e saída correta seja fácil de conferir.
> 
> O objetivo de projetar para transparência e descoberta deve também encorajar interfaces simples que podem facilmente ser manipuladas por outros programas - em particular, ferramentas de teste e monitoramento e scripts de depuração.

