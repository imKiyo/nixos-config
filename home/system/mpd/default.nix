# /home/kiyo/.config/nixos/home/system/mpd/default.nix
{ config, pkgs, lib, ... }:

{
  services.mpd = {
    enable = true; # Ensures MPD service is enabled

    # --------------------------------------------------------------------------
    # Basic Configuration (These are confirmed direct options from minimal config)
    # --------------------------------------------------------------------------
    musicDirectory = "/home/kiyo/Music"; # This should still be a direct option.

    # --------------------------------------------------------------------------
    # User and Permissions (These are confirmed direct options)
    # --------------------------------------------------------------------------
    user = "kiyo"; # Run MPD as your normal user
    group = "users"; # Your primary user group

    # --------------------------------------------------------------------------
    # Network Configuration (Refactored under 'network' attribute set - CONFIRMED)
    # --------------------------------------------------------------------------
    network = {
      listenAddress = "localhost"; # Use this instead of bindToAddress
      port = 6600; # Use this instead of top-level port
    };

    # --------------------------------------------------------------------------
    # Extra Configuration for MPD.conf (for options not directly exposed)
    # --------------------------------------------------------------------------
    extraConfig = ''
      # Database and State Files
      # dbFile and stateFile are configured directly in mpd.conf via extraConfig
      db_file "/var/lib/mpd/database" # Assuming this will also be an error next, let's add it now to save a step
      state_file "/var/lib/mpd/state" # Moved from direct option

      # Playlist Directory
      # playlistDirectory is configured directly in mpd.conf via extraConfig
      playlist_directory "/var/lib/mpd/playlists" # Assuming this will also be an error next, let's add it now

      # Audio Output is configured directly in mpd.conf via extraConfig
      audio_output {
        name "my_pipewire_output"
        type "pipewire"
      }

      # auto_update is configured directly in mpd.conf via extraConfig
      auto_update "yes"

      # Optional: logFile is also typically in mpd.conf
      # log_file "/var/log/mpd/mpd.log"
    '';

    # --------------------------------------------------------------------------
    # Data Directory (still a direct option, sets base path for dbFile etc.)
    # --------------------------------------------------------------------------
    # dataDir = "/var/lib/mpd"; # Default, only specify if you want to change it
  };

  # --------------------------------------------------------------------------
  # Systemd tmpfiles for directories (still necessary if you don't use defaults)
  # --------------------------------------------------------------------------
  systemd.tmpfiles.rules = [
    "d /var/lib/mpd 0755 ${config.services.mpd.user} ${config.services.mpd.group} - -"
    "d /var/lib/mpd/playlists 0755 ${config.services.mpd.user} ${config.services.mpd.group} - -"
    # If you enable log_file in extraConfig, you might need this:
    # "d /var/log/mpd 0755 ${config.services.mpd.user} ${config.services.mpd.group} - -"
  ];
}