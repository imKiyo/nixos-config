{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
      };
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "hyprland";
        "org.freedesktop.impl.portal.Screenshot" = "hyprland";
      };
      niri = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        "org.freedesktop.impl.portal.Settings" = "gnome";
        "org.freedesktop.impl.portal.OpenURI" = "gnome";
      };
    };
    configPackages = [
      pkgs.hyprland
      pkgs.niri
    ];
  };

  # Override systemd services to trick GNOME portal into loading for niri
  systemd.user.services.xdg-desktop-portal = {
    serviceConfig = {
      Environment = [ "XDG_CURRENT_DESKTOP=niri:GNOME" ];
    };
  };

  systemd.user.services.xdg-desktop-portal-gnome = {
    serviceConfig = {
      Environment = [ "XDG_CURRENT_DESKTOP=niri:GNOME" ];
    };
  };

  services = {
    flatpak.enable = true;
  };

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
