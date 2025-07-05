{ config, pkgs, ... }:

{
  # Install quickshell package
  environment.systemPackages = with pkgs; [
    # quickshell  # Uncomment if available in nixpkgs
  ];

  # Create quickshell configuration files
  system.activationScripts.quickshell = ''
    # Create quickshell config directory
    mkdir -p /home/kiyo/.config/quickshell
    
    # Create main shell configuration
    cat > /home/kiyo/.config/quickshell/shell.qml << 'EOF'
import QtQuick 2.15
import QtQuick.Controls 2.15
import Quickshell 1.0

ShellRoot {
    id: root
    
    Panel {
        id: panel
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: 32
        
        Rectangle {
            anchors.fill: parent
            color: "#2e3440"
            opacity: 0.9
            
            Row {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 16
                
                Text {
                    text: "NixOS + Quickshell"
                    color: "#d8dee9"
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
                
                Item { width: parent.width - 200 }
                
                Text {
                    text: Qt.formatDateTime(new Date(), "hh:mm")
                    color: "#d8dee9"
                    anchors.verticalCenter: parent.verticalCenter
                    
                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: parent.text = Qt.formatDateTime(new Date(), "hh:mm")
                    }
                }
            }
        }
    }
}
EOF

    # Set proper ownership and permissions
    chown -R kiyo:users /home/kiyo/.config/quickshell
    chmod 755 /home/kiyo/.config/quickshell
    chmod 644 /home/kiyo/.config/quickshell/shell.qml
  '';
}