import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Button {
    id: button

    readonly property Tokens theme: ShellTheme.tokens

    implicitWidth: Math.max(implicitHeight, contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: theme.controlHeight
    horizontalPadding: theme.unit * 1.5
    hoverEnabled: true
    focusPolicy: Qt.StrongFocus

    background: Rectangle {
        radius: button.theme.radiusMd
        color: {
            if (button.checked)
                return button.theme.accent
            return button.hovered ? button.theme.surfaceAlt : button.theme.surface
        }
        border.width: button.theme.borderWidth
        border.color: button.checked || button.visualFocus ? button.theme.accent : button.theme.border

        Behavior on color {
            ColorAnimation {
                duration: button.theme.durationFast
            }
        }
    }

    contentItem: ShellText {
        role: "small"
        text: button.text
        color: button.checked ? button.theme.textOnAccent : button.theme.text
        font.weight: button.theme.weightMedium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
}
