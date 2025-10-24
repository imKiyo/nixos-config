{ config, pkgs, ... }:
{
  # Disable system MPD service
  services.mpd.enable = true;
  
  # Make mpd available system-wide
  environment.systemPackages = with pkgs; [ mpd mpc-cli ];
}