return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function() 
      return require "configs.cmp"
    end
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info",
        disable_inline_completion = false,
        disable_keymaps = false,
      })
    end,
    lazy = false, -- or true if you want to lazy load
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufEnter",
    opts = require "configs.context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "folke/snacks.nvim",
    opts = require "configs.snacks",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }
}
