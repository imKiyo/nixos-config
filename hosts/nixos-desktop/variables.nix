{
  # Git Configuration
  gitUsername = "kiyo";
  gitEmail = "kiyo@nixos-desktop";

  # System Configuration
  timeZone = "Europe/Warsaw";

  # Monitor Settings (update after installation for your displays)
  extraMonitorSettings = ''
    "monitor=HDMI-A-3,1920x1080@60,0x0,1"
    "monitor=DVI-I-1,1680x1050@60,-1050x0,1,transform,1"
  '';

  # Waybar Settings
  clock24h = false;

  # Default Applications
  browser = "zen";
  terminal = "kitty";
  keyboardLayout = "us";
  consoleKeyMap = "us";

  # For Nvidia Prime support (update if using nvidia-laptop profile)
  # Run 'lspci | grep VGA' to find your actual GPU IDs
  intelID = "PCI:0:2:0";
  nvidiaID = "PCI:1:0:0";

  # Core Features
  enableNFS = false;
  printEnable = false;
  thunarEnable = true;
  stylixEnable = true;

  # Optional Features (disabled for faster initial install)
  # You can enable these later by setting to true and rebuilding
  gamingSupportEnable = false; # Gaming controllers, gamescope, protonup-qt
  flutterdevEnable = false; # Flutter development environment
  syncthingEnable = false; # Syncthing file synchronization
  enableCommunicationApps = false; # Discord, Teams, Zoom, Telegram
  enableExtraBrowsers = false; # Vivaldi, Brave, Firefox, Chromium, Helium
  enableProductivityApps = false; # Obsidian, GNOME Boxes, QuickEmu
  aiCodeEditorsEnable = false; # Claude-code, gemini-cli, cursor

  # Desktop Environment
  enableHyprlock = false; # Set to false if using DMS/Noctalia lock screens

  # Bar/Shell Choice
  barChoice = "noctalia"; # Options: "dms" or "noctalia"
  # NOTE: If you change barChoice to "dms", you must run 'dms-install' after rebuilding

  # Shell Choice
  defaultShell = "zsh"; # Options: "fish" or "zsh"

  # Theming
  stylixImage = ./wallpapers/wife2.jpg;
  #waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;  # Waybar temporarily disabled
  animChoice = ../../modules/home/hyprland/animations-end4.nix;

  # Startup Applications
  startupApps = [ ];
}
