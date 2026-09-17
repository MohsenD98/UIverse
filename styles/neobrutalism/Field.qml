import QtQuick
import UIverse.Core

HardBox {
    readonly property bool focused: ctl && ctl.activeFocus

    implicitHeight: t.controlHeight
    corner: t.radiusSm
    faceColor: focused ? t.surfaceAlt : t.surface
    lift: focused ? t.shadowOffsetX : t.shadowOffsetX / 2
}
