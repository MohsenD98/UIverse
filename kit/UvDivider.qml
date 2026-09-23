import QtQuick
import UIverse.Core

Item {
    id: divider

    readonly property Tokens tokens: Style.tokens

    implicitWidth: tokens.controlWidth
    implicitHeight: tokens.borderWidth

    StyleSlot {
        anchors.fill: parent
        control: divider
        part: "divider"
    }
}
