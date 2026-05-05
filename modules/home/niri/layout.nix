{ ... }:
''
  config-notification {
      disable-failed
  }

  gestures {
      hot-corners {
          off
      }
  }

  input {
      keyboard {
          xkb {
            options "caps:swapescape"
          }
          numlock
      }
      touchpad {
          // Natural scrolling inverts scroll direction
          // Up swipe scrolls down, down swipe scrolls up (natural direction)
          natural-scroll
      }
      mouse {
          accel-profile "adaptive"
          accel-speed 1.0
      }
      trackpoint {
      }

      focus-follows-mouse
      warp-mouse-to-focus
  }

  layout {
        gaps 9

        center-focused-column "never"
        always-center-single-column

        preset-column-widths {
            proportion 0.5
            proportion 0.66667
            proportion 1.0
        }

        default-column-width { proportion 0.5; }

        border {
            width 2
            # A deep, "dried blood" red for the active window
            active-color "#8b0000"
            # A dark, metallic charcoal for inactive windows
            inactive-color "#1a1a1a"
            # A high-contrast orange-red for urgent alerts
            urgent-color "#ff4500"
        }

        focus-ring {
            off
            width 2
            active-color   "#4d0000"
            inactive-color "#121212"
        }

        shadow {
            softness 30
            spread 5
            offset x=0 y=5
            # Slightly tinted red shadow for a subtle glow effect
            color "#2b000077"
        }

        struts {
        }
    }

    overview {
        # Deep navy-black backdrop to keep things dark
        backdrop-color "#05050a"

        workspace-shadow {
            softness 40
            spread 10
            offset x=0 y=10
            color "#00000080"
        }

        zoom 0.5
    }

  animations {
      workspace-switch {
          spring damping-ratio=0.80 stiffness=523 epsilon=0.0001
      }
      window-open {
          duration-ms 150
          curve "ease-out-expo"
      }
      window-close {
          duration-ms 150
          curve "ease-out-quad"
      }
      horizontal-view-movement {
          spring damping-ratio=0.85 stiffness=423 epsilon=0.0001
      }
      window-movement {
          spring damping-ratio=0.75 stiffness=323 epsilon=0.0001
      }
      window-resize {
          spring damping-ratio=0.85 stiffness=423 epsilon=0.0001
      }
      config-notification-open-close {
          spring damping-ratio=0.65 stiffness=923 epsilon=0.001
      }
      screenshot-ui-open {
          duration-ms 200
          curve "ease-out-quad"
      }
      overview-open-close {
          spring damping-ratio=0.85 stiffness=800 epsilon=0.0001
      }
  }
''
