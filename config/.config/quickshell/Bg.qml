import Quickshell
import QtQuick
import QtMultimedia

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
        source: wallpaper // Or wallpapes

        visible: false
    }

    MediaPlayer {
        id: bgvideo
        source: "/home/iv/Downloads/jita.mp4"
        videoOutput: vv
        autoPlay: true
        loops: MediaPlayer.Infinite

        
    }

    VideoOutput {
        id: vv
        anchors.fill: parent
        visible: true
    }

    aboveWindows: false
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
}
