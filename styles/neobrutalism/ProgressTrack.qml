import QtQuick

HardBox {
    id: track

    implicitHeight: 14
    corner: tokens.radiusSm
    lift: 3

    Rectangle {
        x: track.edge
        y: track.edge
        width: Math.max(0, (track.width - track.edge * 2) * track.position)
        height: track.height - track.edge * 2
        color: track.tokens.palette[1]

        Behavior on width {
            NumberAnimation {
                duration: track.tokens.durationBase
            }
        }
    }
}
