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
          type "pipewire"
          name "My PipeWire Output"
          server "unix:/run/user/1000/pulse/native"
      }
    '';
  };
}