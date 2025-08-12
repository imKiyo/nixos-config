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
          type "pulse"
          name "PulseAudio Output"
      }
    '';
  };
}