import QtQuick

Text {
    readonly property StyleSlot slot: parent as StyleSlot
    readonly property var ctl: slot ? slot.ctl : null
    readonly property string variant: slot ? slot.variant : "default"
    readonly property var spec: slot ? slot.spec : ({})
    readonly property Tokens t: Style.t

    readonly property bool isDown: ctl?.down ?? false
    readonly property bool isHovered: ctl?.hovered ?? false

    text: ctl?.text ?? ""
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
    renderType: Text.NativeRendering
}
