-- Which-key: Keybinding popup helper
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      window = {
        border = "rounded",
        position = "bottom",
      },
    })

    -- Document existing key chains
    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>s", group = "Split" },
      { "<leader>t", group = "Terminal" },
      { "<leader>r", group = "Reload" },
      { "<leader>n", group = "No..." },
    })
  end,
}
