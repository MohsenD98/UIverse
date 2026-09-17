import QtQuick
import UIverse.Core

HardBox {
    readonly property bool pressed: ctl && ctl.pressed

    implicitWidth: 26
    implicitHeight: 26
    corner: t.radiusSm
    lift: 3
    sunk: pressed
    faceColor: pressed ? t.palette[1] : t.surface
}
