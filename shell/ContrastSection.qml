pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import UIverse.Core

Column {
    id: section

    property ContrastAudit audit
    property bool decoratedBackground: false

    readonly property Tokens theme: ShellTheme.tokens

    spacing: theme.unit
    visible: audit !== null

    ShellText {
        role: "label"
        muted: true
        text: "Contrast"
    }

    Repeater {
        model: section.audit ? section.audit.checks : []

        RowLayout {
            id: check

            required property var modelData

            width: section.width
            spacing: section.theme.unit * 1.5

            Rectangle {
                Layout.preferredWidth: section.theme.unit * 5
                Layout.preferredHeight: section.theme.unit * 3.5
                radius: section.theme.radiusSm
                color: check.modelData.background
                border.width: section.theme.borderWidth
                border.color: section.theme.border

                Text {
                    anchors.centerIn: parent
                    text: "Aa"
                    color: check.modelData.foreground
                    font.family: section.theme.fontFamily
                    font.pixelSize: section.theme.fontSizeMd
                    font.weight: section.theme.weightMedium
                }
            }

            ShellText {
                Layout.fillWidth: true
                role: "small"
                text: check.modelData.label
                elide: Text.ElideRight
            }

            ShellText {
                role: "small"
                text: check.modelData.ratio.toFixed(1) + ":1"
                color: check.modelData.passes ? section.theme.success : section.theme.danger
                font.weight: section.theme.weightMedium
            }
        }
    }

    ShellText {
        width: parent.width
        visible: section.decoratedBackground
        role: "small"
        muted: true
        wrapMode: Text.WordWrap
        lineHeight: section.theme.lineHeight
        text: "Measured against the plain page color. The decorated background behind this style can lower the real contrast."
    }
}
