import Qt5Compat.GraphicalEffects
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: appLauncher

    aboveWindows: true
    color: "transparent"
    visible: false
    implicitWidth: 200

    anchors {
        bottom: true
        left: true
        right: false
        top: true
    }

    margins {
        bottom: 10
        left: 10
        right: 0
        top: 7
    }


    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            id: datetimebox
            anchors.top : parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            height: 150
            radius: 10
            color: "#1E1E1E"    
        }

        Rectangle {
            anchors.top: datetimebox.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            anchors.topMargin: 10
            radius: 10
            height: 500

            color: "#1E1E1E"
        }

    }
    GlobalShortcut {
        name: "Launchpad"
        onPressed: {
            appLauncher.visible = !appLauncher.visible;
        }
    }

}
