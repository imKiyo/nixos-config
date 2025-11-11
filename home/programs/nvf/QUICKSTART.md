# NVF Configuration Quick Start

## What Changed?

Your nvf setup is now structured exactly like your nvim setup:
- **Main config** (`default.nix`) - imports everything and defines base vim settings
- **Options** (`options.nix`) - editor behavior, UI settings
- **Keymaps** (`keymaps.nix`) - all your keyboard shortcuts
- **Autocommands** (`autocmds.nix`) - auto-triggered actions
- **Plugins** (`plugins/`) - organized by category

## Already Enabled (LazyVim-like preset)

✅ **Core UI**: Catppuccin theme, Lualine statusline, Treesitter, indent guides  
✅ **Editor**: LSP, autocompletion (nvim-cmp), snippets (luasnip)  
✅ **Navigation**: Telescope (fuzzy find), Hop (motion), Leap, Neo-tree  
✅ **Editing**: Comment, Surround, Autopairs, Yanky (yank history)  
✅ **Git**: Gitsigns, Neogit, Diffview  
✅ **Quality**: Trouble (diagnostics), Which-key (help), notifications  
✅ **Languages**: Nix, Python, Rust, Go, Lua, TS, HTML, CSS, JSON, YAML, Bash, Markdown

## Configuration Layers (in order of precedence)

1. **options.nix** - Basic vim behavior (tabsize, line numbers, etc)
2. **plugins/*.nix** - Feature-specific configurations
3. **default.nix** - Overrides and feature toggles
4. **keymaps.nix** - Key bindings
5. **autocmds.nix** - Auto-triggered events

## How to Modify

### To change a keybinding:
Edit `keymaps.nix`, find your binding, modify the `action` or `key` field.

### To enable/disable a feature:
Edit `default.nix` under `programs.nvf.settings.vim`, set `enable = true/false`.

### To customize a plugin:
Find its file in `plugins/`, modify the `setupOpts` or settings.

### To add a new language:
In `default.nix`, add it to the `languages` section:
```nix
languages = {
  # ... existing
  ruby.enable = true;  # Add this
};
```

## Important Notes

⚠️ **Follow nvf documentation**: nvf does things differently than nixvim
- Configuration goes under `programs.nvf.settings.vim`
- NOT under `programs.nixvim`
- Plugins use nvf's module system

⚠️ **No direct runtimepath changes needed**
- nvf handles plugin loading automatically via its module system
- Use built-in options rather than raw Lua when possible

⚠️ **DAG System**: Configuration order matters
- nvf uses Directed Acyclic Graphs to resolve order
- You can specify dependencies like `before = []` or `after = []` when needed

## Next Steps

1. **Test it**: Try your nvf configuration
   ```bash
   nix flake update
   home-manager switch
   ```

2. **Customize keybindings**: Edit `keymaps.nix` with your preferences

3. **Add languages**: Enable the languages you code in

4. **Fine-tune**: Each plugin file can be customized individually

## Useful Commands

```bash
# View your generated config
nvf-print-config | less

# Check for errors
nvf-print-config | bat --language=lua

# Access documentation offline
man 5 nvf

# Check what plugins are available
man 5 nvf | grep -i "enable"
```

## File Editing Workflow

When editing files:
1. Modify the appropriate `.nix` file
2. Save and rebuild: `home-manager switch --flake .`
3. Restart nvim or run `:source ~/.config/nvim/init.lua`
4. Most changes take effect immediately

## Troubleshooting

**If nvim doesn't start:**
- Run `nvf-print-config` to check for Lua syntax errors
- Check the build error message

**If a plugin isn't loading:**
- Check if it's enabled in the appropriate plugin file
- Make sure you've rebuilt: `home-manager switch --flake .`

**To see all options:**
- `man 5 nvf` (offline manual)
- https://notashelf.github.io/nvf/options.html (online)

Enjoy your LazyVim-like nvf setup! 🚀
