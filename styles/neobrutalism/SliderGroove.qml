import QtQuick

HardBox {
    id: groove

    implicitHeight: 14
    cornerRadius: tokens.radiusSm
    shadowOffset: 3

    Rectangle {
        x: groove.edgeWidth
        y: groove.edgeWidth
        width: Math.max(0, (groove.width - groove.edgeWidth * 2) * groove.position)
        height: groove.height - groove.edgeWidth * 2
        color: groove.tokens.accent
    }
}
