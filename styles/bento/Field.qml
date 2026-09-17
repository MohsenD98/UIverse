import QtQuick
import UIverse.Core

SlotRect {
    id: field

    implicitHeight: t.controlHeight
    radius: t.radiusSm
    color: hasActiveFocus ? t.surface : Qt.alpha(t.text, isHovered ? 0.07 : 0.05)
    border.width: hasActiveFocus ? 2 : 0
    border.color: t.accent

    Behavior on color { ColorAnimation { duration: field.t.durationFast } }
}
