-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
set_keymap("n", "<leader>Y", '"+Y', { noremap = true, silent = true })
