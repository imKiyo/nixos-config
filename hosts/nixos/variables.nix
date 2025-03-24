{ config, lib, ... }: {
  imports = [
    # Choose your theme here:
    ../../themes/kiyo.nix
  ];

  config.var = {
    hostname = "nixos";
    username = "kiyo";
    configDirectory = "/home/" + config.var.username
      + "/.config/nixos";

    keyboardLayout = "us";

    location = "Warsaw";
    timeZone = "Europe/Warsaw";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "pl_PL.UTF-8";

    git = {
      username = "imKiyo";
      email = "xargon11@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
