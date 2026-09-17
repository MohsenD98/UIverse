import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.TextField {
    id: control

    property string variant: "default"
    property var spec: ({})

    readonly property Tokens t: Style.t

    implicitHeight: t.controlHeight
    implicitWidth: t.unit * 28
    leftPadding: t.unit * 1.5
    rightPadding: t.unit * 1.5

    color: t.text
    placeholderTextColor: t.textMuted
    selectionColor: t.accent
    selectedTextColor: t.textOnAccent
    verticalAlignment: TextInput.AlignVCenter
    hoverEnabled: true

    font.family: t.fontFamily
    font.pixelSize: t.fontSizeSm

    UvLabel {
        x: control.leftPadding
        width: control.availableWidth
        height: control.height
        role: "label"
        muted: true
        text: control.placeholderText
        font.pixelSize: control.font.pixelSize
        font.weight: control.t.weightBody
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
        visible: !control.length && !control.preeditText
    }

    background: StyleSlot {
        ctl: control
        variant: control.variant
        spec: control.spec
        sourceComponent: Style.pack ? Style.pack.fieldBackground : null
    }
}
