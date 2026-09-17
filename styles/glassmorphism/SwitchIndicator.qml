import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: track

    readonly property bool on: ctl ? ctl.checked : false

    implicitWidth: 46
    implicitHeight: 26
    radius: height / 2
    color: on ? t.accent : Qt.alpha(t.text, 0.14)
    border.width: t.borderWidth
    border.color: on ? Qt.lighter(t.accent, 1.2) : t.border

    Behavior on color { ColorAnimation { duration: track.t.durationBase } }

    RectangularShadow {
        anchors.fill: knob
        radius: knob.radius
        blur: 8
        offset.y: 2
        color: Qt.alpha(track.t.shadowColor, 0.5)
    }

    Rectangle {
        id: knob

        width: track.height - 6
        height: width
        radius: width / 2
        y: 3
        x: track.on ? track.width - width - 3 : 3
        color: track.t.text

        Behavior on x { NumberAnimation { duration: track.t.durationBase; easing.type: track.t.easingType } }
    }
}
