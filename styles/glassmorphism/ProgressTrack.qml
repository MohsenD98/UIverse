import QtQuick
import UIverse.Core

SlotRect {
    id: track

    implicitHeight: 6
    radius: height / 2
    color: Qt.alpha(tokens.text, 0.12)

    Rectangle {
        width: track.width * track.position
        height: track.height
        radius: track.radius
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: track.tokens.palette[3]
            }
            GradientStop {
                position: 1
                color: track.tokens.accent
            }
        }

        Behavior on width {
            NumberAnimation {
                duration: track.tokens.durationBase
            }
        }
    }
}
