{ inputs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # change the name of the backup if ur home manager fails again
    backupFileExtension = "backup13";
    extraSpecialArgs = { inherit inputs; };
  };
}
