import QtQuick
import UIverse.Core

Item {
    id: tag

    property string text
    property string variant: "neutral"
    property var spec: ({})

    readonly property Tokens t: Style.t

    implicitWidth: labelItem.implicitWidth + t.unit * 2.5
    implicitHeight: labelItem.implicitHeight + t.unit

    StyleSlot {
        anchors.fill: parent
        ctl: tag
        variant: tag.variant
        spec: tag.spec
        sourceComponent: Style.pack ? Style.pack.tagBackground : null
    }

    UvLabel {
        id: labelItem
        anchors.centerIn: parent
        role: "caption"
        text: tag.text
        color: {
            switch (tag.variant) {
            case "accent":
                return tag.t.textOnAccent
            case "success":
                return tag.t.success
            case "warning":
                return tag.t.warning
            case "danger":
                return tag.t.danger
            default:
                return tag.t.textMuted
            }
        }
    }
}
