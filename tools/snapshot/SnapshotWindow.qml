import QtQuick
import UIverse.Shell
import UIverse.Styles

Window {
    id: window

    required property string packKey
    required property string route

    x: -width - Screen.desktopAvailableWidth
    y: 0
    flags: Qt.Tool | Qt.FramelessWindowHint | Qt.WindowDoesNotAcceptFocus | Qt.WindowTransparentForInput
    visible: true
    color: ShellTheme.tokens.background

    LabRoot {
        anchors.fill: parent
        route: window.route
    }

    Component.onCompleted: StyleRegistry.select(packKey)
}
