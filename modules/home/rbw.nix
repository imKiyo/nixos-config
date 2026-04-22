{pkgs, ...}: {
  programs.rbw = {
    enable = true;
    settings = {
      email = "xargon11@email.com";
      base_url = "https://localhost";
      pinentry = pkgs.pinentry-gnome3;
    };
  };
}
