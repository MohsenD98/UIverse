import QtQuick

Rectangle {
    readonly property Item ctl: parent && parent.ctl ? parent.ctl : null
    readonly property string variant: parent && parent.variant ? parent.variant : "default"
    readonly property var spec: parent && parent.spec ? parent.spec : ({})
    readonly property Tokens t: Style.t

    readonly property bool isDown: ctl && ctl.down !== undefined ? ctl.down : false
    readonly property bool isHovered: ctl && ctl.hovered !== undefined ? ctl.hovered : false
    readonly property bool isFocused: ctl && ctl.visualFocus !== undefined ? ctl.visualFocus : false
    readonly property bool isEnabled: ctl ? ctl.enabled : true

    color: "transparent"
    antialiasing: radius > 0
}
