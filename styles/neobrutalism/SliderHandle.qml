import QtQuick

HardBox {
    implicitWidth: 26
    implicitHeight: 26
    corner: t.radiusSm
    lift: 3
    sunk: isPressed
    faceColor: isPressed ? t.palette[1] : t.surface
}
