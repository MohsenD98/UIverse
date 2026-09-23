import QtQuick
import UIverse.Core

SlotRect {
    id: track

    implicitHeight: 3
    radius: 1.5
    color: tokens.border

    Rectangle {
        width: parent.width * track.position
        height: parent.height
        radius: parent.radius
        color: track.tokens.accent

        Behavior on width {
            NumberAnimation {
                duration: track.tokens.durationBase
            }
        }
    }
}
