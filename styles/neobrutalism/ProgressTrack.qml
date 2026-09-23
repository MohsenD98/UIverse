import QtQuick

HardBox {
    id: track

    implicitHeight: 14
    cornerRadius: tokens.radiusSm
    shadowOffset: 3

    Rectangle {
        x: track.edgeWidth
        y: track.edgeWidth
        width: Math.max(0, (track.width - track.edgeWidth * 2) * track.position)
        height: track.height - track.edgeWidth * 2
        color: track.tokens.palette[1]

        Behavior on width {
            NumberAnimation {
                duration: track.tokens.durationBase
            }
        }
    }
}
