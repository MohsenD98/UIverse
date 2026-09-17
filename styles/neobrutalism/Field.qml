import QtQuick

HardBox {
    implicitHeight: t.controlHeight
    corner: t.radiusSm
    faceColor: hasActiveFocus ? t.surfaceAlt : t.surface
    lift: hasActiveFocus ? t.shadowOffsetX : t.shadowOffsetX / 2
}
