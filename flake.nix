{
  description = ''
    Nix os conf.
  '';

  inputs = {
    # PINNED: lock system nixpkgs to the exact commit that was used in your working state.
    # This prevents your OS/kernel from drifting past the working kernel.
    nixpkgs.url = "github:NixOS/nixpkgs/c23193b943c6c689d70ee98ce3128239ed9e32d1";

    # Separate moving input for packages you want to update (apps, etc.).
    # Update this input when you want newer user packages:
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixcord.url = "github:kaylorben/nixcord";
    sops-nix.url = "github:Mic92/sops-nix";
    nixarr.url = "github:rasmus-kirk/nixarr";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };
    vicinae.url = "github:vicinaehq/vicinae";
    nix-ai.url = "github:olafkfreund/nix-ai-help";

  };

  outputs = inputs@{ nixpkgs, ... }: {
    nixosConfigurations = {
      nixos =
        # CHANGEME: This should match the 'hostname' in your variables.nix file
        nixpkgs.lib.nixosSystem {
          modules = [
            {
              _module.args = { inherit inputs; };
              nixpkgs.hostPlatform = "x86_64-linux";  # ← Moved inside here
            }
            #inputs.nixos-hardware.nixosModules.omen-16-n0005ne # CHANGEME: check https://github.com/NixOS/nixos-hardware
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts/nixos/configuration.nix
          ];
        };
    };
  };
}
