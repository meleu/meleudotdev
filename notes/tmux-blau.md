## vídeos do blau

### vídeo 1

- <https://youtu.be/fAH3zxgJcrg>
- <https://youtu.be/JNJL0w4RJyg> (parei em 1:00:00)


```
# listar sessões
tmux ls

# conectar a uma sessão existente
tmux a  # conecta a última sessão utilizada
tmux ls # pra pegar o target
tmux a -t ${target}

# nova sessão
tmux new

# nova sessão com um nome
tmux new -s name

# iniciar nova sessão dettached
tmux new -d

# matar uma sessão
tmux ls # para pegar o target
tmux kill-session -t ${target}

# matar todas as sessões
tmux kill-server

# renomear uma sessão
# prefix $
tmux rename-session -t ${target} ${newName}

```

- desconectar da sessão atual: `prefix d`
- fechar painel atual `prefix x`
- abrir nova janela `prefix c`
- renomear janela `prefix ,`
- [**muito legal**] abrir a listagem de sessões/janelas: `prefix w`
- entrar no modo de comando: `prefix :`

modo buffer:

- **importante**: requer `:setw -g mode-keys vi`
- `prefix [` entra no modo buffer
- `space move` seleciona
- `enter` copia e volta pro modo "normal"
- `prefix ]` cola

copy'n'paste:

- `prefix #` abre a listagem de buffer
- `prefix =` abre a listagem de buffers numa visualização mais bonita e ao selecionar já cola



painéis:

- swap panels: `prefix }` / `prefix {`
- converte um painel em janela: `prefix !`
- redimensionar painel: `prefix ctrl-arrow`
- redimensionar igualmente: `prefix E`

**bônus**: ferramenta útil para mostrar as teclas que você está pressionando para um screencast: `screenkey`

