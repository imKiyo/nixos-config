{ config, pkgs, inputs, ... }: {
  imports = [
    # Mostly system related configuration
    ../../nixos/nvidia.nix
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/sddm.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/tailscale.nix
    ../../nixos/steam.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix {
    inherit pkgs config inputs;
  };

  # Don't touch this
  system.stateVersion = "24.05";

  # Renamed from hardware.opengl.driSupport32Bit
  hardware.graphics.enable32Bit = true;

  # Configure xdg-desktop-portal backends to fix build warning.
  xdg.portal = {
    enable = true;
    # Use the portal from your hyprland flake input for consistency
    extraPortals = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "hyprland" "gtk" ];
  };
}
