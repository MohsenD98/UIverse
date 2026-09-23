import QtQuick
import QtQuick.Effects
import UIverse.Core

SlotRect {
    id: track

    implicitWidth: 46
    implicitHeight: 26
    radius: height / 2
    color: isChecked ? tokens.accent : Qt.alpha(tokens.text, 0.14)
    border.width: tokens.borderWidth
    border.color: isChecked ? Qt.lighter(tokens.accent, 1.2) : tokens.border

    Behavior on color {
        ColorAnimation {
            duration: track.tokens.durationBase
        }
    }

    RectangularShadow {
        anchors.fill: knob
        radius: knob.radius
        blur: 8
        offset.y: 2
        color: Qt.alpha(track.tokens.shadowColor, 0.5)
    }

    Rectangle {
        id: knob

        width: track.height - 6
        height: width
        radius: width / 2
        y: 3
        x: track.isChecked ? track.width - width - 3 : 3
        color: track.tokens.text

        Behavior on x {
            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
