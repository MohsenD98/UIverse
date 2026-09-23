import QtQuick
import UIverse.Core

Item {
    id: divider

    readonly property Tokens tokens: Style.tokens

    implicitHeight: tokens.borderWidth
    implicitWidth: 100

    StyleSlot {
        id: skin
        anchors.fill: parent
        control: divider
        sourceComponent: Style.pack ? Style.pack.divider : null
    }

    Rectangle {
        anchors.fill: parent
        visible: skin.status !== Loader.Ready
        color: divider.tokens.border
    }
}
