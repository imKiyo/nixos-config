{profile, ...}: {
  # Services to start
  services = {
    libinput.enable = true; # Input Handling
    fstrim.enable = true; # SSD Optimizer
    gvfs.enable = true; # For Mounting USB & More
    openssh.enable = true; # Enable SSH
    blueman.enable = true; # Bluetooth Support
    tumbler.enable = true; # Image/video preview
    gnome.gnome-keyring.enable = true;
    upower.enable = true; # Power management (required for DMS battery monitoring)

    udev.extraRules = ''
      # QMK/VIA WebHID / RP2040 Bootloader permissions
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="feed", MODE:="0666"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="1209", MODE:="0666"
      SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", MODE:="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="feed", MODE:="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="1209", MODE:="0666"
      KERNEL=="hidraw*", ATTRS{idVendor}=="2e8a", MODE:="0666"
    '';

    smartd = {
      enable =
        if profile == "vm"
        then false
        else true;
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;  # Enable WirePlumber session manager
    };
  };


}
