import Quickshell
import QtQuick

ShellRoot {
    id: root

    property string wallpaper: "assets/pictures/wallpapers/1.png"

    FontLoader {
        id: globalregular
        source: "assets/fonts/sfpro/SFPRODISPLAYREGULAR.OTF"
    }


    Bg {}
    Menubar {}
    Dockbar {}
    AppLauncher {}

    // FIX LATER
    Launchpad {}
}
