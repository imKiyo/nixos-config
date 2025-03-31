{ inputs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "nixos-backup";
    extraSpecialArgs = { inherit inputs; };
  };
}
