return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- table.insert(opts.ensure_installed, "csharpier")
      table.insert(opts.ensure_installed, "bicep-lsp")
      table.insert(opts.ensure_installed, "xmlformatter")
    end,
  },
}
