import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.TextField {
    id: control

    property string variant: "default"
    property var spec: ({})

    readonly property Tokens t: Style.t

    implicitHeight: t.controlHeight
    implicitWidth: 220
    leftPadding: t.unit * 1.5
    rightPadding: t.unit * 1.5

    color: t.text
    placeholderTextColor: t.textMuted
    selectionColor: t.accent
    selectedTextColor: t.onAccent
    verticalAlignment: TextInput.AlignVCenter
    hoverEnabled: true

    font.family: t.fontFamily
    font.pixelSize: t.fontSizeSm

    background: StyleSlot {
        ctl: control
        variant: control.variant
        spec: control.spec
        sourceComponent: Style.pack ? Style.pack.fieldBackground : null
    }
}
