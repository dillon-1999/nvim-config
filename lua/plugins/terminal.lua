-- Terminal integration
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- Terminal keymaps
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- Custom terminal commands
    local Terminal = require("toggleterm.terminal").Terminal

    -- Floating terminal
    local float_term = Terminal:new({
      direction = "float",
      hidden = true,
    })

    function _FLOAT_TERM_TOGGLE()
      float_term:toggle()
    end

    -- Horizontal terminal
    local horizontal_term = Terminal:new({
      direction = "horizontal",
      hidden = true,
    })

    function _HORIZONTAL_TERM_TOGGLE()
      horizontal_term:toggle()
    end

    -- Vertical terminal
    local vertical_term = Terminal:new({
      direction = "vertical",
      hidden = true,
    })

    function _VERTICAL_TERM_TOGGLE()
      vertical_term:toggle()
    end

    -- Keymaps for different terminal types
    vim.keymap.set("n", "<leader>tf", "<cmd>lua _FLOAT_TERM_TOGGLE()<CR>", { desc = "Toggle floating terminal" })
    vim.keymap.set("n", "<leader>th", "<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>", { desc = "Toggle horizontal terminal" })
    vim.keymap.set("n", "<leader>tv", "<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>", { desc = "Toggle vertical terminal" })
    vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

    -- Numbered terminals for multiple instances
    vim.keymap.set("n", "<leader>t1", "<cmd>ToggleTerm 1 direction=horizontal<CR>", { desc = "Terminal 1 (horizontal)" })
    vim.keymap.set("n", "<leader>t2", "<cmd>ToggleTerm 2 direction=horizontal<CR>", { desc = "Terminal 2 (horizontal)" })
    vim.keymap.set("n", "<leader>t3", "<cmd>ToggleTerm 3 direction=horizontal<CR>", { desc = "Terminal 3 (horizontal)" })
    vim.keymap.set("n", "<leader>t4", "<cmd>ToggleTerm 4 direction=horizontal<CR>", { desc = "Terminal 4 (horizontal)" })

    -- Toggle all terminals at once
    vim.keymap.set("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", { desc = "Toggle all terminals" })
  end,
}
