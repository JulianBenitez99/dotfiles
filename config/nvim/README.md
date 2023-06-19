# NVIM

## Maps
File: [maps.lua](./lua/maps.lua)

* Leader map: `' '`

## Telescope
Find, Filter, Preview, Pick. All lua, all the time. [Telescope](https://github.com/nvim-telescope/telescope.nvim)

File: [telescope.lua](./after/plugin/telescope.lua)

Keys (normal mode):
* Find files: `<LEADER>ff`
* Live grep: `<LEADER>lg`
* Buffers: `<LEADER>fb`
* Help tags: `<LEADER>fh`
* Git files: `<LEADER>fg`

## LSP

[Key bindings](https://github.com/VonHeikemen/lsp-zero.nvim#keybindings)

## Commentary.vim
Comment out stuff. [vim-commentary](https://github.com/tpope/vim-commentary)

* Comment out a line: `gcc`
* Comment out the target of a motion: `gcap` (comment out a paragraph)
* Visual Mode, comment out selection: `gc`
