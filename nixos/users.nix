{ config, pkgs, ... }:
let username = config.var.username;
in {
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = "${username} account";
      extraGroups = [ "networkmanager" "wheel" "users" ];
    };
    users.mpd = {
      isSystemUser = true;
      group = "users";
      extraGroups = [ "users" ];
  };
}
