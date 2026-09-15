import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Switch {
    id: control

    property var spec: ({})
    readonly property Tokens t: Style.t

    implicitHeight: Math.max(t.controlHeight, indicator ? indicator.implicitHeight : 0)
    implicitWidth: (indicator ? indicator.implicitWidth : 0)
                   + (text ? contentItem.implicitWidth + spacing : 0)
    spacing: t.unit
    hoverEnabled: true

    indicator: StyleSlot {
        ctl: control
        spec: control.spec
        y: (control.height - height) / 2
        sourceComponent: Style.pack ? Style.pack.switchIndicator : null
    }

    contentItem: UvLabel {
        role: "body"
        text: control.text
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator ? control.indicator.width + control.spacing : 0
    }
}
