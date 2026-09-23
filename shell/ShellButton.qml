import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Button {
    id: control

    property bool accent: false
    readonly property Tokens theme: ShellTheme.tokens
    readonly property bool lit: accent || checked

    implicitHeight: theme.controlHeight
    implicitWidth: Math.max(implicitHeight, contentItem.implicitWidth + leftPadding + rightPadding)
    leftPadding: theme.unit * 1.5
    rightPadding: theme.unit * 1.5
    hoverEnabled: true
    focusPolicy: Qt.StrongFocus

    background: Rectangle {
        radius: control.theme.radiusMd
        color: control.lit ? control.theme.accent : control.hovered ? control.theme.surfaceAlt : control.theme.surface
        border.width: control.theme.borderWidth
        border.color: control.visualFocus ? control.theme.accent : control.lit ? control.theme.accent : control.theme.border

        Behavior on color {
            ColorAnimation {
                duration: control.theme.durationFast
            }
        }
    }

    contentItem: ShellText {
        role: "small"
        text: control.text
        color: control.lit ? control.theme.textOnAccent : control.theme.text
        font.weight: control.theme.weightMedium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
