import QtQuick
import UIverse.Core

Item {
    id: surface

    property string variant: "default"
    property var hints: ({})
    property real padding: Style.tokens.unit * 2

    readonly property Tokens tokens: Style.tokens

    default property alias content: body.data

    implicitWidth: 200
    implicitHeight: 120

    StyleSlot {
        id: skin
        anchors.fill: parent
        control: surface
        variant: surface.variant
        hints: surface.hints
        sourceComponent: Style.pack ? Style.pack.surface : null
        z: -1
    }

    Rectangle {
        anchors.fill: parent
        visible: skin.status !== Loader.Ready
        color: surface.tokens.surface
        radius: surface.tokens.radiusMd
        border.width: surface.tokens.borderWidth
        border.color: surface.tokens.border
        z: -1
    }

    Item {
        id: body
        anchors.fill: parent
        anchors.margins: surface.padding
    }
}
