import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Slider {
    id: control

    property var spec: ({})
    readonly property Tokens t: Style.t

    implicitWidth: 180
    implicitHeight: Math.max(t.unit * 3, handle ? handle.implicitHeight : 0)
    padding: 0
    hoverEnabled: true

    background: StyleSlot {
        ctl: control
        spec: control.spec
        x: control.leftPadding
        y: (control.height - height) / 2
        width: control.availableWidth
        height: implicitHeight
        sourceComponent: Style.pack ? Style.pack.sliderGroove : null
    }

    handle: StyleSlot {
        ctl: control
        spec: control.spec
        x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
        y: (control.height - height) / 2
        sourceComponent: Style.pack ? Style.pack.sliderHandle : null
    }
}
