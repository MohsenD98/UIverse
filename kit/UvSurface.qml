import QtQuick
import UIverse.Core

Item {
    id: surface

    property string variant: "default"
    property var hints: ({})
    property real padding: tokens.unit * 2

    readonly property Tokens tokens: Style.tokens

    default property alias content: contentArea.data

    implicitWidth: tokens.controlWidth
    implicitHeight: tokens.controlHeight * 3

    StyleSlot {
        z: -1
        anchors.fill: parent
        control: surface
        part: "surface"
    }

    Item {
        id: contentArea

        anchors.fill: parent
        anchors.margins: surface.padding
    }
}
