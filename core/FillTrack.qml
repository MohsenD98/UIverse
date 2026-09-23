import QtQuick

SlotRect {
    id: track

    property real inset: 0
    property bool animated: false

    readonly property alias fill: fillBar

    Rectangle {
        id: fillBar

        x: track.inset
        y: track.inset
        width: Math.max(0, track.width - track.inset * 2) * track.position
        height: Math.max(0, track.height - track.inset * 2)
        radius: Math.max(0, track.radius - track.inset)

        Behavior on width {
            enabled: track.animated

            NumberAnimation {
                duration: track.tokens.durationBase
                easing.type: track.tokens.easingType
            }
        }
    }
}
