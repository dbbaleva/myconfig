-- ~/.config/nvim/lua/plugins/codecompanion.lua
-- Drop into your NvChad / lua/plugins/ directory.
-- This file returns a lazy.nvim-style plugin list (NvChad reads this).

return {
  -------------------------------------------------------------------
  -- CodeCompanion plugin (lazy loaded on its user commands)
  -------------------------------------------------------------------
  {
    "olimorris/codecompanion.nvim",
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionCmd",
      "CodeCompanionActions",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- treesitter is required by codecompanion for markdown parsing
      { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
      -- optional, recommended for nicer chat buffer rendering
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
      -- optional for inline-assistant diffs
      { "echasnovski/mini.diff", opts = {} },
      -- optional image clipboard support for chat buffer
      {
        "HakonHarnes/img-clip.nvim",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
    },

    -- plugin options (applies the CodeCompanion docs' examples)
    opts = function()
      -- NOTE: log_level is set under opts.opts per CodeCompanion docs
      return {
        --- Strategies choose which adapter is used for chat/inline/etc.
        strategies = {
          -- keep the chat strategy using the 'openai' adapter in this example
          chat = {
            adapter = "copilot", -- user can change to "copilot", "anthropic", etc.
            -- optionally you can specify model here (or in adapters.extend)
            -- model = "gpt-4o"
          },
          inline = {
            adapter = "copilot",
          },
        },

        -- adapters configuration: extend the built-in openai adapter
        adapters = {
          http = {
            adapter = function()
              -- extend allows you to change schema defaults or env names.
              return require("codecompanion.adapters").extend("copilot", {
                -- default model shown as example; change to your preferred model
                schema = {
                  model = { default = "claude-3.5-sonnet" },
                },
              })
            end,
          },
        },

        -- runtime options (log level etc). The nested `opts` table is intentional.
        opts = {
          log_level = "INFO", -- "DEBUG" for troubleshooting
        },

        -- small display tweak: use telescope for the Action Palette (optional)
        display = {
          action_palette = {
            provider = "telescope", -- "vim.ui.select" is default
          },
        },
      }
    end,

    -- explicit runtime setup + convenient keymaps
    config = function(_, opts)
      -- call setup with the opts produced above (safe even if lazy.nvim would do it)
      require("codecompanion").setup(opts)

      -- recommended keymaps (feel free to change)
      -- open action palette
      vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionActions<cr>", { desc = "CodeCompanion: Actions" })
      -- toggle chat buffer
      vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "CodeCompanion: Toggle Chat" })
      -- add visual selection to chat
      vim.keymap.set("v", "<leader>ax", "<cmd>CodeCompanionChat Add<cr>", { desc = "CodeCompanion: Add selection to Chat" })
      -- inline assistant (use in normal or visual)
      vim.keymap.set({ "n", "v" }, "<leader>ai", "<cmd>CodeCompanion<cr>", { desc = "CodeCompanion: Inline Assistant" })
      -- quick open chat (send argument)
      vim.keymap.set("n", "<leader>aq", function()
        vim.ui.input({ prompt = "Quick CodeCompanion prompt: " }, function(input)
          if input and input ~= "" then
            vim.cmd("CodeCompanionChat " .. vim.fn.shellescape(input))
          end
        end)
      end, { desc = "CodeCompanion: Quick Chat" })
    end,
  },

  -------------------------------------------------------------------
  -- Ensure Tree-sitter has the required markdown parsers
  -- (CodeCompanion docs require these parsers to be installed)
  -------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    -- Extend NvChad / nvim-treesitter's opts to include markdown parsers
    opts = function(_, cfg)
      cfg = cfg or {}
      cfg.ensure_installed = cfg.ensure_installed or {}

      local wanted = { "markdown", "markdown_inline" }
      for _, p in ipairs(wanted) do
        if not vim.tbl_contains(cfg.ensure_installed, p) then
          table.insert(cfg.ensure_installed, p)
        end
      end

      return cfg
    end,
  },

  -------------------------------------------------------------------
  -- Optional: render-markdown plugin for nicer chat buffer rendering
  -------------------------------------------------------------------
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {},
  },

  -------------------------------------------------------------------
  -- Optional: mini.diff for inline diffs used by the inline assistant
  -------------------------------------------------------------------
  {
    "echasnovski/mini.diff",
    config = function()
      require("mini.diff").setup()
    end,
  },

  -------------------------------------------------------------------
  -- Optional: clipboard image support in chats (optional)
  -------------------------------------------------------------------
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}

