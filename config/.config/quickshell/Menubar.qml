import QtQuick 2.15
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower

PanelWindow {
    id: menuBar

    Properties {
        id: props
    }
   
    // Window Setup
    WlrLayershell.namespace: "menuBar"
    visible: props.menuBarvisible
    color: "transparent"
    implicitHeight: props.menuBarHeight
    aboveWindows: true
    exclusionMode: ExclusionMode.Auto

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 0
        bottom: 0
        left: 0
        right: 0
    }

    Timer {
        id: menuBarCollapseTimer
        running: true
        repeat: true
        interval: 500

        onTriggered: {
            props.menuBarHeight = props.menuBarCollapsedHeight;
            props.backgroundColor = "white";
            props.backgroundOpacity = 0.4;
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            menuBarCollapseTimer.stop();
            props.menuBarHeight = 30;
            props.backgroundColor = "white";
                        props.backgroundOpacity = 0.4;

        }

        onExited: {
            menuBarCollapseTimer.start();
        }

    }
    // Background Panel
    Rectangle {
        id: recMenuBar
        visible: true
        anchors.top: parent.top
        anchors.topMargin: props.backgroundTopMargin
        anchors.leftMargin: props.backgroundSideMargin
        anchors.rightMargin: props.backgroundSideMargin
        height: props.backgroundHeight
        radius: props.backgroundRadius
        opacity: props.backgroundOpacity
        color: props.backgroundColor
    }

    // Toplevel
    Text {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        text: ToplevelManager.activeToplevel.title == null ? "" : ToplevelManager.activeToplevel.title
    }

      SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        id: clockText
        text: Qt.formatDateTime(clock.date, "MMM dd, h:mm AP")

        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

    }

    Rectangle {
        anchors.right: clockText.left
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        width: 16
        height: 16
        radius: 3

        
    }
    

    Rectangle {

        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        width: 16
        height: 16
        radius: 3

        visible: false

        Image {

        }

    }
    
    Row {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 7
        // anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20

        spacing: 7

        Repeater {
            model: Hyprland.workspaces

            delegate: Rectangle {
                width: modelData.active ? 24 : 12
                height: 12
                radius: 10
                color: modelData.active ? "red" : "lightgray"

                Text {
                    anchors.centerIn: parent
                    text: modelData.id < 1 ? "" : modelData.id
                    visible: false
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        modelData.activate(modelData.id)
                    }
                }


                

            }
        }
    }





    // Glass Blur Effect
    BackgroundEffect.blurRegion: Region {
        item: recMenuBar
        radius: recMenuBar.radius
    }
}