import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: track

    implicitWidth: 50
    implicitHeight: 30
    radius: height / 2
    color: isChecked ? t.success : Qt.alpha(t.text, 0.12)

    Behavior on color {
        ColorAnimation {
            duration: track.t.durationBase
        }
    }

    RectangularShadow {
        anchors.fill: knob
        radius: knob.radius
        blur: 6
        offset.y: 2
        color: Qt.alpha(track.t.shadowColor, 0.2)
    }

    Rectangle {
        id: knob

        width: track.height - 4
        height: width
        radius: width / 2
        y: 2
        x: track.isChecked ? track.width - width - 2 : 2
        color: track.t.surface

        Behavior on x {
            NumberAnimation {
                duration: track.t.durationBase
                easing.type: track.t.easingType
            }
        }
    }
}
