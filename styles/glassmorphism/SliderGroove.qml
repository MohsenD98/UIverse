import QtQuick
import UIverse.Core

SlotRect {
    id: groove

    implicitHeight: 6
    radius: height / 2
    color: Qt.alpha(tokens.text, 0.14)

    Rectangle {
        width: groove.width * groove.position
        height: groove.height
        radius: groove.radius
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0
                color: groove.tokens.palette[0]
            }
            GradientStop {
                position: 1
                color: groove.tokens.accent
            }
        }
    }
}
