import QtQuick

Rectangle {
    readonly property StyleSlot slot: parent as StyleSlot
    readonly property var ctl: slot ? slot.ctl : null
    readonly property string variant: slot ? slot.variant : "default"
    readonly property var spec: slot ? slot.spec : ({})
    readonly property Tokens t: Style.t

    readonly property bool isDown: ctl?.down ?? false
    readonly property bool isPressed: ctl?.pressed ?? false
    readonly property bool isHovered: ctl?.hovered ?? false
    readonly property bool isFocused: ctl?.visualFocus ?? false
    readonly property bool hasActiveFocus: ctl?.activeFocus ?? false
    readonly property bool isChecked: ctl?.checked ?? false
    readonly property bool isEnabled: ctl?.enabled ?? true
    readonly property real position: ctl?.position ?? 0

    color: "transparent"
    antialiasing: radius > 0
}
