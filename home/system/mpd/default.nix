{ config, pkgs, lib, ... }:

{
  programs.mpd = {
    enable = true;
    package = pkgs.mpd; # Explicitly define the MPD package

    musicDirectory = "$HOME/Music";

    dataDir = "$HOME/.local/share/mpd";

    dbFile = "$HOME/database";
    stateFile = "$HOME/state";
    playlistDirectory = "$HOME/playlists";
    stickerFile = "$HOME/sticker.db";

    # This assumes config.home.uid is correctly populated by Home Manager.
    pidFile = "/run/user/.local/share/mpd/mpd.pid";

    logFile = "$HOME/mpd.log";

    bindToAddress = "localhost";
    port = 6600;

    audioOutputs = [
      {
        name = "my_pipewire_output";
        type = "pipewire";
      }
    ];

    autoUpdate = true;
    restoreSavedPosition = true;
  };
}