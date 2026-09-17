import QtQuick
import UIverse.Core

SlotRect {
    id: groove

    implicitHeight: 3
    radius: 1.5
    color: t.border

    Rectangle {
        width: parent.width * groove.position
        height: parent.height
        radius: parent.radius
        color: groove.t.accent
    }
}
