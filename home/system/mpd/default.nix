# /home/kiyo/.config/nixos/home/system/mpd/default.nix
{ config, pkgs, lib, ... }:

let
  # Define dataDir here to make it accessible to other options within programs.mpd
  mpdDataDir = "${config.home.homeDirectory}/.local/share/mpd";
in
{
  programs.mpd = {
    enable = true;
    package = pkgs.mpd;

    musicDirectory = "${config.home.homeDirectory}/Music";

    dataDir = mpdDataDir; # Use the defined variable

    # Now, reference mpdDataDir instead of config.programs.mpd.dataDir
    dbFile = "${mpdDataDir}/database";
    stateFile = "${mpdDataDir}/state";
    playlistDirectory = "${mpdDataDir}/playlists";
    stickerFile = "${mpdDataDir}/sticker.db";

    pidFile = "/run/user/${toString config.home.uid}/mpd/mpd.pid";

    logFile = "${mpdDataDir}/mpd.log"; # Use mpdDataDir

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