{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    startWhenNeeded = false;
    musicDirectory = "/home/kiyo/Music";
    user = "kiyo";
    group = "users";
    extraConfig = ''
      audio_output {
          type "alsa"
          name "ALSA Output"
          device "default"
      }
    '';
  };
  
  # Ensure proper permissions
  users.users.kiyo.extraGroups = [ "audio" ];
}