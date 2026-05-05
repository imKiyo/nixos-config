{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Add host-specific packages here
    devilutionx # Diablo 1 runner
  ];
}
