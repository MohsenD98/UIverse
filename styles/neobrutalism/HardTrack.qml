import QtQuick

HardBox {
    id: track

    property color fillColor: tokens.accent
    property bool animated: false

    implicitHeight: 14
    cornerRadius: tokens.radiusSm
    shadowOffset: 3

    Rectangle {
        x: track.edgeWidth
        y: track.edgeWidth
        width: Math.max(0, (track.width - track.edgeWidth * 2) * track.position)
        height: track.height - track.edgeWidth * 2
        color: track.fillColor

        Behavior on width {
            enabled: track.animated

            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
