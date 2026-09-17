import QtQuick
import UIverse.Core

SlotRect {
    id: field

    readonly property bool focused: ctl && ctl.activeFocus

    implicitHeight: t.controlHeight
    radius: t.radiusMd
    color: Qt.alpha(t.text, focused ? 0.12 : isHovered ? 0.09 : 0.06)
    border.width: t.borderWidth
    border.color: focused ? t.accent : t.border

    Behavior on color { ColorAnimation { duration: field.t.durationFast } }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: parent.radius + 3
        color: "transparent"
        border.width: 3
        border.color: Qt.alpha(field.t.accent, 0.25)
        visible: field.focused
    }
}
