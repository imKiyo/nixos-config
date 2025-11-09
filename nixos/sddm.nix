{ pkgs, inputs, config, lib, ... }:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = if lib.hasSuffix "sakura_static.png" config.stylix.image then
      { }
    else {
      Background = "${toString config.stylix.image}";
    };
  };
in {
  services.displayManager = {
    sddm = {
      package = pkgs.kdePackages.sddm;
      extraPackages = [ sddm-astronaut ];
      enable = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
      settings = {
        Wayland.SessionDir = "${
            inputs.hyprland.packages."${pkgs.system}".hyprland
          }/share/wayland-sessions";
        
        # Add these lines for auto-login
        Autologin = {
          User = "kiyo";
          Session = "hyprland.desktop";
        };
      };
    };
  };
  services.getty = {
    autologinUser = null;
    helpLine = lib.mkForce "";
  };
  systemd.services."getty@tty1".enable = false;
  environment.systemPackages = [ sddm-astronaut ];
  
  # To prevent getting stuck at shutdown
  systemd.settings.Manager = { DefaultTimeoutStopSec = "10s"; };
}