import QtQuick

HardBox {
    implicitHeight: tokens.controlHeight
    corner: tokens.radiusSm
    faceColor: hasActiveFocus ? tokens.surfaceAlt : tokens.surface
    lift: hasActiveFocus ? tokens.shadowOffsetX : tokens.shadowOffsetX / 2
}
