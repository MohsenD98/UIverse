import QtQuick
import QtQuick.Templates as T
import UIverse.Core

T.TextField {
    id: field

    property string variant: "default"
    property var hints: ({})

    readonly property Tokens tokens: Style.tokens

    implicitWidth: tokens.controlWidth
    implicitHeight: tokens.controlHeight
    leftPadding: tokens.unit * 1.5
    rightPadding: tokens.unit * 1.5
    verticalAlignment: TextInput.AlignVCenter
    hoverEnabled: true

    color: tokens.text
    placeholderTextColor: tokens.textMuted
    selectionColor: tokens.accent
    selectedTextColor: tokens.textOnAccent
    font.family: tokens.fontFamily
    font.pixelSize: tokens.fontSizeSm

    UvLabel {
        x: field.leftPadding
        width: field.width - field.leftPadding - field.rightPadding
        height: field.height
        visible: !field.length && !field.preeditText
        muted: true
        text: field.placeholderText
        font.pixelSize: field.font.pixelSize
        font.weight: field.tokens.weightBody
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        elide: Text.ElideRight
    }

    background: StyleSlot {
        control: field
        part: "fieldBackground"
    }
}
