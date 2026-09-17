import QtQuick
import UIverse.Core

Text {
    property string role: "body"
    property bool muted: false

    readonly property Tokens s: ShellTheme.t
    readonly property bool isDisplay: role === "display" || role === "title"
    readonly property bool isMinor: role === "label" || role === "caption"

    color: muted ? s.textMuted : s.text
    renderType: Text.NativeRendering
    font.family: isDisplay ? s.displayFamily : s.fontFamily
    font.pixelSize: {
        switch (role) {
        case "display": return s.displaySize
        case "title": return s.fontSizeXl
        case "heading": return s.fontSizeLg
        case "label": return s.fontSizeXs
        case "caption": return s.fontSizeXs
        case "small": return s.fontSizeSm
        default: return s.fontSizeMd
        }
    }
    font.weight: isDisplay ? s.weightDisplay : role === "heading" || role === "label" ? s.weightMedium : s.weightBody
    font.letterSpacing: isDisplay ? s.letterSpacingDisplay : role === "label" ? s.letterSpacingLabel : s.letterSpacingBody
    font.capitalization: s.uppercaseLabels && role === "label" ? Font.AllUppercase : Font.MixedCase
}
