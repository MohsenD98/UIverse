import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Button {
    id: button

    property string variant: "primary"
    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitHeight: Math.max(tokens.controlHeight, background ? background.implicitHeight : 0)
    implicitWidth: Math.max(tokens.controlHeight * 2, contentItem.implicitWidth + leftPadding + rightPadding)
    leftPadding: tokens.unit * 2
    rightPadding: tokens.unit * 2

    hoverEnabled: true
    focusPolicy: Qt.StrongFocus

    background: StyleSlot {
        control: button
        variant: button.variant
        hints: button.hints
        sourceComponent: Style.pack ? Style.pack.buttonBackground : null
    }

    contentItem: StyleSlot {
        control: button
        variant: button.variant
        hints: button.hints
        sourceComponent: Style.pack ? Style.pack.buttonContent : null
    }
}
