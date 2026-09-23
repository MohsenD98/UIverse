import QtQuick

Rectangle {
    readonly property StyleSlot slot: parent as StyleSlot
    readonly property var control: slot ? slot.control : null
    readonly property string variant: slot ? slot.variant : "default"
    readonly property var hints: slot ? slot.hints : ({})
    readonly property Tokens tokens: Style.tokens

    readonly property bool isDown: control?.down ?? false
    readonly property bool isPressed: control?.pressed ?? false
    readonly property bool isHovered: control?.hovered ?? false
    readonly property bool isFocused: control?.visualFocus ?? false
    readonly property bool hasActiveFocus: control?.activeFocus ?? false
    readonly property bool isChecked: control?.checked ?? false
    readonly property bool isEnabled: control?.enabled ?? true
    readonly property real position: control?.position ?? 0

    color: "transparent"
    antialiasing: radius > 0
}
