import QtQuick
import QtQuick.Layouts
import UIverse.Core
import UIverse.Kit

RowLayout {
    readonly property Tokens t: Style.t

    spacing: t.unit * 2

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
        Layout.preferredWidth: t.unit * 28
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
