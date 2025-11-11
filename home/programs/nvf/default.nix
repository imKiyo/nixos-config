# nvf - LazyVim-like configuration
{ inputs, lib, ... }: {
  imports = [
    inputs.nvf.homeManagerModules.nvf
  ];

  programs.nvf = {
    enableManpages = true;
    enable = true;

    settings = {
      vim = {
        # Basic options
        viAlias = true;
        vimAlias = true;
        enableLuaLoader = true;

        # UI/UX
        theme = {
          enable = true;
          name = lib.mkForce "catppuccin";
          style = "mocha";
          transparent = false;
        };

        # Visuals
        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          indent-blankline.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
        };

        # Status line
        statusline.lualine = {
          enable = true;
          theme = lib.mkForce "catppuccin";
        };

        # Treesitter (needed for most modern plugins)
        treesitter = {
          enable = true;
          context.enable = true;
        };

        # LSP
        lsp = {
          enable = true;
          formatOnSave = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };

        # Autocomplete
        autocomplete.nvim-cmp.enable = true;

        # Snippets
        snippets.luasnip.enable = true;

        # File tree
        filetree.neo-tree.enable = true;

        # Tabline
        tabline.nvimBufferline.enable = true;

        # Bindings
        binds.whichKey.enable = true;

        # Telescope - fuzzy finder
        telescope.enable = true;

        # Git integration
        git = {
          enable = true;
          gitsigns.enable = true;
          neogit.enable = true;
        };

        # Terminal
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };

        # UI enhancements
        ui = {
          borders.enable = true;
          noice.enable = true;
          illuminate.enable = true;
          colorizer.enable = true;
        };

        # Utilities
        utility = {
          motion.hop.enable = true;
          motion.leap.enable = true;
          surround.enable = true;
          diffview-nvim.enable = true;
          yanky-nvim.enable = false;
        };

        # Comments
        comments.comment-nvim.enable = true;

        # Notifications
        notify.nvim-notify.enable = true;

        # Debugging
        debugger.nvim-dap = {
          enable = true;
          ui.enable = true;
        };

        # Keymaps
        keymaps = [
          # Navigation keybindings
          {
            key = "<leader>h";
            mode = "n";
            action = "<C-w>h";
            desc = "Move to left window";
          }
          {
            key = "<leader>j";
            mode = "n";
            action = "<C-w>j";
            desc = "Move to lower window";
          }
          {
            key = "<leader>k";
            mode = "n";
            action = "<C-w>k";
            desc = "Move to upper window";
          }
          {
            key = "<leader>l";
            mode = "n";
            action = "<C-w>l";
            desc = "Move to right window";
          }

          # Window management
          {
            key = "<leader>w|";
            mode = "n";
            action = "<C-w>v";
            desc = "Split right";
          }
          {
            key = "<leader>w-";
            mode = "n";
            action = "<C-w>s";
            desc = "Split below";
          }
          {
            key = "<leader>wd";
            mode = "n";
            action = "<C-w>c";
            desc = "Close window";
          }

          # File operations
          {
            key = "<leader>w";
            mode = "n";
            action = ":w<CR>";
            desc = "Save file";
          }
          {
            key = "<leader>q";
            mode = "n";
            action = ":q<CR>";
            desc = "Quit";
          }

          # Escape from insert mode
          {
            key = "jk";
            mode = "i";
            action = "<Esc>";
            desc = "Escape from insert mode";
          }

          # Better indenting
          {
            key = "<";
            mode = "v";
            action = "<gv";
            desc = "Indent left";
          }
          {
            key = ">";
            mode = "v";
            action = ">gv";
            desc = "Indent right";
          }
        ];

        # Editor options
        options = {
          number = true;
          relativenumber = true;
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          autoindent = true;
          smartindent = true;
          ignorecase = true;
          smartcase = true;
          hlsearch = true;
          incsearch = true;
          scrolloff = 8;
          sidescrolloff = 8;
          signcolumn = "yes";
          cmdheight = 1;
          updatetime = 250;
          timeoutlen = 300;
        };

        # Global settings
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        # Autocommands
        augroups = [
          {
            name = "UserConfig";
            clear = true;
          }
        ];

        autocmds = [
          # Highlight on yank
          {
            event = [ "TextYankPost" ];
            group = "UserConfig";
            desc = "Highlight yanked text";
            callback = lib.generators.mkLuaInline ''
              function()
                vim.highlight.on_yank({
                  higroup = 'IncSearch',
                  timeout = 200
                })
              end
            '';
          }

          # Auto-resize splits when window is resized
          {
            event = [ "VimResized" ];
            group = "UserConfig";
            desc = "Resize splits equally";
            command = "tabdo wincmd =";
          }

          # Remove trailing whitespace on save
          {
            event = [ "BufWritePre" ];
            group = "UserConfig";
            desc = "Remove trailing whitespace";
            callback = lib.generators.mkLuaInline ''
              function()
                local save_cursor = vim.fn.getpos(".")
                vim.cmd('%s/\\s\\+$//e')
                vim.fn.setpos(".", save_cursor)
              end
            '';
          }
        ];

        # Languages - popular ones
        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          markdown.enable = true;
          bash.enable = true;
          python.enable = true;
          rust.enable = true;
          go.enable = true;
          lua.enable = true;
          ts.enable = true;
          html.enable = true;
          css.enable = true;
          yaml.enable = true;
        };

        # Autopairs
        autopairs.nvim-autopairs.enable = true;
      };
    };
  };
}
