# NVF Configuration

This is a structured NVF (Neovim via Flakes) configuration following best practices.

## Structure

```
nvf/
├── default.nix          # Main entry point with base configuration
├── options.nix          # Editor options, UI behavior, keytimeouts etc.
├── keymaps.nix          # Global keybindings
├── autocmds.nix         # Autocommands and autogroups
└── plugins/             # Plugin-specific configurations
    ├── cmp.nix          # Autocompletion (nvim-cmp)
    ├── git.nix          # Git integration (gitsigns, neogit)
    ├── lsp.nix          # LSP setup and diagnostics
    ├── markdown.nix     # Markdown language support
    ├── mini.nix         # Mini.nvim plugins
    ├── picker.nix       # Fuzzy finders (telescope, fzf-lua)
    ├── snacks.nix       # Snacks plugin enhancements
    ├── trouble.nix      # Diagnostics viewer
    └── utils.nix        # Utility plugins (surround, comment, etc.)
```

## Key Features (LazyVim-like)

### ✨ UI Enhancements
- **Theme**: Catppuccin (mocha)
- **Status Line**: Lualine with beautiful design
- **Treesitter**: Syntax highlighting & code objects
- **Indent Guides**: Visual indentation with indent-blankline
- **Notifications**: Noice + nvim-notify
- **Icons**: nvim-web-devicons integration
- **UI Polish**: smooth animations, cursorline, undo highlighting

### 🚀 LSP & Completion
- **LSP**: Full language server setup with lspconfig
- **Diagnostics**: Trouble plugin for organized error/warning display
- **Completion**: nvim-cmp with snippet support (luasnip)
- **Format on Save**: Automatic code formatting
- **Lightbulb**: Shows code actions available

### 🔧 Navigation & Motion
- **Telescope**: Powerful fuzzy finder for files, buffers, grep
- **Hop**: Quick motion with custom leader bindings
- **Leap**: Advanced cursor movement
- **Which-Key**: Discoverable keybindings with help menu
- **Neo-tree**: Modern file explorer

### 📝 Editing
- **Comment.nvim**: Quick toggle comments
- **Surround**: Easy manipulation of surrounding characters
- **Autopairs**: Auto-closing brackets/quotes
- **Yanky**: Yank history with previews
- **Mini.nvim**: Collection of useful small plugins

### 🐙 Git Integration
- **Gitsigns**: Inline git blame, hunks, and changes
- **Neogit**: Git operations UI
- **Diffview**: File change visualization

### 🛠️ Languages Supported
- Nix (native support)
- Python, Rust, Go, Lua
- JavaScript/TypeScript
- HTML, CSS, JSON
- YAML, Bash, Markdown

## How to Customize

### Adding/Modifying Keybindings
Edit `keymaps.nix` to add new keymaps. Follow the pattern:

```nix
{
  key = "<leader>XX";
  mode = "n";  # "n" for normal, "i" for insert, "v" for visual
  action = ":Command<CR>";
  desc = "Description for which-key";
}
```

### Enabling More Language Support
In `default.nix`, under `languages` section, set languages to `enable = true`:

```nix
languages = {
  ruby.enable = true;
  java.enable = true;
  # ... etc
};
```

### Customizing Plugins
Each plugin has its own file in `plugins/`. For example, to customize LSP:

Edit `plugins/lsp.nix` and adjust the `setupOpts` or enable additional features.

### Adding New Plugins
1. Check if nvf supports it: `man 5 nvf` or the online manual
2. Create a new file in `plugins/` or add to existing file
3. Import it in `default.nix`
4. Follow nvf's configuration pattern using `programs.nvf.settings.vim.*`

## Building & Testing

```bash
# Build the configuration
nix flake update  # Update inputs if needed
nixos-rebuild switch --flake .#yourhost

# Or for home-manager only
home-manager switch --flake .#yourusername@hostname
```

## Key Mappings Guide

```
<leader>h/j/k/l     - Navigate between windows
<leader>w|          - Split window right
<leader>w-          - Split window below
<leader>wd          - Close window
<leader>w           - Save file
<leader>q           - Quit
jk                  - Escape from insert mode

<leader>ff          - Find files (telescope)
<leader>fg          - Live grep (telescope)
<leader>fb          - Find buffers (telescope)

<leader>xx          - Toggle trouble diagnostics
<leader>xr          - LSP references
<leader>xq          - Quickfix list

<leader>gs          - Git status (neogit)
<leader>h           - Hop motion

<leader>c*          - Code actions
<leader>l*          - LSP commands
```

## Documentation

- Official nvf manual: Run `man 5 nvf` in terminal
- Online docs: https://notashelf.github.io/nvf/
- Options reference: https://notashelf.github.io/nvf/options.html

## Tips

1. **Lazy Loading**: Plugins are lazy-loaded by default via lz.n
2. **DAG System**: nvf uses Directed Acyclic Graphs to order config
3. **Lua vs Nix**: Most configs are in Nix, but can embed Lua with `mkLuaInline`
4. **Debugging**: Use `nvf-print-config` to see generated init.lua
