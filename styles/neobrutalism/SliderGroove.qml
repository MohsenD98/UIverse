import QtQuick
import UIverse.Core

HardBox {
    id: groove

    implicitHeight: 14
    corner: t.radiusSm
    lift: 3

    Rectangle {
        x: groove.edge
        y: groove.edge
        width: Math.max(0, (groove.width - groove.edge * 2) * (groove.ctl ? groove.ctl.position : 0))
        height: groove.height - groove.edge * 2
        color: groove.t.accent
    }
}
