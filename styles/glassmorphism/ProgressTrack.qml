import QtQuick
import UIverse.Core

SlotRect {
    id: track

    implicitHeight: 6
    radius: height / 2
    color: Qt.alpha(t.text, 0.12)

    Rectangle {
        width: track.width * (track.ctl ? track.ctl.position : 0)
        height: track.height
        radius: track.radius
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: track.t.palette[3] }
            GradientStop { position: 1; color: track.t.accent }
        }

        Behavior on width { NumberAnimation { duration: track.t.durationBase } }
    }
}
