import QtQuick
import UIverse.Core

SlotRect {
    id: field

    implicitHeight: tokens.controlHeight
    radius: tokens.radiusSm
    color: hasActiveFocus ? tokens.surface : Qt.alpha(tokens.text, isHovered ? 0.07 : 0.05)
    border.width: hasActiveFocus ? 2 : 0
    border.color: tokens.accent

    Behavior on color {
        ColorAnimation {
            duration: field.tokens.durationFast
        }
    }
}
