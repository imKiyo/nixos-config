{
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      lineNumberMode = "relNumber";
      enableLuaLoader = true;
      preventJunkFiles = true;
      telescope.enable = true;
      git.gitsigns.enable = true;

      binds.whichKey.enable = true;

      spellChecking = {
        enable = true;
        programmingWordlist.enable = true;
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        wrap = false;
      };

      clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xsel.enable = true;
        };
      };

      keymaps = [
        {
          key = "jk";
          mode = [ "i" ];
          action = "<ESC>";
          desc = "Exit insert mode";
        }
        {
          key = "<leader>nh";
          mode = [ "n" ];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = [ "n" ];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Search files by name";
        }
        {
          key = "<leader>lg";
          mode = [ "n" ];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "<leader>e"; # Changed from <leader>fe to just <leader>e for speed
          mode = [ "n" ];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<leader>t";
          mode = [ "n" ];
          action = "<cmd>ToggleTerm<CR>";
          desc = "Toggle terminal";
        }
        # Arrow-key style navigation in insert mode using Ctrl
        {
          key = "<C-h>";
          mode = [ "i" ];
          action = "<Left>";
        }
        {
          key = "<C-j>";
          mode = [ "i" ];
          action = "<Down>";
        }
        {
          key = "<C-k>";
          mode = [ "i" ];
          action = "<Up>";
        }
        {
          key = "<C-l>";
          mode = [ "i" ];
          action = "<Right>";
        }

        # Shortcut for the annoying way of toggling terminal
        {
          key = "<ESC>";
          mode = [ "t" ];
          action = "<C-\\><C-n>";
          desc = "Escape terminal mode with just Escape";
        }
        {
          key = "<leader>gc"; # "Go to Config"
          mode = [ "n" ];
          action = "<cmd>cd /home/kiyo/kiyo-os | Neotree toggle<cr>";
          desc = "Jump to NixOS config folder";
        }
        {
          key = "<leader>fr"; # "File Recent"
          mode = [ "n" ];
          action = "<cmd>Telescope oldfiles<cr>";
          desc = "Search recently opened files";
        }
      ];

      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = false; # STOP the pop-out command line
        colorizer.enable = true;
        illuminate.enable = true;
        smartcolumn.enable = false;
        fastaction.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = false;
        lspsaga.enable = false;
        trouble.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        clang.enable = true;
        zig.enable = true;
        python.enable = true;
        markdown.enable = true;
        ts.enable = true;
        html.enable = true;
        lua.enable = true;
        css.enable = true;
        rust.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        fidget-nvim.enable = true;
        indent-blankline.enable = false;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };

      filetree.neo-tree.enable = true;

      dashboard.dashboard-nvim = {
        enable = true;
        setupOpts = {
          theme = "doom";
          config = {
            header = [
              "⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠉⠁⠀⠀⠀⠀⠀⠀⣑⣿⣻⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠠⢠⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⢻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⢠⣪⣻⣿⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣥⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠘⣾⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠛⠛⠛⠛⠋⠉⠉⠉⠉⣉⣀⣤⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣿⢿⣻⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣻⣟⠛⠯⠉⠈⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣴⣶⣾⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠈⢻⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⢿⣟⣭⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣟⠿⣿⣟⣿⣿⣿⣻⣿⣟⡟⠏⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠹⣿⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⠿⣛⣽⣾⣿⣿⣿⣿⣿⣿⡿⠟⠉⠉⠁⠉⠀⠉⠈⠫⠛⣞⣿⣿⣼⠾⡛⠓⠂⠋⣀⣤⣤⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠿⢿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣿⣿⣿⣿⣿⠿⣋⣴⣾⣿⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠂⠀⠁⠈⠉⠀⢁⣄⣀⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⡖⠀⠀⠀⠀⣀⣐⣒⡶⢤⠤⣤⣤⣤⣠⣤⣉⣙⣛⣿⣂⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣛⣵⣾⣿⣿⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠤⠀⠀⠀⢠⣾⣿⣿⠟⠁⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣿⣛⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⡿⠟⠉⠁⠀⠀⠀⠀⢀⣠⣶⡏⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⣉⣁⣀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⠵⠊⠁⠀⠀⠀⢀⣠⣶⣿⣿⣿⠁⠀⢀⣀⣠⣶⣾⡄⠀⠀⣠⣶⣤⡠⢠⣿⣿⣿⣿⣿⣇⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⢀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⠛⠀⠀⣀⡀⠀⢀⣴⣿⣿⣿⣿⣿⣿⡇⠀⢸⣿⣿⣿⣿⣿⣥⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢸⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⣠⡴⠿⣷⣾⣯⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠘⢷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⠟⢉⣠⣴⣶⣾⡿⠁⢰⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢠⣿⣿⣿⣿⣿⣿⠏⠁⣀⣴⣬⣿⣛⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠠⠰⣾⣿⣮⣠⠀⠀⠀⠀⠀⠀⠀⠀⠈⠿⣿⣿⣿⡟⣡⡆⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣷⣿⣿⣿⣿⣿⠟⢀⣠⣾⣿⣭⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠂⢛⣻⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣿⢋⣴⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢵⣶⢿⣿⣷⣾⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠻⢿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠉⢀⣴⣻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠘⢻⣿⣦⣄⠀⠀⢀⠀⠀⢀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠛⠛⠛⠛⠋⠉⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠙⢻⣿⣶⣄⡸⣶⣄⡀⠀⠀⡀⠀⠀⠀⠹⣿⣿⣿⣿⠿⠛⠛⠛⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣠⣤⣤⣤⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣽⣦⡀⠀⢆⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣿⣿⣶⣮⣭⣦⣄⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⡿⠿⠿⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
              ""
            ];
            center = [
              {
                icon = "󱞁  ";
                desc = "Quick Scratch Note";
                action = ''execute "e ~/Documents/Obsidian/quick_notes/" . strftime("%Y-%m-%d_%H-%M-%S") . ".md"'';
                key = "n";
              }
              {
                icon = "󰎚  ";
                desc = "Obsidian Notes";
                action = "cd ~/Documents/Obsidian/ | Neotree reveal";
                key = "o";
              }
              {
                icon = "󰎚  ";
                desc = "System Config (NixOS)";
                action = "cd /home/kiyo/kiyo-os | Neotree reveal";
                key = "s";
              }
              {
                icon = "󰈞  ";
                desc = "Find File";
                action = "Telescope find_files";
                key = "f";
              }
            ];
            footer = [ "" ];
          };
        };
      };
    };
  };
}
