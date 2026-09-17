import QtQuick
import UIverse.Core

SlotRect {
    id: groove

    implicitHeight: 6
    radius: height / 2
    color: Qt.alpha(t.text, 0.14)

    Rectangle {
        width: groove.width * (groove.ctl ? groove.ctl.position : 0)
        height: groove.height
        radius: groove.radius
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: groove.t.palette[0] }
            GradientStop { position: 1; color: groove.t.accent }
        }
    }
}
