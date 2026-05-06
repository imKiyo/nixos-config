{ profile, ... }:
{
  programs.bash = {
    enable = false;
    enableCompletion = true;
    initExtra = ''
      fastfetch
      if [ -f $HOME/.bashrc-personal ]; then
        source $HOME/.bashrc-personal
      fi
    '';

    # NOT HERE lil bro, use /modules/home/zsh/zshrc-personal.nix
    shellAliases = {
      sv = "sudo nvim";
      fr = "dcli rebuild";
      fu = "dcli update";
      rebuild = "dcli rebuild";
      update = "dcli update";
      cleanup = "dcli cleanup";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      v = "nvim";
      cat = "bat";
      ".." = "cd ..";
      hosts = "dcli list-hosts";
      switch = "dcli switch-host";
      conf = "nvim /home/kiyo/kiyo-os";
      config = "nvim /home/kiyo/kiyo-os";
      nos = "cd ~/kiyo-os && git add . && git commit -m 'quick_update' && git push";
    };
  };
}
