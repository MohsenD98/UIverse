import QtQuick
import UIverse.Core

SlotRect {
    id: field

    readonly property bool focused: ctl && ctl.activeFocus

    implicitHeight: t.controlHeight
    radius: t.radiusSm
    color: focused ? t.surface : Qt.alpha(t.text, isHovered ? 0.07 : 0.05)
    border.width: focused ? 2 : 0
    border.color: t.accent

    Behavior on color { ColorAnimation { duration: field.t.durationFast } }
}
