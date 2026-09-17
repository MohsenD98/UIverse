import QtQuick
import UIverse.Core

SlotRect {
    id: button

    readonly property bool solid: variant === "primary" || variant === "danger"
    readonly property color base: variant === "danger" ? t.danger : t.accent

    implicitHeight: t.controlHeight
    radius: t.radiusMd
    color: solid ? (isDown ? Qt.lighter(base, 1.35)
                           : isHovered ? Qt.lighter(base, 1.18) : base)
                 : (isDown ? t.bgAlt : "transparent")
    border.width: variant === "secondary" ? t.borderWidth : 0
    border.color: isHovered ? t.textMuted : t.border
    opacity: isEnabled ? 1 : 0.4

    Behavior on color { ColorAnimation { duration: button.t.durationFast } }

    Rectangle {
        anchors.fill: parent
        anchors.margins: -3
        radius: parent.radius + 3
        color: "transparent"
        border.width: 1
        border.color: button.t.accent
        visible: button.isFocused
    }
}
