import QtQuick
import UIverse.Core

SlotRect {
    id: handle

    implicitWidth: 16
    implicitHeight: 16
    radius: width / 2
    color: t.surface
    border.width: 1
    border.color: isPressed ? t.accent : t.textMuted
    scale: isPressed ? 1.15 : 1

    Behavior on scale { NumberAnimation { duration: handle.t.durationFast } }
}
