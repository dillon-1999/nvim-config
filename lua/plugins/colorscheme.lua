-- Colorscheme configuration
return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
