import QtQuick

HardBox {
    id: groove

    implicitHeight: 14
    corner: tokens.radiusSm
    lift: 3

    Rectangle {
        x: groove.edge
        y: groove.edge
        width: Math.max(0, (groove.width - groove.edge * 2) * groove.position)
        height: groove.height - groove.edge * 2
        color: groove.tokens.accent
    }
}
