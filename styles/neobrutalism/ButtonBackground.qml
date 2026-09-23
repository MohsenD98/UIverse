import QtQuick

HardBox {
    id: button

    readonly property bool ghost: variant === "ghost"

    implicitHeight: tokens.controlHeight
    corner: tokens.radiusSm
    flat: ghost
    sunk: isDown && !ghost
    lift: ghost ? 0 : tokens.shadowOffsetX
    opacity: isEnabled ? 1 : 0.45
    faceColor: variant === "primary" ? (isHovered ? Qt.darker(tokens.accent, 1.08) : tokens.accent) : variant === "danger" ? tokens.danger : ghost ? (isHovered ? tokens.surfaceAlt : "transparent") : (isHovered ? tokens.surfaceAlt : tokens.surface)

    Rectangle {
        x: -6
        y: -6
        width: button.width + button.lift + 12
        height: button.height + button.lift + 12
        radius: button.corner + 4
        color: "transparent"
        border.width: 2
        border.color: button.tokens.text
        visible: button.isFocused
    }
}
