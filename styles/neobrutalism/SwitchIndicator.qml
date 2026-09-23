import QtQuick

HardBox {
    id: track

    implicitWidth: 56
    implicitHeight: 30
    cornerRadius: tokens.radiusSm
    shadowOffset: 3
    faceColor: isChecked ? tokens.palette[2] : tokens.surface

    Rectangle {
        width: track.height - track.edgeWidth * 2 - 6
        height: width
        y: (track.height - height) / 2
        x: track.isChecked ? track.width - width - track.edgeWidth - 3 : track.edgeWidth + 3
        radius: 2
        color: track.isChecked ? track.tokens.surface : track.tokens.text
        border.width: track.edgeWidth
        border.color: track.tokens.border

        Behavior on x {
            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
