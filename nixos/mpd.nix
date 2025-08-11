{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/kiyo/Music";
    user = "mpd";
    group = "users";
    extraAllowedDirs = [ "/home/kiyo" ];
    extraConfig = ''
      audio_output {
          type "pipewire"
          name "My PipeWire Output"
      }
    '';
  };
}