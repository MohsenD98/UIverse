import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: handle

    readonly property bool pressed: ctl && ctl.pressed

    implicitWidth: 26
    implicitHeight: 26

    RectangularShadow {
        anchors.fill: dot
        radius: dot.radius
        blur: 8
        offset.y: 2
        color: Qt.alpha(handle.t.shadowColor, 0.22)
    }

    Rectangle {
        id: dot

        anchors.fill: parent
        radius: width / 2
        color: handle.t.surface
        scale: handle.pressed ? 1.1 : 1

        Behavior on scale { NumberAnimation { duration: handle.t.durationFast; easing.type: handle.t.easingType } }
    }
}
