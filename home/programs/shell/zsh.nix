# My shell configuration
{ pkgs, lib, config, ... }:
let fetch = config.theme.fetch; # neofetch, nerdfetch, pfetch
in {

  home.packages = with pkgs; [ bat ripgrep tldr sesh ];

  home.sessionPath = [ "$HOME/go/bin" ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    initContent = lib.mkBefore ''
      bindkey -e
      ${if fetch == "neofetch" then
        pkgs.neofetch + "/bin/neofetch"
      else if fetch == "nerdfetch" then
        "nerdfetch"
      else if fetch == "pfetch" then
        "echo; ${pkgs.pfetch}/bin/pfetch"
      else
        ""}

      function sesh-sessions() {
        session=$(sesh list -t -c | fzf --height 70% --reverse)
        [[ -z "$session" ]] && return
        sesh connect $session
      }

      zle     -N             sesh-sessions
      bindkey -M emacs '\es' sesh-sessions
      bindkey -M vicmd '\es' sesh-sessions
      bindkey -M viins '\es' sesh-sessions
    '';

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };

    profileExtra = lib.optionalString (config.home.sessionPath != [ ]) ''
      export PATH="$PATH''${PATH:+:}${
        lib.concatStringsSep ":" config.home.sessionPath
      }"
    '';

    #NOTE- for btop to show gpu usage 
    #may want to check the driver version with:
    #nix path-info -r /run/current-system | grep nvidia-x11
    #and 
    #nix search nixpkgs nvidia_x11
    sessionVariables = {
      LD_LIBRARY_PATH = lib.concatStringsSep ":" [
        "${pkgs.linuxPackages_latest.nvidia_x11_beta}/lib" # change the package name according to nix search result
        "$LD_LIBRARY_PATH"
      ];
    };

    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      v = "nvim";
      c = "clear";
      clera = "clear";
      celar = "clear";
      e = "exit";
      cd = "z";
      ls = "eza --icons=always --no-quotes";
      tree = "eza --icons=always --tree --no-quotes";
      sl = "ls";
      open = "${pkgs.xdg-utils}/bin/xdg-open";
      icat = "${pkgs.kitty}/bin/kitty +kitten icat";
      ssh = "kitty +kitten ssh";

      blep = "sudo nixos-rebuild switch --flake ~/.config/nixos#nixos";

      wireguard-import = "nmcli connection import type wireguard file";

      notes =
        "nvim ~/nextcloud/notes/index.md --cmd 'cd ~/nextcloud/notes' -c ':Telescope find_files'";
      note = "notes";

      # git
      g = "lazygit";
      ga = "git add";
      gc = "git commit";
      gcu = "git add . && git commit -m 'Update'";
      gp = "git push";
      gpl = "git pull";
      gs = "git status";
      gd = "git diff";
      gco = "git checkout";
      gcb = "git checkout -b";
      gbr = "git branch";
      grs = "git reset HEAD~1";
      grh = "git reset --hard HEAD~1";
      gaa = "git add .";
      gcm = "git commit -m";
      internetpls = "sudo sh -c 'systemctl stop NetworkManager && ip a add 192.168.1.5/24 dev enp3s0 && ip r add default via 192.168.1.1 dev enp3s0 && echo \"nameserver 8.8.8.8\" > /etc/resolv.conf && ping -c 3 google.com'";
      godot = "steam-run ~/Downloads/GODOT/Godot_v4.4.1-stable_linux.x86_64";
      osrs = "flatpak run --user com.jagex.Launcher";
      yt = "yt-dlp -o \"/home/kiyo/Music/%(title)s.%(ext)s\" -t mp3";
      yay = "nix-shell -p";

      # games
      vintagestory = "flatpak run at.vintagestory.VintageStory";
    };
  };
}
