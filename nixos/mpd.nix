{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    startWhenNeeded = false;
    musicDirectory = "/home/kiyo/Music";
    user = "mpd";
    group = "users";
    extraConfig = ''
      audio_output {
          type "pipewire"
          name "My PipeWire Output"
      }
    '';
  };
}