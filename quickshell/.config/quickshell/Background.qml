import Quickshell
import Quickshell.Wayland
import QtMultimedia
import QtQuick

PanelWindow {
	
	WlrLayershell.layer: WlrLayer.Background
	WlrLayershell.namespace: "Quickshell Background"
	
	property string envVarUSER: Quickshell.env("USER")

	anchors {
		left: true
		right: true
		top: true
		bottom: true
	}

	color: "transparent"

	Rectangle {
		anchors.fill: parent
		color: "white"
		
		Image {
			id: backgroundImage
			anchors.fill: parent
			source: "file:///home/" + envVarUSER + "/.local/share/wallpapers/W1.png"
		}
		MediaPlayer {
			id: player
			source: "https://www.youtube.com/live/HxW3mT10o8A"
			videoOutput: backgroundVideo

		}

		VideoOutput {
			id: backgroundVideo
			anchors.fill: parent
			visible: false
		}
	}


}
