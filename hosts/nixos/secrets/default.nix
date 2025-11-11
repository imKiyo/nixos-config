{ pkgs, inputs, config, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.keyFile = "/home/kiyo/.config/sops/age/keys.txt";
    defaultSopsFile = "/home/kiyo/.config/nixos/hosts/nixos/secrets/secrets.yaml";
    secrets = {
      git_ssh_key = {
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };
    };
  };

  home.packages = with pkgs; [ sops age ];
}