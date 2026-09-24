import QtQuick 2.15

QtObject {
    id: properties

    // --- Dimensions & Spacing ---
    property int menuBarHeight: 32
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

    // --- Typography ---
    property int appleIconSize: 15
    property int menuFontSize: 13
    property int statusFontSize: 12

    // --- Date & Time Settings ---
    property int timerIntervalMs: 1000
    property string timeFormat: "h:mm AP"
    property string dateFormat: "ddd MMM d"

    // --- Menu Bar Labels ---
    property string appleLogo: ""
    property string appTitle: "Finder"
    property var menuItems: ["File", "Edit", "View"]

    // --- Status Icons & Thresholds ---
    property string iconMuted: "🔇"
    property string iconUnmuted: "🔊"
    property string iconCharging: "⚡"
    property string iconBatteryNormal: "🔋"
    property string iconBatteryLow: "🪫"
    property int lowBatteryThresholdPercentage: 20
}