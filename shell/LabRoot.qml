pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core
import UIverse.Styles

Rectangle {
    id: root

    property string route: "gallery"

    readonly property Tokens s: ShellTheme.t

    color: s.bg

    Loader {
        id: view

        anchors.fill: parent
        focus: true
        sourceComponent: root.route === "gallery" ? galleryView : workbenchView
        onLoaded: {
            (view.item as Item)?.forceActiveFocus()
            fade.restart()
        }
    }

    NumberAnimation {
        id: fade
        target: view
        property: "opacity"
        from: 0
        to: 1
        duration: root.s.durationBase
        easing.type: root.s.easingType
    }

    Component {
        id: galleryView

        GalleryView {
            onOpened: key => {
                StyleRegistry.select(key)
                root.route = "workbench"
            }
        }
    }

    Component {
        id: workbenchView

        Workbench {
            onBack: root.route = "gallery"
        }
    }
}
