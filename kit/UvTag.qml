import QtQuick
import UIverse.Core

Item {
    id: tag

    property string text
    property string variant: "neutral"
    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: caption.implicitWidth + tokens.unit * 2.5
    implicitHeight: caption.implicitHeight + tokens.unit

    StyleSlot {
        anchors.fill: parent
        control: tag
        part: "tagBackground"
    }

    UvLabel {
        id: caption

        anchors.centerIn: parent
        role: "caption"
        text: tag.text
        color: tag.variant === "accent" ? tag.tokens.textOnAccent : tag.tokens.statusColor(tag.variant, tag.tokens.textMuted)
    }
}
