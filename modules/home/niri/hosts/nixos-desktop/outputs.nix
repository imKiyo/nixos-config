{ host, ... }:
''
  // LG Main Monitor
  output "HDMI-A-3" {
    mode "1920x1080@60.000"
    scale 1.0
    position x=1050 y=0
  }

  // Dell Secondary Monitor (Tilted right)
  output "DVI-I-1" {
    mode "1680x1050@59.883"
    scale 1.0
    // Positioned to the right of the LG
    position x=0 y=0
    // Fixes the right-tilted angle
    transform "90"
  }
''
