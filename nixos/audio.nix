{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = true;
      # Add MPD-specific configuration
      extraConfig = {
        "10-disable-camera" = {
          "wireplumber.profiles" = { main."monitor.libcamera" = "disabled"; };
        };
        "50-alsa-config" = {
          "monitor.alsa.rules" = [
            {
              matches = [{ "node.name" = "~alsa_input.*"; }];
              actions = {
                update-props = {
                  "audio.format" = "S32LE";
                  "audio.rate" = 48000;
                };
              };
            }
          ];
        };
      };
    };
  };
  
  # Enable user services for audio
  systemd.user.services.pipewire.wantedBy = [ "default.target" ];
  systemd.user.services.pipewire-pulse.wantedBy = [ "default.target" ];
  systemd.user.services.wireplumber.wantedBy = [ "default.target" ];
}