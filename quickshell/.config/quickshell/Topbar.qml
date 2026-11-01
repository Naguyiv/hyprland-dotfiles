import Quickshell
import QtQuick
import Quickshell.Wayland
import Quickshell.Hyprland

PanelWindow {

    anchors {
		left: true
		right: true
		top: true
		bottom: false
	}
    implicitHeight: 40
    color: "transparent"
    WlrLayershell.namespace: "Quickshell Topbar"
    property string envVarUSER: Quickshell.env("USER")


    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "white"
        opacity: 1
        border.width: 1
        border.color: "gray"

        
    
    // Right Row
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        spacing: 5


        Rectangle {
            id: time
            width: 200
            height: 30
            radius: 7

            color: "red"

            SystemClock {
                id: clock
                precision: SystemClock.Seconds
            }

            Text {
                anchors.centerIn: parent
                text: Qt.formatDateTime(clock.date, "MMM d, h:mm AP")
            }
        }

        Rectangle {
            id: systemstats
            // WIFI|VOLUME|OPENS UP TO CONTROL CENTER| BLUETOOTH| BACKGROUND SERVECIS

        }

            Rectangle {
            id: pwr

            width: 30
            height: 30
            color: "red"
            radius: 7   

            FontLoader {
                source: "file://"
                
            }

            MouseArea {

            }

            Text {
                anchors.centerIn: parent
                text: "⏻"
                // font.family:
                font.pixelSize: 24
            }
        }

    }

    // Center Row
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: toplevel
            color: "red"

            width: 400
            height: 30
            radius: 7

            Text {
                text: ToplevelManager.activeToplevel.activated == true ? ToplevelManager.activeToplevel.title : ""
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: notfications
        }
    }

    // Left Row
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        spacing: 5

        Rectangle {
            id: workspaces

                width: 200 
                height: 30
                color: "red"

                Row {
                    spacing: 5

                    Repeater {
                
                model: Hyprland.workspaces

                delegate: Rectangle {
                    width: 30 
                    height: 30
                    color: modelData.active == true ? "gray" : "black"

                    MouseArea {
                        
                        onClicked: {
                            modelData.activate()
                        }
                    }

                }
            }
                }
               
           
            
           


            
            
        }

        Rectangle {
            id: spawner


        }

    }

    }

    

}
