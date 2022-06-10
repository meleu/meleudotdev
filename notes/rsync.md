# rsync

## options

Some sort of a gitignore:


From the man page:
> `--exclude-from=FILE`
>
> This  option is related to the --exclude option, but it specifies a FILE that contains exclude patterns (one per line).  Blank lines in the  file  are  ig‐ nored,  as are whole-line comments that start with ';' or '#' (filename rules that contain those characters are unaffected).
> 
> If FILE is '-', the list will be read from standard input.



## Clonando um sistema com `rsync`

Tava precisando migrar um sistema da Amazon para a Digital Ocean, e para clonar o sistema todo, usei `rsync`.

Conectei na máquina a ser migrada/clonada e mandei o seguinte comando:

```sh
sudo rsync --numeric-ids -aHAXSve ssh \
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