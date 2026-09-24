import QtQuick 2.15
import Quickshell

QtObject {
    id: properties

    property bool menuBarvisible: true
    property bool dockVisible: true

  



    // --- Dimensions & Spacing ---
    property int menuBarHeight: 35
    property int backgroundHeight: 26
    property int backgroundRadius: 8
    property int backgroundTopMargin: 4
    property int backgroundSideMargin: 8
    property int contentSideMargin: 12

    property int leftRowSpacing: 16
    property int rightRowSpacing: 14
    property int statusItemSpacing: 4

    // --- Colors & Opacity ---
    property color backgroundColor: "white"
    property color textColor: "black"
    property real backgroundOpacity: 0.4
    property real textSecondaryOpacity: 0.8

    property int menuFontSize: 13
    property int statusFontSize: 12

    // --- Date & Time Settings ---
    property int timerIntervalMs: 1000
    property string timeFormat: "h:mm AP"
    property string dateFormat: "ddd MMM d"

    // --- Menu Bar Labels ---
    property string appTitle: "Finder"
    property var menuItems: ["File", "Edit", "View"]

    // --- Status Icons & Thresholds ---
    property string iconMuted: ""
    property string iconUnmuted: ""
    property string iconCharging: ""
    property string iconBatteryNormal: ""
    property string iconBatteryLow: ""
    property int lowBatteryThresholdPercentage: 20


    // --- Window & Visibility ---
    property string namespace: "dockBar"

    // --- Application List ---
    property var dockApps: [
        "Firefox",
        "Code-OSS",
        "Launchpad",
        "Alacritty",
        "obsidian",
        // "obs",

        //"steam",
        "google-chrome",
        "org.vinegarhq.Sober",
        "org.quickshell",
        "gitkraken"
    ]

    // --- Dimensions & Spacing ---
    property int expandedHeight: 85
    property int dockbarcollapsedHeight: 10
    property int menuBarCollapsedHeight: 7
    property int iconWidth: 40
    property int iconHeight: 40
    property int iconSpacing: 10
    property int dockTopMargin: 9
    property int dockRadius: 10

    // --- Dynamic Calculations ---
    property int dockAppsLength: dockApps.length
    property int totalWidth: (dockApps.length * iconWidth) + ((dockApps.length + 1) * iconSpacing)

    // --- Colors & Opacity ---
    property color barColorActive: "white"
    property color barColorHidden: "transparent"
    property color iconColor: "transparent"
    property color highlightColor: "white"
    property real barOpacity: 0.4
    property real highlightOpacity: 0.3

    // --- Timers & Intervals (ms) ---
    property int hideInterval: 500
    property int hoverCheckInterval: 100
    property int retryInterval: 250
    property int clickEffectInterval: 150
}

