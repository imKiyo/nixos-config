{ pkgs, ... }:

let
  # Define the directory where you keep your AppImages
  appImageDir = "/home/kiyo/Apps";
in
{
  # 1. Ensure appimage-run is installed system-wide so they execute cleanly
  home.packages = [ pkgs.appimage-run ];

  # 2. Declarative Desktop Entries
  xdg.desktopEntries = {
    
    motrix-next = {
      name = "Motrix Next";
      exec = "${pkgs.appimage-run}/bin/appimage-run ${appImageDir}/motrix-next.AppImage";
      icon = "download";
      categories = [ "Network" ];
    };

    # You can easily stack more manual appimages right under here cleanly:
    /*
    another-app = {
      name = "Another App";
      exec = "${pkgs.appimage-run}/bin/appimage-run ${appImageDir}/another.AppImage";
      icon = "preferences-other";
    };
    */
  };
}
