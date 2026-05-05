{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ./host-packages.nix
  ];

  # Self https certificate thingy
  services.caddy = {
    enable = true;
    virtualHosts."https://localhost" = {
      extraConfig = ''
        tls internal
        reverse_proxy 127.0.0.1:8222
      '';
    };
  };

  # Password Manager based on Bitwarden
  services.vaultwarden = {
    enable = true;
    config = {
      ROCKET_PORT = 8222;
      ROCKET_ADDRESS = "127.0.0.1";
      SIGNUPS_ALLOWED = false;
      DOMAIN = "https://localhost";
    };
  };

  services.ssh-agent.enable = true;

  # Enable sddm display manager
  services.displayManager.sddm.enable = true;

  # Sysc-greet display manager
  services.sysc-greet.enable = false;

  # Keep niri available at system level for ly display manager to detect it
  programs.niri.package = pkgs.niri;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };
  };

  # Ensure niri session is available to display manager
  services.displayManager.sessionPackages = [ pkgs.niri ];

  environment.systemPackages = with pkgs; [ ydotool ];

  systemd.user.services.ydotool = {
    description = "ydotool daemon";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold";
      Restart = "always";
    };
  };

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
