import QtQuick
import Quickshell

/*
PanelWindow {
    color: "transparent"
    implicitHeight: 20
    aboveWindows: false
    visible: false

    anchors {
        top: true
        left: true
        right: true
    }

    Rectangle {
        id: rmenbar

        property var defheight: 20
        property var defwidth: 16

        anchors.fill: parent
        color: "transparent"

        Row {
            spacing: 5
            anchors.top: parent.top
            anchors.right: parent.right

            Rectangle {
                width: rmenbar.defwidth
                height: rmenbar.defheight
            }

            Rectangle {
                width: rmenbar.defwidth + 80
                height: rmenbar.defheight
                color: "red"

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    anchors.leftMargin: 8
                    anchors.left: parent.left
                    color: "black"
                    text: Qt.formatDateTime(clock.date, "ddd hh:mm AP")
                }

            }

        }

        Row {
            spacing: 5
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 5

            Image {
                width: rmenbar.defwidth
                height: rmenbar.defheight
                source: "assets/pictures/icons/ArchLogo.svg"
                fillMode: Image.PreserveAspectFit
                clip: true

            }

        }

        SystemClock {
            id: clock

            precision: SystemClock.Seconds
        }

    }

}

*/
PanelWindow {

    visible: false
    implicitHeight: 20

    color: "transparent"

    anchors {
        top: true
        left: true
        right: true
    }



}
