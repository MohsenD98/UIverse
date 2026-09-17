import QtQuick

HardBox {
    id: button

    readonly property bool ghost: variant === "ghost"

    implicitHeight: t.controlHeight
    corner: t.radiusSm
    flat: ghost
    sunk: isDown && !ghost
    lift: ghost ? 0 : t.shadowOffsetX
    opacity: isEnabled ? 1 : 0.45
    faceColor: variant === "primary" ? (isHovered ? Qt.darker(t.accent, 1.08) : t.accent) : variant === "danger" ? t.danger : ghost ? (isHovered ? t.surfaceAlt : "transparent") : (isHovered ? t.surfaceAlt : t.surface)

    Rectangle {
        x: -6
        y: -6
        width: button.width + button.lift + 12
        height: button.height + button.lift + 12
        radius: button.corner + 4
        color: "transparent"
        border.width: 2
        border.color: button.t.text
        visible: button.isFocused
    }
}
