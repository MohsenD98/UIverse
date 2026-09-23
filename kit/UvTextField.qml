import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.TextField {
    id: field

    property string variant: "default"
    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitHeight: tokens.controlHeight
    implicitWidth: tokens.unit * 28
    leftPadding: tokens.unit * 1.5
    rightPadding: tokens.unit * 1.5

    color: tokens.text
    placeholderTextColor: tokens.textMuted
    selectionColor: tokens.accent
    selectedTextColor: tokens.textOnAccent
    verticalAlignment: TextInput.AlignVCenter
    hoverEnabled: true

    font.family: tokens.fontFamily
    font.pixelSize: tokens.fontSizeSm

    UvLabel {
        x: field.leftPadding
        width: field.width - field.leftPadding - field.rightPadding
        height: field.height
        muted: true
        text: field.placeholderText
        font.pixelSize: field.font.pixelSize
        font.weight: field.tokens.weightBody
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
        visible: !field.length && !field.preeditText
    }

    background: StyleSlot {
        control: field
        variant: field.variant
        hints: field.hints
        sourceComponent: Style.pack ? Style.pack.fieldBackground : null
    }
}
