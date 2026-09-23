import QtQuick
import UIverse.Core

Item {
    id: tag

    property string text
    property string variant: "neutral"
    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: labelItem.implicitWidth + tokens.unit * 2.5
    implicitHeight: labelItem.implicitHeight + tokens.unit

    StyleSlot {
        anchors.fill: parent
        control: tag
        variant: tag.variant
        hints: tag.hints
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
                return tag.tokens.textOnAccent
            case "success":
                return tag.tokens.success
            case "warning":
                return tag.tokens.warning
            case "danger":
                return tag.tokens.danger
            default:
                return tag.tokens.textMuted
            }
        }
    }
}
