# Those are my secrets, encrypted with sops
{ pkgs, inputs, ... }: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.keyFile = "/home/kiyo/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      git_ssh_key = {
        path = "/home/kiyo/.ssh/id_ed25519";
        mode = "0600";
      };
    };
  };

  home.packages = with pkgs; [ sops age ];
}
