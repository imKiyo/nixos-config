{
  # Disable system MPD service
  services.mpd.enable = false;
  
  # Make mpd available system-wide
  environment.systemPackages = with pkgs; [ mpd mpc-cli ];
}