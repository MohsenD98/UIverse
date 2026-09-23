import QtQuick

HardBox {
    id: button

    readonly property bool ghost: variant === "ghost"

    implicitHeight: tokens.controlHeight
    cornerRadius: tokens.radiusSm
    flat: ghost
    sunken: isDown && !ghost
    shadowOffset: ghost ? 0 : tokens.shadowOffsetX
    opacity: isEnabled ? 1 : 0.45
    faceColor: {
        switch (variant) {
        case "primary":
            return isHovered ? Qt.darker(tokens.accent, 1.08) : tokens.accent
        case "danger":
            return tokens.danger
        case "ghost":
            return isHovered ? tokens.surfaceAlt : "transparent"
        default:
            return isHovered ? tokens.surfaceAlt : tokens.surface
        }
    }

    Rectangle {
        x: -6
        y: -6
        width: button.width + button.shadowOffset + 12
        height: button.height + button.shadowOffset + 12
        radius: button.cornerRadius + 4
        color: "transparent"
        border.width: 2
        border.color: button.tokens.text
        visible: button.isFocused
    }
}
