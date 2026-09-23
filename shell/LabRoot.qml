pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core
import UIverse.Styles

Rectangle {
    id: lab

    property string route: "gallery"

    readonly property Tokens theme: ShellTheme.tokens

    color: theme.background

    Loader {
        id: screen

        anchors.fill: parent
        focus: true
        sourceComponent: lab.route === "gallery" ? galleryView : workbenchView
        onLoaded: {
            (screen.item as Item)?.forceActiveFocus()
            fade.restart()
        }
    }

    NumberAnimation {
        id: fade
        target: screen
        property: "opacity"
        from: 0
        to: 1
        duration: lab.theme.durationBase
        easing.type: lab.theme.easingType
    }

    Component {
        id: galleryView

        GalleryView {
            onOpened: key => {
                StyleRegistry.select(key)
                lab.route = "workbench"
            }
        }
    }

    Component {
        id: workbenchView

        Workbench {
            onBack: lab.route = "gallery"
        }
    }
}
