import QtQuick

HardBox {
    id: track

    implicitHeight: 14
    corner: t.radiusSm
    lift: 3

    Rectangle {
        x: track.edge
        y: track.edge
        width: Math.max(0, (track.width - track.edge * 2) * track.position)
        height: track.height - track.edge * 2
        color: track.t.palette[1]

        Behavior on width {
            NumberAnimation {
                duration: track.t.durationBase
            }
        }
    }
}
