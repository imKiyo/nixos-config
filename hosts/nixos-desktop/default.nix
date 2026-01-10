{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];

  # Enable sddm display manager
  services.displayManager.sddm.enable = true;

  # Sysc-greet display manager
  services.sysc-greet.enable = false;

  # Keep niri available at system level for ly display manager to detect it
  programs.niri.package = pkgs.niri;

  # Ensure niri session is available to display manager
  services.displayManager.sessionPackages = [ pkgs.niri ];

  services.ollama = {
    enable = true;
    # We use overrideAttrs to manually set the GPU architecture to 5.2 (Maxwell)
    package = pkgs.ollama-cuda.overrideAttrs (oldAttrs: {
      cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [
        "-DCMAKE_CUDA_ARCHITECTURES=52"
      ];
    });

    loadModels = [ "dolphin-llama3:8b" ];

    environmentVariables = {
      OLLAMA_CUDA_COMPUTE_CAPABILITIES = "5.2";
      # Maxwell cards (GTX 900 series) crash with Flash Attention
      OLLAMA_FLASH_ATTENTION = "0";
      # Limits VRAM usage to help with the 970's 3.5GB/0.5GB split
      OLLAMA_NUM_PARALLEL = "1";
    };
  };

  # Firewall for local usage of ai if needed
  # networking.firewall.allowedTCPPorts = [ 11434 ];
}
