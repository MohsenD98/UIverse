import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Switch {
    id: toggle

    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: (indicator ? indicator.implicitWidth : 0) + (text ? contentItem.implicitWidth + spacing : 0)
    implicitHeight: Math.max(tokens.controlHeight, indicator ? indicator.implicitHeight : 0)
    spacing: tokens.unit
    hoverEnabled: true

    indicator: StyleSlot {
        control: toggle
        part: "switchIndicator"
        y: (toggle.height - height) / 2
    }

    contentItem: UvLabel {
        leftPadding: toggle.indicator ? toggle.indicator.width + toggle.spacing : 0
        text: toggle.text
        verticalAlignment: Text.AlignVCenter
    }
}
