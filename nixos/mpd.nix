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
          name "Scarlett 2i2"
          device "hw:USB"
      }
    '';
  };
}