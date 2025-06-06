require "nvchad.mappings"

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "t" }, "<C-/>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

if pcall(require, "snacks") then
  local snacks = require "snacks"
  -- unset keymaps
  vim.keymap.del("n", "<leader>b")
  vim.keymap.del("n", "<leader>x")

  if vim.fn.executable "lazygit" == 1 then
    map("n", "<leader>gg", function()
      snacks.lazygit()
    end, { desc = "Open lazygit" })
  end
  map("n", "<leader>bd", function()
    snacks.bufdelete()
  end, { desc = "Delete Buffer" })
  map("n", "<leader>bo", function()
    snacks.bufdelete.other()
  end, { desc = "Delete Other Buffers" })
end
