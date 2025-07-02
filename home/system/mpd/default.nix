# /home/kiyo/.config/nixos/system/mpd/default.nix
{ config, pkgs, lib, ... }: # Ensure 'lib' is available for potential future use

{
  services.mpd = {
    enable = true; # Enables the MPD service

    # --------------------------------------------------------------------------
    # Basic Configuration
    # --------------------------------------------------------------------------

    # 1. Music Directory (REQUIRED)
    # IMPORTANT: Change "/home/kiyo/Music" to your actual music folder path.
    musicDirectory = "/home/kiyo/Music";

    # 2. Database File
    dbFile = "/var/lib/mpd/database";

    # 3. State File
    stateFile = "/var/lib/mpd/state";

    # 4. Playlist Directory
    playlistDirectory = "/var/lib/mpd/playlists";

    # --------------------------------------------------------------------------
    # User and Permissions (CRITICAL for accessing music)
    # --------------------------------------------------------------------------

    # Run MPD as your normal user for easy access to your home directory music.
    # Replace "kiyo" with your actual username if different.
    user = "kiyo";
    group = "users"; # Your primary user group

    # --------------------------------------------------------------------------
    # Network Configuration (for clients like rmpc)
    # --------------------------------------------------------------------------
    bindToAddress = "localhost"; # For local clients like rmpc
    port = 6600; # Standard MPD port

    # --------------------------------------------------------------------------
    # Audio Output (REQUIRED)
    # --------------------------------------------------------------------------

    # Choose ONE of these audio output configurations based on your setup:
    # Most modern NixOS users will use PipeWire.
    audioOutputs = [
      {
        name = "my_pipewire_output";
        type = "pipewire";
      }
    ];

    # OR (uncomment if you use PulseAudio instead):
    # audioOutputs = [
    #   {
    #     name = "my_pulseaudio_output";
    #     type = "pulseaudio";
    #   }
    # ];

    # OR (uncomment if you use ALSA directly, for advanced users):
    # audioOutputs = [
    #   {
    #     name = "my_alsa_output";
    #     type = "alsa";
    #     device = "hw:0,0"; # Adjust based on your sound card (e.g., 'aplay -L')
    #   }
    # ];

    # --------------------------------------------------------------------------
    # Optional Settings (uncomment and adjust as needed)
    # --------------------------------------------------------------------------

    autoUpdate = true; # Automatically update database on changes to musicDirectory

    # logFile = "/var/log/mpd/mpd.log"; # For debugging, ensure /var/log/mpd exists and is writable
  };

  # --------------------------------------------------------------------------
  # Systemd tmpfiles for directories (Ensures MPD's data dirs exist and have correct permissions)
  # --------------------------------------------------------------------------
  systemd.tmpfiles.rules = [
    # These use the user and group defined in services.mpd for consistency
    "d /var/lib/mpd 0755 ${config.services.mpd.user} ${config.services.mpd.group} - -"
    "d /var/lib/mpd/playlists 0755 ${config.services.mpd.user} ${config.services.mpd.group} - -"
    # Uncomment the line below if you enabled logFile above:
    # "d /var/log/mpd 0755 ${config.services.mpd.user} ${config.services.mpd.group} - -"
  ];

  # Make 'mpc' client available system-wide (good for quick updates from terminal)
  environment.systemPackages = with pkgs; [ mpc ];

  # Note: You don't need to add rmpc here. rmpc is a user program and is already
  # handled by your home-manager configuration, which is correctly imported
  # into your /etc/nixos/configuration.nix at a higher level.
}