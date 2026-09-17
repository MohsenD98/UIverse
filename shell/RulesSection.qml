import QtQuick
import UIverse.Core

Column {
    id: section

    property string title
    property string marker
    property color markerColor: s.accent
    property var items: []

    readonly property Tokens s: ShellTheme.t

    spacing: s.unit
    visible: items.length > 0

    ShellText {
        role: "label"
        muted: true
        text: section.title
    }

    Repeater {
        model: section.items

        Row {
            required property var modelData

            width: section.width
            spacing: section.s.unit

            ShellText {
                id: bullet
                text: section.marker
                color: section.markerColor
                font.weight: section.s.weightDisplay
            }

            ShellText {
                width: parent.width - bullet.width - parent.spacing
                text: parent.modelData
                wrapMode: Text.WordWrap
                lineHeight: section.s.lineHeight
            }
        }
    }
}
