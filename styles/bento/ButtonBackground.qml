import QtQuick
import UIverse.Core

SlotRect {
    id: button

    readonly property bool solid: variant === "primary" || variant === "danger"
    readonly property color base: variant === "danger" ? t.danger : t.accent

    implicitHeight: t.controlHeight
    radius: height / 2
    opacity: isEnabled ? 1 : 0.4
    scale: isDown ? 0.96 : 1
    color: solid ? (isHovered ? Qt.darker(base, 1.08) : base)
         : variant === "ghost" ? (isHovered ? Qt.alpha(t.text, 0.06) : "transparent")
         : (isHovered ? Qt.darker(t.surfaceAlt, 1.04) : t.surfaceAlt)

    Behavior on scale { NumberAnimation { duration: button.t.durationFast; easing.type: button.t.easingType } }
    Behavior on color { ColorAnimation { duration: button.t.durationFast } }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: height / 2
        color: "transparent"
        border.width: 2
        border.color: Qt.alpha(button.t.accent, 0.5)
        visible: button.isFocused
    }
}
