import QtQuick

HardBox {
    implicitHeight: tokens.controlHeight
    cornerRadius: tokens.radiusSm
    faceColor: hasActiveFocus ? tokens.surfaceAlt : tokens.surface
    shadowOffset: hasActiveFocus ? tokens.shadowOffsetX : tokens.shadowOffsetX / 2
}
