import QtQuick
import UIverse.Core

Text {
    property string role: "body"
    property bool muted: false

    readonly property Tokens theme: ShellTheme.tokens
    readonly property bool isDisplay: role === "display" || role === "title"
    readonly property bool isMinor: role === "label" || role === "caption"

    color: muted ? theme.textMuted : theme.text
    renderType: Text.NativeRendering
    font.family: isDisplay ? theme.displayFamily : theme.fontFamily
    font.pixelSize: {
        switch (role) {
        case "display":
            return theme.displaySize
        case "title":
            return theme.fontSizeXl
        case "heading":
            return theme.fontSizeLg
        case "label":
            return theme.fontSizeXs
        case "caption":
            return theme.fontSizeXs
        case "small":
            return theme.fontSizeSm
        default:
            return theme.fontSizeMd
        }
    }
    font.weight: isDisplay ? theme.weightDisplay : role === "heading" || role === "label" ? theme.weightMedium : theme.weightBody
    font.letterSpacing: isDisplay ? theme.letterSpacingDisplay : role === "label" ? theme.letterSpacingLabel : theme.letterSpacingBody
    font.capitalization: theme.uppercaseLabels && role === "label" ? Font.AllUppercase : Font.MixedCase
}
