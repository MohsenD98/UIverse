import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Kit

GridLayout {
    id: header

    property bool narrow: false

    readonly property Tokens tokens: Style.tokens

    columns: narrow ? 1 : 2
    columnSpacing: tokens.unit * 2
    rowSpacing: tokens.unit * 2

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 0

        UvLabel {
            Layout.fillWidth: true
            role: "caption"
            muted: true
            text: "Workspace · Q3 overview"
        }

        UvLabel {
            Layout.fillWidth: true
            role: "display"
            text: "Analytics"
        }
    }

    RowLayout {
        spacing: header.tokens.unit * 2

        UvTextField {
            Layout.preferredWidth: header.tokens.controlWidth
            Layout.fillWidth: header.narrow
            placeholderText: "Search reports"
        }

        UvButton {
            text: "Export"
            variant: "secondary"
        }

        UvButton {
            text: "New report"
        }
    }
}
