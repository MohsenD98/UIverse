import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Button {
    id: control

    property string variant: "primary"
    property var spec: ({})

    readonly property Tokens t: Style.t

    implicitHeight: Math.max(t.controlHeight, background ? background.implicitHeight : 0)
    implicitWidth: Math.max(t.controlHeight * 2,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    leftPadding: t.unit * 2
    rightPadding: t.unit * 2

    hoverEnabled: true
    focusPolicy: Qt.StrongFocus

    background: StyleSlot {
        ctl: control
        variant: control.variant
        spec: control.spec
        sourceComponent: Style.pack ? Style.pack.buttonBackground : null
    }

    contentItem: StyleSlot {
        ctl: control
        variant: control.variant
        spec: control.spec
        sourceComponent: Style.pack ? Style.pack.buttonContent : null
    }
}
