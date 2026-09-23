import QtQuick

HardBox {
    id: track

    implicitWidth: 56
    implicitHeight: 30
    corner: tokens.radiusSm
    lift: 3
    faceColor: isChecked ? tokens.palette[2] : tokens.surface

    Rectangle {
        width: track.height - track.edge * 2 - 6
        height: width
        y: (track.height - height) / 2
        x: track.isChecked ? track.width - width - track.edge - 3 : track.edge + 3
        radius: 2
        color: track.isChecked ? track.tokens.surface : track.tokens.text
        border.width: track.edge
        border.color: track.tokens.border

        Behavior on x {
            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
