require("nvchad.configs.cmp")
local cmp = require "cmp"
cmp.setup {
  mapping = {
    ["<Tab>"] = function(fallback)
      if require("supermaven-nvim").has_suggestion() then
        require("supermaven-nvim").accept_suggestion()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
  }
}
