import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import Quickshell.Wayland

PanelWindow {

    aboveWindows: true
    color: "transparent"
    visible: false

    anchors {
        bottom: true
        left: true
        right: true
        top: true
    }
    margins {
        bottom: 0
        left: 0
        right: 0
        top: 0
    }
}
