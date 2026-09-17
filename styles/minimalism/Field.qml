import QtQuick
import UIverse.Core

SlotRect {
    id: field

    implicitHeight: t.controlHeight
    color: t.surface
    radius: t.radiusMd
    border.width: t.borderWidth
    border.color: hasActiveFocus ? t.accent : isHovered ? t.textMuted : t.border

    Behavior on border.color {
        ColorAnimation {
            duration: field.t.durationFast
        }
    }
}
