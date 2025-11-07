{ inputs, pkgs, ... }:
let
  # Override the Hyprspace package to manually define the installPhase
  hyprspaceFixed = inputs.hyprspace.packages.${pkgs.system}.Hyprspace.overrideAttrs (oldAttrs: {
    # The default builder fails because no 'make install' rule exists.
    # We manually copy the compiled plugin library (.so) to the final output path.
    installPhase = ''
      mkdir -p $out/lib
      cp Hyprspace.so $out/lib/Hyprspace.so
    '';
  });
in {
  wayland.windowManager.hyprland = {
    # Use the fixed package instead of the original one
    plugins = [ hyprspaceFixed ];
    
    settings = { 
      plugin = { 
        overview = { autoDrag = false; }; 
      }; 
    };
  };
}