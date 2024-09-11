---
dg-publish: true
---

[Nice introductory article!](https://m4xshen.dev/posts/develop-a-neovim-plugin-in-lua)

Leveraging Telescope
https://youtu.be/HXABdG3xJW4?si=LKsH40bAg3L7ATFj

TJDevries
https://youtu.be/n4Lp4cV8YR0?si=zmuRUaSh1FiC3rOt

testing plugins:
https://hiphish.github.io/blog/2024/01/29/testing-neovim-plugins-with-busted/



---

## Playing with Telescope

### 1. setup

```bash
mkdir nvim-telescope-docker
cd nvim-telescope-docker
mkdir -p lua/telescope_docker
```

keybind to write and source (`r`eload):
`nmap <Leader>r :luafile %<cr>`

`lua/telescope_docker/init.lua`:
```lua
local M = {}

M.show_docker_images = function ()
  print("Hello")
end

M.show_docker_images()

return M
```

Use `<leader>r` to see if `Hello` is going to be printed.

### 2. telescope basic usage

```lua
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local config = require('telescope.config').values

local M = {}

M.show_docker_images = function (opts)
  pickers.new(opts, {
    finder = finders.new_table({
      "Yes",
      "No",
      "Maybe",
      "Perhaps",
    }),
    sorter = config.generic_sorter(opts)
  }):find()
end
```

### 3. telescope: dealing with richer data

```lua
-- ...
local previewers = require("telescope.previewers")
-- ...

pickers.new(opts, {
  finder = finders.new_table({
    results = {
      { name = "Yes", value = {1, 2, 3}},
      { name = "No", value = {1, 2, 3}},
      { name = "Maybe", value = {1, 2, 3}},
      { name = "Perhaps", value = {1, 2, 3}},
    },
    entry_maker = function(entry)
        return {
          display = entry.name,
          ordinal = entry.name,
        }
    end
  }),
  sorter = config.generic_sorter(opts),
  previewer = previewers.new_buffer_previewer ({
    title = "Docker Image Details",
    define_preview = function (self, entry)
      vim.api.nvim_buf_set_lines(self.state.bufnr, 0, 0, true, {"Hello", "Everyone" })
    end
  })
})
```

[PAREI AQUI](https://youtu.be/HXABdG3xJW4?si=9ev4hIZQXKsMZd1w&t=545)
