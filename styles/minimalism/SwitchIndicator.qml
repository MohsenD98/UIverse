import QtQuick
import UIverse.Core

SlotRect {
    id: track

    readonly property bool on: ctl ? ctl.checked : false

    implicitWidth: 40
    implicitHeight: 22
    radius: height / 2
    color: on ? t.accent : t.border

    Behavior on color { ColorAnimation { duration: t.durationBase } }

    Rectangle {
        width: parent.height - 4
        height: width
        radius: width / 2
        y: 2
        x: track.on ? parent.width - width - 2 : 2
        color: track.t.surface

        Behavior on x {
            NumberAnimation { duration: track.t.durationBase; easing.type: track.t.easingType }
        }
    }
}
