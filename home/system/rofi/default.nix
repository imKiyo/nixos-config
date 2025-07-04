{ config, pkgs, lib, ... }:
let
  accent = "#${config.lib.stylix.colors.base0D}";
  background = "#${config.lib.stylix.colors.base00}";
  background-alt = "#${config.lib.stylix.colors.base01}";
  foreground = "#${config.lib.stylix.colors.base05}";
  font = config.stylix.fonts.serif.name;
  rounding = config.theme.rounding;
  font-size = config.stylix.fonts.sizes.popups;
in {
  home.packages = with pkgs; [ rofi-emoji ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland; # or pkgs.rofi for X11

    extraConfig = {
      display-drun = "Apps";
      modi = "drun,run";
      hide-scrollbar = true;
      show-icons = true;
      kb-accept-entry = "Tab, Return, KP_Enter";
      kb-exit = "Escape";
      matching = "normal";
      sorting-method = "name";
      case-sensitive = false;
    };

    theme = ''
      * {
        font: "${font} ${font-size}";
        background: ${background};
        background-alt: ${background-alt};
        foreground: ${foreground};
        accent: ${accent};
        border-radius: ${rounding}px;
      }

      window {
        background-color: @background;
        text-color: @foreground;
        border-radius: @border-radius;
        width: 650px;
        height: 325px;
      }

      inputbar {
        children: [ prompt, textbox-prompt-colon, textbox ];
        background-color: @background-alt;
        text-color: @foreground;
        border: 0px solid @accent;
        border-radius: @border-radius;
        padding: 8px 12px;
      }

      textbox-prompt-colon {
        str: ":";
        expand: false;
        text-color: @foreground;
      }

      listview {
        margin-top: 20px;
        lines: 10;
      }

      element {
        padding: 6px;
        text-color: @foreground;
      }

      element-icon {
        size: 24px;
        padding-right: 8px;
      }

      element selected {
        background-color: @accent;
        text-color: @foreground;
        border-radius: @border-radius;
      }
    '';
  };
}
