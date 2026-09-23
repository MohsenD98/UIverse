import QtQuick
import UIverse.Core

SlotRect {
    id: track

    implicitWidth: 40
    implicitHeight: 22
    radius: height / 2
    color: isChecked ? tokens.accent : tokens.border

    Behavior on color {
        ColorAnimation {
            duration: track.tokens.durationBase
        }
    }

    Rectangle {
        width: parent.height - 4
        height: width
        radius: width / 2
        y: 2
        x: track.isChecked ? parent.width - width - 2 : 2
        color: track.tokens.surface

        Behavior on x {
            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
