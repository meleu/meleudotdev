---
dg-publish: true
---
# database queries from inside neovim

I started to play with [dadbod.vim](https://github.com/tpope/vim-dadbod) to interact with a Postgres Data Base, and it is awesome!

For the [[notes/LazyVim]] users, you just need to enable `lang.sql` in `:LazyExtras`now you can do things like:  

- `<leader>D` - open the DBUI
- while in normal/visual mode, `<leader>S`  to run an SQL query
- you can save your queries

tip: use this connection URL to access a Postgres DB  

```
postgres://{USER}:{PASS}@{DB_HOST}:{PORT}/{DB_NAME}
```

There are more features, but these simple ones are already killer features for me.  

Now I don't need to interrupt my flow to run a simple query in the database.

## references

- <https://www.youtube.com/watch?v=NhTPVXP8n7w>