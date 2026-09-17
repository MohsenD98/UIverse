import QtQuick
import UIverse.Core

HardBox {
    id: track

    readonly property bool on: ctl ? ctl.checked : false

    implicitWidth: 56
    implicitHeight: 30
    corner: t.radiusSm
    lift: 3
    faceColor: on ? t.palette[2] : t.surface

    Rectangle {
        width: track.height - track.edge * 2 - 6
        height: width
        y: (track.height - height) / 2
        x: track.on ? track.width - width - track.edge - 3 : track.edge + 3
        radius: 2
        color: track.on ? track.t.surface : track.t.text
        border.width: track.edge
        border.color: track.t.border

        Behavior on x { NumberAnimation { duration: track.t.durationBase; easing.type: track.t.easingType } }
    }
}
