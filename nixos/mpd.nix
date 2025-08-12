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
          device "hw:CARD=USB,DEV=0"  # Your Scarlett interface
      }
      
      # Fallback output
      audio_output {
          type "alsa"
          name "HDMI Output"
          device "hw:CARD=NVidia,DEV=3"  # Your HDMI output
          enabled "no"
      }
    '';
  };
  
  # Ensure proper permissions
  users.users.kiyo.extraGroups = [ "audio" ];
}