import QtQuick
import UIverse.Core

SlotRect {
    id: track

    implicitHeight: 3
    radius: 1.5
    color: t.border

    Rectangle {
        width: parent.width * track.position
        height: parent.height
        radius: parent.radius
        color: track.t.accent

        Behavior on width {
            NumberAnimation {
                duration: track.t.durationBase
            }
        }
    }
}
