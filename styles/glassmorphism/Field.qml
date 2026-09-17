import QtQuick
import UIverse.Core

SlotRect {
    id: field

    implicitHeight: t.controlHeight
    radius: t.radiusMd
    color: Qt.alpha(t.text, hasActiveFocus ? 0.12 : isHovered ? 0.09 : 0.06)
    border.width: t.borderWidth
    border.color: hasActiveFocus ? t.accent : t.border

    Behavior on color {
        ColorAnimation {
            duration: field.t.durationFast
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: parent.radius + 3
        color: "transparent"
        border.width: 3
        border.color: Qt.alpha(field.t.accent, 0.25)
        visible: field.hasActiveFocus
    }
}
