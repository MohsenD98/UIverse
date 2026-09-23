import QtQuick
import UIverse.Core

SlotRect {
    id: field

    implicitHeight: tokens.controlHeight
    radius: tokens.radiusMd
    color: {
        if (hasActiveFocus)
            return Qt.alpha(tokens.text, 0.12)
        return Qt.alpha(tokens.text, isHovered ? 0.09 : 0.06)
    }
    border.width: tokens.borderWidth
    border.color: hasActiveFocus ? tokens.accent : tokens.border

    Behavior on color {
        ColorAnimation {
            duration: field.tokens.durationFast
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: parent.radius + 3
        color: "transparent"
        border.width: 3
        border.color: Qt.alpha(field.tokens.accent, 0.25)
        visible: field.hasActiveFocus
    }
}
