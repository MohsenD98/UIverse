import QtQuick
import UIverse.Core

Item {
    id: surface

    property string variant: "default"
    property var spec: ({})
    property real padding: Style.t.unit * 2

    readonly property Tokens t: Style.t

    default property alias content: body.data

    implicitWidth: 200
    implicitHeight: 120

    StyleSlot {
        id: skin
        anchors.fill: parent
        ctl: surface
        variant: surface.variant
        spec: surface.spec
        sourceComponent: Style.pack ? Style.pack.surface : null
        z: -1
    }

    Rectangle {
        anchors.fill: parent
        visible: skin.status !== Loader.Ready
        color: surface.t.surface
        radius: surface.t.radiusMd
        border.width: surface.t.borderWidth
        border.color: surface.t.border
        z: -1
    }

    Item {
        id: body
        anchors.fill: parent
        anchors.margins: surface.padding
    }
}
