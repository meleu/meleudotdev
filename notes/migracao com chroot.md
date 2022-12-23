---
dg-publish: true
---
# migracao com chroot

[TOC]


## Premissas

### Motivação

Preciso migrar um sistema antigo (desenvolvido com PHP 5.3 e rodando em um Ubuntu 12.04) movendo de um VPS caro para outro mais em conta. O sistema é utilizado diariamente e "não pode parar".

### Problemas

- Atualmente o PHP está na versão 7. Nesta versão houve perda de retrocompatibilidade com muitos recursos da versão 5. Portanto, para rodar a aplicação do sistema antigo é mandatório que se tenha uma versão antiga do PHP.

- No VPS mais em conta o sistema é Ubuntu 18.04, e não seria tão simples instalar o PHP 5.3 (cheguei a tentar instalar "from source", porém seria necessário fazer downgrade de uma grande quantidade de bibliotecas, tornando este caminho inconvenientemente complexo).

### Possíveis soluções

1. *Refatorar o código PHP para torná-lo compatível com PHP 7*. Acredito que essa seria a solução ideal. Porém isso demandaria um esforço de programação, e neste trampo específico eu não fui contratado como programador.

2. *Clonar o sistema antigo e fazê-lo rodar no VPS novo.* É disso que tratamos neste artigo.


## Pré-requisitos

- O host que vai receber o sistema clonado precisa permitir que o usuário `root` se conecte via `ssh`.

- no sistema a ser clonado é necessário acesso de super usuário (pode ser via `sudo`) para que possamos copiar todos os arquivos do sistema.


## Clonando com `rsync`

Para clonar o sistema todo, usei `rsync`.

Conectei na máquina a ser migrada/clonada e mandei o seguinte comando (repito: **comando a ser executado na máquina original que será clonada**):

```sh
sudo rsync \
  --numeric-ids \
  -aHAXSve ssh \
  --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
  / root@NewServer:/destination/directory
```

*Atenção*: lembrar de ajustar `@NewServer:/destination/directory` para os valores adequados.

É fundamental utilizar a opção `--numeric-ids` e `-A`, caso contrário todos os arquivos copiados terão suas permissões alteradas para que sejam de propriedade do usuário que está recebendo esses arquivos no host "NewServer".

A man page do `rsync` explica a função de cada uma das opções que utilizamos aqui, vou colocar aqui o trecho com um resumo:

```
     --numeric-ids           don't map uid/gid values by user/group name
 -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
 -H, --hard-links            preserve hard links
 -A, --acls                  preserve ACLs (implies -p)
 -X, --xattrs                preserve extended attributes
 -S, --sparse                handle sparse files efficiently
 -v, --verbose               increase verbosity
 -e, --rsh=COMMAND           specify the remote shell to use
     --exclude=PATTERN       exclude files matching PATTERN
```

**Observação**: é de suma importância que o acesso ao host que vai receber os arquivos seja `root` pois queremos manter as permissões e as informações de proprietário e grupo dos arquivos. E se usarmos um usuário regular para receber os arquivos, ele não terá permissão de alterar as permissões e consequentemente todos os arquivos pertencerão a ele (o que inviabiliza o que estamos querendo fazer aqui).

A execução deste comando vai demorar muitos minutos. Recomenda-se um bom café...


## `schroot`

O `schroot` é uma ferramentinha bem bacana que já facilita muita coisa que teríamos que fazer uma a uma (e provavelmente esqueceríamos de algo), como por exemplo montar as partições `/proc`, `/dev`, copiar alguns arquivos do `/etc`, dentre outras coisas.

Já no novo host, rodando Ubuntu 18.04, vamos instalar e configurar o `schroot`.

```
sudo apt install schroot
```

Editar o arquivo `/etc/schroot/schroot.conf`. No meu caso utilizei a seguinte configuração:

```
[SistemaAntigo]
description=Ubuntu 12.04 - Sistema Antigo
type=plain
directory=/SistemaAntigo
# ajustar "meleu" para o seu usuário
users=meleu
groups=root
root-groups=root
# importante que o setup.nssdatabases seja em branco!
setup.nssdatabases=

```

**ATENÇÃO**: É necessário que a opção `setup.nssdatabases` esteja em branco! O motivo disso é explicado na man page `schroot-faq`, mas vou tentar explicar com minhas palavras.

Lembra que copiamos os arquivos utilizando `rsync --numeric-ids`? Pois bem, fizemos isso para que todos os arquivos copiados tenham suas informações de proprietário e grupo baseados no **número** de *user ID* e *group ID* (`uid` e `gid`). A "tradução" do uid/gid em um nome de usuário/grupo é feita pelo sistema através do arquivo `/etc/passwd`.

O comportamento default do `schroot` é sobrescrever alguns arquivos do sistema `chroot`ed com os arquivos do host, como por exemplo `passwd`, `shadow`, `group`, dentre outros presentes em `/etc/`. E nós não queremos sobrescrever estes arquivos. Precisamos dos originais quando formos rodar a nosso sistema `chroot`ed.


## Testando se funcionou

Agora veremos se o nosso sistema antigo vai rodar legal nesse host.

```
sudo schroot --all --directory / --verbose
```

Após esse comando você estará no sistema `chroot`ed logado como super usuário. Vale a pena dar uma navegada no sistema de arquivos para dar uma conferida nas coisas.

Por exemplo, para conferir se as permissões estão ok, vale mandar um `ls -lh /home/` e checar se o proprietário/grupo dos diretórios estão batendo com os usuários/grupos do sistema antigo. Se tiverem números no lugar de nomes de usuário, algo deu errado (ou na cópia dos arquivos com `rsync`, ou na configuração do `setup.nssdatabases` do `schroot`).

É importante também mandar um `ping` em algum site qualquer para ver se o DNS está configurado corretamente. Caso não esteja, saia do `chroot` (basta digitar `exit`) e copie o `/etc/resolv.conf`, tipo assim:

```
sudo rm /destination/directory/etc/resolv.conf
sudo cp /etc/resolv.conf /destination/directory/etc/resolv.conf
```

Depois disso use novamente o `schroot --all --directory /` e teste o `ping` novamente.

## ajeitar o `/etc/fstab`

TBD


## iniciando os serviços...

Se tudo estiver ok, é hora de iniciar os serviços que normalmente seriam iniciados na hora do boot do sistema antigo (Apache, banco de dados, e outros daemons). Para obter isso eu fiz o seguinte:

```
sudo /etc/init.d/rc 2 -
```

Após os serviços serem iniciados, vamos no browser de algum outro computador e testamos se a aplicação PHP está rodando conforme esperado.

**[TODO]**: Observei que o `cron` não funcionou, mas vamos resolver isso mais adiante...

## Configurando timezone

No novo servidor o timezone estava setado como UTC, e na aplicação a ser executada há uma necessidade de que o horário seja o brasileiro, pois há muitos registros de log que são importantes.

Para isso devemos configurar o timezone *dentro do ambiente `chroot`*:

```
sudo dpkg-reconfigure tzdata
```

Seguir as instruções e escolher `America/Sao_Paulo`.


## Iniciar automaticamente os serviços no sistema clonado

USEI O systemd PARA ISSO. A INFORMAÇÃO ABAIXO ESTÁ INCORRETA!

Para isso eu usei o `crontab` no host "principal", ou seja, fora do `chroot`:

```
sudo crontab -e
```

Fui no final do arquivo e inseri a seguinte linha:

```
@reboot /etc/bin/schroot --all --directory / --verbose -- su -c /etc/init.d/rc\ 2 -
```

Reiniciei o sistema e após o reboot observei que tudo estava rodando conforme esperado. **EXCETO `cron`!**

**FALTA ESCREVER SOBRE `cron` e sobre as soluções para backup diário**