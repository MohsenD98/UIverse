import QtQuick
import UIverse.Core

SlotRect {
    id: groove

    implicitHeight: 4
    radius: height / 2
    color: Qt.alpha(t.text, 0.1)

    Rectangle {
        width: groove.width * groove.position
        height: groove.height
        radius: groove.radius
        color: groove.t.accent
    }
}
