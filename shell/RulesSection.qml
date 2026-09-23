pragma ComponentBehavior: Bound
import QtQuick
import UIverse.Core

Column {
    id: section

    property string title
    property string marker
    property color markerColor: theme.accent
    property var items: []

    readonly property Tokens theme: ShellTheme.tokens

    spacing: theme.unit
    visible: items.length > 0

    ShellText {
        role: "label"
        muted: true
        text: section.title
    }

    Repeater {
        model: section.items

        Row {
            id: row

            required property string modelData

            width: section.width
            spacing: section.theme.unit

            ShellText {
                id: bullet
                text: section.marker
                color: section.markerColor
                font.weight: section.theme.weightDisplay
            }

            ShellText {
                width: row.width - bullet.width - row.spacing
                text: row.modelData
                wrapMode: Text.WordWrap
                lineHeight: section.theme.lineHeight
            }
        }
    }
}
