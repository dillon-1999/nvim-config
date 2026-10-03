# My Neovim Configuration

Portable Neovim configuration using lazy.nvim plugin manager.

## Installation

### Requirements
- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for icons)

### Fresh Installation

1. **Backup existing config (if any):**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```

   Plugins will automatically install on first launch.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── settings.lua         # Core Neovim settings
│   ├── keymaps.lua          # Key mappings
│   └── plugins/             # Plugin configurations
│       ├── colorscheme.lua
│       └── example.lua
└── README.md
```

## Key Bindings

Leader key: `Space`

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>nh` - Clear search highlights

### Windows
- `<C-h/j/k/l>` - Navigate between splits
- `<leader>sv` - Split vertically
- `<leader>sh` - Split horizontally
- `<leader>sx` - Close split

### Buffers
- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer

### Plugins
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers

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

## Customization

- **Settings:** Edit `lua/settings.lua`
- **Keymaps:** Edit `lua/keymaps.lua`
- **Plugins:** Add files to `lua/plugins/`
