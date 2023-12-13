-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", opts)
vim.keymap.set("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", opts)
