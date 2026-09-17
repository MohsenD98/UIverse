import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Button {
    id: control

    property bool accent: false
    readonly property Tokens s: ShellTheme.t
    readonly property bool lit: accent || checked

    implicitHeight: s.controlHeight
    implicitWidth: Math.max(implicitHeight, contentItem.implicitWidth + leftPadding + rightPadding)
    leftPadding: s.unit * 1.5
    rightPadding: s.unit * 1.5
    hoverEnabled: true
    focusPolicy: Qt.StrongFocus

    background: Rectangle {
        radius: control.s.radiusMd
        color: control.lit ? control.s.accent : control.hovered ? control.s.surfaceAlt : control.s.surface
        border.width: control.s.borderWidth
        border.color: control.visualFocus ? control.s.accent : control.lit ? control.s.accent : control.s.border

        Behavior on color {
            ColorAnimation {
                duration: control.s.durationFast
            }
        }
    }

    contentItem: ShellText {
        role: "small"
        text: control.text
        color: control.lit ? control.s.textOnAccent : control.s.text
        font.weight: control.s.weightMedium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
