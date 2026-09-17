pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core
import UIverse.Styles

Rectangle {
    id: gallery

    signal opened(string key)

    readonly property Tokens s: ShellTheme.t

    color: s.bg

    Column {
        id: header
        anchors { left: parent.left; right: parent.right; top: parent.top }
        anchors.margins: gallery.s.pagePadding
        spacing: gallery.s.unit

        ShellText { role: "display"; text: "UIverse" }

        ShellText {
            width: Math.min(gallery.s.unit * 70, parent.width)
            muted: true
            wrapMode: Text.WordWrap
            text: "One contract, many design languages. Each style is a complete " +
                  "pack: tokens, components and the rules it plays by."
        }
    }

    GridView {
        id: grid

        readonly property int columns: Math.max(1, Math.floor(width / (gallery.s.unit * 40)))

        anchors {
            left: parent.left
            right: parent.right
            top: header.bottom
            bottom: parent.bottom
            margins: gallery.s.pagePadding
        }
        cellWidth: width / columns
        cellHeight: gallery.s.unit * 28 + gallery.s.gridGap
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
                anchors.rightMargin: gallery.s.gridGap
                anchors.bottomMargin: gallery.s.gridGap
                pack: cell.modelData
                onActivated: gallery.opened(cell.modelData.key)
            }
        }
    }
}
