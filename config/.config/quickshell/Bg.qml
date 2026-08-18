import Quickshell
import QtQuick

PanelWindow {
    id: bg

    anchors {
        left: true
        bottom: true
        right: true
        top: true
    }

    Image {
        id: bgimage
        anchors.fill: parent
        source: wallpaper // Or wallpaper
    }

    aboveWindows: false
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
}
