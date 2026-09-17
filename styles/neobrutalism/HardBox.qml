import QtQuick
import UIverse.Core

SlotRect {
    id: box

    property color faceColor: t.surface
    property color edgeColor: t.border
    property real lift: t.shadowOffsetX
    property real edge: t.borderWidth
    property real corner: t.radiusMd
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
        color: box.t.shadowColor
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

        Behavior on x { NumberAnimation { duration: box.t.durationFast; easing.type: box.t.easingType } }
        Behavior on y { NumberAnimation { duration: box.t.durationFast; easing.type: box.t.easingType } }
        Behavior on color { ColorAnimation { duration: box.t.durationFast } }
    }
}
