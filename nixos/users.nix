{ config, pkgs, ... }:
let username = config.var.username;
in {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = [ "networkmanager" "wheel" "users" "audio" "pipewire" ];
    };
  };
  
  # Enable user services
  systemd.user = {
    services.mpd = {
      description = "Music Player Daemon";
      after = [ "pipewire.service" ];
      wants = [ "pipewire.service" ];
      wantedBy = [ "default.target" ];
      
      environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
        PULSE_RUNTIME_PATH = "/run/user/1000/pulse";
      };
      
      serviceConfig = {
        Type = "notify";
        ExecStart = "${pkgs.mpd}/bin/mpd --no-daemon /home/${username}/.config/mpd/mpd.conf";
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        KillMode = "mixed";
        Restart = "on-failure";
        RestartSec = 5;
        
        # Run as user
        User = username;
        Group = "users";
        
        # Audio access
        SupplementaryGroups = [ "audio" "pipewire" ];
      };
    };
  };
}