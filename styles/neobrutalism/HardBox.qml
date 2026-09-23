import QtQuick
import UIverse.Core

SlotRect {
    id: box

    property color faceColor: tokens.surface
    property color edgeColor: tokens.border
    property real lift: tokens.shadowOffsetX
    property real edge: tokens.borderWidth
    property real corner: tokens.radiusMd
    property bool sunk: false
    property bool flat: false

    readonly property alias face: faceRect

    Rectangle {
        visible: !box.flat && box.lift > 0
        x: box.lift
        y: box.lift
        width: box.width
        height: box.height
        radius: box.corner
        color: box.tokens.shadowColor
    }

    Rectangle {
        id: faceRect

        x: box.sunk ? box.lift : 0
        y: box.sunk ? box.lift : 0
        width: box.width
        height: box.height
        radius: box.corner
        color: box.faceColor
        border.width: box.flat ? 0 : box.edge
        border.color: box.edgeColor

        Behavior on x {
            NumberAnimation {
                duration: box.tokens.durationFast
                easing.type: box.tokens.easingType
            }
        }
        Behavior on y {
            NumberAnimation {
                duration: box.tokens.durationFast
                easing.type: box.tokens.easingType
            }
        }
        Behavior on color {
            ColorAnimation {
                duration: box.tokens.durationFast
            }
        }
    }
}
