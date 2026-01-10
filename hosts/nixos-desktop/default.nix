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
      package = pkgs.ollama-cuda.override {
        cudaArches = [ "52" ];
      };
      loadModels = [ "dolphin-llama3:8b" ];
    };

    environmentVariables = {
      # Forces Ollama to recognize Maxwell card's compute capability
      OLLAMA_CUDA_COMPUTE_CAPABILITIES = "5.2";
      # Helps with memory management on older 4GB cards
      OLLAMA_NOPRUNE = "1";
    };
  };

  # Firewall for local usage of ai if needed
  # networking.firewall.allowedTCPPorts = [ 11434 ];
}
