import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Kit

RowLayout {
    readonly property Tokens tokens: Style.tokens

    spacing: tokens.unit * 2

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

    UvTextField {
        Layout.preferredWidth: tokens.unit * 28
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
