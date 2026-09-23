import QtQuick

HardBox {
    implicitWidth: 26
    implicitHeight: 26
    cornerRadius: tokens.radiusSm
    shadowOffset: 3
    sunken: isPressed
    faceColor: isPressed ? tokens.palette[1] : tokens.surface
}
