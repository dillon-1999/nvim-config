-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Reload Neovim config (install new plugins only)
keymap.set("n", "<leader>rc", function()
  vim.cmd("source $MYVIMRC")

  -- Check if there are any missing plugins
  local lazy = require("lazy")
  local missing = {}
  for _, plugin in pairs(lazy.plugins()) do
    if not plugin._.installed then
      table.insert(missing, plugin.name)
    end
  end

  if #missing > 0 then
    vim.notify("Installing " .. #missing .. " new plugin(s)...", vim.log.levels.INFO)
    lazy.install({
      wait = false,
      show = true,
    })

    -- Auto-close Lazy window after install completes
    vim.defer_fn(function()
      local lazy_view = require("lazy.view")
      if lazy_view.visible() then
        vim.cmd("close")
        vim.notify("Plugins installed!", vim.log.levels.INFO)
      end
    end, 3000)
  else
    vim.notify("Config reloaded! No new plugins to install.", vim.log.levels.INFO)
  end
end, { desc = "Reload config and install new plugins" })

-- Full plugin sync (install, update, clean)
keymap.set("n", "<leader>rC", function()
  vim.notify("Syncing all plugins...", vim.log.levels.INFO)
  require("lazy").sync({
    wait = false,
    show = true,
  })
end, { desc = "Full plugin sync (update all)" })

-- Window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })
