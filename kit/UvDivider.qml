import QtQuick
import UIverse.Core

Item {
    id: divider

    readonly property Tokens t: Style.t

    implicitHeight: t.borderWidth
    implicitWidth: 100

    StyleSlot {
        id: skin
        anchors.fill: parent
        ctl: divider
        sourceComponent: Style.pack ? Style.pack.divider : null
    }

    Rectangle {
        anchors.fill: parent
        visible: skin.status !== Loader.Ready
        color: divider.t.border
    }
}
