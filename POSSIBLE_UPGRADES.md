# Possible Future Upgrades

This document tracks potential plugins and features to add to the Neovim config in the future.

## Power User Features

### Nvim-surround
**What it does:** Manipulate surrounding characters (quotes, brackets, tags)

**Examples:**
- Change `"hello"` to `'hello'` with `cs"'`
- Add quotes around word with `ysiw"`
- Delete surrounding brackets with `ds(`
- Change HTML tag with `cst<div>`

**Plugin:** `kylechui/nvim-surround`

**Why wait:** Need to learn the keybindings, adds complexity

---

### Flash/Leap/Hop
**What it does:** Jump to any word on screen with 2 keystrokes

**Examples:**
- Type `s` + two characters to jump anywhere visible
- Much faster than hjkl navigation
- Like Vim's EasyMotion but modern

**Plugins:**
- `folke/flash.nvim` (newest, most features)
- `ggandor/leap.nvim` (simple, fast)
- `phaazon/hop.nvim` (original)

**Why wait:** Learning curve, might conflict with existing habits

---

## Better UX/UI

### Trouble.nvim
**What it does:** Pretty list for diagnostics, quickfix, LSP references

**Benefits:**
- Much better than default quickfix window
- Integrates with LSP and Telescope
- Prettier, more usable interface

**Plugin:** `folke/trouble.nvim`

**Keybindings to add:**
```lua
<leader>xx - Toggle Trouble
<leader>xw - Workspace diagnostics
<leader>xd - Document diagnostics
<leader>xq - Quickfix list
```

---

### Todo-comments
**What it does:** Highlight and search TODO, FIXME, NOTE comments

**Benefits:**
- Makes `-- TODO:` stand out with colors
- Search all TODOs with Telescope
- Track work across project

**Plugin:** `folke/todo-comments.nvim`

**Highlights:**
- TODO: (blue)
- HACK: (orange)
- FIXME: (red)
- NOTE: (green)

---

### Dashboard/Start Screen
**What it does:** Fancy start screen when opening Neovim

**Options:**
- `goolord/alpha-nvim` (lightweight, customizable)
- `nvimdev/dashboard-nvim` (more features)

**Benefits:**
- Quick access to recent files
- Session management
- Looks cool
- Can show git status

**Why wait:** Aesthetic, not functional. Nice to have but not essential.

---

## Visual Polish

### Colorizer
**What it does:** Show colors inline for hex codes

**Example:** `#ff0000` displays with red background

**Plugin:** `NvChad/nvim-colorizer.lua`

**Useful for:** CSS, web development, theme editing

---

### Scrollbar
**What it does:** Visual scrollbar showing git changes, diagnostics

**Plugin:** `petertriho/nvim-scrollbar`

**Benefits:**
- See where errors are in file
- See git changes location
- Modern look

---

### Better Notifications
**What it does:** Prettier notification popups

**Plugin:** `rcarriga/nvim-notify`

**Benefits:**
- Replace default notifications
- Stack multiple notifications
- History of notifications
- Integrates with other plugins

---

### Noice.nvim
**What it does:** Complete UI overhaul for messages, cmdline, popups

**Plugin:** `folke/noice.nvim`

**Benefits:**
- Fancy command line
- Better messages
- Modern popups
- Very aesthetic

**Why wait:** Heavy plugin, can be distracting, opinionated

---

### Winbar/Breadcrumbs
**What it does:** Show file path and current function at top of window

**Plugins:**
- `SmiteshP/nvim-navic` (LSP breadcrumbs)
- Built-in `winbar` with custom config

**Benefits:**
- Know where you are in large files
- See current function/class
- Navigate code structure

---

## Quality of Life

### Better Escape
**What it does:** Exit insert mode with `jk` or `jj` instead of Esc

**Plugin:** Can be done with simple keymap:
```lua
vim.keymap.set("i", "jk", "<Esc>")
```

**Why wait:** Might interfere if you actually type "jk" in code/text

---

### Auto-save
**What it does:** Automatically save files when you leave insert mode or switch buffers

**Plugin:** `okuuva/auto-save.nvim`

**Benefits:**
- Never lose work
- One less thing to think about

**Why wait:** Some people prefer manual control over saves

---

### Session Manager
**What it does:** Save and restore workspace sessions

**Plugins:**
- `folke/persistence.nvim`
- `rmagatti/auto-session`

**Benefits:**
- Resume exactly where you left off
- Different sessions for different projects
- Restore all open files, splits, tabs

---

## Advanced Features

### Debugging (DAP)
**What it does:** Full debugging support inside Neovim

**Plugins:**
- `mfussenegger/nvim-dap` (core)
- `rcarriga/nvim-dap-ui` (UI)
- `theHamsta/nvim-dap-virtual-text` (inline values)

**Benefits:**
- Set breakpoints
- Step through code
- Inspect variables
- All inside Neovim

**Why wait:** Complex setup, language-specific configuration needed

---

### Testing Integration
**What it does:** Run and view tests inside Neovim

**Plugins:**
- `nvim-neotest/neotest` (framework)
- Language-specific adapters

**Benefits:**
- Run tests from editor
- See results inline
- Jump to failures

**Why wait:** Complex setup, depends on testing framework

---

### Database Integration
**What it does:** Query databases from Neovim

**Plugin:** `kristijanhusak/vim-dadbod-ui`

**Benefits:**
- Connect to databases
- Run queries
- View results

**Why wait:** Only useful if you work with databases frequently

---

## File Management

### Oil.nvim
**What it does:** Edit filesystem like a buffer

**Plugin:** `stevearc/oil.nvim`

**Benefits:**
- Rename/move files by editing text
- Very unique approach
- Powerful file operations

**Alternative to:** nvim-tree (we already have this)

---

### Harpoon
**What it does:** Quick navigation between important files

**Plugin:** `ThePrimeagen/harpoon`

**Benefits:**
- Mark 4-5 most important files
- Jump between them instantly
- Better than opening same files repeatedly

**Why wait:** Learn existing navigation first

---

## How to Add These Later

When you want to add any of these:

1. Create a new plugin file: `lua/plugins/pluginname.lua`
2. Copy the plugin spec from this document
3. Save the file
4. Run `Space r c` to install
5. Read `:help pluginname` to learn keybindings

## Priority Order (If Adding More)

1. **Nvim-surround** - Very powerful once learned
2. **Trouble.nvim** - Better diagnostics UX
3. **Todo-comments** - Helpful for tracking work
4. **Better escape** (jk mapping) - Easy quality of life
5. **Flash/Leap** - Fast navigation
6. **Colorizer** - If doing web/design work
7. **Dashboard** - Aesthetic improvement
8. Everything else based on need

---

**Last Updated:** 2026-10-03
