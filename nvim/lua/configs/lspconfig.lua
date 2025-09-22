require("nvchad.configs.lspconfig").defaults()

local servers = {
  "biome",
  "csharp_ls",
  "cssls",
  "dockerls",
  "elixirls",
  "gopls",
  "html",
  "jsonls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "ts_ls",
  "vue_ls",
  "zls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
