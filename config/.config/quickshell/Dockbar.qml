import QtQuick 2.15
import Quickshell
import Quickshell.Wayland


PanelWindow {
    id: dockBar

    Properties {
        id: properties
    }

    property int dockBarHeight: properties.expandedHeight
    property bool iconHovered: false

    WlrLayershell.namespace: properties.namespace
    visible: properties.dockVisible
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

        interval: properties.hideInterval
        repeat: false
        onTriggered: {
            dockBar.dockBarHeight = properties.dockbarcollapsedHeight;
            recdockBar.recdockBarColor = properties.barColorHidden;
        }
    }

    Rectangle {
        id: recdockBar

        property color recdockBarColor: properties.barColorActive

        width: properties.totalWidth
        height: properties.iconHeight + 20
        radius: properties.dockRadius
        opacity: properties.barOpacity
        color: recdockBarColor
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: properties.dockTopMargin

        Timer {
            interval: properties.hoverCheckInterval
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
                dockBar.dockBarHeight = properties.expandedHeight;
                recdockBar.recdockBarColor = properties.barColorActive;
                hideTimer.stop();
            }
            onExited: hideTimer.start()
        }
    }

    Row {
        id: iconRow

        spacing: properties.iconSpacing
        anchors.left: recdockBar.left
        anchors.leftMargin: properties.iconSpacing
        anchors.top: recdockBar.top
        anchors.topMargin: properties.iconSpacing

        Repeater {
            model: properties.dockApps

            delegate: Rectangle {
                id: iconRect

                property string desktopId: modelData
                property var de: null
                property var recentrating: 0

                width: properties.iconWidth
                height: properties.iconHeight
                color: properties.iconColor

                Rectangle {
                    id: u1

                    visible: false
                    anchors.centerIn: parent
                    width: properties.iconWidth + 7
                    height: properties.iconHeight + 7
                    color: properties.highlightColor
                    radius: properties.dockRadius
                    opacity: properties.highlightOpacity
                }

                Timer {
                    id: retryTimer

                    interval: properties.retryInterval
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

                Text {
                    anchors.top: parent.bottom
                    text: iconRect.de.name
                    font.pixelSize: 7
                    visible: false
                }

                Timer {
                    id: u1vis

                    interval: properties.clickEffectInterval
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

                        recentrating = recentrating + 3;
                        console.log(iconRect.de + " RecRating Increased");
                    }
                }
            }
        }
    }

    PopupWindow {
        id: launcher
        width: properties.totalWidth
        height: 300
        visible: false
        color: "transparent"

        anchor {

            item: recdockBar
            edges: Edges.Top | Edges.Left
            gravity: Edges.Top | Edges.Right
     
        }

        Rectangle {
            anchors.fill: parent
            color: "red"
            radius: 10
        }
        

    }
    
    BackgroundEffect.blurRegion: Region {
        item: recdockBar
        radius: recdockBar.radius
    }


}