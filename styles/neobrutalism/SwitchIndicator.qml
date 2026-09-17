import QtQuick

HardBox {
    id: track

    implicitWidth: 56
    implicitHeight: 30
    corner: t.radiusSm
    lift: 3
    faceColor: isChecked ? t.palette[2] : t.surface

    Rectangle {
        width: track.height - track.edge * 2 - 6
        height: width
        y: (track.height - height) / 2
        x: track.isChecked ? track.width - width - track.edge - 3 : track.edge + 3
        radius: 2
        color: track.isChecked ? track.t.surface : track.t.text
        border.width: track.edge
        border.color: track.t.border

        Behavior on x {
            NumberAnimation {
                duration: track.t.durationBase
                easing.type: track.t.easingType
            }
        }
    }
}
