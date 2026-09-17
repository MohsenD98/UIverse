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
        color: Qt.alpha(handle.t.accent, handle.isPressed ? 0.35 : 0.18)
        scale: handle.isPressed ? 1.15 : 1

        Behavior on scale {
            NumberAnimation {
                duration: handle.t.durationFast
            }
        }
    }

    RectangularShadow {
        anchors.fill: dot
        radius: dot.radius
        blur: 10
        offset.y: 3
        color: Qt.alpha(handle.t.shadowColor, 0.5)
    }

    Rectangle {
        id: dot
        anchors.fill: parent
        radius: width / 2
        color: handle.t.text
    }
}
