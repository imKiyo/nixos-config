{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Add host-specific packages here
    scanmem # Its like a Cheat Engine but in a terminal
    devilutionx # Diablo 1 runner
    bambu-studio # 3d printer software
    yt-dlp # yt vid downloader
  ];
}
