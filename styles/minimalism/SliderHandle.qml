import QtQuick
import UIverse.Core

SlotRect {
    implicitWidth: 16
    implicitHeight: 16
    radius: width / 2
    color: t.surface
    border.width: 1
    border.color: ctl && ctl.pressed ? t.accent : t.textMuted
    scale: ctl && ctl.pressed ? 1.15 : 1

    Behavior on scale { NumberAnimation { duration: t.durationFast } }
}
