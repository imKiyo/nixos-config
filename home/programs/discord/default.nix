# In /home/kiyo/.config/nixos/home/programs/discord/default.nix
{ inputs, ... }: {
  imports = [ inputs.nixcord.homeModules.nixcord ]; # <-- Change 'homeManagerModules' to 'homeModules'
  # OR, more likely, if 'nixcord' is the module's name:
  # imports = [ inputs.nixcord.homeModules.default ]; # <-- if the module is named 'default.nix' inside 'homeModules'
  # OR, if 'nixcord' itself is the module at the top level of homeModules:
  # imports = [ inputs.nixcord.homeModules ]; # <-- if the module is the directory itself
  
  programs.nixcord = {
    enable = true;
    config = { frameless = true; };
  };
}



# some extra configs if i ever need to add more
/* {
  # ...
  programs.nixcord = {
    enable = true;          # Enable Nixcord (It also installs Discord)
    vesktop.enable = true;  # Vesktop
    dorion.enable = true;   # Dorion
    quickCss = "some CSS";  # quickCSS file
    config = {
      useQuickCss = true;   # use out quickCSS
      themeLinks = [        # or use an online theme
        "https://raw.githubusercontent.com/link/to/some/theme.css"
      ];
      frameless = true;                   # Set some Vencord options
      plugins = {
        hideAttachments.enable = true;    # Enable a Vencord plugin
        ignoreActivities = {              # Enable a plugin and set some options
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
          ignoredActivities = [ "someActivity" ];
        };
      };
    };
    dorion = {
      theme = "dark";
      zoom = "1.1";
      blur = "acrylic";       # "none", "blur", or "acrylic"
      sysTray = true;
      openOnStartup = true;
      autoClearCache = true;
      disableHardwareAccel = false;
      rpcServer = true;
      rpcProcessScanner = true;
      pushToTalk = true;
      pushToTalkKeys = ["RControl"];
      desktopNotifications = true;
      unreadBadge = true;
    };
    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
  # ...
} */