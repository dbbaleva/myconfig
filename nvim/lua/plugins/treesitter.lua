return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c_sharp" })
      end
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enabled = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multi_line_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = nil,
      zindex = 20,
      on_attach = nil,
    },
  },
}
