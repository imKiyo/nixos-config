{ lib, pkgs, inputs, ... }: {

  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 5;
      gaps-in = 1;
      gaps-out = 1;
      active-opacity = 0.90;
      inactive-opacity = 0.80;
      blur = true;
      border-size = 1;
      animation-speed = "fast"; # "fast" | "medium" | "slow"
      fetch = "none"; # "nerdfetch" | "neofetch" | "pfetch" | "none"

      bar = { # Hyprpanel
        position = "top"; # "top" | "bottom"
        transparent = true;
        transparentButtons = false;
        floating = false;
      };
    };
    description = "Remember our promise";
  };

  config = {
    stylix = {
      enable = true;

      base16Scheme = {
        base00 = "#0A0E13"; # Default Background
        base01 = "#19202A"; # Lighter Background
        base02 = "#293444"; # Selection Background
        base03 = "#677382"; # Comments, Invisibles, Line Highlighting
        base04 = "#B4B8C2"; # Dark Foreground
        base05 = "#DDE1E8"; # Default Foreground, Caret, Delimiters, Operators
        base06 = "#E8E2D9"; # Light Foreground
        base07 = "#F9E8B5"; # Light Background
        base08 = "#D94136"; # Red/Error, Variables, Markup Link Text
        base09 = "#C17C3D"; # Orange, Integers, Boolean, Constants
        base0A = "#B39F47"; # Yellow, Classes, Markup Bold
        base0B = "#759F4A"; # Green, Strings, Inherited Class
        base0C = "#51A5A2"; # Cyan, Support, Regular Expressions
        base0D = "#4568A5"; # Blue, Functions, Methods, Headings
        base0E = "#9D7A9E"; # Magenta, Keywords, Storage
        base0F = "#884B42"; # Brown, Deprecated
      };

      cursor = {
        name = "phinger-cursors-light";
        package = pkgs.phinger-cursors;
        size = 25;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrains Mono Nerd Font";
        };
        sansSerif = {
          package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
          name = "SFProDisplay Nerd Font";
        };
        serif = {
          package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
          name = "SFProDisplay Nerd Font";
        };
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
        sizes = {
          applications = 13;
          desktop = 13;
          popups = 13;
          terminal = 13;
        };
      };

      polarity = "dark";
      image = pkgs.fetchurl {
        url =
          "https://raw.githubusercontent.com/imKiyo/nixy-wallpapers/refs/heads/main/wallpapers/wallpaper1.jpeg";
        # to get ur sha256 type in terminal nix-prefetch-url "https://raw.githubusercontent.com/imKiyo/nixy-wallpapers/refs/heads/main/wallpapers/frieren1.png"
        # sha256 = "177svqrhnpz0n3da9hpvknc6y8h2lc5s9pqdqka3izg7zda42zhv";
        sha256 = "1w1cpl3395vc8hpdf33scsbyadi973gfbqbrfvh2kp64kl8ycacd";
      };
    };
  };

}