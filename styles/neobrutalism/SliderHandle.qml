import QtQuick

HardBox {
    implicitWidth: 26
    implicitHeight: 26
    corner: tokens.radiusSm
    lift: 3
    sunk: isPressed
    faceColor: isPressed ? tokens.palette[1] : tokens.surface
}
