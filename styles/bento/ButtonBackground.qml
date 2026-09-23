import QtQuick
import UIverse.Core

SlotRect {
    id: button

    readonly property bool solid: variant === "primary" || variant === "danger"
    readonly property color base: variant === "danger" ? tokens.danger : tokens.accent

    implicitHeight: tokens.controlHeight
    radius: height / 2
    opacity: isEnabled ? 1 : 0.4
    scale: isDown ? 0.96 : 1
    color: {
        if (solid)
            return isHovered ? Qt.darker(base, 1.08) : base
        if (variant === "ghost")
            return isHovered ? Qt.alpha(tokens.text, 0.06) : "transparent"
        return isHovered ? Qt.darker(tokens.surfaceAlt, 1.04) : tokens.surfaceAlt
    }

    Behavior on scale {
        NumberAnimation {
            duration: button.tokens.durationFast
            easing.type: button.tokens.easingType
        }
    }
    Behavior on color {
        ColorAnimation {
            duration: button.tokens.durationFast
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: height / 2
        color: "transparent"
        border.width: 2
        border.color: Qt.alpha(button.tokens.accent, 0.5)
        visible: button.isFocused
    }
}
