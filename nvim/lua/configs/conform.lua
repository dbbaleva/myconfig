local options = {
  formatters_by_ft = {
    csharp = { "csharpier" },
    css = { "biome" },
    elixir = { "mix" },
    html = { "prettier" },
    javascript = { "biome" },
    json = { "biome" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "isort", "black" },
    typescript = { "biome" },
    vue = { "biome" },
    yaml = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
