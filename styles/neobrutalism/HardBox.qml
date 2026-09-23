import QtQuick
import UIverse.Core

SlotRect {
    id: box

    property color faceColor: tokens.surface
    property color edgeColor: tokens.border
    property real edgeWidth: tokens.borderWidth
    property real cornerRadius: tokens.radiusMd
    property real shadowOffset: tokens.shadowOffsetX
    property bool sunken: false
    property bool flat: false

    Rectangle {
        visible: !box.flat && box.shadowOffset > 0
        x: box.shadowOffset
        y: box.shadowOffset
        width: box.width
        height: box.height
        radius: box.cornerRadius
        color: box.tokens.shadowColor
    }

    Rectangle {
        x: box.sunken ? box.shadowOffset : 0
        y: box.sunken ? box.shadowOffset : 0
        width: box.width
        height: box.height
        radius: box.cornerRadius
        color: box.faceColor
        border.width: box.flat ? 0 : box.edgeWidth
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
