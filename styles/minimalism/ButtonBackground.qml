import QtQuick
import UIverse.Core

SlotRect {
    id: button

    readonly property bool solid: variant === "primary" || variant === "danger"
    readonly property color base: variant === "danger" ? tokens.danger : tokens.accent

    implicitHeight: tokens.controlHeight
    radius: tokens.radiusMd
    color: solid ? (isDown ? Qt.lighter(base, 1.35) : isHovered ? Qt.lighter(base, 1.18) : base) : (isDown ? tokens.backgroundAlt : "transparent")
    border.width: variant === "secondary" ? tokens.borderWidth : 0
    border.color: isHovered ? tokens.textMuted : tokens.border
    opacity: isEnabled ? 1 : 0.4

    Behavior on color {
        ColorAnimation {
            duration: button.tokens.durationFast
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: parent.radius + 3
        color: "transparent"
        border.width: 1
        border.color: button.tokens.accent
        visible: button.isFocused
    }
}
