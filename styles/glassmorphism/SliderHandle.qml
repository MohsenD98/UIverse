import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: handle

    implicitWidth: 22
    implicitHeight: 22

    Rectangle {
        anchors.centerIn: parent
        width: parent.width + 10
        height: width
        radius: width / 2
        color: Qt.alpha(handle.tokens.accent, handle.isPressed ? 0.35 : 0.18)
        scale: handle.isPressed ? 1.15 : 1

        Behavior on scale {
            NumberAnimation {
                duration: handle.tokens.durationFast
            }
        }
    }

    RectangularShadow {
        anchors.fill: dot
        radius: dot.radius
        blur: 10
        offset.y: 3
        color: Qt.alpha(handle.tokens.shadowColor, 0.5)
    }

    Rectangle {
        id: dot
        anchors.fill: parent
        radius: width / 2
        color: handle.tokens.text
    }
}
