import QtQuick
import UIverse.Core

SlotRect {
    id: handle

    implicitWidth: 16
    implicitHeight: 16
    radius: width / 2
    color: tokens.surface
    border.width: 1
    border.color: isPressed ? tokens.accent : tokens.textMuted
    scale: isPressed ? 1.15 : 1

    Behavior on scale {
        NumberAnimation {
            duration: handle.tokens.durationFast
        }
    }
}
