{ pkgs, config, inputs, ... }: {

  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    #../../home/programs/nvim
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    #../../home/programs/nextcloud
    ../../home/programs/thunar # file manager
    ../../home/programs/lazygit 
    ../../home/programs/zen
    ../../home/programs/duckduckgo-colorscheme
    ../../home/programs/discord
    ../../home/programs/tailscale
    ../../home/programs/nvf # neovim but more autistic
    ../../home/programs/yazi
    ../../home/programs/rmpc
    #../../home/programs/mpd # Music Player Daemon

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/wofi
    #../../home/system/rofi
    #../../home/system/batsignal
    ../../home/system/mime # lets you chose which app should run said files
    ../../home/system/udiskie
    ../../home/system/clipman
    #../../home/system/quickshell

    #./secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      #bitwarden # Password manager
      vlc # Video player
      blanket # White-noise app
      obsidian # Note taking app
      planify # Todolists
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images
      resources # btop like but with gui

      # Dev
      go
      nodejs
      #python3
      jq
      just
      pnpm

      # Unpacking
      zip
      unzip
      unrar

      # Utils
      optipng # PNG optimizer that recompresses image files to a smaller size
      libsecret # For git credential store
      pfetch
      btop
      fastfetch
      tree
      flatpak

      # Forbidden tools i sweared to eventually drop lol
      vscode

      # Gaming
      wine
      winetricks
      lutris
      rofi

      #Testing apps
      #ydotool
      #dotool
      xautoclick
      yt-dlp
      ffmpeg
      rmpc
      picard
      spotdl

      # Quickshell setup in progress
      inputs.quickshell.packages.x86_64-linux.default
      fish
      jq
      fd
      (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
        aubio
        pyaudio
        numpy
      ]))
      cava
      bluez
      ddcutil
      brightnessctl
      curl
      material-symbols
      scanmem # Its like a Cheat Engine but in a terminal
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = { source = ./profile_picture.png; };

    # Don't touch this
    stateVersion = "24.05";
    
  };

  programs.home-manager.enable = true;

}
