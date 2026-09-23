import QtQuick
import UIverse.Core

SlotRect {
    id: groove

    implicitHeight: 3
    radius: 1.5
    color: tokens.border

    Rectangle {
        width: parent.width * groove.position
        height: parent.height
        radius: parent.radius
        color: groove.tokens.accent
    }
}
