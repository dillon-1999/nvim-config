-- Mason: LSP, DAP, Linter, and Formatter installer
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- List of servers to auto-install
      ensure_installed = {
        "ts_ls",         -- TypeScript/JavaScript
        "pyright",       -- Python
        "lua_ls",        -- Lua
        "gopls",         -- Go
        "rust_analyzer", -- Rust
        "clangd",        -- C/C++
        "jdtls",         -- Java
        "html",          -- HTML
        "cssls",         -- CSS
        "jsonls",        -- JSON
        "tailwindcss",   -- Tailwind CSS
      },
      -- Auto-install configured servers
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",  -- Prettier formatter
        "stylua",    -- Lua formatter
        "eslint_d",  -- JS linter
        "pylint",    -- Python linter
      },
    })
  end,
}
