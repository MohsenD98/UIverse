pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core
import UIverse.Styles

Rectangle {
    id: gallery

    signal opened(string key)

    readonly property Tokens theme: ShellTheme.tokens

    color: theme.background

    Column {
        id: header
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        anchors.margins: gallery.theme.pagePadding
        spacing: gallery.theme.unit

        ShellText {
            role: "display"
            text: "UIverse"
        }

        ShellText {
            width: Math.min(gallery.theme.unit * 70, parent.width)
            muted: true
            wrapMode: Text.WordWrap
            text: "Pick a style to see the same dashboard drawn in it."
        }
    }

    GridView {
        id: grid

        readonly property int columns: Math.max(1, Math.floor(width / (gallery.theme.unit * 40)))
        readonly property real cardHeight: gallery.theme.unit * 28

        anchors {
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: parent.bottom
            margins: gallery.theme.pagePadding
        }
        cellWidth: width / columns
        cellHeight: cardHeight + gallery.theme.gridGap
        model: StyleRegistry.packs
        clip: true
        keyNavigationWraps: true

        delegate: Item {
            id: cell

            required property StylePack modelData

            width: grid.cellWidth
            height: grid.cellHeight

            StyleCard {
                anchors.fill: parent
                anchors.rightMargin: gallery.theme.gridGap
                anchors.bottomMargin: gallery.theme.gridGap
                pack: cell.modelData
                onActivated: gallery.opened(cell.modelData.key)
            }
        }
    }
}
