import QtQuick
import UIverse.Core

SlotRect {
    id: track

    implicitHeight: 6
    radius: height / 2
    color: Qt.alpha(tokens.text, 0.08)

    Rectangle {
        width: track.width * track.position
        height: track.height
        radius: track.radius
        color: track.tokens.accent

        Behavior on width {
            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
