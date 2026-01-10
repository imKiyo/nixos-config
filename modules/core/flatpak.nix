{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
  };

  # Override systemd service to set XDG_CURRENT_DESKTOP to include GNOME
  # This tricks GTK portal into loading for niri
  systemd.user.services.xdg-desktop-portal = {
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
