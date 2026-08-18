import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: dockBar

    property int dockBarHeight: 85
    property bool iconHovered: false
    property var dockApps: ["Firefox", "Code-OSS", "Launchpad", "Alacritty", "obsidian", "chromium", "org.quickshell", "gitkraken"]
    property int dockAppsLength: dockApps.length 
    
    property int totalWidth: (dockApps.length  * 40) + ((dockApps.length + 1) * 10)


    WlrLayershell.namespace: "dockBar"
    visible: true
    color: "transparent"
    implicitHeight: dockBarHeight
    aboveWindows: true
    exclusionMode: ExclusionMode.Ignore

    anchors {
        bottom: true
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
        id: hideTimer

        interval: 500
        repeat: false
        onTriggered: {
            dockBar.dockBarHeight = 10;
            recdockBar.recdockBarColor = "transparent";
        }
    }

    Rectangle {
        id: recdockBar

        property color recdockBarColor: "white"

        width: totalWidth
        height: 60
        radius: 10
        opacity: 0.4
        color: recdockBarColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 9

        Timer {
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                if (dockMouse.containsMouse || dockBar.iconHovered)
                    hideTimer.stop();
                else
                    hideTimer.start();
            }
        }

        MouseArea {
            id: dockMouse

            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                dockBar.dockBarHeight = 85;
                recdockBar.recdockBarColor = "white";
                hideTimer.stop();
            }
            onExited: hideTimer.start()
        }

    }
    Row {
        spacing: 10
        
    }
    Row {
        id: iconRow

        property int iconWidth: 40
        property int iconHeight: 40
        property color iconColor: "transparent"

        spacing: 10
        anchors.left: recdockBar.left
        anchors.leftMargin: 10
        anchors.top: recdockBar.top
        anchors.topMargin: 10

        Timer {
            id: clickEffect

            interval: 300
            repeat: false
            onTriggered: {
            }
        }

        Repeater {
            model: dockBar.dockApps

            delegate: Rectangle {
                id: iconRect

                property string desktopId: modelData
                property var de: null
                property var recentrating: 0

                width: iconRow.iconWidth
                height: iconRow.iconHeight
                color: iconRow.iconColor

                Rectangle {
                    id: u1

                    visible: false
                    anchors.centerIn: parent
                    width: iconRow.iconWidth + 7
                    height: iconRow.iconHeight + 7
                    color: "white"
                    radius: 10
                    opacity: 0.3
                }

                Timer {
                    id: retryTimer

                    interval: 250
                    running: true
                    repeat: true
                    onTriggered: {
                        iconRect.de = DesktopEntries.heuristicLookup(iconRect.desktopId);
                        if (iconRect.de)
                            stop();

                    }
                }

                Image {
                    anchors.fill: parent
                    asynchronous: true
                    cache: true
                    fillMode: Image.PreserveAspectFit
                    source: iconRect.de ? Quickshell.iconPath(iconRect.de.icon) : ""
                }

                Timer {
                    id: u1vis

                    interval: 150
                    onTriggered: {
                        u1.visible = false;
                    }
                }

                MouseArea {
                    id: ttty7

                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        u1.visible = true;
                        dockBar.iconHovered = true;
                    }
                    onExited: {
                        u1.visible = false;
                        dockBar.iconHovered = false;
                    }
                    onClicked: {
                        u1.visible = true;
                        u1vis.start();
                        if (iconRect.de)
                            iconRect.de.execute();

                        recentrating = recentrating + 3
                        console.log(iconRect.de + "RecRating Increased")



                    }
                }

            }

        }

      

    }

 
    BackgroundEffect.blurRegion: Region {
        item: recdockBar
        radius: recdockBar.radius
    }

}
