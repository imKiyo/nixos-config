{ lib, pkgs, inputs, ... }: {

  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 10;
      gaps-in = 1;
      gaps-out = 1;
      active-opacity = 0.90;
      inactive-opacity = 0.85;
      blur = true;
      border-size = 1;
      animation-speed = "fast"; # "fast" | "medium" | "slow"
      fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"

      bar = { # Hyprpanel
        position = "top"; # "top" | "bottom"
        transparent = true;
        transparentButtons = false;
        floating = false;
      };
    };
    description = "Theme configuration options uhh ohh";
  };

  config = {
    stylix = {
      enable = true;

      # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
      base16Scheme = {
        base00 = "#120f09"; # Default Background
        base01 = "#1e1812"; # Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#35291d"; # Selection Background
        base03 = "#66553f"; # Comments, Invisibles, Line Highlighting
        base04 = "#a28662"; # Dark Foreground (Used for status bars)
        base05 = "#c0a179"; # Default Foreground, Caret, Delimiters, Operators
        base06 = "#d6b891"; # Light Foreground (Not often used)
        base07 = "#292016"; # Light Background (Not often used)
        base08 = "#887254"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 = "#d6b891"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
        base0A = "#c0a179"; # Classes, Markup Bold, Search Text Background
        base0B = "#927a60"; # Strings, Inherited Class, Markup Code, Diff Inserted
        base0C = "#a28662"; # Support, Regular Expressions, Escape Characters, Markup Quotes
        base0D = "#d6b891"; # Functions, Methods, Attribute IDs, Headings, Accent color
        base0E = "#a28662"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
        base0F = "#887254"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
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
          package = pkgs.noto-fonts-emoji;
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