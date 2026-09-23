import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.Button {
    id: button

    property string variant: "primary"
    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: Math.max(tokens.controlHeight * 2, contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(tokens.controlHeight, background ? background.implicitHeight : 0)
    horizontalPadding: tokens.unit * 2
    hoverEnabled: true
    focusPolicy: Qt.StrongFocus

    background: StyleSlot {
        control: button
        part: "buttonBackground"
    }

    contentItem: StyleSlot {
        control: button
        part: "buttonContent"
    }
}
