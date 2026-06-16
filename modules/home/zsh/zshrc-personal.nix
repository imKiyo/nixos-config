{ pkgs, ... }:
{
  home.packages = with pkgs; [ zsh ];

  home.file."./.zshrc-personal".text = ''

    # This file allows you to define your own aliases, functions, etc
    # below are just some examples of what you can use this file for

      #!/usr/bin/env zsh
      # Set defaults
      export PATH=/home/don/Development/Repos/flutter/bin:$PATH
      export CHROME_EXECUTABLE=${pkgs.google-chrome}/bin/google-chrome
      export CHROME_EXECUTABLE=/run/current-system/sw/bin/google-chrome-stable
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$PATH":"$HOME/.pub-cache/bin"
      # export BROWSER="flatpak run app.zen_browser.zen"

      alias z="cd"
      alias conf="nvim /home/kiyo/kiyo-os"
      alias config="nvim /home/kiyo/kiyo-os"
      alias nalias="nvim /home/kiyo/kiyo-os/modules/home/zsh/zshrc-personal.nix"
      alias nixgit="cd ~/kiyo-os && git add . && git commit -m 'quick_update' && git push"
      alias obsgit="cd /home/kiyo/Documents/Obsidian && git add . && git commit -m 'quick_update' && git push"
      alias nobs="nvim /home/kiyo/Documents/Obsidian"
      alias nobsidian="nvim /home/kiyo/Documents/Obsidian"


      export EDITOR="nvim"
      export VISUAL="nvim"

      alias c="clear"
      #eval "$(zoxide init zsh)"
      #eval "$(oh-my-posh init zsh --config $HOME/.config/powerlevel10k_rainbow.omp.json)"

  '';
}
