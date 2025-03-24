{ lib, pkgs, inputs, ... }: {

  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 10;
      gaps-in = 1;
      gaps-out = 1;
      active-opacity = 0.96;
      inactive-opacity = 0.95;
      blur = true;
      border-size = 2;
      animation-speed = "fast"; # "fast" | "medium" | "slow"
      fetch = "neofetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"

      bar = { # Hyprpanel
        position = "top"; # "top" | "bottom"
        transparent = false;
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
        base00 = "#231e18"; # Default Background
        base01 = "#302b25"; # Lighter Background (Used for status bars, line number and folding marks)
        base02 = "#48413a"; # Selection Background
        base03 = "#9d8b70"; # Comments, Invisibles, Line Highlighting
        base04 = "#b4a490"; # Dark Foreground (Used for status bars)
        base05 = "#cabcb1"; # Default Foreground, Caret, Delimiters, Operators
        base06 = "#d7c8bc"; # Light Foreground (Not often used)
        base07 = "#e4d4c8"; # Light Background (Not often used)
        base08 = "#d35c5c"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
        base09 = "#ca7f32"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
        base0A = "#e0ac16"; # Classes, Markup Bold, Search Text Background
        base0B = "#b7ba53"; # Strings, Inherited Class, Markup Code, Diff Inserted
        base0C = "#6eb958"; # Support, Regular Expressions, Escape Characters, Markup Quotes
        base0D = "#b4a490"; # Functions, Methods, Attribute IDs, Headings, Accent color
        base0E = "#bb90e2"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
        base0F = "#b49368"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
      };

      /* system: "base16"
      name: "Woodland"
      author: "Jay Cornwall (https://jcornwall.com)"
      variant: "dark"
      palette:
        base00: "#231e18"
        base01: "#302b25"
        base02: "#48413a"
        base03: "#9d8b70"
        base04: "#b4a490"
        base05: "#cabcb1"
        base06: "#d7c8bc"
        base07: "#e4d4c8"
        base08: "#d35c5c"
        base09: "#ca7f32"
        base0A: "#e0ac16"
        base0B: "#b7ba53"
        base0C: "#6eb958"
        base0D: "#88a4d3"
        base0E: "#bb90e2"
        base0F: "#b49368" */

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
          "https://raw.githubusercontent.com/anotherhadi/nixy-wallpapers/refs/heads/main/wallpapers/dark.png";
        sha256 = "1dxmncq7wyj3m1gpl3jv4i4nxcrrv1fi8mbyz61qkbhmgdqgch8h";
      };
    };
  };

}