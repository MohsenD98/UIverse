import QtQuick
import UIverse.Core
import UIverse.Styles

Item {
    id: gallery

    signal opened(string key)

    readonly property Tokens s: ShellTheme.t

    Rectangle {
        anchors.fill: parent
        color: gallery.s.bg
    }

    Column {
        id: header
        anchors { left: parent.left; right: parent.right; top: parent.top }
        anchors.margins: gallery.s.pagePadding
        spacing: gallery.s.unit

        Text {
            text: "UIverse"
            color: gallery.s.text
            font.family: gallery.s.displayFamily
            font.pixelSize: gallery.s.displaySize
            font.weight: Font.Bold
            font.letterSpacing: -0.5
        }

        Text {
            width: Math.min(560, parent.width)
            text: "One contract, many design languages. Each style is a complete " +
                  "pack — tokens, components and the rules it plays by."
            color: gallery.s.textMuted
            font.family: gallery.s.fontFamily
            font.pixelSize: gallery.s.fontSizeMd
            wrapMode: Text.WordWrap
        }
    }

    GridView {
        id: grid

        anchors {
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: parent.bottom
            margins: gallery.s.pagePadding
        }
        anchors.topMargin: gallery.s.pagePadding

        readonly property int columns: Math.max(1, Math.floor(width / 320))

        cellWidth: width / columns
        cellHeight: 244
        clip: true
        model: StyleRegistry.packs

        delegate: Item {
            required property var modelData

            width: grid.cellWidth
            height: grid.cellHeight

            StyleCard {
                anchors.fill: parent
                anchors.rightMargin: gallery.s.gridGap
                anchors.bottomMargin: gallery.s.gridGap
                pack: parent.modelData
                onActivated: gallery.opened(pack.key)
            }
        }
    }
}
