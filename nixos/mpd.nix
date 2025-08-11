{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
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
  
  systemd.services.mpd.serviceConfig = {
    ReadWritePaths = "/home/kiyo/Music";
  };
}