import Quickshell
import QtQuick
import Quickshell.Wayland

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

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "white"
        opacity: 1
        border.width: 1
        border.color: "gray"

    }

    // Right Row
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

        Rectangle {
            id: pwr

        }

        Rectangle {
            id: time
        }

        Rectangle {
            id: systemstats
            // WIFI|VOLUME|OPENS UP TO CONTROL CENTER| BLUETOOTH| BACKGROUND SERVECIS

        }


    }

    // Center Row
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: toplevel

        }

        Rectangle {
            id: notfications
        }
    }

    // Left Row
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        Rectangle {
            id: workspaces
        }

        Rectangle {
            id: spawner
        }

    }

}
