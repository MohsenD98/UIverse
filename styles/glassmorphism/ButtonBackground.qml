import QtQuick
import UIverse.Core

SlotRect {
    id: button

    readonly property bool solid: variant === "primary" || variant === "danger"
    readonly property color base: variant === "danger" ? t.danger : t.accent

    implicitHeight: t.controlHeight
    radius: height / 2
    opacity: isEnabled ? 1 : 0.4
    color: solid ? base : variant === "ghost" ? Qt.alpha(t.text, isHovered ? 0.08 : 0) : Qt.alpha(t.text, isDown ? 0.2 : isHovered ? 0.16 : 0.1)
    border.width: variant === "secondary" ? t.borderWidth : 0
    border.color: t.border
    gradient: solid ? sheen : null
    scale: isDown ? 0.97 : 1

    Behavior on scale {
        NumberAnimation {
            duration: button.t.durationFast
            easing.type: button.t.easingType
        }
    }

    Gradient {
        id: sheen
        orientation: Gradient.Horizontal
        GradientStop {
            position: 0
            color: Qt.lighter(button.base, button.isHovered ? 1.2 : 1.1)
        }
        GradientStop {
            position: 1
            color: button.base
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -4
        radius: height / 2
        color: "transparent"
        border.width: 2
        border.color: Qt.alpha(button.t.accent, 0.6)
        visible: button.isFocused
    }
}
