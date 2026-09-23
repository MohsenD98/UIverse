import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Switch {
    id: toggle

    property var hints: ({})
    readonly property Tokens tokens: Style.tokens

    implicitHeight: Math.max(tokens.controlHeight, indicator ? indicator.implicitHeight : 0)
    implicitWidth: (indicator ? indicator.implicitWidth : 0) + (text ? contentItem.implicitWidth + spacing : 0)
    spacing: tokens.unit
    hoverEnabled: true

    indicator: StyleSlot {
        control: toggle
        hints: toggle.hints
        y: (toggle.height - height) / 2
        sourceComponent: Style.pack ? Style.pack.switchIndicator : null
    }

    contentItem: UvLabel {
        role: "body"
        text: toggle.text
        verticalAlignment: Text.AlignVCenter
        leftPadding: toggle.indicator ? toggle.indicator.width + toggle.spacing : 0
    }
}
