# Regra da Separação - The Art of Unix Programming

**Separe política do mecanismo; separe interface dos motores.**

Um exemplo mencionado noi livro é o caso do X (o motor gráfico genérico utilizado no Unix).

> (...) política e mecanismo tendem a mudar em diferentes escalas de tempo, com a política mudando muito mais rápido que o mecanismo. As modas de *look and feel* dos *toolkits* de GUI vêm e vão, mas *raster* e *compositing* são eternos.
> Portanto, entrelaçar política com mecanismo tem dois efeitos negativos: deixa a política rígida e mais difícil de mudar em respostas aos requerimentos do usuário, e significa que tentar mudar a política tem uma forte tendência a desestabilizar os mecanismos.
> Por outro lado, separando os dois, tornamos possível experimentar novas políticas sem quebrar os mecanismos.

Isso também está relacionado com a maneira de organizar sua aplicação separando-a em back-end e front-end.

