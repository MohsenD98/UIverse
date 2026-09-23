import QtQuick

Text {
    readonly property StyleSlot slot: parent as StyleSlot
    readonly property var control: slot ? slot.control : null
    readonly property string variant: slot ? slot.variant : "default"
    readonly property var hints: slot ? slot.hints : ({})
    readonly property Tokens tokens: Style.tokens

    readonly property bool isDown: control?.down ?? false
    readonly property bool isHovered: control?.hovered ?? false

    text: control?.text ?? ""
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    elide: Text.ElideRight
    renderType: Text.NativeRendering
}
