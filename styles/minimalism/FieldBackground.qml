import QtQuick
import UIverse.Core

SlotRect {
    id: field

    implicitHeight: tokens.controlHeight
    color: tokens.surface
    radius: tokens.radiusMd
    border.width: tokens.borderWidth
    border.color: hasActiveFocus ? tokens.accent : isHovered ? tokens.textMuted : tokens.border

    Behavior on border.color {
        ColorAnimation {
            duration: field.tokens.durationFast
        }
    }
}
