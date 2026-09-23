import QtQuick
import UIverse.Core

Text {
    id: label

    property string role: "body"
    property bool muted: false

    readonly property Tokens tokens: Style.tokens
    readonly property bool isDisplay: role === "display" || role === "title"
    readonly property bool isMinor: role === "label" || role === "caption"

    color: muted ? tokens.textMuted : tokens.text
    renderType: Text.NativeRendering
    textFormat: Text.PlainText
    wrapMode: Text.WordWrap

    font.family: role === "mono" ? tokens.monoFamily : isDisplay ? tokens.displayFamily : tokens.fontFamily
    font.pixelSize: {
        switch (role) {
        case "display":
            return tokens.displaySize
        case "title":
            return tokens.fontSizeXl
        case "heading":
            return tokens.fontSizeLg
        case "label":
            return tokens.fontSizeSm
        case "caption":
            return tokens.fontSizeXs
        case "mono":
            return tokens.fontSizeSm
        default:
            return tokens.fontSizeMd
        }
    }
    font.weight: isDisplay ? tokens.weightDisplay : (role === "heading" || role === "label") ? tokens.weightMedium : tokens.weightBody
    font.letterSpacing: isDisplay ? tokens.letterSpacingDisplay : isMinor ? tokens.letterSpacingLabel : tokens.letterSpacingBody
    font.capitalization: tokens.uppercaseLabels && role === "label" ? Font.AllUppercase : Font.MixedCase
    lineHeight: tokens.lineHeight
    lineHeightMode: Text.ProportionalHeight

    Behavior on color {
        ColorAnimation {
            duration: label.tokens.durationFast
        }
    }
}
