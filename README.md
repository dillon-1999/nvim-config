# My Neovim Configuration

Portable Neovim configuration using lazy.nvim plugin manager.

## Installation

### Requirements
- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)
- Node.js (for some LSP servers)
- Python 3 (for Python LSP)

### Fresh Installation

1. **Backup existing config (if any):**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository:**
   ```bash
   git clone https://github.com/dillon-1999/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

   Plugins and LSP servers will automatically install on first launch.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── settings.lua         # Core Neovim settings
│   ├── keymaps.lua          # Key mappings
│   └── plugins/             # Plugin configurations
│       ├── colorscheme.lua
│       ├── example.lua
│       ├── lsp.lua
│       ├── mason.lua
│       ├── autocompletion.lua
│       ├── git.lua
│       ├── terminal.lua
│       ├── treesitter.lua
│       ├── which-key.lua
│       ├── autopairs.lua
│       ├── comment.lua
│       └── indent-blankline.lua
├── POSSIBLE_UPGRADES.md     # Future plugin ideas
└── README.md
```

## Key Bindings

Leader key: `Space`

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>rc` - Reload config and install new plugins (doesn't update existing)
- `<leader>rC` - Full plugin sync (updates all plugins)
- `<leader>nh` - Clear search highlights

### Windows
- `<C-h/j/k/l>` - Navigate between splits
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>sx` - Close split

### Buffers
- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer

### Terminal
- `<C-\>` - Toggle terminal (quick access)
- `<leader>tf` - Toggle floating terminal
- `<leader>th` - Toggle horizontal terminal (bottom)
- `<leader>tv` - Toggle vertical terminal (side)
- `<leader>t1` - Terminal 1 (horizontal)
- `<leader>t2` - Terminal 2 (horizontal)
- `<leader>t3` - Terminal 3 (horizontal)
- `<leader>t4` - Terminal 4 (horizontal)
- `<leader>ta` - Toggle all terminals
- `<Esc>` - Exit terminal mode (when in terminal)
- `<C-h/j/k/l>` - Navigate between terminal and editor splits

### Plugins
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers

### LSP (Language Server Protocol)
- `gD` - Go to declaration
- `gd` - Go to definition
- `gi` - Go to implementation
- `gt` - Go to type definition
- `gR` - Show references
- `K` - Show documentation (hover)
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>d` - Show line diagnostics
- `<leader>D` - Show buffer diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>rs` - Restart LSP

### Autocompletion
- `<C-k>` - Previous suggestion
- `<C-j>` - Next suggestion
- `<C-Space>` - Trigger completion
- `<C-e>` - Close completion
- `<CR>` - Confirm selection

### Git Integration
**Git Status & Commands:**
- `<leader>gs` - Git status (opens fugitive panel)
- `<leader>gc` - Git commit
- `<leader>gp` - Git push
- `<leader>gl` - Git pull
- `<leader>gb` - Git blame

**Viewing Diffs:**
- `<leader>gd` - Git diff split (compare working vs staged)
- `<leader>gv` - Open DiffView (visual diff of all changes)
- `<leader>gf` - File history (git log for current file)
- `<leader>gF` - Project history (git log for entire project)
- `<leader>gx` - Close DiffView

**Hunk Operations (inline changes):**
- `]c` - Next git change (hunk)
- `[c` - Previous git change (hunk)
- `<leader>hp` - Preview hunk (show diff in floating window)
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk (discard changes)
- `<leader>hS` - Stage entire buffer
- `<leader>hR` - Reset entire buffer
- `<leader>hu` - Undo stage hunk
- `<leader>hb` - Blame line (who changed this line)
- `<leader>tb` - Toggle inline blame (shows blame on every line)
- `<leader>hd` - Diff this file
- `<leader>td` - Toggle deleted lines view

### Code Editing
**Comment Toggle:**
- `gcc` - Toggle comment on current line
- `gc` + motion - Toggle comment (e.g., `gcap` for paragraph)
- `gc` in visual mode - Toggle comment on selection

**Auto-pairs:**
- Automatically closes `()`, `{}`, `[]`, `""`, `''`
- Deletes pairs together when backspacing
- Works with completion

**Treesitter Text Objects:**
- `<C-Space>` - Start incremental selection
- `<C-Space>` again - Expand selection to next node
- `<Backspace>` - Shrink selection

### Which-key Helper
- Press `<leader>` and wait 300ms - Shows available keybindings
- Works with any partial key sequence (e.g., `<leader>g` shows all git commands)
- Helps discover keybindings you forgot

## Features

### Treesitter
- **Better syntax highlighting** - Semantic, not regex-based
- **Smart indentation** - Understands code structure
- **Text objects** - Select functions, classes, etc.
- **Auto-installed parsers** for common languages

### Indent Guides
- Visual vertical lines showing indentation levels
- Highlights current scope
- Auto-hidden in certain buffers (terminal, file explorer, etc.)

## Adding Plugins

Add new plugin files in `lua/plugins/` directory. Each file should return a table with plugin specs.

Example:
```lua
return {
  "username/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

## Language Support

LSP servers are automatically installed for:
- TypeScript/JavaScript (ts_ls)
- Python (pyright)
- Lua (lua_ls)
- Go (gopls)
- Rust (rust_analyzer)
- C/C++ (clangd)
- Java (jdtls)
- HTML, CSS, JSON
- Tailwind CSS

Mason will auto-install these servers on first launch. You can manage LSP servers with `:Mason`.

## Customization

- **Settings:** Edit `lua/settings.lua`
- **Keymaps:** Edit `lua/keymaps.lua`
- **Plugins:** Add files to `lua/plugins/`
- **LSP Servers:** Modify `lua/plugins/mason.lua`
